Return-Path: <linux-arm-msm+bounces-19136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1E8B9B5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 15:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1841C2034B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094BF824AC;
	Thu,  2 May 2024 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pq0FcFFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CAA32C60
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 May 2024 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714655553; cv=none; b=gcwiOQ8X2qG/h48De1FFdqP72tS/xyGb4fY0JeOgKtHcJv/ZBE/Y2fyDbKAIGWFKTxT8SKXsQUiDemTt6pSYNlKKftyUwoVwTAWP8ADPuEk6yw7ft5qTQHqAcfEa1es6GuBSND9dV1QJW/6ynXaTA1H+JOfF51srUHB64nnOt1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714655553; c=relaxed/simple;
	bh=w36A9qNTkHew7BT2vRvvyNspByFD2CNRYwskOpKFMNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5dTkK+KM6K3Hjb5AMj4ugmf0Rf8L0iocRDXOQ8KQtttOt1U+ZumGy4Jcksl7Wn7UIutzfWD3sz7/DrCNiKo+jx8PU1+uGkDE4Qv3CQp/M0LaIGQ5aRc7aAD8eRce9KKqMcYMkP1KB3AmHK/ezEtJY81NMbd853dLwe5sSwvK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pq0FcFFd; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6184acc1ef3so74825457b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714655551; x=1715260351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9IfF2XRrC1/or05aEZt3Pgg1CS/l8eHWqh1tFVKZN4=;
        b=pq0FcFFdFyslHFHmW4iDwTqhNMjI0Wh4AibrlCf4ipmtVjIjnYVOtFEx6iTp/NHEUT
         aDweGprtPI6uW1sFtvp9lL1iWFibsYbLvZF8d1rkGCTwF5UwpqB5EaUv6Z8K91HJdd6T
         WsNfJ8lZKuHcX1EVeYLgQsAxyltsXipHtgW3hFiBe2esvPEw39UbzopxfT+NAyfRt1Wf
         LKEQQyYtdCdrITo8RIreOGb1qzRE5ev4YZDz7TnodKFOFKz6luibL7eoEcNt9FUBF5oH
         qItPSV7p8nnPY6VM88twrhz3mDUB0+F80g+zqDnSZbEEcbvChgxhGdow+iwFeZAdQd9b
         4+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714655551; x=1715260351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9IfF2XRrC1/or05aEZt3Pgg1CS/l8eHWqh1tFVKZN4=;
        b=buNuoO1AH+A+HgsEMZV6XaTkxbLWP+Nh6KIZcwJuXm0cbDrkCKfQyZddPXbxob84IG
         Wq0quxuLe72J+CUczrSqFEjqZr6BiCr6oGXNlBOA3ORCUkiFYTfdSawyaAKlVpM5q8Po
         mFAeWJN4/mhsoAHl3GcDEoTm5U4CAjCn2tCk26ujBcUoX3XU62nV69eU1BDcKGtPhXYf
         3qx8HUx7fqVq4nK7QUqdM+zXq6u8aQMKMo05ldj5G0ODMRs4a5XtZiUxvRJYxZR0euXx
         ZWd/cxIbo1dmQTHg+706OhC2Xv7XYsf0AUcVzzXWSCF+iH8VBAH7uJwoWuyx7uX7/Dbc
         Dvbw==
X-Forwarded-Encrypted: i=1; AJvYcCWiC6w6OD9GCf4O2d+LdB4wkgPXnjbi1eKBqP2ggZ01KRyUXmkOumbzhqN85HnQ7NL8vgfmA0/gOnjxzYXmm7fYcGwJVG1NW+VeyLKBnQ==
X-Gm-Message-State: AOJu0YzweQcAdyuLO8ihSq1O6SgHl3PXh4Z/GI6B664bxZ+jWAwZb2i0
	kDlMFtGaruyf9f6b5glPEQbhh/PYdE/i0jJcQ3bXV5z3UlFvlGRnp+Zqpw+shhNh1akIaqM8Zgt
	m9XBOJ/F0Vj+iABAo3Nel/C9qIf8T2VX2eKabTWs9DlcRjLyd27VaZg==
