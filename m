Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C464FCC1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 18:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfFWQks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 12:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfFWQks (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 12:40:48 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F16C2073F;
        Sun, 23 Jun 2019 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561308047;
        bh=mtPesJuWQ7t0JFWn2B6X2pN6nU+T7enAXuVl76hjQRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uaHq9OKEc72NTXo6bCpJxpTavqpbbSn6z00ubbv1DmU/IVJZKGezMw4fPM48T/bHR
         bU/kMUAUqfdSatwL/btXAf5kuMXGBnfJzF+A62KLdjpBf0dVipbpqHGdwOg81k/bwZ
         BvLXP1+MoiMiwy/jT3IES3RYMGfLpFTPUICxwdJM=
Date:   Sun, 23 Jun 2019 22:07:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5]  usb: xhci: Add support for Renesas USB
 controllers
Message-ID: <20190623163737.GU2962@vkoul-mobl>
References: <20190621085913.8722-1-vkoul@kernel.org>
 <11747914.jfR0NPdACA@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11747914.jfR0NPdACA@debian64>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-06-19, 21:41, Christian Lamparter wrote:
> On Friday, June 21, 2019 10:59:08 AM CEST Vinod Koul wrote:
> > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > These require firmware to be loaded and in case devices have ROM those can
> > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > 
> > This includes two patches from Christian which supported these controllers
> > w/o ROM and later my patches for ROM support and multiple firmware versions.
> > 
> > Changes in v2:
> >   used macros for timeout count and delay
> >   removed renesas_fw_alive_check
> >   cleaned renesas_fw_callback
> >   removed recurion for renesas_fw_download
> >   added MODULE_FIRMWARE
> >   added comment for multiple fw order
> > 
> > Christian Lamparter (2):
> >   usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
> >   usb: xhci: handle uPD720201 and uPD720202 w/o ROM
> > 
> > Vinod Koul (3):
> >   usb: xhci: Use register defined and field names
> >   usb: xhci: Add ROM loader for uPD720201
> >   usb: xhci: allow multiple firmware versions
> > 
> >  drivers/usb/host/xhci-pci.c | 942 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 942 insertions(+)
> > 
> 
> bootlog from a Netgear WNDR4700 with a 32GiB USB3 Stick attached to the 
> Renesas uPD720202K8-711-BAA-A chip.
> 
> [   13.523094] xhci_hcd 0000:45:00.0: firmware size is not a multiple of 8.
> [   13.868071] xhci_hcd 0000:45:00.0: xHCI Host Controller
> [   13.873325] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 2
> [   13.886296] xhci_hcd 0000:45:00.0: hcc params 0x014051cf hci version 0x100 quirks 0x0000000101000090
> [   13.902719] usbcore: registered new interface driver usb-storage
> [   13.909277] kmodloader: done loading kernel modules from /etc/modules-boot.d/*
> [   13.917336] hub 2-0:1.0: USB hub found
> [   13.921432] init: - preinit -
> [   13.930356] hub 2-0:1.0: 2 ports detected
> [   13.942869] xhci_hcd 0000:45:00.0: xHCI Host Controller
> [   13.948122] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 3
> [   13.955514] xhci_hcd 0000:45:00.0: Host supports USB 3.0  SuperSpeed
> [   13.981227] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
> [   13.997141] hub 3-0:1.0: USB hub found
> [   14.004375] hub 3-0:1.0: 2 ports detected
> [   14.375644] usb-storage 1-1:1.0: USB Mass Storage device detected
> [   14.382247] scsi host1: usb-storage 1-1:1.0
> [   14.438959] usb 3-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [   14.467746] usb-storage 3-2:1.0: USB Mass Storage device detected
> [   14.474241] scsi host2: usb-storage 3-2:1.0
> [   15.394562] scsi 1:0:0:0: Direct-Access     Generic  STORAGE DEVICE   9454 PQ: 0 ANSI: 0
> [   15.405183] sd 1:0:0:0: [sda] Attached SCSI removable disk
> [   15.522448] scsi 2:0:0:0: Direct-Access     SanDisk  Ultra            1.00 PQ: 0 ANSI: 6
> [   15.531952] sd 2:0:0:0: [sdb] 60063744 512-byte logical blocks: (30.8 GB/28.6 GiB)
> [   15.541007] sd 2:0:0:0: [sdb] Write Protect is off
> [   15.546808] sd 2:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [   15.574567]  sdb: sdb1
> [   15.580581] sd 2:0:0:0: [sdb] Attached SCSI removable disk
> 
> This is working.
> 
> Tested-by: Christian Lamparter <chunkeey@gmail.com>

Thanks for the verification Christian.

Regards
-- 
~Vinod
