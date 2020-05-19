Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF47A1D95C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 14:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbgESMBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 08:01:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbgESMBf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 08:01:35 -0400
Received: from localhost (unknown [122.182.207.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 460282072C;
        Tue, 19 May 2020 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589889695;
        bh=Qlm8SoqsLDcOC9wi24RYefzJ1mZnCn+8vEkJi2KRVJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nM4goJouEui7NhAAqUybi6Dgp2NItjFAX393D8tDrZGHsOge9pU7Eb9NlDbyFhrwT
         guh8qt79oLB7ah0c5WVTHzkxg/F52vbImhbrA76pRpOL3auSd4/yZ3VURrZ9i+Ghhi
         ioyTpQa8BHmqfRX4hd3DJxhv1by/8AH7q2LpL/+k=
Date:   Tue, 19 May 2020 17:31:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
Message-ID: <20200519120130.GN374218@vkoul-mobl.Dlink>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-3-vkoul@kernel.org>
 <20200519114528.GC1298122@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519114528.GC1298122@kuha.fi.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Heikki

On 19-05-20, 14:45, Heikki Krogerus wrote:
> Hi guys,
> 
> On Wed, May 06, 2020 at 11:30:22AM +0530, Vinod Koul wrote:
> > From: Christian Lamparter <chunkeey@googlemail.com>
> > 
> > This add a new driver for renesas xhci which is basically a firmware
> > loader for uPD720201 and uPD720202 w/o ROM. The xhci-pci driver will
> > invoke this driver for loading/unloading on relevant devices.
> > 
> > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > devices which need the firmware loader on page 2 in order to
> > work as they "do not support the External ROM".
> > 
> > The "Firmware Download Sequence" is describe in chapter
> > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > 
> > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > alternative version can be sourced from Netgear's WNDR4700 GPL
> > archives.
> > 
> > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > (2012-06-15) state that the firmware is for the following devices:
> >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> 
> You wouldn't happen to have access to the documentation of the
> "original" uPD720200 USB 3.0 controller?
> 
> It would be cool if we could support that too with this driver.

Not me. does it also require firmware? If so you can try with this
driver and see if it works for you?

Thanks
-- 
~Vinod