X-Google-Smtp-Source: AGHT+IEmkdUGj5jxW8y/dVl1d+EP/OPmo0I1J+BrgLeQOzwiCRVJgZVKxM+VVh8ViBEG0rKvwXQFvcvTYJR/P/usunM=
X-Received: by 2002:a25:db8e:0:b0:dca:a3e8:a25a with SMTP id
 g136-20020a25db8e000000b00dcaa3e8a25amr2216795ybf.62.1714655551232; Thu, 02
 May 2024 06:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502123312.31083-1-quic_ugoswami@quicinc.com>
In-Reply-To: <20240502123312.31083-1-quic_ugoswami@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 May 2024 16:12:20 +0300
Message-ID: <CAA8EJppeQTadmny=hcs4xCQDXHwXEBHXjeecvZCUVcSXmwBTgg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-snps-femto-v2: Add load and voltage setting for
 LDO's used
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 May 2024 at 15:33, Udipto Goswami <quic_ugoswami@quicinc.com> wrote:
>
> The Femto phy depends on 0.88/ 1.8/ 3.3V regulators for its operation.
> If one of the regulators is not voted to the required minimum voltage
> for phy to operate, then High speed mode of operation will fail.
>
> On certain targets like (qcm6490_rb3gen2) where the minimum voltage
> of the regulator is lower than the operating voltage of the phy.
> If not voted properly, the phy supply would be limited to the min value
> of the LDO thereby rendering the phy non-operational.
>
> The current implementation of the regulators in the Femto PHY is not
> setting the load and voltage for each LDO. The appropriate voltages and
> loads required for the PHY to operate should be set.

Please move min/max voltages to the DTS. There is no need to set them
from the driver.

