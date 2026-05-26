Return-Path: <linux-arm-msm+bounces-109803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILozM9CQFWovWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:23:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 552415D579B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC5E300EA98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D515A3F5BD0;
	Tue, 26 May 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZPR3riL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176323F7AB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798213; cv=none; b=AQbPCcg53WxPoPwqKv8pzUmHw1UaPBoIhgQIqfgJKY+aESnrvElqFuNOpBc/zGX1BAu8P+GJFq4fLFzcMhDs+yQYWqSNEsIFoQ41D12d1zDRIeWxMOyjq4zUfIk1aj8NtgS7KYTRxPtz/5LrjtCpMG7rjIW4OmwWXyrsz6gA1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798213; c=relaxed/simple;
	bh=iGDQmirXwsVXqAciJSjXGrEGgNfDX2hiOOLxRSpT0f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkeBi1Vg/nXuSxPCL1xAYtxC4NzzFAAda9PftOnDGSPLpQUAaqR0nqXIIqyq1Pvt1EyC9r6DMxaXeDRed1Nv7ulBnck7ceS1sapQRe8A7DbmSHfxr70gry85mDwbiKeDSBpx0ct+cA7yU9s+EQMH4584KakfApjUhZqt1IA0eJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZPR3riL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so66512575e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798210; x=1780403010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCIY9sU4f3NHfQKfeX8dod9XT1LJXx2xAP5zQxt3BVI=;
        b=eZPR3riL+W3qzANtKqmOvNbGUks1goO8ojCdqBbVgQKNnexrOZ/10JxbUBr9dsJTIH
         ogkU9zT9/Qdtl7BCSsNZHDrG0MNwJmwBd0ZKos+BrB9ZHzVQeay4g8PsBgdvaVX/vIQ3
         xCmGrIW7IEnFtik3bIZkE+g76i4XNlVkczMIxGcLKKskwvemjd97gyWwxwHLzW45GwEd
         TeVypgBZSz/SzDGxqCblGMAw1AZhkMq5Vf9NNFVxcvUdAN1PawnP8O06FksdHOS/H9rv
         K8+7QGcFfhE+sa3rUATMM6AolENy5WtTN9QpghsOgykaLuTP6uGxl8L0DJehJu3kqOke
         lzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798210; x=1780403010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCIY9sU4f3NHfQKfeX8dod9XT1LJXx2xAP5zQxt3BVI=;
        b=Vyu3+ZMYf1rig1+kw08FwMgycixJm6bHM/unByq7tax9dzWkBaOIyHcLnO7VxXSDzp
         sw1cDlw3fCu2r05t5DM9UkMbfSjGbMs0TGzN4BHUMTCuUzmhhQucE1cldce2B1oeu3u2
         fc/QS5cYtLyJcDqhZ16RNX4HzaJ4/WAcBMO/juPqIy1L1gKPH16NLDvN7aBSzUDCrqpi
         Yz0iUsPawZuD2v3Gzntge+tZDxQYj8jNncTMn36Ky+ZRbBxdGj11kgLpK3oOWDdA9R3V
         X1ImlaV+qMxOYpIh9jbuF1VMIUoseaC4GF7o3sfLDO00LiuZHI5ZRhubU37kvl5JjAml
         xYnw==
X-Forwarded-Encrypted: i=1; AFNElJ/gSMuys5NJScR1yA+W3Z5Z0UCqphSUZA2mT1V+8hqIBI6aYNnP06WiLs4CEh3u/tKqXCzxTOwU0yi9q29C@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXi5uEoeebXBqlgGzFnu/UCE50r3bi4/IK8NLqorQ4hydukc6
	n02FQKKvlZvyTj7Cyf9ug33sTReeIszb1T1/eutm4BsQnyqBMuymrhGmelxxz+MNpZE=
