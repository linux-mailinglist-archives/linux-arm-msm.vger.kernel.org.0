Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1736D302840
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 17:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbhAYQyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 11:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728681AbhAYQxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 11:53:30 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC162C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 08:52:48 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id j8so3425091oon.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 08:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e4g+tFMveVk8ycAsFKT1Lz7duEh4H/cEv5udD3mnNBI=;
        b=YyYVgk1gaBAIt0BLww0cBWRnTkqVpS9HZmmIKYYnx/bLzLrxHdEIkzHDAJmJ/3iajL
         1/Xof5C5eeFbTCApft+pnhF4a0plDSLHWelfx3fvtBSNrQHAN1r0XgRfIz4S3dCgYY/c
         TvU8bw/l6tgxrC//wpyFwFPf4WAuV1Cd6ywDR33WmpSwLQN9oy7SP0oUYeT28utik3Pn
         /shD+yrTYJ4/MZoTBTllB+kiMqP7+WkR0am7N/DgzCVCr/pizSblXFXfkUlBpyag3YjV
         PFwDwD5zx34zpmeDU2aYyKxB3MKj0FIgT3gEUl58Rh0LTWPx54+r9qSmj3Y/OR+3etWt
         mlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4g+tFMveVk8ycAsFKT1Lz7duEh4H/cEv5udD3mnNBI=;
        b=R6ffsc/wm/SHWE14R7rJzfja/PluNA1agr5yaCp61pXLRGKC+soZdU93MYmzxPe80k
         nHWDKwzZ+bHNzImaWHO5OnF9qs/MrHb865+zxyKtoYjr6Ss1kHx8jkHz152JMiknl63T
         ndVRJj9wsUNS/Y4glDZMukCfP0iJMaVLNPgrXW5yW/CKZegc7wbClls7im8i4f2pGqBi
         NyUQPJZqYWJ5luiCHP5mNAv0ZChOgucaVxFS0CQfBN9FfUCh/F9ZXP8qtRm/50xJ+HOx
         9I8Gl+dXD93GQtmSJbsHf/dcTelzRzTqzr5d83Z6yA6BFikZ6vj54xsg81cnC/F4UhKH
         huBA==
X-Gm-Message-State: AOAM533T6k63QW2nYIQ2FvIpGC7TDffgQ9lSpmJHsyp1fl/3ni94et31
        N/ZMErC+F19OHXXjB1LWSINIgA==
X-Google-Smtp-Source: ABdhPJwfUAIQOxGReRupBWy1n2paERXB5qvQXdMr8vlHkDVgKPYczT/2xa88heY1HjuW/CODmjXa/g==
X-Received: by 2002:a4a:e294:: with SMTP id k20mr1083994oot.82.1611593568047;
        Mon, 25 Jan 2021 08:52:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a71sm166694oob.48.2021.01.25.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 08:52:47 -0800 (PST)
Date:   Mon, 25 Jan 2021 10:52:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Andy Gross <agross@kernel.org>, robh+dt@kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v2 4/4] arm: dts: add 8devices Habanero DVK
Message-ID: <YA73XeUCO/0bYKT2@builder.lan>
References: <20200909195640.3127341-1-robert.marko@sartura.hr>
 <20200909195640.3127341-5-robert.marko@sartura.hr>
 <CA+HBbNEkmYMi5KutwrBVh3uqzjdEmHrbJnPbH43C9B-Kq1MBNA@mail.gmail.com>
 <YAsf9aZ8mXU8vLZK@builder.lan>
 <CA+HBbNHtvP7_8RovLs1L=C+iSpGTRAov17TuC58DwNkkAeSjfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNHtvP7_8RovLs1L=C+iSpGTRAov17TuC58DwNkkAeSjfQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 04:59 CST 2021, Robert Marko wrote:

> On Fri, Jan 22, 2021 at 7:56 PM Bjorn Andersson <bjorn.andersson@linaro.org>
> wrote:
> 
> > On Fri 02 Oct 12:41 CDT 2020, Robert Marko wrote:
> >
> > > On Wed, Sep 9, 2020 at 9:56 PM Robert Marko <robert.marko@sartura.hr>
> > wrote:
> > > >
> > > > 8devices Habanero DVK is a dual-band SoM development kit based on
> > Qualcomm
> > > > IPQ4019 + QCA8075 platform.
> > > >
> > > > Specs are:
> > > > CPU: QCA IPQ4019
> > > > RAM: DDR3L 512MB
> > > > Storage: 32MB SPI-NOR and optional Parallel SLC NAND(Some boards ship
> > with it and some without)
> > > > WLAN1: 2.4 GHz built into IPQ4019 (802.11n) 2x2
> > > > WLAN2: 5 GHz built into IPO4019 (802.11ac Wawe-2) 2x2
> > > > Ethernet: 5x Gbit LAN (QCA 8075)
> > > > USB: 1x USB 2.0 and 1x USB 3.0 (Both built into IPQ4019)
> > > > MicroSD slot (Uses SD controller built into IPQ4019)
> > > > SDIO3.0/EMMC slot (Uses the same SD controller)
> > > > Mini PCI-E Gen 2.0 slot (Built into IPQ4019)
> > > > 5x LEDs (4 GPIO controllable)
> > > > 2x Pushbutton (1 is connected to GPIO, other to SoC reset)
> > > > LCD ZIF socket (Uses the LCD controller built into IPQ4019 which has
> > no driver support)
> > > > 1x UART 115200 rate on J18
> > > >
> > > > 2x breakout development headers
> > > > 12V DC Jack for power
> > > > DIP switch for bootstrap configuration
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > > > ---
> > > > Changes since v1:
> > > > * Drop include that does not exist
> > > >
> > > >  arch/arm/boot/dts/Makefile                    |   1 +
> > > >  .../boot/dts/qcom-ipq4019-habanero-dvk.dts    | 304 ++++++++++++++++++
> > > >  2 files changed, 305 insertions(+)
> > > >  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> > > >
> > > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > > index 246d82fc5fcd..004262e0d699 100644
> > > > --- a/arch/arm/boot/dts/Makefile
> > > > +++ b/arch/arm/boot/dts/Makefile
> > > > @@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
> > > >         qcom-ipq4019-ap.dk04.1-c3.dtb \
> > > >         qcom-ipq4019-ap.dk07.1-c1.dtb \
> > > >         qcom-ipq4019-ap.dk07.1-c2.dtb \
> > > > +       qcom-ipq4019-habanero-dvk.dtb \
> > > >         qcom-ipq8064-ap148.dtb \
> > > >         qcom-ipq8064-rb3011.dtb \
> > > >         qcom-msm8660-surf.dtb \
> > > > diff --git a/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
> > b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
[..]
> > >
> > > Hi,
> > > Is there an issue with the patch preventing the review?
> > >
> >
> > Found this in my inbox and I don't know why I never replied to you,
> > perhaps because kernel test robot says it doesn't build...
> >
> > I tried to apply it now but there's no "vqmmc" so it doesn't build :/
> >
> >
> > If you're still interested in this I'd be happy to merge it if you can
> > fix up the vqmmc - and if respinning it I would appreciate if you could
> > sort the nodes alphabetically.
> >
> > Regards,
> > Bjorn
> >
> 
> Hi,
> This patch series depends on:
> https://patchwork.kernel.org/patch/11765789/
> https://patchwork.kernel.org/patch/11760437/
> 
> USB nodes appear to finally be picked for the Qcom tree while the VQMMC LDO
> is still pending.
> 
> I am still interested in this and was planning to send the updated versions
> anyway soon.
> I Will respin these and reorder the nodes.
> 

I've pushed out the vqmmc patch now as well. Looking forward to the
respin of this patch.

Thank you,
Bjorn
