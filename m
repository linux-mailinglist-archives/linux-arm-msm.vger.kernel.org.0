Return-Path: <linux-arm-msm+bounces-17684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A58A821A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4612818B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B9813CA8B;
	Wed, 17 Apr 2024 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXTpDZQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C013342F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713353357; cv=none; b=oy6P4ZTAwyLKs4xfvyZzxdh0Vnj88QLydZlC32ZnrkwRoIY2THO1/XGIfTmHsTpi4o9GKh77pjjR4i2lQ25UMLHTMbsZTvWQuz3Bg+w9TwnvyFxie4KHfzWjlgYdlCFcinpyOsB8EVNTO+1A8HiaC3/hsCKojzjtmMd+OTjlAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713353357; c=relaxed/simple;
	bh=eDSAI4jwFqizU3Xa4ItQgLLzrB+FlbMoo2xHRcsaXVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEa98l5qQGc4mYRslrcufIYXS3IVh0l9CLjniEjyq2D1GVEN7HCLyok4MYC6+9p9xBrGh0vUcIMD5POtDcjkNidIgspbXzEVxQNuorIYD1gZjOZNWjg8g6t4NMxaOsUg5/KO+pcDrLa9mPq+Y81kFU+WZwVB/on/lr86qyfD/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXTpDZQ9; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so591354276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713353355; x=1713958155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fta0Dyi3G93YWIko/JSRJw+1bKCGXLJxuwb9oPH+wY=;
        b=dXTpDZQ9wamko8baHayIv5SSofBhh14IXZEo7pIKyd4FlIEANA8g5iC7JlbBSrWN7r
         435DfGc8TkcEBFX6odk99lwgaSGC5jb+/4iOupxOl2kWykWvKz+q+YQ0BsjZ4ZmPtGuA
         9ip5HUUBLaLP3WMTbhEJQU7foEFI67gwl27HPfUOo+ZKckkAmAwOYe/Ec05ZSxMCtQwa
         uI97cJegXZ18pkyOlmvaVOFVANoXOrB81o6cQ4WDOwYU7plKoht8NU5qtafxHDvlbeRm
         80Uyp0pfD3xxgL0zcoh8FlwrDacuaYLRmB+y7/GLM1qGK9euiQCJICAYtHrd9HyoE0G5
         ygwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353355; x=1713958155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Fta0Dyi3G93YWIko/JSRJw+1bKCGXLJxuwb9oPH+wY=;
        b=bltZErgTGufgvmGcZgWrZwu1LSlX7KoUV5JtsNRqBIrPJD/vHmGoC8rHcpuYeAOOe1
         6nDzKpnr9rB5ADO/RsDdeGWOhgbGzWWfDBFPBCFk10OXQdqQ3UkK8j9ePcOfmvCV+hCX
         BKlcy6Q0AIUUwrDqgi8Uprey4fRC4ZBDtRPpm0ycueF7rqACpD9lNiEaSh9CzVng479k
         9jEOSBwg9xbsXUeeAkPjmFL5Y97KIx5uf4rDGNl3oFnaSSlyBBRY3AnfQdIQ7LVwggkA
         U2RYY0G22lyCuM9DhDw7f+u+LCzUxikRpBP/b159vb6xXIO7YBJuK8nGcyL/fiWYpkYl
         vEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2ihSFPCnRXkLX1Yi+E6Ng4JKRtrbs67QWhKw2/IoRcB6Ola/RYEy+bKu2nkkNLE6YCjPPy6VUfEouBnCW35i57ghajlvN0G08yOO0XQ==
X-Gm-Message-State: AOJu0Yyi7VQ0hB2BwAsEFds36xTLiZm42YpBMuANrdnV0qThdeswTEMp
	oMO6fFPm1hMO0Tzh5/9Ptt+eJ19oIxpUcLdk4O1yvlQpZoWa7xsvP9ZV6IVpumhmxK5p1eNH93G
	eWrLwOjFawgZMQWNa7Cel2I7COlOb5KgkEH+woQ==
X-Google-Smtp-Source: AGHT+IH1jnG6dEhiSTWawlONVFFSu65Dx/6vIYJTIg2Fbd5IgoTIEEgrWgmEH4F5+Ukf79rDog1BaJ6QCXnoiA+r6Ic=
X-Received: by 2002:a25:10d7:0:b0:dcd:9a9b:8d7e with SMTP id
 206-20020a2510d7000000b00dcd9a9b8d7emr4734393ybq.9.1713353354668; Wed, 17 Apr
 2024 04:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417105605.836705-1-quic_varada@quicinc.com> <20240417105605.836705-6-quic_varada@quicinc.com>
