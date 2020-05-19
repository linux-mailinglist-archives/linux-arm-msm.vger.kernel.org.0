Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078D41D96AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 14:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgESMva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 08:51:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:47865 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726991AbgESMv3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 08:51:29 -0400
IronPort-SDR: j3Px7osGxG7WSDJsfBM2hDsMm1AysejSzYsg7Iumi9EN5jjlKD2YZZGwHjP/aDAgGRcxLOKIey
 S08AxcH3j8Sg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:51:29 -0700
IronPort-SDR: 0COlADP61rFlXgsldtC2+8lHkEFUk+vocSTxCrwrtsRUq8MnmP6g3iJsQ4U5byQqnPsvNn6dMc
 3rsc5aNdgrxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="373716987"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2020 05:51:25 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 19 May 2020 15:51:25 +0300
Date:   Tue, 19 May 2020 15:51:24 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Christian Lamparter <chunkeey@googlemail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/5] usb: renesas-xhci: Add the renesas xhci driver
Message-ID: <20200519125124.GD1298122@kuha.fi.intel.com>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-3-vkoul@kernel.org>
 <20200519114528.GC1298122@kuha.fi.intel.com>
 <20200519120130.GN374218@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519120130.GN374218@vkoul-mobl.Dlink>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 05:31:30PM +0530, Vinod Koul wrote:
> Hi Heikki
> 
> On 19-05-20, 14:45, Heikki Krogerus wrote:
> > Hi guys,
> > 
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
> Not me. does it also require firmware? If so you can try with this
> driver and see if it works for you?

It does require firmware, and yes I can test this driver at some
point.

thanks,

-- 
heikki