X-Gm-Gg: Acq92OHsBbLLX6LmcxP3CD9S24OYfweQPsXt0ejYbbtrbjUzxEJ47IQ2NK5jWoVTrjZ
	wJuKtMSH0woa5HQsSSZ0DfUL03FTI8+zbfMnsIqkVZ8OzzgzXLs8IOuCRJX9EDBYxsMJxEtf1uX
	6bdlfu61QC5ZNf2YoFiK9pJtWutRCmZjym7OBRNyOi3duR3ANCKjcFhplmVQFLb7x2oAub3unu6
	yEWdl3mDfiL5690a2mCNPpqxsonCYVc01RH51tU1nfKWA+muuxErWyMYabT2tLqpfX41qOqVCSx
	hg5ny8fydKiHpmhhypvVh+QTkAau7PFbkae1qy4rHztWcTdc5A/ccH3Q9j2+RP75MwwmLdtraaE
	75EXr6iUmwfeaC9yr9Js/RDimzsQFB8ZnSN5iY1H1bMFuPclrxF2ecRNAXc9aXQUveyqmPkzumg
	VrozfkaVqlTduOcwOLCuYxeu3HmHNekO6hs1z4NCo=
X-Received: by 2002:a05:600c:4510:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-490428ddc9fmr289822275e9.32.1779798210262;
        Tue, 26 May 2026 05:23:30 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm33487487f8f.17.2026.05.26.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:23:29 -0700 (PDT)
Date: Tue, 26 May 2026 14:22:49 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Message-ID: <ahWQmTr-9a33b9FY@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 552415D579B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:24:41PM +0530, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 109 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 86379dddc5be..69ddd7d89a83 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> [...]
> @@ -135,6 +151,8 @@ static const struct pdc_regs pdc_v3_2 = {
>  };
>  
>  static const struct pdc_cfg pdc_cfg_v3_2 = {
> +	.gpio_irq_sts = GENMASK(5, 5),
> +	.gpio_irq_mask = GENMASK(4, 4),

BIT(5) / BIT(4) would be clearer here in my opinion.

>  	.irq_enable = GENMASK(3, 3),
>  	.irq_type = GENMASK(2, 0),
>  };
> [...]
> @@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
>  	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
>  }
>  
> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> +{
> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
> +		return true;
> +
> +	return false;

Can put this in one line:

	return pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis;

> +}
> +
>  static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
>  {
>  	void __iomem *base;
> @@ -232,6 +260,36 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>  		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
>  
>  	raw_spin_unlock_irqrestore(&pdc->lock, flags);
> +
> +	if (pdc_pin_uses_seconary_mode(pin_out))
> +		pdc->unmask_gpio(pin_out, on);
> +}
> +
> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);

Is this guaranteed to be called sequentially, i.e. not in parallel on
another CPU? Otherwise, you need to add the lock here to make sure the
read-modify-write doesn't race with another CPU.

Note that since the irq_cfg_reg is also used in qcom_pdc_gic_set_type()
it would be safest to add the lock there as well (although since PDC has
IRQCHIP_SET_TYPE_MASKED it's probably unlikely to be called in parallel
with another irqchip operation for the same IRQ). In my patch, I handled
this for all users using a new pdc_update_irq_cfg() function [1].

[1]: https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14

> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_mask = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	if (unmask)
> +		gpio_mask &= ~pdc->cfg->gpio_irq_mask;
> +	else
> +		gpio_mask |= pdc->cfg->gpio_irq_mask;
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
>  }
>  
>  static void pdc_enable_intr_cfg(int pin_out, bool on)
> [...]
> @@ -258,6 +319,20 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
>  	irq_chip_enable_parent(d);
>  }
>  
> +static void qcom_pdc_ack(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +}

You might need a write memory barrier here and/or read-back here to make
sure the write is complete before the interrupt is unmasked in the GIC.
IIRC I added this in my patch after seeing some test tlmm-test failure..

> +
> +static void qcom_pdc_gic_eoi(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +
> +	irq_chip_eoi_parent(d);
> +}
> +
>  /*
>   * GIC does not handle falling edge or active low. To allow falling edge and
>   * active low interrupts to be handled at GIC, PDC has an inverter that inverts
> [...]
> @@ -510,6 +600,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		pdc->enable_intr = pdc_enable_intr_bank;
>  	}
>  
> +	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
> +	pdc->clear_gpio = pdc_clear_gpio_cfg;

What is the purpose of these function pointers if you always assign the
same function?

Thanks,
Stephan

