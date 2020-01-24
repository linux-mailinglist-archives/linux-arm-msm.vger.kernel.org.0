Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEC414903C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 22:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAXVi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 16:38:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41134 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAXVi1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 16:38:27 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so3744576wrw.8;
        Fri, 24 Jan 2020 13:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JPUjZ35jiwDXQW49rwcMtsfq6BXn4MFG9FEiV5U41rE=;
        b=ZaLoFyM1kPanZnCOnNPKAXSWQthVDcubhVQQFC7AiDABfafPmmH+RneRSfuqgIkqt+
         XVso8jc6ybReoxy90PpCsQZ+/4FThRCiP27TlXS7fZgetK10FK67TRcZOokBLB9ti+jt
         2yawyQMTq5cMJTJBqrtEwQjHplr6byjYyitomfLWwHB5aeHu4mviemP/b4sHOGW5+0V+
         LmiwosOL2HWgvH/4OamcAxRIxbbqJa+O8vfYRCqLppaIEVuexaEX01TE4VrCWYKOYmVN
         1R9bvOtk3lm0m7ocr8t9K5AO8T51liS3G0iJTZG1ho3SVB4JseLCKfkOdS1N6/9l4Xml
         Inrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JPUjZ35jiwDXQW49rwcMtsfq6BXn4MFG9FEiV5U41rE=;
        b=g9Q5f/V9QSTRizoqGPsKKuH3Nags0g6NCDKR94L8jmxHjm9EZ6wGRRRvElKa+99+pV
         Ipm9hGO3Ks6j9EzumhuN3MFsGIF0gd9ctEwxRE7dewf/gBEMt1vHADBAQweIx+64fI2r
         JtRfp46Q3madeO4d/+eYQBanNP3jXP1ZuGCMzYxuQDEbwUDy315z9r81qe7Wibhtpv11
         oSgQJ2fhDaD4rV5R39dkRVsnKZpxLgMnjcGtRM4kWg/qFucH1LVFpK9/uT8Ys1RKcAXS
         U8zmmCy2bZgXU8tTtZIRtXncRkTYPU/IObNVlmKpmyHmTZHdornMFAk4EudKp93JcS+e
         iTGA==
X-Gm-Message-State: APjAAAVdoc1VwcFLiYPg6otKs38tpZusEOrHNRIK57t/0G2lF1gxlxq1
        WjYANf7T3Ym5ji4NlxRg4Qmgud3Q
X-Google-Smtp-Source: APXvYqzBetlE4PI7hVXmwd69Hyjm8pHO5DtljMJmQ6DmTZU5Q2rsglnlOi5d1FdzdFmhB2Hffz/COg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr6448507wrt.366.1579901903966;
        Fri, 24 Jan 2020 13:38:23 -0800 (PST)
Received: from debian64.daheim (p4FD0967A.dip0.t-ipconnect.de. [79.208.150.122])
        by smtp.gmail.com with ESMTPSA id n8sm9016719wrx.42.2020.01.24.13.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 13:38:22 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.93)
        (envelope-from <chunkeey@gmail.com>)
        id 1iv6ej-0024sy-TR; Fri, 24 Jan 2020 22:38:21 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Date:   Fri, 24 Jan 2020 22:38:21 +0100
Message-ID: <5878067.luYmtVZgP3@debian64>
In-Reply-To: <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
References: <20200113084005.849071-1-vkoul@kernel.org> <20200121064608.GA2841@vkoul-mobl> <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday, 21 January 2020 21:26:34 CET Christian Lamparter wrote:
> Hello,
> 
> On Tue, Jan 21, 2020 at 7:46 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > hey Christian,
> >
> > On 13-01-20, 21:33, Christian Lamparter wrote:
> > > On Mon, Jan 13, 2020 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
> > > >
> > > > On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > > >
> > > > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > > > These require firmware to be loaded and in case devices have ROM those can
> > > > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > > >
> > > > > This includes two patches from Christian which supported these controllers
> > > > > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > > > > debugfs hook for rom erase and export of xhci-pci functions.
> > > > >
> > > >
> > > > Thanks so much for updating these! They are working ok for me in my
> > > > testing on db845c.
> > > >
> > > > Tested-by: John Stultz <john.stultz@linaro.org>
> > >
> > > Nice! I'll definitely give this series another try on my WNDR4700 too
> > > (PowerPC Arch)
> > > this weekend.
> > >
> > > and from me: Thanks!
> >
> > Did you get around to test these?
> 
> Not yet, I was too optimistic that I could get current linux-usb with the
> patches running on the WNDR4700 (due to APM82181) over the
> weekend. Do you think that It still counts, if I'm going with 5.4.11 on
> OpenWrt instead? Because then I just swap out the old patches from
> my OpenWrt APM821XX branch:
> <https://git.openwrt.org/?p=openwrt/staging/chunkeey.git;a=commit;h=4dd6f62a36a3724f0363d639cd9e29e04d7b62c0>
> 
> and don't have to figure out what broke with linux-usb on the APM821xx.

