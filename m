Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6985A2FA7F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 18:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407262AbhARRwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 12:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407336AbhARRvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 12:51:35 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3569C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 09:50:49 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so219589pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 09:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IzwteHICGjyIn2Du51loln2nvbA/Mz4gv3XLd8Owd0o=;
        b=RF+/H0S5srOYwTCAPyPjQ9WJnYvmYcdWWpuAIWTn4j3umRdE0IyUZx3oJ80Ys1Pl56
         PKzanZeA65LPLvufXcHXTh31+zGk7Ciqb26N7Kz0ZoC+Q/cuFiISnq0/sNWfJpPDMXBq
         hfg2ruwO7S9yPI6a0gTO8sjITckyh1RrXbTTeYNtWiiQjFt30c6nDIf3lXVAya4bTecq
         4FMDwjgnpz2MNdM2yV9Ot9rstTVcWudFc4NjRrwDBIecW3iAgne90hmf3BKJBOsuBk1n
         ggI0/2x7w8ZNHjq11+nXDHUX/eIZwIHZPzVc+5IiCquMdpuV3DKNeP5GSIwgz2Div62R
         p9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IzwteHICGjyIn2Du51loln2nvbA/Mz4gv3XLd8Owd0o=;
        b=ehYJYEOE0h7Tzsj3YzD5oj8/VkdZ7RO5o8h7idbJIDU9HDI0RwOgvvzrwuVElSW1lD
         eeAqHvM7i5ZngdfeY/uSLnvf0VOz6Pxqs8o9zNEeNY0gkX38VoJU6xsSo8Nt12cL62Bo
         nhXyaIUJcdFcy3CAT0XlM/y9oDHtwAa9p2IH/2ZcbDbUt+EoNhNMJMHS6SbglqCkOtEG
         J4xQ2kZEJ+ysDhfH2jN00Tu7W9cSDl8C5W2sH7YQtdJG3+ueoy8YDDveQhmoCQVCYAm6
         5hKF/F7zStUAcX5RY4flnQrg6YyhQ0Yyx9QoiZhh3bvl6etzsHDqe8Bbhjjs++fpyOJ+
         nC+A==
X-Gm-Message-State: AOAM532ddkaoRy9CnPPmvBsku2ZAZ3Kq83ll+mgfpORC/hLmoj3+Osug
        PKYcDOffBIVmAQ7ni3aa+O/s
X-Google-Smtp-Source: ABdhPJz5lWcdNE4Iks4juiqsCIlseOjSQmLbvfji7NgfxrV/b3KhSBUK5XqMt3NJcTBfRHGgoPAMoQ==
X-Received: by 2002:a17:90a:4582:: with SMTP id v2mr456193pjg.15.1610992249275;
        Mon, 18 Jan 2021 09:50:49 -0800 (PST)
Received: from thinkpad ([2409:4072:6d10:e0cf:bf2b:fc5e:cb6d:136])
        by smtp.gmail.com with ESMTPSA id d16sm4015534pfn.160.2021.01.18.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 09:50:48 -0800 (PST)
Date:   Mon, 18 Jan 2021 23:20:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     will@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] ARM: kernel: Fix interrupted SMC calls
Message-ID: <20210118175042.GA20457@thinkpad>
References: <20210118155153.21520-1-manivannan.sadhasivam@linaro.org>
 <20210118160807.GF1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118160807.GF1551@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Russel,

On Mon, Jan 18, 2021 at 04:08:07PM +0000, Russell King - ARM Linux admin wrote:
> On Mon, Jan 18, 2021 at 09:21:53PM +0530, Manivannan Sadhasivam wrote:
> > @@ -27,10 +29,18 @@ UNWIND(	.fnstart)
> >  UNWIND(	.save	{r4-r7})
> >  	ldm	r12, {r4-r7}
> >  	\instr
> > +	mov	r9, r6			// Copy r6 before popping from stack
> >  	pop	{r4-r7}
> >  	ldr	r12, [sp, #(4 * 4)]
> >  	stm	r12, {r0-r3}
> > -	bx	lr
> > +	ldr	r10, [sp, #20]
> > +	cmp	r10, #0
> > +	beq	1f			// No quirk structure
> > +	ldr     r11, [r10, #ARM_SMCCC_QUIRK_ID_OFFS]
> > +	cmp     r11, #ARM_SMCCC_QUIRK_QCOM_A6
> > +	bne	1f			// No quirk present
> > +	str	r9, [r10, #ARM_SMCCC_QUIRK_STATE_OFFS]
> > +1:	bx	lr
> 
> NAK. This patch shows little regard for the C ABI. You are corrupting
> registers that must be preserved. Please find out about the C ABIs
> that are used on ARM.
> 

Sorry, my asm foo is not that great. Should've checked AAPCS. Will fix it in
next revision.

Thanks,
Mani

> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
