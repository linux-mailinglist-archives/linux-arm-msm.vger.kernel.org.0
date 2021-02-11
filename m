Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525B8318ED5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 16:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBKPf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 10:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhBKPdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 10:33:05 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383E0C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 07:32:25 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id fa16so3595498pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QgFTmgXQGiqIKd8Yj0TUSai/AxpTkOZablyty8uKeWs=;
        b=fe9rmSwpPG6/cICUyh5vAqXFbE0rZ2ghlkJ1JD599XlNP1DSCFLWB94x6hp/zCsL3J
         sta5FsZwxZuxs9EGz6xDKMn3wnwLoqaClFVGiLnCLtQ389h4qulfwQjNVNw3Oj0telzO
         Pa09qtrpl7PunI9Su2hm7p1bffkTzRmn+eKMTGFm1G36JI5vrj++ds2/8S6QhRdupyJk
         Mur4RhLxWMQ9q9jHUMEzkXtrEF+cOdREcRQdpnxqOP/avNd+O8SZMJ13XHJW+6u14Ko/
         QxcN7XvyYkhpaUPsREKxMwvD2KELNdbJOwybrJZNmFPV8qMolK6frgmDAVPStClu1J2H
         OdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QgFTmgXQGiqIKd8Yj0TUSai/AxpTkOZablyty8uKeWs=;
        b=ObGmf4Kh4x793Eje3wER2V5ItKkI1/rsYJoSv0zIApcrcUno6e/5kOq/bM2zwKSamI
         CB18Wow+vWxLqZbW24rbjsdraJptstftMd36Vdj8RVfFW0M/OLp1KeVxZHeisVONK5Yl
         AtVzVQhrnkzcDNxNN8wA2oomohT/OGWNBO/MC8DVepyzmUlfeObqKDJ/d4I2ste9/hN2
         Bv6tt7QoWTOCIEfiDqtlSPdo18s4rGN/B42kl5E4jHbUAnyKiTVIXmgX5xWiba0xMpi4
         /w/Vy9M2VZnUIrIR+c7aj2zOsYlcVLgyFz1PIZidCXjnmBt/sFfy1mBLcERmoEcbTnOz
         y92A==
X-Gm-Message-State: AOAM530l+zF2TL5LPSsS/JmlyPv7r9SnZu1bPUsXsvOiSbkhp0f4pCI7
        7w6XkL50/crq0cvgebYW5Y4O
X-Google-Smtp-Source: ABdhPJwv7fLaLq77pnuho7qi6QrDXBBzzM3uo0EsfxioJXGCbIhZdJv8ths0icJyjaWvsWcKadCoxg==
X-Received: by 2002:a17:902:b285:b029:e1:5b44:454 with SMTP id u5-20020a170902b285b02900e15b440454mr8152642plr.54.1613057544628;
        Thu, 11 Feb 2021 07:32:24 -0800 (PST)
Received: from work ([103.66.79.29])
        by smtp.gmail.com with ESMTPSA id e7sm4656075pfd.169.2021.02.11.07.32.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 07:32:24 -0800 (PST)
Date:   Thu, 11 Feb 2021 21:02:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linux@armlinux.org.uk, will@kernel.org, arnd@arndb.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ARM: kernel: Fix interrupted SMC calls
Message-ID: <20210211153220.GB22704@work>
References: <20210118181040.51238-1-manivannan.sadhasivam@linaro.org>
 <20210201123602.GD108653@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201123602.GD108653@thinkpad>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Arnd

On Mon, Feb 01, 2021 at 06:06:07PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Mon, Jan 18, 2021 at 11:40:40PM +0530, Manivannan Sadhasivam wrote:
> > On Qualcomm ARM32 platforms, the SMC call can return before it has
> > completed. If this occurs, the call can be restarted, but it requires
> > using the returned session ID value from the interrupted SMC call.
> > 
> > The ARM32 SMCC code already has the provision to add platform specific
> > quirks for things like this. So let's make use of it and add the
> > Qualcomm specific quirk (ARM_SMCCC_QUIRK_QCOM_A6) used by the QCOM_SCM
> > driver.
> > 
> > This change is similar to the below one added for ARM64 a while ago:
> > commit 82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")
> > 
> > Without this change, the Qualcomm ARM32 platforms like SDX55 will return
> > -EINVAL for SMC calls used for modem firmware loading and validation.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> A gentle ping on this patch!
> 

Ping again!

Thanks,
Mani

> Thanks,
> Mani
> 
> > ---
> > 
> > Changes in v2:
> > 
> > * Preserved callee saved registers and used the registers r4, r5 which
> >   are getting pushed onto the stack.
> > 
> >  arch/arm/kernel/asm-offsets.c |  3 +++
> >  arch/arm/kernel/smccc-call.S  | 11 ++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
> > index a1570c8bab25..2e2fa6fc2d4f 100644
> > --- a/arch/arm/kernel/asm-offsets.c
> > +++ b/arch/arm/kernel/asm-offsets.c
> > @@ -23,6 +23,7 @@
> >  #include <asm/vdso_datapage.h>
> >  #include <asm/hardware/cache-l2x0.h>
> >  #include <linux/kbuild.h>
> > +#include <linux/arm-smccc.h>
> >  #include "signal.h"
> >  
> >  /*
> > @@ -147,6 +148,8 @@ int main(void)
> >    DEFINE(SLEEP_SAVE_SP_PHYS,	offsetof(struct sleep_save_sp, save_ptr_stash_phys));
> >    DEFINE(SLEEP_SAVE_SP_VIRT,	offsetof(struct sleep_save_sp, save_ptr_stash));
> >  #endif
> > +  DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
> > +  DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
> >    BLANK();
> >    DEFINE(DMA_BIDIRECTIONAL,	DMA_BIDIRECTIONAL);
> >    DEFINE(DMA_TO_DEVICE,		DMA_TO_DEVICE);
> > diff --git a/arch/arm/kernel/smccc-call.S b/arch/arm/kernel/smccc-call.S
> > index 00664c78faca..931df62a7831 100644
> > --- a/arch/arm/kernel/smccc-call.S
> > +++ b/arch/arm/kernel/smccc-call.S
> > @@ -3,7 +3,9 @@
> >   * Copyright (c) 2015, Linaro Limited
> >   */
> >  #include <linux/linkage.h>
> > +#include <linux/arm-smccc.h>
> >  
> > +#include <asm/asm-offsets.h>
> >  #include <asm/opcodes-sec.h>
> >  #include <asm/opcodes-virt.h>
> >  #include <asm/unwind.h>
> > @@ -27,7 +29,14 @@ UNWIND(	.fnstart)
> >  UNWIND(	.save	{r4-r7})
> >  	ldm	r12, {r4-r7}
> >  	\instr
> > -	pop	{r4-r7}
> > +	ldr	r4, [sp, #36]
> > +	cmp	r4, #0
> > +	beq	1f			// No quirk structure
> > +	ldr     r5, [r4, #ARM_SMCCC_QUIRK_ID_OFFS]
> > +	cmp     r5, #ARM_SMCCC_QUIRK_QCOM_A6
> > +	bne	1f			// No quirk present
> > +	str	r6, [r4, #ARM_SMCCC_QUIRK_STATE_OFFS]
> > +1:	pop	{r4-r7}
> >  	ldr	r12, [sp, #(4 * 4)]
> >  	stm	r12, {r0-r3}
> >  	bx	lr
> > -- 
> > 2.25.1
> > 
