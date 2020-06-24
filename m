Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2D5207331
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 14:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390161AbgFXMVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 08:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388548AbgFXMVI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 08:21:08 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 660BF2065F;
        Wed, 24 Jun 2020 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593001267;
        bh=ubm037DjoqhWp5F5sJ1u0TjSw4h4hwKqC/VMwTuOQV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xmb12H8k4I/htKdxidiwU427lNKY2KKHuxv3zKvwevJ/lPnJQ+Z/AKwIzkmNyUNyX
         vUYSD3lc8BC0bhWkW2DyKvpmpRk2V3EiVGL2Bzc5mD62zUpCJzkWI8Xap+beE0Hnyv
         pulOF6Qk6kh+1sWwkx4tO/YG58KRooDU7pH59MOU=
Date:   Wed, 24 Jun 2020 17:51:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom-snps: Add runtime suspend and resume
 handlers
Message-ID: <20200624122103.GC2324254@vkoul-mobl>
References: <1590112200-1110-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590112200-1110-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On 21-05-20, 18:50, Wesley Cheng wrote:
> Allow for the PHY to be put into a powered down state when possible.
> Add the required suspend and resume callbacks, which will determine
> what resources can be turned off depending on the cable status.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> 
> ---
> Changes in v2:
>  - Addressed checkpatch alignment/line length warnings.
>  - Removed superfluous init in qcom_snps_hsphy_resume().
> 
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 100 ++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 4d74045..0a4e77af 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -76,7 +76,9 @@
>   * @iface_clk: phy interface clock
>   * @phy_reset: phy reset control
>   * @vregs: regulator supplies bulk data
> + * @suspended: PHY is in the suspended state
>   * @phy_initialized: if PHY has been initialized correctly
> + * @mode: contains the current mode the PHY is in
>   */
>  struct qcom_snps_hsphy {
>  	struct phy *phy;
> @@ -87,7 +89,9 @@ struct qcom_snps_hsphy {
>  	struct reset_control *phy_reset;
>  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>  
> +	bool suspended;
>  	bool phy_initialized;
> +	enum phy_mode mode;
>  };
>  
>  static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> @@ -104,6 +108,84 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>  	readl_relaxed(base + offset);
>  }
>  
> +static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (hsphy->suspended)
> +		return 0;

Am still not convinced why this would be called when we are already
suspended :)

> +
> +	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode:%d\n",
> +		hsphy->mode);

Remove debug artifacts here?

> +
> +	if (hsphy->mode == PHY_MODE_USB_HOST) {
> +		/* Enable auto-resume to meet remote wakeup timing */
> +		qcom_snps_hsphy_write_mask(hsphy->base,
> +						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +						USB2_AUTO_RESUME,
> +						USB2_AUTO_RESUME);

Lets align the lines above to opening brace please..
If you run checkpatch with --strict option you would get this CHECK: Alignment should match open parenthesis

> +		usleep_range(500, 1000);
> +		qcom_snps_hsphy_write_mask(hsphy->base,
> +						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +						0, USB2_AUTO_RESUME);
> +	}
> +
> +	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	hsphy->suspended = true;
> +
> +	return 0;
> +}
> +
> +static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	if (!hsphy->suspended)
> +		return 0;
> +
> +	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode:%d\n",
> +		hsphy->mode);

here as well

> +
> +	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> +	if (ret) {
> +		dev_err(&hsphy->phy->dev,
> +			"failed to enable cfg ahb clock, %d\n", ret);

single line should be okay now :)

> +		return ret;
> +	}
> +
> +	hsphy->suspended = false;
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
> +static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
> +					int submode)
> +{
> +	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> +
> +	hsphy->mode = mode;
> +	return 0;
> +}
> +
>  static int qcom_snps_hsphy_init(struct phy *phy)
>  {
>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> @@ -175,6 +257,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
>  
>  	hsphy->phy_initialized = true;
> +	hsphy->suspended = false;
>  
>  	return 0;
>  
> @@ -201,6 +284,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>  static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>  	.init		= qcom_snps_hsphy_init,
>  	.exit		= qcom_snps_hsphy_exit,
> +	.set_mode	= qcom_snps_hsphy_set_mode,

This should be a separate patch, whats set_mode got to do with suspend
support :)

>  	.owner		= THIS_MODULE,
>  };
>  
> @@ -212,6 +296,11 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
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
> @@ -255,6 +344,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
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
> @@ -269,6 +366,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (!IS_ERR(phy_provider))
>  		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
> +	else
> +		pm_runtime_disable(dev);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> @@ -277,6 +376,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
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
