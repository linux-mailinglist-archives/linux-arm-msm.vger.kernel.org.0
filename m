Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20142F719E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 05:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbhAOEi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 23:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbhAOEi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 23:38:26 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE19C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 20:37:46 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id w124so8370551oia.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 20:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ti1+XvEBYKD5HOAz+seG/0Q1jqCmkgMfWBdD27RtC3s=;
        b=HkFhV6luuv28KUrB+IaMXo6skoARgmkkSsCjOkJ10D6fXQv0ZeFH0Ah12rgajzFPz5
         Zk7QPYWYpJKDHE3xGhpXkl07L2PaCHYkrO3UvwZeJZMdzGD7s9inIIyXfGwV7cnkAn57
         DCXJufTfGUcV4ugr4DAT+J30+wcqPJqnf3Bhm4abjRZspUc72gvrpTw727LwNcgMZcmd
         7qVGCK+M4R66O68qyFdTDQKGwqQWTJBp0zvO+sektIl2vUxYfKWTlCrAdIYnSSOPzfWI
         L51Ku3FonkMhNJKtMNKT/N8si+CkV89H9YPWSpbWl3IUrffaxno/v5GBBcJ02esCiEvp
         4PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ti1+XvEBYKD5HOAz+seG/0Q1jqCmkgMfWBdD27RtC3s=;
        b=AN/+ZwAdrCkfGun7/1naMX+zl4bJGv3y0RBaAcrMvGEE0VIb5CnnW4S86TPvnDGrXy
         LMLFoQqEOh4IISonvxFRZXpTpIWXlXyDQvqFELH/MkvV22CTLdD/cy141ZbG8i5qCVMG
         rLEFU/cyx3eFTK2Ku1A2xMoHCq/6SEpY5/4nOO2zJ3TdCHXd+7DjKAOGq3JYgkrQV7jH
         69t5dVc6mcYx/lou/KzQ4hFrrWRkeNnhnShDrc8PXJN/CjZuUGlWE8osbmycJQ/aObHf
         BCFvi17dNbQKyAZ7WZdcPC3IC+WEVIrCVJ6w8mnRi9Qco3LEvKBmnB66CsJK9quRYdrB
         HdHA==
X-Gm-Message-State: AOAM531H/FTztvR8wQ6CPZK4Y/NMxDYiLx8bPhbRRJAgGhY6xhgfViWv
        BzBz5MUieSJx9bZdNBZZG4smDA==
X-Google-Smtp-Source: ABdhPJw1JGad8B0HVG837iICWPtWpxbdpANl/YpXYfYNZ4kKT/wjH+bJT4vl2jEturLid5vW0tx92A==
X-Received: by 2002:aca:3784:: with SMTP id e126mr4603833oia.170.1610685465274;
        Thu, 14 Jan 2021 20:37:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m22sm1549156otr.79.2021.01.14.20.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 20:37:44 -0800 (PST)
Date:   Thu, 14 Jan 2021 22:37:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v2 2/7] regulator: qcom-labibb: Implement current limiting
Message-ID: <YAEcFhFFsYIumI2e@builder.lan>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113194214.522238-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:

> LAB and IBB regulators can be current-limited by setting the
> appropriate registers, but this operation is granted only after
> sending an unlock code for secure access.
> 
> Besides the secure access, it would be possible to use the
> regmap helper for get_current_limit, as there is no security
> blocking reads, but I chose not to as to avoid having a very
> big array containing current limits, especially for IBB.
> 
> That said, these regulators support current limiting for:
> - LAB (pos): 200-1600mA, with 200mA per step (8 steps),
> - IBB (neg):   0-1550mA, with  50mA per step (32 steps).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/regulator/qcom-labibb-regulator.c | 92 +++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index 9f51c96f16fb..d364f54ad294 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -29,6 +29,15 @@
>  #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>  #define LABIBB_CONTROL_ENABLE		BIT(7)
>  
> +#define REG_LABIBB_CURRENT_LIMIT	0x4b
> + #define LAB_CURRENT_LIMIT_MASK		GENMASK(2, 0)
> + #define IBB_CURRENT_LIMIT_MASK		GENMASK(4, 0)
> + #define LAB_CURRENT_LIMIT_OVERRIDE_EN	BIT(3)
> + #define LABIBB_CURRENT_LIMIT_EN	BIT(7)
> +
> +#define REG_LABIBB_SEC_ACCESS		0xd0
> + #define LABIBB_SEC_UNLOCK_CODE		0xa5
> +
>  #define LAB_ENABLE_CTL_MASK		BIT(7)
>  #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
>  
> @@ -37,11 +46,18 @@
>  #define IBB_ENABLE_TIME			(LABIBB_OFF_ON_DELAY * 10)
>  #define LABIBB_POLL_ENABLED_TIME	1000
>  
> +struct labibb_current_limits {
> +	u32				uA_min;
> +	u32				uA_step;
> +	u8				ovr_val;
> +};
> +
>  struct labibb_regulator {
>  	struct regulator_desc		desc;
>  	struct device			*dev;
>  	struct regmap			*regmap;
>  	struct regulator_dev		*rdev;
> +	struct labibb_current_limits	uA_limits;
>  	u16				base;
>  	u8				type;
>  };
> @@ -53,6 +69,57 @@ struct labibb_regulator_data {
>  	const struct regulator_desc	*desc;
>  };
>  
> +static int qcom_labibb_set_current_limit(struct regulator_dev *rdev,
> +					 int min_uA, int max_uA)

