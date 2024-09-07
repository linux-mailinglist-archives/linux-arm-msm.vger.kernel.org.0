Return-Path: <linux-arm-msm+bounces-31207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025A97036A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 19:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8D6B2062B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 17:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D21161319;
	Sat,  7 Sep 2024 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y471n6mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD217571
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731548; cv=none; b=c3C51DArKL593C4fR4ddT5E/U5UO1NPpxFSSKuILuNNtWefRY3QdSSXwFn+YGvhj5aVfyGfdVkx1jLQoJPGi7qAXvnfWcg43Y1rBT9bXhe2woy7s8PD1LVFscGho9UhuHG0ckY6/2dxRUKFmXMumRgA4d/HLwHhleIhsG26Pn8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731548; c=relaxed/simple;
	bh=wdfXapGzOxZQkBuhCe8zCnKWGB0UNMRpMvwy7Ho1EbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZfVcQBROy/hcGqaUClJ8vFPabczZAe9Xe3VTC/wXeaJFzDoipSh0oWLg2cRMagoSRvhioekwdKR2zYpLDvtABfGKTbwwYsBvZOJhgwbkHH61JeQ1EbyaUcYAvqitO2X0EE0hiDlYwogyP7icbZjx7iDBkhDDYOw3nwW8py3Zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y471n6mo; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so3049779276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725731545; x=1726336345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmfUXum+hMGBOXSX617klpzb0zjjyzayHt/KE016mEU=;
        b=y471n6moWgrzJMSUolzNlgQCRKdo/USMCVk5P56B3b03HJOhynowFHigLhtEn81P7u
         umw08QWZcqLdIKmrRLH3WvjLse9j/g12+U74l0SvevqWzFOLa4/1tgcPfEI17yqHieHi
         vXqnpd/nl8DMlcR8aMJHdpH7yB6Yfuikp1Gj5kgUHFOIeMBuil4bclgOesD8FCXCB31N
         Nnn57WBgOG9j4FJRbf5yysq9Qc8qUVcaX/5dDOTFgzycKqCckzDLhBqgZwzthazsid6f
         Z/EOews9VFqgMfsN+uvCfuKXdoYLd0nAwaNIzTAkx/63KIo6tMpLuHgrq4ksbkVRKJXD
         /EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725731545; x=1726336345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmfUXum+hMGBOXSX617klpzb0zjjyzayHt/KE016mEU=;
        b=lf+Sw70rQmWOgZ55QuBopGrUDVUimX4IxosouUAA5oyED7GnNQHlQTMSrnNfK1W9Ey
         /1YX9VyH62dPKD4WoW8DZeA20gTZEdbEFC/oV1c4KWrKopaaUQE+/rWH0sWmwJc7V7Qs
         p7Oym2fPmYuwHnKx+cvHuAFWMxSgrRZsF1Lf/uhhm5ixxeJVIAAssXUzUN4KWPZPJSa0
         EEYPDU8lcx2lCBdKuG8hiIxIxaR7SDbFF+OLBcVgXDqFtk0aJRFHInBpObOnvjk8l/af
         QnARChmgTj2Meiby6N89vviWel90+bUt5ScOINejN+nzDBnrTQXBLC6MXywxXvSpfz90
         SQAg==
X-Forwarded-Encrypted: i=1; AJvYcCX63B7K3Yjt2jBpJI771EjOAoBsk/iPChOiyIuvzn/zrlgMAYo5LNYlz5kTk762gEB250cB+46DwK1TqTUP@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuZ1GJFCtoJf995cQisodnb8JYRWsBu944e7UIACvV/fQeS/A
	5mydHKVkudSqlwVMOVoHhD9XkilNdDxxHa4SPwQRW/Kztryvm6i8TtWjVsZUErRUPUCH8787xuO
	WlSjmG9AJxNq4JxN1WyPv5qEKCMgP974IZ4kO5A==
X-Google-Smtp-Source: AGHT+IESE/nI8Bxzeh7UNT9DbmSMYE6dgAE/AysGBHexnA1PwCtiJcPuwdEeKbrhyv24ijKDBUrx3TYJPr8W6PNDuVw=
X-Received: by 2002:a05:690c:f:b0:64a:90fe:911e with SMTP id
 00721157ae682-6db45154290mr63873167b3.31.1725731544986; Sat, 07 Sep 2024
 10:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
