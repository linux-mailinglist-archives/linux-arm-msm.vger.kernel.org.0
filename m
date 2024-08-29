Return-Path: <linux-arm-msm+bounces-30068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC15964D32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7CC01F218EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634841B3F14;
	Thu, 29 Aug 2024 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alE77Gbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9D4D8C1;
	Thu, 29 Aug 2024 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724953747; cv=none; b=IURCoVczF1f7jeZIx+Ai4Qu4HlsmuhJX67th8ZkAQ4Ph2bN7GPBheGsXtJyEa3udnKmTFbCqGm90No0JIf/mLihV1f+YGZ9EDqs3NbuK4C13ogVxAW2B1nJVCxRU1arRvVCTBUvzEGTchljCo4BliQEFXEXEAi0w0nPmPTE6nVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724953747; c=relaxed/simple;
	bh=QWWOFe/ASXAPJ38v2aHBuhEpRmh5sbL8ny7rcbpiugc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n80JIWoFQ0CgZLgxl8pHgNIKARo7cmlvwKdaLWQo7WszewhIkgJT6CUgZ8zjmjmOtj9MpdhjqxfAldrq3KY4Rxa1AhGBLcYaFBetpilCFQUplSvohdd59NzsBFalQOIEGVeZ84L9LXYDgC1Q0GlG4B0mtYT0pMWQmdQHHJCIIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alE77Gbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481FEC4CEC1;
	Thu, 29 Aug 2024 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724953746;
	bh=QWWOFe/ASXAPJ38v2aHBuhEpRmh5sbL8ny7rcbpiugc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alE77GbcKxrXUGBBTKl/3SKJ027OH7GUR7jM0NlH/DXMGZLzbUVI72oqOpZuR/tXk
	 D9Iede+iR5Gbjgn8ScAJ7+oCPY7JKMVYn04trYdl16x62MEKLZ5dphIoP62KyFNdZI
	 BRRWGvkUhf112pDrV99Ei3Hf9bcM68O28H/YHuFQslAQ1I4hWQNyfbPcNiFAumZpL5
	 DnCMTjTEB63jEKLLbZCOhlMX5jOMv5YjK2chde7GdySjIBKNNZaGOinnAOb/9a1jf3
	 CojHvFfX2JSWOYghFo2wByQPQ0UEjRcfJxhu8JneRLSu6GCP6hVA3T7qDatdsTUWfj
	 H3s8b5YjuXhsg==
Date: Thu, 29 Aug 2024 23:19:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: kishon@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com,
	konrad.dybcio@linaro.org, liubo03@inspur.com, robh@kernel.org,
	yuvaraj.cd@gmail.com, ks.giri@samsung.com, vasanth.a@samsung.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-apq8064-sata: Convert to
 devm_clk_get_enabled()
Message-ID: <ZtC0j1kaHKHA3v/P@vaman>
References: <20240822084400.1595426-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084400.1595426-1-frank.li@vivo.com>

On 22-08-24, 02:44, Yangtao Li wrote:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.

Can you please resend this as a single thread. Threading is broken in
this series, I see 2, 3 patches, no idea where 1, 4 are...

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 22 ++++----------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index 3642a5d4f2f3..18c0dbd8e707 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -68,7 +68,6 @@
>  
>  struct qcom_apq8064_sata_phy {
>  	void __iomem *mmio;
> -	struct clk *cfg_clk;
>  	struct device *dev;
>  };
>  
> @@ -203,7 +202,7 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
>  	struct phy *generic_phy;
> -	int ret;
> +	struct clk *cfg_clk;
>  
>  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
> @@ -223,19 +222,14 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
>  	phy_set_drvdata(generic_phy, phy);
>  	platform_set_drvdata(pdev, phy);
>  
> -	phy->cfg_clk = devm_clk_get(dev, "cfg");
> -	if (IS_ERR(phy->cfg_clk)) {
> +	cfg_clk = devm_clk_get_enabled(dev, "cfg");
> +	if (IS_ERR(cfg_clk)) {
>  		dev_err(dev, "Failed to get sata cfg clock\n");
> -		return PTR_ERR(phy->cfg_clk);
> +		return PTR_ERR(cfg_clk);
>  	}
>  
> -	ret = clk_prepare_enable(phy->cfg_clk);
> -	if (ret)
> -		return ret;
> -
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(phy_provider)) {
> -		clk_disable_unprepare(phy->cfg_clk);
>  		dev_err(dev, "%s: failed to register phy\n", __func__);
>  		return PTR_ERR(phy_provider);
>  	}
> @@ -243,13 +237,6 @@ static int qcom_apq8064_sata_phy_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static void qcom_apq8064_sata_phy_remove(struct platform_device *pdev)
> -{
> -	struct qcom_apq8064_sata_phy *phy = platform_get_drvdata(pdev);
> -
> -	clk_disable_unprepare(phy->cfg_clk);
> -}
> -
>  static const struct of_device_id qcom_apq8064_sata_phy_of_match[] = {
>  	{ .compatible = "qcom,apq8064-sata-phy" },
>  	{ },
> @@ -258,7 +245,6 @@ MODULE_DEVICE_TABLE(of, qcom_apq8064_sata_phy_of_match);
>  
>  static struct platform_driver qcom_apq8064_sata_phy_driver = {
>  	.probe	= qcom_apq8064_sata_phy_probe,
> -	.remove_new = qcom_apq8064_sata_phy_remove,
>  	.driver = {
>  		.name	= "qcom-apq8064-sata-phy",
>  		.of_match_table	= qcom_apq8064_sata_phy_of_match,
> -- 
> 2.39.0

-- 
~Vinod