I could get 5.4.11 to boot on the Netgear WNDR4700 :-).
(This has a APM82181 SoC (PowerPC 464))

Here's faillog from the "plain xhci-pci" driver: 

[  375.481868] xhci_hcd 0000:45:00.0: xHCI Host Controller
[  375.487149] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 1
[  385.494590] xhci_hcd 0000:45:00.0: can't setup: -110
[  385.499558] xhci_hcd 0000:45:00.0: USB bus 1 deregistered
[  385.504963] xhci_hcd 0000:45:00.0: init 0000:45:00.0 fail, -110
[  385.510889] xhci_hcd: probe of 0000:45:00.0 failed with error -110

(Notice how it gets stuck for 10 seconds there).

And this is the successlog from the xhci-pci-renesas module

[  391.555559] renesas xhci 0000:45:00.0: xHCI Host Controller
[  391.561171] renesas xhci 0000:45:00.0: new USB bus registered, assigned bus number 1
[  391.575068] renesas xhci 0000:45:00.0: hcc params 0x014051cf hci version 0x100 quirks 0x0000000101000090
[  391.586750] hub 1-0:1.0: USB hub found
[  391.592601] hub 1-0:1.0: 2 ports detected
[  391.597199] renesas xhci 0000:45:00.0: xHCI Host Controller
[  391.602797] renesas xhci 0000:45:00.0: new USB bus registered, assigned bus number 2
[  391.610537] renesas xhci 0000:45:00.0: Host supports USB 3.0 SuperSpeed
[  391.617719] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[  391.626495] hub 2-0:1.0: USB hub found
[  391.630570] hub 2-0:1.0: 2 ports detected

this is when I added the usb 3.0-stick:

[  775.403928] usb 2-2: new SuperSpeed Gen 1 USB device number 3 using renesas xhci
[  775.432684] usb-storage 2-2:1.0: USB Mass Storage device detected
[  775.439238] scsi host1: usb-storage 2-2:1.0
[  776.482556] scsi 1:0:0:0: Direct-Access     SanDisk  Ultra            1.00 PQ: 0 ANSI: 6
[  776.492181] sd 1:0:0:0: [sda] 60063744 512-byte logical blocks: (30.8 GB/28.6 GiB)
[  776.501193] sd 1:0:0:0: [sda] Write Protect is off
[  776.507047] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[  776.524893]  sda: sda1 sda2
[  776.531062] sd 1:0:0:0: [sda] Attached SCSI removable disk

root@(none):/dev# hdparm -t /dev/sda

/dev/sda:
 Timing buffered disk reads: 466 MB in  3.01 seconds = 154.98 MB/sec

and this is the log from my usb 2.0-memorystick:

[ 1187.113650] usb 2-2: USB disconnect, device number 3
[ 1195.867397] usb 1-2: new high-speed USB device number 2 using renesas xhci
[ 1195.895171] usb-storage 1-2:1.0: USB Mass Storage device detected
[ 1195.901848] scsi host1: usb-storage 1-2:1.0
[ 1196.962583] scsi 1:0:0:0: Direct-Access     SanDisk  Cruzer Blade     1.00 PQ: 0 ANSI: 6
[ 1196.978772] sd 1:0:0:0: [sda] 30031872 512-byte logical blocks: (15.4 GB/14.3 GiB)
[ 1196.988529] sd 1:0:0:0: [sda] Write Protect is off
[ 1196.994498] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[ 1197.020407]  sda: sda1
[ 1197.030458] sd 1:0:0:0: [sda] Attached SCSI removable disk

root@(none):/dev# hdparm -t /dev/sda

/dev/sda:
 Timing buffered disk reads:  64 MB in  3.01 seconds =  21.28 MB/sec

These speeds for usb3 and usb2 are within what the device can do.
So, everything is working fine with the v6.

Tested-by: Christian Lamparter <chunkeey@gmail.com>

Cheers,
Christian