I was under the impression that a regulator driver should either
implement set_voltage_* or set_current_limit, depending on which type of
regulator it is - i.e. this API isn't supposed to be setting the current
limit. Perhaps I'm wrong though?

> +{
> +	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
> +	struct regulator_desc *desc = &vreg->desc;
> +	struct labibb_current_limits *lim = &vreg->uA_limits;
> +	u32 mask, val;
> +	int i, ret, sel = -1;
> +
> +	if (min_uA < lim->uA_min || max_uA < lim->uA_min)
> +		return -EINVAL;
> +
> +	for (i = 0; i < desc->n_current_limits; i++) {
> +		int uA_limit = (lim->uA_step * i) + lim->uA_min;
> +
> +		if (max_uA >= uA_limit && min_uA <= uA_limit)

I presume here you rely on the client passing something like min_uA = 0
and max_uA 500? Because if the client where to
regulator_set_current_limit(475, 475) you will pass through this loop
without finding a match, but 450 would probably be a really good
pick...

But what does it even mean to pass min/max uA for a current limit?

That said, I think this loop would be better expressed as a single
subtract uA_min and then divide by uA_step.


Apart from that, this patch looks good to me.

Regards,
Bjorn

> +			sel = i;
> +	}
> +	if (sel < 0)
> +		return -EINVAL;
> +
> +	/* Current limit setting needs secure access */
> +	ret = regmap_write(vreg->regmap, vreg->base + REG_LABIBB_SEC_ACCESS,
> +			   LABIBB_SEC_UNLOCK_CODE);
> +	if (ret)
> +		return ret;
> +
> +	mask = desc->csel_mask | lim->ovr_val;
> +	mask |= LABIBB_CURRENT_LIMIT_EN;
> +	val = (u32)sel | lim->ovr_val;
> +	val |= LABIBB_CURRENT_LIMIT_EN;
> +
> +	return regmap_update_bits(vreg->regmap, desc->csel_reg, mask, val);
> +}
> +
> +static int qcom_labibb_get_current_limit(struct regulator_dev *rdev)
> +{
> +	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
> +	struct regulator_desc *desc = &vreg->desc;
> +	struct labibb_current_limits *lim = &vreg->uA_limits;
> +	unsigned int cur_step;
> +	int ret;
> +
> +	ret = regmap_read(vreg->regmap, desc->csel_reg, &cur_step);
> +	if (ret)
> +		return ret;
> +	cur_step &= desc->csel_mask;
> +
> +	return (cur_step * lim->uA_step) + lim->uA_min;
> +}
> +
>  static const struct regulator_ops qcom_labibb_ops = {
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
> @@ -61,6 +128,8 @@ static const struct regulator_ops qcom_labibb_ops = {
>  	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>  	.list_voltage		= regulator_list_voltage_linear_range,
>  	.map_voltage		= regulator_map_voltage_linear_range,
> +	.set_current_limit	= qcom_labibb_set_current_limit,
> +	.get_current_limit	= qcom_labibb_get_current_limit,
>  };
>  
>  static const struct regulator_desc pmi8998_lab_desc = {
> @@ -73,6 +142,9 @@ static const struct regulator_desc pmi8998_lab_desc = {
>  	.vsel_mask		= LAB_VOLTAGE_SET_MASK,
>  	.apply_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
>  	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
> +	.csel_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_CURRENT_LIMIT),
> +	.csel_mask		= LAB_CURRENT_LIMIT_MASK,
> +	.n_current_limits	= 8,
>  	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>  	.owner			= THIS_MODULE,
>  	.type			= REGULATOR_VOLTAGE,
> @@ -94,6 +166,9 @@ static const struct regulator_desc pmi8998_ibb_desc = {
>  	.vsel_mask		= IBB_VOLTAGE_SET_MASK,
>  	.apply_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
>  	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
> +	.csel_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_CURRENT_LIMIT),
> +	.csel_mask		= IBB_CURRENT_LIMIT_MASK,
> +	.n_current_limits	= 32,
>  	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>  	.owner			= THIS_MODULE,
>  	.type			= REGULATOR_VOLTAGE,
> @@ -167,6 +242,23 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
>  		vreg->base = reg_data->base;
>  		vreg->type = reg_data->type;
>  
> +		switch (vreg->type) {
> +		case QCOM_LAB_TYPE:
> +			/* LAB Limits: 200-1600mA */
> +			vreg->uA_limits.uA_min  = 200000;
> +			vreg->uA_limits.uA_step = 200000;
> +			vreg->uA_limits.ovr_val = LAB_CURRENT_LIMIT_OVERRIDE_EN;
> +			break;
> +		case QCOM_IBB_TYPE:
> +			/* IBB Limits: 0-1550mA */
> +			vreg->uA_limits.uA_min  = 0;
> +			vreg->uA_limits.uA_step = 50000;
> +			vreg->uA_limits.ovr_val = 0; /* No override bit */
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
>  		memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
>  		vreg->desc.of_match = reg_data->name;
>  		vreg->desc.name = reg_data->name;
> -- 
> 2.29.2
> 
