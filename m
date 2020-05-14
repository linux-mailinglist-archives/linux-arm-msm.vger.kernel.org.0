Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA991D2CB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 12:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgENK1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 06:27:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:55914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726234AbgENK1y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 06:27:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3C9A20734;
        Thu, 14 May 2020 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589452073;
        bh=8YB9PkihPxyIdTMoNW95kPZVAuM1cjE/7vhXPSTIK6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z958oHucrRPdewqJv4Gvyp12/z5HkOQ/5iRnCCEMxauRv6a9Gum/JsyXEO9hVeonn
         LeYX3KtpbsiqpvCUULsndaaqF0yUVMDsq0uZ52Dtw4kLAzvISzWugYxsisv/0eJMjY
         bajxmRGO6M5HGRqZeSfStnIFQpCsf3MCtHIxfAVs=
Date:   Thu, 14 May 2020 11:24:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 5/5] usb: xhci: provide a debugfs hook for erasing rom
Message-ID: <20200514092458.GA1591384@kroah.com>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-6-vkoul@kernel.org>
 <caa2c5f4-a858-d699-27af-7b0c22b4dc40@linux.intel.com>
 <20200513124554.GA1083139@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513124554.GA1083139@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 02:45:54PM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 13, 2020 at 03:36:19PM +0300, Mathias Nyman wrote:
> > On 6.5.2020 9.00, Vinod Koul wrote:
> > > run "echo 1 > /sys/kernel/debug/renesas-usb/rom_erase" to erase
> > > firmware when driver is loaded.
> > > 
> > > Subsequent init of driver shall reload the firmware
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  drivers/usb/host/xhci-pci-renesas.c | 33 +++++++++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > > index f7d2445d30ec..fa32ec352dc8 100644
> > > --- a/drivers/usb/host/xhci-pci-renesas.c
> > > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright (C) 2019-2020 Linaro Limited */
> > >  
> > >  #include <linux/acpi.h>
> > > +#include <linux/debugfs.h>
> > >  #include <linux/firmware.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pci.h>
> > > @@ -170,6 +171,8 @@ static int renesas_fw_verify(const void *fw_data,
> > >  	return 0;
> > >  }
> > >  
> > > +static void debugfs_init(struct pci_dev *pdev);
> > > +
> > >  static bool renesas_check_rom(struct pci_dev *pdev)
> > >  {
> > >  	u16 rom_status;
> > > @@ -183,6 +186,7 @@ static bool renesas_check_rom(struct pci_dev *pdev)
> > >  	rom_status &= RENESAS_ROM_STATUS_ROM_EXISTS;
> > >  	if (rom_status) {
> > >  		dev_dbg(&pdev->dev, "External ROM exists\n");
> > > +		debugfs_init(pdev);
> > >  		return true; /* External ROM exists */
> > >  	}
> > >  
> > > @@ -449,6 +453,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
> > >  	dev_dbg(&pdev->dev, "ROM Erase... Done success\n");
> > >  }
> > >  
> > > +static int debugfs_rom_erase(void *data, u64 value)
> > > +{
> > > +	struct pci_dev *pdev = data;
> > > +
> > > +	if (value == 1) {
> > > +		dev_dbg(&pdev->dev, "Userspace requested ROM erase\n");
> > > +		renesas_rom_erase(pdev);
> > > +		return 0;
> > > +	}
> > > +	return -EINVAL;
> > > +}
> > > +DEFINE_DEBUGFS_ATTRIBUTE(rom_erase_ops, NULL, debugfs_rom_erase, "%llu\n");
> > > +
> > > +static struct dentry *debugfs_root;
> > > +
> > > +static void debugfs_init(struct pci_dev *pdev)
> > > +{
> > > +	debugfs_root = debugfs_create_dir("renesas_usb", NULL);
> > 
> > This will create a renesas_usb directory right under debugfs root.
> > xhci has its own struct dentry xhci_debugfs_root; 
> > Use that as parent instead
> 
> Ah, I misssed that, a follow-on patch can do this, right?

Actually, a whole new series with this changed is good, I didn't take
these for now, for some reason I thought I had.

thanks,

greg k-h
