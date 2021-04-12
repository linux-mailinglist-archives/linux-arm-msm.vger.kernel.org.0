Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE7F35B9FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 08:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhDLGGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 02:06:06 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:45718 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhDLGGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 02:06:05 -0400
Received: by mail-lj1-f169.google.com with SMTP id z8so13911095ljm.12;
        Sun, 11 Apr 2021 23:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=lcon2rmRARLmChe6kE+I9FLuhgI2av1Gb7xCDp3yuQ0=;
        b=Xg7ciMM1TDIHe1d2ZcEC0pVpPz7APQvjkUw1AXjZls2wNPh4SjQEPwhBljcmpUEPFk
         p/D3JLnwPN1vUkyXGwjPixBybVL86rtwoQ+JU7kS4hr5rJlvBAa2oqKpOhnMKA29UM7k
         XcSslKEsxeyZlgE1At8ERwnKx1z9HaJUi8kjoJLFXBKDCWw5bMgG6KL+wI9QzCPWHGVd
         H/WMLNTDqDhrUL5rjm2Z4wT+6fJkXtGkSRriUd99Z7NadhSq6CorYD4I70yMkRrLK5i4
         p2tpYDUy1lOT15kXeuVlcWUhcTfzmKiGzbmeSr8KHDYsbZJgeobEDaX0Lw/UDJeNaqXf
         peiw==
X-Gm-Message-State: AOAM532IgKpSol9nd9oGtoo6TubEpesJlF6glyl11UEEVwjoEWBt8kU8
        cHKkq/ujWfKfXtGIA4pGfUPtJAMsWdRSLQ==
X-Google-Smtp-Source: ABdhPJyBUIynKa25iOasIiRQlPLnH6KH8qoGRt+hmACCB3+XZdckJI+CW20WJK3qTO5Ysj3j8+gY3A==
X-Received: by 2002:a2e:9295:: with SMTP id d21mr13245670ljh.299.1618207546399;
        Sun, 11 Apr 2021 23:05:46 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id f26sm416194lfj.37.2021.04.11.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 23:05:45 -0700 (PDT)
Message-ID: <4abddb76d87a2e6e0d2ad98da0b8349251456158.camel@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v3 1/3] regmap-irq: Extend sub-irq to support
 non-fixed reg strides
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <526562423eaa58b4075362083f561841f1d6956c.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
         <526562423eaa58b4075362083f561841f1d6956c.1615423027.git.gurus@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 12 Apr 2021 09:05:39 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi All,

On Wed, 2021-03-10 at 16:39 -0800, Guru Das Srinagesh wrote:
> Qualcomm's MFD chips have a top level interrupt status register and
> sub-irqs (peripherals).  When a bit in the main status register goes
> high, it means that the peripheral corresponding to that bit has an
> unserviced interrupt. If the bit is not set, this means that the
> corresponding peripheral does not.
> 
> Commit a2d21848d9211d ("regmap: regmap-irq: Add main status register
> support") introduced the sub-irq logic that is currently applied only
> when reading status registers, but not for any other functions like
> acking
> or masking. Extend the use of sub-irq to all other functions, with
> two
> caveats regarding the specification of offsets:
> 
> - Each member of the sub_reg_offsets array should be of length 1
> - The specified offsets should be the unequal strides for each sub-
> irq
>   device.
> 
> In QCOM's case, all the *_base registers are to be configured to the
> base addresses of the first sub-irq group, with offsets of each
> subsequent group calculated as a difference from these addresses.
> 
> Continuing from the example mentioned in the cover letter:
> 
> 	/*
> 	 * Address of MISC_INT_MASK		= 0x1011
> 	 * Address of TEMP_ALARM_INT_MASK	= 0x2011
> 	 * Address of GPIO01_INT_MASK		= 0x3011
> 	 *
> 	 * Calculate offsets as:
> 	 * offset_0 = 0x1011 - 0x1011 = 0       (to access MISC's
> 	 * 					 registers)
> 	 * offset_1 = 0x2011 - 0x1011 = 0x1000
> 	 * offset_2 = 0x3011 - 0x1011 = 0x2000
> 	 */
> 
> 	static unsigned int sub_unit0_offsets[] = {0};
> 	static unsigned int sub_unit1_offsets[] = {0x1000};
> 	static unsigned int sub_unit2_offsets[] = {0x2000};
> 
> 	static struct regmap_irq_sub_irq_map chip_sub_irq_offsets[] = {
> 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> 		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
> 	};
> 
> 	static struct regmap_irq_chip chip_irq_chip = {
> 	--------8<--------
> 	.not_fixed_stride = true,
> 	.mask_base	  = MISC_INT_MASK,
> 	.type_base	  = MISC_INT_TYPE,
> 	.ack_base	  = MISC_INT_ACK,
> 	.sub_reg_offsets  = chip_sub_irq_offsets,
> 	--------8<--------
> 	};
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  drivers/base/regmap/regmap-irq.c | 81 ++++++++++++++++++++++++++--
> ------------
>  include/linux/regmap.h           |  7 ++++
>  2 files changed, 60 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/base/regmap/regmap-irq.c
> b/drivers/base/regmap/regmap-irq.c
> index 19db764..e1d8fc9e 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -45,6 +45,27 @@ struct regmap_irq_chip_data {
>  	bool clear_status:1;
>  };
> 

Sorry that I am late with the "review" but I only now noticed this
change when I was following the references from PM8008 PMIC patch mail.


>  
> +static int sub_irq_reg(struct regmap_irq_chip_data *data,
> +		       unsigned int base_reg, int i)

Do I read this correctly - this function should map the main status bit
(given in i) to the (sub)IRQ register, right? How does this work for
cases where one bit corresponds to more than one sub-register? Or do I
misunderstand the purpose of this function? (This is the case with both
the BD70528 and BD71828).

> +{
> +	const struct regmap_irq_chip *chip = data->chip;
> +	struct regmap *map = data->map;
> +	struct regmap_irq_sub_irq_map *subreg;
> +	unsigned int offset;
> +	int reg = 0;
> +
> +	if (!chip->sub_reg_offsets || !chip->not_fixed_stride) {
> +		/* Assume linear mapping */
> +		reg = base_reg + (i * map->reg_stride * data-
> >irq_reg_stride);
> +	} else {
> +		subreg = &chip->sub_reg_offsets[i];
> +		offset = subreg->offset[0];
> +		reg = base_reg + offset;
> +	}
> +
> +	return reg;
> +}
> +
>  static inline const
>  struct regmap_irq *irq_to_regmap_irq(struct regmap_irq_chip_data
> *data,
>  				     int irq)
> @@ -87,8 +108,7 @@ static void regmap_irq_sync_unlock(struct irq_data
> *data)
>  
>  	if (d->clear_status) {
>  		for (i = 0; i < d->chip->num_regs; i++) {
> -			reg = d->chip->status_base +
> -				(i * map->reg_stride * d-
> >irq_reg_stride);
> +			reg = sub_irq_reg(d, d->chip->status_base, i);

How does this work with the case where we have many subregs pointed by
single main-status register bit? If I read this correctly, then the
chip->num_regs can be greater than amount of meaningful main-status
bits and thus greater than amount of map entries.

I don't have BD71828 or BD70528 at home so I haven't tested this. So
hopefully I misunderstand something - but if I don't, then this change
will break the existing main-IRQ functionality. I will visit the office
later this week and I'll see if I have a chance to test this - but I
hope you can check your change still supports the case where one main
status IRQ bit signals more than one sub-register with active IRQs.

Best Regards
	Matti Vaittinen


--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
K
iviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)


