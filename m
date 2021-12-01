Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388114648EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 08:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347753AbhLAHjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 02:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242308AbhLAHjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 02:39:53 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE641C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 23:36:32 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id n26so23506434pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 23:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v/bPnGzpgS/aqERfPNQaK5pckwGE99mbqC1MZQThorw=;
        b=KnAjqEFol52RpzJpcu0BqEmQ+5gdeuVeB2QVa3WqnMXCKUHp0JkSxyE9UNNLBi76T6
         KwDG/QQ6AHk1OUZZgNlmbrgcFewsyijQ6Qq1okgQQLngNNGfQ4iJF2zDFV8zQEOV3ful
         I4+Sa0leE8qTuqg9L94+zWhB6USom/8/PHd1dhYbmYGTkrDE18ZHKjUZlVOGudDpJmYF
         /CUomznbRqkGYDinU7cm+9w6VQXhtdMzqqSumdNKgizlb/P9uEZnqyeJ8rzEddQEOQ7S
         jLnGFQpD3gzBlagEQH3Iyf3RvLUfPFWshGhZ0ebisdmnK6xWRp+r1r+MfD/eRG814bdF
         KaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v/bPnGzpgS/aqERfPNQaK5pckwGE99mbqC1MZQThorw=;
        b=oExxS3MHQaPwJ4n3O2m1jH/uMHtO9NobZT5agVLsPbDL0cv/Smq810heCAUxQxHYTU
         sQkGEV8dj/uCXm+Sr67SrACWC1klanm33D/5/vFj7Ib9juJgqhLMvKpHh/KnNqB/iZXr
         Z/+glcskV5eNfMIfN31BCNzzOTdbBo557A2JolfuKR1y6jxPDEq94d9SX4qDN0/AMCej
         DdwoZVyO0FPKpB0WOGlNI1KdwtZK5HoKmx5ohkZM8LkbLIDyi4DawHzlniqmHNBKQobb
         FCD63wCEJtJPlvKnW3BigaHHkeEUHvHpd+XCH5XI+JW3epJ9QZ5lQQ6sy9mMoDZR4tSC
         CZ8A==
X-Gm-Message-State: AOAM532Kq3J+O4sgaAxMInSxnZgCO63Jdt/vxB1NGqhkwR10Vr/q7FRF
        w3s5KxsRY2gWjoNm+DVnUC1BzQ==
X-Google-Smtp-Source: ABdhPJy6MKItXBesVd26sIBAPUe0gijdCE3uSCObZrXrMQakChIFjeDuWzNG7rtalroOIDmtecX3fQ==
X-Received: by 2002:aa7:8e48:0:b0:4a7:fe01:5971 with SMTP id d8-20020aa78e48000000b004a7fe015971mr4321163pfr.20.1638344192465;
        Tue, 30 Nov 2021 23:36:32 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id w142sm23265118pfc.115.2021.11.30.23.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 23:36:32 -0800 (PST)
Date:   Wed, 1 Dec 2021 15:36:25 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Message-ID: <20211201073622.GJ10105@dragon>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
 <20211126093529.31661-3-shawn.guo@linaro.org>
 <87czmmbu8k.wl-maz@kernel.org>
 <20211129133308.GB10105@dragon>
 <87pmqjm1c8.wl-maz@kernel.org>
 <20211130023151.GD10105@dragon>
 <87lf16m3ua.wl-maz@kernel.org>
 <20211130091708.GH10105@dragon>
 <87fsrdncsg.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsrdncsg.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 10:44:15AM +0000, Marc Zyngier wrote:
> On Tue, 30 Nov 2021 09:17:08 +0000,
> Shawn Guo <shawn.guo@linaro.org> wrote:
> > 
> > On Tue, Nov 30, 2021 at 08:42:53AM +0000, Marc Zyngier wrote:
> > > On Tue, 30 Nov 2021 02:31:52 +0000,
> > > Shawn Guo <shawn.guo@linaro.org> wrote:
> > > > 
> > > > + Maulik
> > > > 
> > > > On Mon, Nov 29, 2021 at 03:24:39PM +0000, Marc Zyngier wrote:
> > > > [...]
> > > > > > > > @@ -430,6 +430,14 @@ config QCOM_PDC
> > > > > > > >  	  Power Domain Controller driver to manage and configure wakeup
> > > > > > > >  	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
> > > > > > > >  
> > > > > > > > +config QCOM_MPM
> > > > > > > > +	bool "QCOM MPM"
> > > > > > > 
> > > > > > > Can't be built as a module?
> > > > > > 
> > > > > > The driver is implemented as a builtin_platform_driver().
> > > > > 
> > > > > This, on its own, shouldn't preclude the driver from being built as a
> > > > > module. However, the config option only allows it to be built in. Why?
> > > > 
> > > > I just tried to build it as a module, and it seems that "irq_to_desc" is
> > > > only available for built-in build.
> > > 
> > > Yet another thing that you should not be using. The irqdomain code
> > > gives you everything you need without having to resort to the
> > > internals of the core IRQ infrastructure.
> > 
> > I see.  I should use irq_get_irq_data() rather than &desc->irq_data.
> 
> Even better:
> 
> 	desc = irq_resolve_mapping(domain, hwirq);
> 
> Job done. No extra tracking, no dubious hack in the unmask callback,
> works with modules.
> 
> > 
> > > 
> > > > > Furthermore, why would you look up anywhere other than the wake-up
> > > > > domain? My impression was that only these interrupts would require
> > > > > being re-triggered.
> > > > 
> > > > Both domains have MPM pins that could wake up system.
> > > 
> > > Then why do you need two domains?
> > 
> > This is basically the same situation as qcom-pdc, and I have some
> > description about that in the commit log:
> > 
> > - For given SoC, a fixed number of MPM pins are supported, e.g. 96 pins
> >   on QCM2290.  Each of these MPM pins can be either a MPM_GIC pin or
> >   a MPM_GPIO pin. The mapping between MPM_GIC pin and GIC interrupt
> >   is defined by SoC, as well as the mapping between MPM_GPIO pin and
> >   GPIO number.  The former mapping can be found as the SoC data in this
> >   MPM driver, while the latter can be found as the msm_gpio_wakeirq_map[]
> >   in TLMM driver.
> > 
> > - Two irq domains are created for a single irq_chip to handle MPM_GIC
> >   and MPM_GPIO pins respectively, i.e. MPM_GIC domain and MPM_GPIO domain.
> >   The former is a child domain of GIC irq domain, while the latter is
> >   a parent domain of TLMM/GPIO irq domain.
> 
> That doesn't answer my question.
> 
> It doesn't matter what the pins are used for as long as you can
> identify which ones are routed to the GIC and which are not. You are
> obviously are able to do so, since you are able to disconnect part of
> the hierarchy (why is qcom_mpm_gic_alloc() named as such, since most
> of the interrupts it deals with are *never* routed to the GIC).
> 
> All the interrupts have the same irqchip callbacks and act on the same
> 'priv' data, so they it is obvious they don't overlap in the hwirq
> space.
> 
> Ergo: you can implement the whole thing with a single domain. All you
> need to make sure is that you identify the pins that are routed to the
> GIC, and you already have that information.

You are right!  A single domain works.  Nice and clean!  Thanks for the
comment, Marc!

Shawn
