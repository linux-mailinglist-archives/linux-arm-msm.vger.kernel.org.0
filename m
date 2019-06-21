Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 885C74EF8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 21:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfFUTlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 15:41:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36034 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUTli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 15:41:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so6442152wrs.3;
        Fri, 21 Jun 2019 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3systKa+Hf4qC2jaG3AjlrFBz0jY6HiFgy5kIInPZyA=;
        b=NLFcAIzJgQC5f+4dP79+WzoN2aitRR76c7mWvmCCPV4uCawGWkfNCv+sp8q02aMeZ0
         QLs8F9F5ZxQHU2zMr1pDMg0mJZ9NIdhh0dS+ovi7D6fypSw0WxWOEBv0r2KegNP2cPUT
         MPEvxb6Ty11Q1G3CueeX4lHLUV3LnS2L//E+LvJgzdLSPkGhNb+VfMITeDOK7fQD5iwq
         YsrLpfxE3QHD1RAR2Wa82xAU4mvglXsvD/2J1OI0VKiNKP26WO4LfLOLqhZjPrADrH4v
         QWQ/OZtVZNWrAdDHUqF1UPSTnakH3EedOOt5ZYtWEaYOWTw6vrRdLKUNAa9IeR0woh3c
         7RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3systKa+Hf4qC2jaG3AjlrFBz0jY6HiFgy5kIInPZyA=;
        b=nz4NDUYM3IOo9ycEEiRVIyNZmTMQ9gevibf4INGDIlWORn9gCSRCAEkhfjCu4fKEZq
         Y3T5jdJ9hPQmgCDJ3dl3J1sFZaiQ+1Q3OJxqUIHABQnRgRHAJ7+MZ/QNiXKVqTIoU+ta
         A6J3UpUZzo/zJiE3EQ4judNyD7o9Beo8b/Ra6NXykUj2wUtDUaGZwAhXyCQil4AwVF7e
         ABzzdjizALBsLpIagWYVyY0HsfOj1ozfjejtg6mZM7XUtFcnGX9pvmqIAaaYYZJscFUm
         iaNQ0yiBiRXNHCesrRAjdUrYquUOC+xyHfAiIafuOxZ3MfDmyHNwFVyS9hUknf60AvKN
         eZ6Q==
X-Gm-Message-State: APjAAAVEY/UyHAJjqyhwGD9d7jXi6gQrjcRAlRgpZLKjmIEHzAmqzlug
        NqLI3Wd4K9YvxZubjDyDqwY=
X-Google-Smtp-Source: APXvYqxaj/OzULPesBpIwooy+0eOaACaAA/gzFy/CQ5q+tz/e3X0fiWlukbCm3LdvH2dHk7gBO+6ww==
X-Received: by 2002:adf:f34b:: with SMTP id e11mr11601910wrp.230.1561146096000;
        Fri, 21 Jun 2019 12:41:36 -0700 (PDT)
Received: from debian64.daheim (pD9E297F7.dip0.t-ipconnect.de. [217.226.151.247])
        by smtp.gmail.com with ESMTPSA id t6sm3622441wmb.29.2019.06.21.12.41.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 12:41:34 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hePPi-0006bH-8c; Fri, 21 Jun 2019 21:41:34 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5]  usb: xhci: Add support for Renesas USB controllers
Date:   Fri, 21 Jun 2019 21:41:33 +0200
Message-ID: <11747914.jfR0NPdACA@debian64>
In-Reply-To: <20190621085913.8722-1-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday, June 21, 2019 10:59:08 AM CEST Vinod Koul wrote:
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> 
> This includes two patches from Christian which supported these controllers
> w/o ROM and later my patches for ROM support and multiple firmware versions.
> 
> Changes in v2:
>   used macros for timeout count and delay
>   removed renesas_fw_alive_check
>   cleaned renesas_fw_callback
>   removed recurion for renesas_fw_download
>   added MODULE_FIRMWARE
>   added comment for multiple fw order
> 
> Christian Lamparter (2):
>   usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
>   usb: xhci: handle uPD720201 and uPD720202 w/o ROM
> 
> Vinod Koul (3):
>   usb: xhci: Use register defined and field names
>   usb: xhci: Add ROM loader for uPD720201
>   usb: xhci: allow multiple firmware versions
> 
>  drivers/usb/host/xhci-pci.c | 942 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 942 insertions(+)
> 

bootlog from a Netgear WNDR4700 with a 32GiB USB3 Stick attached to the 
Renesas uPD720202K8-711-BAA-A chip.

[   13.523094] xhci_hcd 0000:45:00.0: firmware size is not a multiple of 8.
[   13.868071] xhci_hcd 0000:45:00.0: xHCI Host Controller
[   13.873325] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 2
[   13.886296] xhci_hcd 0000:45:00.0: hcc params 0x014051cf hci version 0x100 quirks 0x0000000101000090
[   13.902719] usbcore: registered new interface driver usb-storage
[   13.909277] kmodloader: done loading kernel modules from /etc/modules-boot.d/*
[   13.917336] hub 2-0:1.0: USB hub found
[   13.921432] init: - preinit -
[   13.930356] hub 2-0:1.0: 2 ports detected
[   13.942869] xhci_hcd 0000:45:00.0: xHCI Host Controller
[   13.948122] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 3
[   13.955514] xhci_hcd 0000:45:00.0: Host supports USB 3.0  SuperSpeed
[   13.981227] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
[   13.997141] hub 3-0:1.0: USB hub found
[   14.004375] hub 3-0:1.0: 2 ports detected
[   14.375644] usb-storage 1-1:1.0: USB Mass Storage device detected
[   14.382247] scsi host1: usb-storage 1-1:1.0
[   14.438959] usb 3-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[   14.467746] usb-storage 3-2:1.0: USB Mass Storage device detected
[   14.474241] scsi host2: usb-storage 3-2:1.0
[   15.394562] scsi 1:0:0:0: Direct-Access     Generic  STORAGE DEVICE   9454 PQ: 0 ANSI: 0
[   15.405183] sd 1:0:0:0: [sda] Attached SCSI removable disk
[   15.522448] scsi 2:0:0:0: Direct-Access     SanDisk  Ultra            1.00 PQ: 0 ANSI: 6
[   15.531952] sd 2:0:0:0: [sdb] 60063744 512-byte logical blocks: (30.8 GB/28.6 GiB)
[   15.541007] sd 2:0:0:0: [sdb] Write Protect is off
[   15.546808] sd 2:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[   15.574567]  sdb: sdb1
[   15.580581] sd 2:0:0:0: [sdb] Attached SCSI removable disk

This is working.

Tested-by: Christian Lamparter <chunkeey@gmail.com>


