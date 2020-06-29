Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3025020E4E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbgF2VaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728875AbgF2SlW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:41:22 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4921E2342C;
        Mon, 29 Jun 2020 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593423865;
        bh=w3FZD4im0Akh+fIGBw1c9ClNYUbIQLJYgTYhb1xdu1c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0/POGlUp0WbbmUZGA9MOwno2mdejSPgSen/jAC7icBvo5DI527qhcOcbn2WQZlUoB
         1ZPOQcIHcyWvvRpYgt697/mxrSX1vy7+haXmoN0v0tDuAWtTBUAnmYDhs/Ruob6KKn
         rHBOLMDiCJ8+xR6ChC3vFoO8Soqn9qQ7ZGKmtGgk=
Date:   Mon, 29 Jun 2020 15:14:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     kishon@ti.com, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org
Subject: Re: [PATCH v3 1/2] phy: qcom-snps: Add runtime suspend and resume
 handlers
Message-ID: <20200629094421.GD2599@vkoul-mobl>
References: <20200625195444.15130-1-wcheng@codeaurora.org>
 <20200625195444.15130-2-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625195444.15130-2-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On 25-06-20, 12:54, Wesley Cheng wrote:
> Allow for the PHY to be put into a powered down state when possible.
> Add the required suspend and resume callbacks, which will determine
> what resources can be turned off depending on the cable status.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Please do not add this tag unless someone send it explictly over the
email.. I do not recall sending a review tag

> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 4d74045271eb..152d8633f4ea 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -104,6 +104,63 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>  	readl_relaxed(base + offset);
>  }
>  
> +static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> +{
> +	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
> +
> +	if (hsphy->mode == PHY_MODE_USB_HOST) {
> +		/* Enable auto-resume to meet remote wakeup timing */
> +		qcom_snps_hsphy_write_mask(hsphy->base,
> +					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +					   USB2_AUTO_RESUME,
> +					   USB2_AUTO_RESUME);
> +		usleep_range(500, 1000);
> +		qcom_snps_hsphy_write_mask(hsphy->base,
> +					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +					   0, USB2_AUTO_RESUME);
> +	}
> +
> +	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	return 0;
> +}
> +
> +static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
> +
> +	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> +	if (ret) {
> +		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> +
> +	if (!hsphy->phy_initialized)
> +		return 0;
> +
> +	qcom_snps_hsphy_suspend(hsphy);
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
> +{
> +	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
> +
> +	if (!hsphy->phy_initialized)
> +		return 0;
> +
> +	qcom_snps_hsphy_resume(hsphy);
> +	return 0;
> +}
> +
>  static int qcom_snps_hsphy_init(struct phy *phy)
>  {
>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> @@ -212,6 +269,11 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
>  
> +static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
> +			   qcom_snps_hsphy_runtime_resume, NULL)
> +};
> +
>  static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -255,6 +317,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	/*
> +	 * Prevent runtime pm from being ON by default. Users can enable
> +	 * it using power/control in sysfs.
> +	 */
> +	pm_runtime_forbid(dev);
> +
>  	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
>  	if (IS_ERR(generic_phy)) {
>  		ret = PTR_ERR(generic_phy);
> @@ -269,6 +339,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (!IS_ERR(phy_provider))
>  		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
> +	else
> +		pm_runtime_disable(dev);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> @@ -277,6 +349,7 @@ static struct platform_driver qcom_snps_hsphy_driver = {
>  	.probe		= qcom_snps_hsphy_probe,
>  	.driver = {
>  		.name	= "qcom-snps-hs-femto-v2-phy",
> +		.pm = &qcom_snps_hsphy_pm_ops,
>  		.of_match_table = qcom_snps_hsphy_of_match_table,
>  	},
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