Also, is there any reason why you can't use `regulator-initial-mode =
<RPMH_REGULATOR_MODE_HPM>;` like other boards do?

>
> Implement a bulk operation api to set load & voltages before doing bulk
> enable. This will ensure that the PHY remains operational under all
> conditions.
>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 121 +++++++++++++++++-
>  1 file changed, 114 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index eb0b0f61d98e..cbe9cdaa6849 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -78,11 +78,39 @@
>
>  #define LS_FS_OUTPUT_IMPEDANCE_MASK            GENMASK(3, 0)
>
> -static const char * const qcom_snps_hsphy_vreg_names[] = {
> -       "vdda-pll", "vdda33", "vdda18",
> +
> +struct qcom_snps_hsphy_regulator_data {
> +       const char *name;
> +       unsigned int enable_load;
> +       unsigned int min_voltage;
> +       unsigned int max_voltage;
> +};
> +
> +static const struct qcom_snps_hsphy_regulator_data hsphy_vreg_l[] = {
> +       {
> +               .name = "vdda-pll",
> +               .enable_load = 30000,
> +               .min_voltage = 825000,
> +               .max_voltage = 925000,
> +       },
> +
> +       {
> +               .name = "vdda18",
> +               .enable_load = 19000,
> +               .min_voltage = 1704000,
> +               .max_voltage = 1800000
> +       },
> +
> +       {
> +               .name = "vdda33",
> +               .enable_load = 16000,
> +               .min_voltage = 3050000,
> +               .max_voltage = 3300000
> +       },
> +
>  };
>
> -#define SNPS_HS_NUM_VREGS              ARRAY_SIZE(qcom_snps_hsphy_vreg_names)
> +#define SNPS_HS_NUM_VREGS              ARRAY_SIZE(hsphy_vreg_l)
>
>  struct override_param {
>         s32     value;
> @@ -132,12 +160,90 @@ struct qcom_snps_hsphy {
>         struct clk_bulk_data *clks;
>         struct reset_control *phy_reset;
>         struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> +       const struct qcom_snps_hsphy_regulator_data *vreg_list;
>
>         bool phy_initialized;
>         enum phy_mode mode;
>         struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
>  };
>
> +static int __vdda_phy_bulk_enable_disable(struct qcom_snps_hsphy *hsphy, bool on)

Separate functions, please.

> +{
> +       int ret = 0;
> +       int i;
> +
> +       if (!on)
> +               goto disable_vdd;
> +
> +       for (i = 0; i < SNPS_HS_NUM_VREGS; i++) {
> +
> +               ret = regulator_set_load(hsphy->vregs[i].consumer,
> +                                        hsphy->vreg_list[i].enable_load);
> +
> +               if (ret < 0) {
> +                       dev_err(hsphy->dev, "unable to set HPM of %s %d\n",
> +                                               hsphy->vregs[i].supply, ret);
> +                       goto err_vdd;
> +               }
> +       }
> +
> +       for (i = 0; i < SNPS_HS_NUM_VREGS; i++) {
> +               ret = regulator_set_voltage(hsphy->vregs[i].consumer,
> +                                           hsphy->vreg_list[i].min_voltage,
> +                                           hsphy->vreg_list[i].max_voltage);
> +               if (ret) {
> +                       dev_err(hsphy->dev,
> +                               "unable to set voltage of regulator %s %d\n",
> +                                               hsphy->vregs[i].supply, ret);
> +                       goto put_vdd_lpm;
> +               }
> +       }
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +       if (ret)
> +               goto unconfig_vdd;
> +
> +       return ret;
> +
> +disable_vdd:
> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +
> +unconfig_vdd:
> +       for (i = 0; i < SNPS_HS_NUM_VREGS; i++) {
> +               ret = regulator_set_voltage(hsphy->vregs[i].consumer, 0,
> +                                           hsphy->vreg_list[i].max_voltage);
> +               if (ret) {
> +                       dev_err(hsphy->dev,
> +                       "unable to set voltage of regulator %s %d\n",
> +                                       hsphy->vregs[i].supply, ret);
> +               }
> +       }
> +
> +put_vdd_lpm:
> +       for (i = 0; i < SNPS_HS_NUM_VREGS; i++) {
> +               ret = regulator_set_load(hsphy->vregs[i].consumer, 0);
> +
> +               if (ret < 0) {
> +                       dev_err(hsphy->dev, "unable to set LPM of %s %d\n",
> +                                               hsphy->vregs[i].supply, ret);
> +               }
> +       }
> +
> +err_vdd:
> +       return ret;
> +
> +}
> +
> +static int vdda_phy_bulk_enable(struct qcom_snps_hsphy *hsphy)
> +{
> +       return __vdda_phy_bulk_enable_disable(hsphy, true);
> +}
> +
> +static int vdda_phy_bulk_disable(struct qcom_snps_hsphy *hsphy)
> +{
> +       return __vdda_phy_bulk_enable_disable(hsphy, false);
> +}
> +
>  static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
>  {
>         struct device *dev = hsphy->dev;
> @@ -390,7 +496,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>
>         dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +       ret = vdda_phy_bulk_enable(hsphy);
>         if (ret)
>                 return ret;
>
> @@ -471,7 +577,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  disable_clks:
>         clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
>  poweroff_phy:
> -       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +       ret = vdda_phy_bulk_disable(hsphy);
>
>         return ret;
>  }
> @@ -482,7 +588,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>
>         reset_control_assert(hsphy->phy_reset);
>         clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> -       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +       vdda_phy_bulk_disable(hsphy);
>         hsphy->phy_initialized = false;
>
>         return 0;
> @@ -592,8 +698,9 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>
>         num = ARRAY_SIZE(hsphy->vregs);
>         for (i = 0; i < num; i++)
> -               hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
> +               hsphy->vregs[i].supply = hsphy_vreg_l[i].name;
>
> +       hsphy->vreg_list  = hsphy_vreg_l;
>         ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
>         if (ret)
>                 return dev_err_probe(dev, ret,
> --
> 2.17.1
>
>


-- 
With best wishes
Dmitry