In-Reply-To: <20240417105605.836705-6-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:29:03 +0300
Message-ID: <CAA8EJpq75LhY3BD4JEqAOVAt1SxTvSOsdJTTb2bZD9rj15FmGA@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] clk: qcom: common: Add interconnect clocks support
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 13:57, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Unlike MSM platforms that manage NoC related clocks and scaling
> from RPM, IPQ SoCs dont involve RPM in managing NoC related
> clocks and there is no NoC scaling.
>
> However, there is a requirement to enable some NoC interface
> clocks for accessing the peripheral controllers present on
> these NoCs. Though exposing these as normal clocks would work,
> having a minimalistic interconnect driver to handle these clocks
> would make it consistent with other Qualcomm platforms resulting
> in common code paths. This is similar to msm8996-cbf's usage of
> icc-clk framework.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v8: Explicitly set master and slave ids
> v7: Restore clk_get
> v6: first_id -> icc_first_node_id
>     Remove clock get so that the peripheral that uses the clock
>     can do the clock get
> v5: Split changes in common.c to separate patch
>     Fix error handling
>     Use devm_icc_clk_register instead of icc_clk_register
> v4: Use clk_hw instead of indices
>     Do icc register in qcom_cc_probe() call stream
>     Add icc clock info to qcom_cc_desc structure
> v3: Use indexed identifiers here to avoid confusion
>     Fix error messages and move to common.c
> v2: Move DTS to separate patch
>     Update commit log
>     Auto select CONFIG_INTERCONNECT & CONFIG_INTERCONNECT_CLK to fix build error
> ---
>  drivers/clk/qcom/common.c | 35 ++++++++++++++++++++++++++++++++++-
>  drivers/clk/qcom/common.h | 16 ++++++++++++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 75f09e6e057e..a6410b1828ca 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -8,6 +8,7 @@
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-clk.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
>
> @@ -234,6 +235,38 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>         return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>  }
>
> +static int qcom_cc_icc_register(struct device *dev,
> +                               const struct qcom_cc_desc *desc)
> +{
> +       struct icc_clk_data *icd;
> +       struct clk_hw *hws;
> +       int i;
> +
> +       if (!IS_ENABLED(CONFIG_INTERCONNECT_CLK))
> +               return 0;
> +
> +       if (!desc->icc_hws)
> +               return 0;
> +
> +       icd = devm_kcalloc(dev, desc->num_icc_hws, sizeof(*icd), GFP_KERNEL);
> +       if (!icd)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < desc->num_icc_hws; i++) {
> +               icd[i].master_id = desc->icc_hws[i].master_id;
> +               icd[i].slave_id = desc->icc_hws[i].slave_id;
> +               hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;

I think I keep on repeating this again and again. Instead of passing
indices please pass clk_hw pointers.

> +               icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
> +               if (!icd[i].clk)
> +                       return dev_err_probe(dev, -ENOENT,
> +                                            "(%d) clock entry is null\n", i);
> +               icd[i].name = clk_hw_get_name(hws);
> +       }
> +
> +       return devm_icc_clk_register(dev, desc->icc_first_node_id,
> +                                                    desc->num_icc_hws, icd);
> +}
> +
>  int qcom_cc_really_probe(struct platform_device *pdev,
>                          const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -303,7 +336,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>         if (ret)
>                 return ret;
>
> -       return 0;
> +       return qcom_cc_icc_register(dev, desc);
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
>
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 9c8f7b798d9f..f6b25df1ca17 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -19,6 +19,19 @@ struct clk_hw;
>  #define PLL_VOTE_FSM_ENA       BIT(20)
>  #define PLL_VOTE_FSM_RESET     BIT(21)
>
> +struct qcom_icc_hws_data {
> +       int master_id;
> +       int slave_id;
> +       int clk_id;
> +};
> +
> +#define HWS_DATA(_b, _c)               \
> +{                                      \
> +       .master_id = MASTER_##_b,       \
> +       .slave_id = SLAVE_##_b,         \
> +       .clk_id = _c,                   \
> +}

This shouldn't be a part of this commit. It is not used in it.

> +
>  struct qcom_cc_desc {
>         const struct regmap_config *config;
>         struct clk_regmap **clks;
> @@ -29,6 +42,9 @@ struct qcom_cc_desc {
>         size_t num_gdscs;
>         struct clk_hw **clk_hws;
>         size_t num_clk_hws;
> +       struct qcom_icc_hws_data *icc_hws;
> +       size_t num_icc_hws;
> +       unsigned int icc_first_node_id;
>  };
>
>  /**
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