In-Reply-To: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 7 Sep 2024 20:52:14 +0300
Message-ID: <CAA8EJpqw6pB4d_zQyYdhq9_prLnh+mLMdRSzJ+5EvAjT9wi86A@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Sept 2024 at 18:25, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Enable runtime PM support by adding proper ops which will handle the
> clocks and regulators. These resources will now be handled on power_on and
> power_off instead of init and exit PHY ops. Also enable these resources on
> probe in order to balance out the disabling that is happening right after.
> Prevent runtime PM from being ON by default as well.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
>  1 file changed, 77 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..3affeef261bf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -192,14 +192,6 @@ static int qcom_edp_phy_init(struct phy *phy)
>         int ret;
>         u8 cfg8;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -       if (ret)
> -               return ret;
> -
> -       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> -       if (ret)
> -               goto out_disable_supplies;
> -
>         writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>                DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>                edp->edp + DP_PHY_PD_CTL);
> @@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
>         msleep(20);
>
>         return 0;
> -
> -out_disable_supplies:
> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -
> -       return ret;
>  }
>
>  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> @@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>         u32 val;
>         u8 cfg1;
>
> +       pm_runtime_get_sync(&phy->dev);
> +
>         ret = edp->cfg->ver_ops->com_power_on(edp);
>         if (ret)
>                 return ret;
> @@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>
>         writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
>
> +       pm_runtime_put(&phy->dev);
> +
>         return 0;
>  }
>
> @@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
>         return 0;
>  }
>
> -static int qcom_edp_phy_exit(struct phy *phy)
> -{
> -       struct qcom_edp *edp = phy_get_drvdata(phy);
> -
> -       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -
> -       return 0;
> -}
> -
>  static const struct phy_ops qcom_edp_ops = {
>         .init           = qcom_edp_phy_init,
>         .configure      = qcom_edp_phy_configure,
>         .power_on       = qcom_edp_phy_power_on,
>         .power_off      = qcom_edp_phy_power_off,
>         .set_mode       = qcom_edp_phy_set_mode,
> -       .exit           = qcom_edp_phy_exit,
>         .owner          = THIS_MODULE,
>  };
>
> @@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>         return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
>  }
>
> +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> +{
> +       struct qcom_edp *edp = dev_get_drvdata(dev);
> +
> +       dev_err(dev, "Suspending DP phy\n");

Debug leftovers?

> +
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
> +{
> +       struct qcom_edp *edp = dev_get_drvdata(dev);
> +       int ret;
> +
> +       dev_err(dev, "Resuming DP phy\n");

Debug leftovers?

> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       if (ret)
> +               return ret;
> +
> +       return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);

Missing error handling

> +}
> +
>  static int qcom_edp_phy_probe(struct platform_device *pdev)
>  {
>         struct phy_provider *phy_provider;
> @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> -       if (ret)
> +       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       if (ret) {
> +               dev_err(dev, "failed to enable regulators, err=%d\n", ret);
>                 return ret;
> +       }
> +
> +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> +       if (ret) {
> +               dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> +               goto err_disable_regulators;
> +       }

Please use pm_runtime_get_sync() instead().

> +
> +       ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> +       if (ret) {
> +               dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> +               goto err_disable_clocks;
> +       }
>
>         edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
>         if (IS_ERR(edp->phy)) {
>                 dev_err(dev, "failed to register phy\n");
> -               return PTR_ERR(edp->phy);
> +               ret = PTR_ERR(edp->phy);
> +               goto err_disable_clocks;
>         }
>
> +       pm_runtime_set_active(dev);
> +       ret = devm_pm_runtime_enable(dev);

If this handles earlier, you don't need to call pm_runtime_set_active() manually

> +       if (ret)
> +               goto err_disable_clocks;
> +       /*
> +        * Prevent runtime pm from being ON by default. Users can enable
> +        * it using power/control in sysfs.

why?

> +        */
> +       pm_runtime_forbid(dev);
> +
> +       dev_set_drvdata(dev, edp);
>         phy_set_drvdata(edp->phy, edp);
>
>         phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -       return PTR_ERR_OR_ZERO(phy_provider);
> +       if (IS_ERR(phy_provider))
> +               goto err_disable_clocks;
> +
> +       return 0;
> +
> +err_disable_clocks:
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +
> +err_disable_regulators:
> +       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);

Ideally this should be handled by pm_runtime. Or at least by pm_runtime_put().

> +
> +       return ret;
>  }
>
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> @@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
>
> +static const struct dev_pm_ops qcom_edp_pm_ops = {
> +       SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
> +                          qcom_edp_runtime_resume, NULL)
> +};
> +
>  static struct platform_driver qcom_edp_phy_driver = {
>         .probe          = qcom_edp_phy_probe,
>         .driver = {
>                 .name   = "qcom-edp-phy",
> +               .pm     = &qcom_edp_pm_ops,
>                 .of_match_table = qcom_edp_phy_match_table,
>         },
>  };
>
> ---
> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> change-id: 20240907-phy-qcom-edp-enable-runtime-pm-6fad07af8947
>
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>
>


-- 
With best wishes
Dmitry

