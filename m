Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52B0149AAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2020 14:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgAZNHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jan 2020 08:07:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38548 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgAZNHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jan 2020 08:07:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so7644949wrh.5;
        Sun, 26 Jan 2020 05:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AInU9jEfF+3yWDuqYPlj88z1dwAMsWqWDrRRvQfEaJs=;
        b=ClC3mylOJzOZ82nh3T6d53RMLeBNqf9vv10iofrKwYwdXmwi5MaHV3bHXEy9Fmtqdn
         DIvWm0rTD5twWN6wVXjBII9GDncZfMqs/1Hj6rrA8xLs5sp+gc5vlIMoiJgnpldvvV4t
         hfPJ3soRfQlqIsVYIIjBAcQuCYbtU+q/slF2wX5ZayxxCOKD86qd/MpLXUoTBgxYowkN
         JRI866UzTCCMnnM++eNiwBcZLbbWaCk4r0M7nC3i5En/OzCEKknfkf1xezG9P7FKXTiM
         EfMz2miUm48NcQRhVK92SNNnn6RZhOmFYB86P8r8BuXTqEQ6glG5BovxCi9K3FbM0SJo
         Lh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AInU9jEfF+3yWDuqYPlj88z1dwAMsWqWDrRRvQfEaJs=;
        b=pvPOyDhHMaCTCljeDy7Q+2GqU/QDbk0DHTC3liozKP8Tx66RglVX63QkL77LS3jSB/
         eg89m3PmEl2Ccma76Sglyks8sR0814lxFPSAfh/Y5AOb93U0QqHJY5LpD6VpegWSa2a9
         1Y9v0Sf/TfRJhQFpGRZoJV31lB/Qg3VhqaFDpc/wkJ2FZMRWHPMs8+mYxoJ1a5WcfXXF
         hjcZv5dh35uN8prvHwrgtjc6zJ7I7XTxJOQm/OA8nP0JUtnH1FELMlQivq7wGz7oqyZA
         bcgH4TXQZeMwBQ6xUYp7wC7WbCCr3PCRJELDVObP3iPLpOtCtE4++8aQmqgMk/pVk+mt
         TVmQ==
X-Gm-Message-State: APjAAAWQtxTbv+b7ZaGfrnAs95A5/cS72JzhjVCd5OL4oiYnW1s3RBDu
        iCvczCtOVjdHyc2QhUS1WDs=
X-Google-Smtp-Source: APXvYqx5XlmZYou0Skb71KJcM/U9yJ3iwNcSkjDlmKzhAD9dUArq3wO/sxIvFyKSktYRCS3nqregUw==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr15374180wrv.108.1580044064975;
        Sun, 26 Jan 2020 05:07:44 -0800 (PST)
Received: from debian64.daheim (p4FD09AEC.dip0.t-ipconnect.de. [79.208.154.236])
        by smtp.gmail.com with ESMTPSA id a22sm11553039wmd.20.2020.01.26.05.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2020 05:07:44 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.93)
        (envelope-from <chunkeey@gmail.com>)
        id 1ivhdf-000dre-5g; Sun, 26 Jan 2020 14:07:43 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Andreas =?ISO-8859-1?Q?B=F6hler?= <dev@aboehler.at>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Date:   Sun, 26 Jan 2020 14:07:42 +0100
Message-ID: <3802988.9TbF58Ff0q@debian64>
In-Reply-To: <9b63675e-36f4-292a-4bcc-579cb59ed855@aboehler.at>
References: <20200113084005.849071-1-vkoul@kernel.org> <9b63675e-36f4-292a-4bcc-579cb59ed855@aboehler.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sunday, 26 January 2020 01:11:35 CET Andreas B=F6hler wrote:
>=20
> On 13/01/2020 09:40, Vinod Koul wrote:
> > This series add support for Renesas USB controllers uPD720201 and uPD72=
0202.
> > These require firmware to be loaded and in case devices have ROM those =
can
> > also be programmed if empty. If ROM is programmed, it runs from ROM as =
well.
> >=20
> > This includes two patches from Christian which supported these controll=
ers
> > w/o ROM and later my patches for ROM support and multiple firmware vers=
ions,
> > debugfs hook for rom erase and export of xhci-pci functions.
> >=20
> I tested this on an AVM FRITZ!Box 3490, backported to 4.19: Firmware
> upload works fine.
>=20
> However, I'm seeing read errors afterwards which, I suppose, are a
> different story.
>=20
> Here is the log:
>=20
> [  498.115808] ifx_pcie_bios_map_irq port 0 dev 0000:01:00.0 slot 0 pin 1
> [  498.121154] ifx_pcie_bios_map_irq dev 0000:01:00.0 irq 144 assigned
> [  498.488541] renesas xhci 0000:01:00.0: xHCI Host Controller
> [  498.492820] renesas xhci 0000:01:00.0: new USB bus registered,
> assigned bus number 1
> [  498.506123] renesas xhci 0000:01:00.0: hcc params 0x014051cf hci
> version 0x100 quirks 0x0000000101000090
> [  498.516869] hub 1-0:1.0: USB hub found
> [  498.519631] hub 1-0:1.0: 2 ports detected
> [  498.525641] renesas xhci 0000:01:00.0: xHCI Host Controller
> [  498.530217] renesas xhci 0000:01:00.0: new USB bus registered,
> assigned bus number 2
> [  498.537846] renesas xhci 0000:01:00.0: Host supports USB 3.0 SuperSpeed
> [  498.545095] usb usb2: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [  498.554921] hub 2-0:1.0: USB hub found
> [  498.557588] hub 2-0:1.0: 2 ports detected
> [  523.013361] usb 1-1: new full-speed USB device number 2 using renesas
> xhci
> [  523.182725] usb 1-1: no configurations
> [  523.185085] usb 1-1: can't read configurations, error -22
> [  523.317423] usb 1-1: new full-speed USB device number 3 using renesas
> xhci
> [  523.493710] usb 1-1: no configurations
> [  523.496069] usb 1-1: can't read configurations, error -22
> [  523.501951] usb usb1-port1: attempt power cycle
>=20
Hm, I don't think lantiq's PCI code is upstream... And now that I've seen
more errors from your forum post at:=20
<https://forum.openwrt.org/t/fix-xhci-errors-on-renesas-upd70202-fritz-box-=
3490/53620>

I wonder if this has something to do with a similar issue I was facing with
the ath9k chip loader in commit:
5a4f2040fd07 ("ath9k: add loader for AR92XX (and older) pci(e)")

which later needed a fix for a specifc lantiq byteswap problem in commit:
22d0d5ae7a08 ("ath9k: use iowrite32 over __raw_writel"):
|    This patch changes the ath9k_pci_owl_loader to use the
|    same iowrite32 memory accessor that ath9k_pci is using
|    to communicate with the PCI(e) chip.
|  =20
|   This will fix endian issues that came up during testing
|   with loaned AVM Fritz!Box 7360 (Lantiq MIPS SoCs + AR9287).


The reason was that apparently (I gave back the loaned device), the lantiq
PCI silicon does some sneaky byteswaps in special cases. Could this be
related? You mentioned in another post that AVM did changes to the xhci
driver, can you look if they added changes to the memory accessors?
Because this would explain why the APM82181 (PowerPC which is also a
BigEndian) had no issues (as it's using a entirely different pcie hardware
and code).

Cheers,
Christian


