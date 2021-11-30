Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3A2462EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 09:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239703AbhK3IqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 03:46:22 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:54200 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239666AbhK3IqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 03:46:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AD97DCE1812;
        Tue, 30 Nov 2021 08:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6697C53FC1;
        Tue, 30 Nov 2021 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638261775;
        bh=kop9ekaNxcrvm1nzG7ZaL3bUmyF0UPMTsxU7AW0+IsE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tN2dE1R+510zjPlOOblJ1YMjDC/3lkzIy9sA0QbUnp5hu5kuqnli5b7Nxt7PNMpWC
         r0KZTmCME458FYwr0pM0j2RoLH4rSpMsfXW4xUI61wnQQvS60iAcf2A6QWjPFSo1ta
         5ihZujakLwGXoWYXEEwoRSRONBpGLeDfGtWg7q062Y8ViQi9FRwaPZtcIjw02VH/Ew
         TopiFIfYk1FA4rkfLLUufgXTIb+gA05MVVyvhtjApP9qPNDGG+VDv1DHlYkBd+DyEB
         kKTMiIYovYm55WupBH9I6FhkGXixsD8dg6IcIHYKjwHoHsXhvI9zTTYPdNnxLRPtRN
         RBvudAt1W+Nbg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mryiz-008oud-EP; Tue, 30 Nov 2021 08:42:53 +0000
Date:   Tue, 30 Nov 2021 08:42:53 +0000
Message-ID: <87lf16m3ua.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
In-Reply-To: <20211130023151.GD10105@dragon>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
        <20211126093529.31661-3-shawn.guo@linaro.org>
        <87czmmbu8k.wl-maz@kernel.org>
        <20211129133308.GB10105@dragon>
        <87pmqjm1c8.wl-maz@kernel.org>
        <20211130023151.GD10105@dragon>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: shawn.guo@linaro.org, tglx@linutronix.de, quic_mkshah@quicinc.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, loic.poulain@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Nov 2021 02:31:52 +0000,
Shawn Guo <shawn.guo@linaro.org> wrote:
> 
> + Maulik
> 
> On Mon, Nov 29, 2021 at 03:24:39PM +0000, Marc Zyngier wrote:
> [...]
> > > > > @@ -430,6 +430,14 @@ config QCOM_PDC
> > > > >  	  Power Domain Controller driver to manage and configure wakeup
> > > > >  	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
> > > > >  
> > > > > +config QCOM_MPM
> > > > > +	bool "QCOM MPM"
> > > > 
> > > > Can't be built as a module?
> > > 
> > > The driver is implemented as a builtin_platform_driver().
> > 
> > This, on its own, shouldn't preclude the driver from being built as a
> > module. However, the config option only allows it to be built in. Why?
> 
> I just tried to build it as a module, and it seems that "irq_to_desc" is
> only available for built-in build.

Yet another thing that you should not be using. The irqdomain code
gives you everything you need without having to resort to the
internals of the core IRQ infrastructure.

> > Furthermore, why would you look up anywhere other than the wake-up
> > domain? My impression was that only these interrupts would require
> > being re-triggered.
> 
> Both domains have MPM pins that could wake up system.

Then why do you need two domains?

	M.

-- 
Without deviation from the norm, progress is not possible.
