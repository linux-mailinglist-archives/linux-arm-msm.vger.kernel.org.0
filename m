Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECFF1DB4F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 15:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgETN1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 09:27:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:30752 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETN1o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 09:27:44 -0400
IronPort-SDR: 702/lacGYT8hEPHthzihBeB2yJ9dkfjg1nfQg9IsQlKRyPXgrr85FqypyGRboij5atShrUyeO8
 imGaGil/tWeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:27:43 -0700
IronPort-SDR: cv4BF2+S190M0BuNw9T1f7pRHZsNf3Jgigha8gssDa5mRFFCBDNOv9/HheNr1f1HNkSwuvWqyx
 X2TPB5wzr11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374076597"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 06:27:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 16:27:39 +0300
Date:   Wed, 20 May 2020 16:27:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 2/5] usb: renesas-xhci: Add the renesas xhci driver
Message-ID: <20200520132739.GK1298122@kuha.fi.intel.com>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-3-vkoul@kernel.org>
 <20200519114528.GC1298122@kuha.fi.intel.com>
 <CAAd0S9AEOsOLrnry4xNRVOi5fXwm3KXYzQsUMCm9tVxHr2sr1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd0S9AEOsOLrnry4xNRVOi5fXwm3KXYzQsUMCm9tVxHr2sr1w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 10:19:03PM +0200, Christian Lamparter wrote:
> Hello,
> 
> On Tue, May 19, 2020 at 1:45 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> > On Wed, May 06, 2020 at 11:30:22AM +0530, Vinod Koul wrote:
> > > From: Christian Lamparter <chunkeey@googlemail.com>
> > >
> > > This add a new driver for renesas xhci which is basically a firmware
> > > loader for uPD720201 and uPD720202 w/o ROM. The xhci-pci driver will
> > > invoke this driver for loading/unloading on relevant devices.
> > >
> > > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > > devices which need the firmware loader on page 2 in order to
> > > work as they "do not support the External ROM".
> > >
> > > The "Firmware Download Sequence" is describe in chapter
> > > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > >
> > > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > > alternative version can be sourced from Netgear's WNDR4700 GPL
> > > archives.
> > >
> > > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > > (2012-06-15) state that the firmware is for the following devices:
> > >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> > >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> > >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> >
> > You wouldn't happen to have access to the documentation of the
> > "original" uPD720200 USB 3.0 controller?
> >
> > It would be cool if we could support that too with this driver.
> 
> ???. I have one of those "original" uPD720200(A) working "just fine"
> in my Laptop currently.
> It's an really old HP dv6-6003eg from around 2011 that came with two
> USB 3.0 Ports, which
> are driven by a "NEC Corporation uPD720200 USB 3.0 Host Controller"
> 1033:0194 (Rev 04).
> 
> As for supporting the uPD720200 (flasher) with this serises.... There
> are some bad news:
> 
> "In addition, the programming interface for the uPD720200 and uPD720200A
> is different from the uPD720202, needs different programming tools, and relies
> on proprietary chip features that cannot be disclosed outside of Renesas."
> <https://mail.coreboot.org/pipermail/flashrom/2013-February/010498.html> :-(

Too bad. That's what I was hoping to do with this driver. There are
still boards out there equipped with uPD720200/uPD720200A that have
older firmware. If you don't have the latest firmware (which is also
from 2012), then PME and a few other things will not work (so resume
from D3 does not work for example).

thanks,

-- 
heikki
