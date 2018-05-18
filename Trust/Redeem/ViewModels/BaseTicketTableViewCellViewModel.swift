// Copyright © 2018 Stormbird PTE. LTD.

import UIKit

struct BaseTicketTableViewCellViewModel {
    private let ticketHolder: TicketHolder

    init(
            ticketHolder: TicketHolder
    ) {
        self.ticketHolder = ticketHolder
    }

    var ticketCount: String {
        return "x\(ticketHolder.tickets.count)"
    }

    var city: String {
        return ticketHolder.city
    }

    var category: String {
        return String(ticketHolder.category)
    }

    var time: String {
        //TODO Should format be localized?
        return ticketHolder.date.format("h:mm a", overrideWithTimezoneIdentifier: ticketHolder.timeZoneIdentifier)
    }

    var teams: String {
        return R.string.localizable.aWalletTicketTokenMatchVs(ticketHolder.countryA, ticketHolder.countryB)
    }

    var match: String {
        return "M\(ticketHolder.match)"
    }

	var venue: String {
        return ticketHolder.venue
    }

    var date: String {
        return ticketHolder.date.formatAsShortDateString(overrideWithTimezoneIdentifier: ticketHolder.timeZoneIdentifier)
    }

    var backgroundColor: UIColor {
        return Colors.appWhite
    }

    var status: String {
        return ""
    }

    var cellHeight: CGFloat {
        let detailsHeight = CGFloat(34)
        if ticketHolder.areDetailsVisible {
            return 120 + detailsHeight
        } else {
            return 120
        }
        }

    var checkboxImage: UIImage {
        if ticketHolder.isSelected {
            return R.image.ticket_bundle_checked()!
        } else {
            return R.image.ticket_bundle_unchecked()!
        }
    }

    var areDetailsVisible: Bool {
        return ticketHolder.areDetailsVisible
    }
}
