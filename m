Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DD51493B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 06:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgAYFcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 00:32:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:41362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgAYFcn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 00:32:43 -0500
Received: from localhost (unknown [122.181.212.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 684802071A;
        Sat, 25 Jan 2020 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579930362;
        bh=Xx1+ur3lE4Jj0egyyY3++sVwcP+whPpqBcx5ffuZgco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hkAK80tJX2RXuqEgaPCwRlVALqppsoJhph8gwLLvbs57xpHmFALaItpbJMHfDXE7B
         3nypie7ulbvbPqSvvplfzmJLRZc7/e/d2oGlSgVnDIXWFU428WAdcwlA031Mh+q90j
         WACEOdJ+4YVtjkDPyyQknJKvQHT534Wt8qQl38d0=
Date:   Sat, 25 Jan 2020 11:02:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200125053237.GG2841@vkoul-mobl>
References: <20200113084005.849071-1-vkoul@kernel.org>
 <20200121064608.GA2841@vkoul-mobl>
 <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
 <5878067.luYmtVZgP3@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5878067.luYmtVZgP3@debian64>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-01-20, 22:38, Christian Lamparter wrote:
> On Tuesday, 21 January 2020 21:26:34 CET Christian Lamparter wrote:
> > Hello,
> > 
> > On Tue, Jan 21, 2020 at 7:46 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > hey Christian,
> > >
> > > On 13-01-20, 21:33, Christian Lamparter wrote:
> > > > On Mon, Jan 13, 2020 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > >
> > > > > On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > > > >
> > > > > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > > > > These require firmware to be loaded and in case devices have ROM those can
> > > > > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > > > >
> > > > > > This includes two patches from Christian which supported these controllers
> > > > > > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > > > > > debugfs hook for rom erase and export of xhci-pci functions.
> > > > > >
> > > > >
> > > > > Thanks so much for updating these! They are working ok for me in my
> > > > > testing on db845c.
> > > > >
> > > > > Tested-by: John Stultz <john.stultz@linaro.org>
> > > >
> > > > Nice! I'll definitely give this series another try on my WNDR4700 too
> > > > (PowerPC Arch)
> > > > this weekend.
> > > >
> > > > and from me: Thanks!
> > >
> > > Did you get around to test these?
> > 
> > Not yet, I was too optimistic that I could get current linux-usb with the
> > patches running on the WNDR4700 (due to APM82181) over the
> > weekend. Do you think that It still counts, if I'm going with 5.4.11 on
> > OpenWrt instead? Because then I just swap out the old patches from
> > my OpenWrt APM821XX branch:
> > <https://git.openwrt.org/?p=openwrt/staging/chunkeey.git;a=commit;h=4dd6f62a36a3724f0363d639cd9e29e04d7b62c0>
> > 
> > and don't have to figure out what broke with linux-usb on the APM821xx.
> 
> I could get 5.4.11 to boot on the Netgear WNDR4700 :-).
> (This has a APM82181 SoC (PowerPC 464))
> 
> Here's faillog from the "plain xhci-pci" driver: 
> 
> [  375.481868] xhci_hcd 0000:45:00.0: xHCI Host Controller
> [  375.487149] xhci_hcd 0000:45:00.0: new USB bus registered, assigned bus number 1
> [  385.494590] xhci_hcd 0000:45:00.0: can't setup: -110
> [  385.499558] xhci_hcd 0000:45:00.0: USB bus 1 deregistered
> [  385.504963] xhci_hcd 0000:45:00.0: init 0000:45:00.0 fail, -110
> [  385.510889] xhci_hcd: probe of 0000:45:00.0 failed with error -110
> 
> (Notice how it gets stuck for 10 seconds there).
> 
> And this is the successlog from the xhci-pci-renesas module
> 
> [  391.555559] renesas xhci 0000:45:00.0: xHCI Host Controller
> [  391.561171] renesas xhci 0000:45:00.0: new USB bus registered, assigned bus number 1
> [  391.575068] renesas xhci 0000:45:00.0: hcc params 0x014051cf hci version 0x100 quirks 0x0000000101000090
> [  391.586750] hub 1-0:1.0: USB hub found
> [  391.592601] hub 1-0:1.0: 2 ports detected
> [  391.597199] renesas xhci 0000:45:00.0: xHCI Host Controller
> [  391.602797] renesas xhci 0000:45:00.0: new USB bus registered, assigned bus number 2
> [  391.610537] renesas xhci 0000:45:00.0: Host supports USB 3.0 SuperSpeed
> [  391.617719] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [  391.626495] hub 2-0:1.0: USB hub found
> [  391.630570] hub 2-0:1.0: 2 ports detected
> 
> this is when I added the usb 3.0-stick:
> 
> [  775.403928] usb 2-2: new SuperSpeed Gen 1 USB device number 3 using renesas xhci
> [  775.432684] usb-storage 2-2:1.0: USB Mass Storage device detected
> [  775.439238] scsi host1: usb-storage 2-2:1.0
> [  776.482556] scsi 1:0:0:0: Direct-Access     SanDisk  Ultra            1.00 PQ: 0 ANSI: 6
> [  776.492181] sd 1:0:0:0: [sda] 60063744 512-byte logical blocks: (30.8 GB/28.6 GiB)
> [  776.501193] sd 1:0:0:0: [sda] Write Protect is off
> [  776.507047] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [  776.524893]  sda: sda1 sda2
> [  776.531062] sd 1:0:0:0: [sda] Attached SCSI removable disk
> 
> root@(none):/dev# hdparm -t /dev/sda
> 
> /dev/sda:
>  Timing buffered disk reads: 466 MB in  3.01 seconds = 154.98 MB/sec
> 
> and this is the log from my usb 2.0-memorystick:
> 
> [ 1187.113650] usb 2-2: USB disconnect, device number 3
> [ 1195.867397] usb 1-2: new high-speed USB device number 2 using renesas xhci
> [ 1195.895171] usb-storage 1-2:1.0: USB Mass Storage device detected
> [ 1195.901848] scsi host1: usb-storage 1-2:1.0
> [ 1196.962583] scsi 1:0:0:0: Direct-Access     SanDisk  Cruzer Blade     1.00 PQ: 0 ANSI: 6
> [ 1196.978772] sd 1:0:0:0: [sda] 30031872 512-byte logical blocks: (15.4 GB/14.3 GiB)
> [ 1196.988529] sd 1:0:0:0: [sda] Write Protect is off
> [ 1196.994498] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [ 1197.020407]  sda: sda1
> [ 1197.030458] sd 1:0:0:0: [sda] Attached SCSI removable disk
> 
> root@(none):/dev# hdparm -t /dev/sda
> 
> /dev/sda:
>  Timing buffered disk reads:  64 MB in  3.01 seconds =  21.28 MB/sec
> 
> These speeds for usb3 and usb2 are within what the device can do.
> So, everything is working fine with the v6.
> 
> Tested-by: Christian Lamparter <chunkeey@gmail.com>

Thanks a lot Christian for again testing this.

Mathias, any comments on this series..?

-- 
~Vinod
