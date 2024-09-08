Return-Path: <linux-arm-msm+bounces-31217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E579704F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 05:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55DAA1C20D86
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 03:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C51200A0;
	Sun,  8 Sep 2024 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDDYNwFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9AA11C92;
	Sun,  8 Sep 2024 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725765585; cv=none; b=kuhV+MvaM0TAUmeh/rMIjLFEVZ4sQ5lfND4xekua3PDnkquxtvxOShm67L4kDLq7sio+e0Pz80Jaju9UJFzNqDDcP2aT58HCdSP2kiO9XPVHEZjbuU/sZULHwlxOtcknMlJHleLZT8TFcslECO8oBLyIZ1Fc7cFqYXmpkxO3Z7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725765585; c=relaxed/simple;
	bh=dKtKvgCT0A7VnzYFqYSnTV61i+lVLVKOOj/YC5m3Daw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J68Mu6XSMesMAhKG2qiIy2Hs2h9Ac+EwifOw+FzZJel9gkwC+9ZBlv0BkbHUoaYF8sXWi1n5B4ekpHCrRrBPL++/mUgjRT/P9TUFeHb8lCQb2F69r/cWv3mBld4MF9bPs+6RYwX2u09f1ky6GFrSAALOMOAe7uKVvilD4F905r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDDYNwFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23826C4CEC8;
	Sun,  8 Sep 2024 03:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725765584;
	bh=dKtKvgCT0A7VnzYFqYSnTV61i+lVLVKOOj/YC5m3Daw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDDYNwFJd2eh380q6zm6NBsR1Zz7XoaaHGBtjD1TcBPwt+y6eZ3uC9kdho8DUkCMl
	 2QTeIl4kedZmJ6mh0idEeHvKQbS9sRJgBh3GY0cggO5cjGZcwk4eKLeAPnLKC/kfzk
	 xrPfA6FCRbUe75qLZVqtqw/hnxH9Eho8SUNlHBjLZqj9MPADwVBHfGmR4/wBn49PJY
	 j+5pJuWq2C088/ML9LAO4XAscVeYF/94v1DJPD5KcLf7fSfWpctT1POoQEBUWX++md
	 EYCvzIkkJADqExcGiWE+lggvuZQTQs1au6kOpej7Mry+hfpwIjn+tNpT7CCCsnkl6x
	 L/Tbku2v7oqTg==
Date: Sat, 7 Sep 2024 22:19:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <v6jzz6q5eutbmdy6vwagdhenjnvxucf3u3nl5qdjte65wlc77e@tzvxcm3xnuht>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>

On Sat, Sep 07, 2024 at 06:25:21PM GMT, Abel Vesa wrote:
> Enable runtime PM support by adding proper ops which will handle the
> clocks and regulators. These resources will now be handled on power_on and
> power_off instead of init and exit PHY ops. Also enable these resources on
> probe in order to balance out the disabling that is happening right after.

Sounds good, I assume there's a good reason for doing this?

Please provide a proper problem description, as defined in:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> Prevent runtime PM from being ON by default as well.
> 

Why?

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
>  	int ret;
>  	u8 cfg8;
>  
> -	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> -	if (ret)
> -		goto out_disable_supplies;
> -
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>  	       edp->edp + DP_PHY_PD_CTL);
> @@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
>  	msleep(20);
>  
>  	return 0;
> -
> -out_disable_supplies:
> -	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -
> -	return ret;
>  }
>  
>  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> @@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  	u32 val;
>  	u8 cfg1;
>  
> +	pm_runtime_get_sync(&phy->dev);
> +
>  	ret = edp->cfg->ver_ops->com_power_on(edp);
>  	if (ret)
>  		return ret;
> @@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>  
>  	writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
>  
> +	pm_runtime_put(&phy->dev);
> +
>  	return 0;
>  }
>  
> @@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
>  	return 0;
>  }
>  
> -static int qcom_edp_phy_exit(struct phy *phy)
> -{
> -	struct qcom_edp *edp = phy_get_drvdata(phy);
> -
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> -	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> -
> -	return 0;
> -}
> -
>  static const struct phy_ops qcom_edp_ops = {
>  	.init		= qcom_edp_phy_init,
>  	.configure	= qcom_edp_phy_configure,
>  	.power_on	= qcom_edp_phy_power_on,
>  	.power_off	= qcom_edp_phy_power_off,
>  	.set_mode	= qcom_edp_phy_set_mode,
> -	.exit		= qcom_edp_phy_exit,
>  	.owner		= THIS_MODULE,
>  };
>  
> @@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>  	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
>  }
>  
> +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_edp *edp = dev_get_drvdata(dev);
> +
> +	dev_err(dev, "Suspending DP phy\n");
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
> +{
> +	struct qcom_edp *edp = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_err(dev, "Resuming DP phy\n");
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +	if (ret)
> +		return ret;
> +
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> +}
> +
>  static int qcom_edp_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> -	if (ret)
> +	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators, err=%d\n", ret);
>  		return ret;
> +	}
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> +		goto err_disable_regulators;
> +	}
> +
> +	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> +	if (ret) {
> +		dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> +		goto err_disable_clocks;
> +	}
>  
>  	edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
>  	if (IS_ERR(edp->phy)) {
>  		dev_err(dev, "failed to register phy\n");
> -		return PTR_ERR(edp->phy);
> +		ret = PTR_ERR(edp->phy);
> +		goto err_disable_clocks;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_disable_clocks;
> +	/*
> +	 * Prevent runtime pm from being ON by default. Users can enable
> +	 * it using power/control in sysfs.

That is what this call do, please describe why it's done instead.

Regards,
Bjorn

> +	 */
> +	pm_runtime_forbid(dev);
> +
> +	dev_set_drvdata(dev, edp);
>  	phy_set_drvdata(edp->phy, edp);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	return PTR_ERR_OR_ZERO(phy_provider);
> +	if (IS_ERR(phy_provider))
> +		goto err_disable_clocks;
> +
> +	return 0;
> +
> +err_disable_clocks:
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +	return ret;
>  }
>  
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> @@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
>  
> +static const struct dev_pm_ops qcom_edp_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
> +			   qcom_edp_runtime_resume, NULL)
> +};
> +
>  static struct platform_driver qcom_edp_phy_driver = {
>  	.probe		= qcom_edp_phy_probe,
>  	.driver = {
>  		.name	= "qcom-edp-phy",
> +		.pm	= &qcom_edp_pm_ops,
>  		.of_match_table = qcom_edp_phy_match_table,
>  	},
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
> 

