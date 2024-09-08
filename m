Return-Path: <linux-arm-msm+bounces-31221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFE3970934
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 20:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DB22820A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 18:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B12F176AAF;
	Sun,  8 Sep 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NouGuBDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040EAC8D7
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Sep 2024 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725819773; cv=none; b=Y706N+hgUPE0VPXYYy20a6/PphXk0Xh1FPAid0Khzqmt5UB0MlW4hE5+XDlbPEIqCMGZENzzW5+m2HQWpXv5/94wVDCmMUPoW/agdH+ZnsvqKjUcaQnSxy0vNuym44qzrL3wTg7myzJOCsHBV3bLW4V3Pq/NyQyUZ1Ro+vIi18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725819773; c=relaxed/simple;
	bh=//91YXUCp8+Hb6aoluXndl17VgxsH1k7PFe5IRSXhog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXrQOybPONr2BzRs3nvSnewxjyqIIn1iAVTSQEvGanZlO0w63uj9VwT5gZHRPcWp8kuEJ0qpAuVnG6u8/p3wScX/it0Pk2MGn8D9fWc8WYh7KDNGz3+4BH60nb8Z4DzTbnpXJzraYuG2IFf2vR43kJ1NEWX4l+HteIbJMmShPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NouGuBDT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a89c8db505bso528270366b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2024 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725819769; x=1726424569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2idfAWkFdYYhqtf5N/5jWe/6MHCVAFh03fQfQe/bH4=;
        b=NouGuBDTW78kd8ZmtNWHkakENZ5loLd9+m1Cs6cgVRvRGX2WcqTB2mPuuXjJzMFmwu
         ru2o8jG1zVT8LMYUOZSGvqvb5tu/pxiCvMQAabKZ3aMyiQpTErIz7jOSGn1aSqsCjlQG
         MD5vtRbfCbZULRabZKzMRpCIDAEim8DGeABQcqLjpET52+DryhUo7NBnE0zgZoXcS7a7
         5vdO0wqxU/cBjXfhlU4r7mayHd/splsju5QPAU/sMYq611jThF4a1nGoBCd0Gk8yU7X/
         pkF35bHm1gMAtheuKWUtin1j36e+7yyrS0KWOsRZy4455Zfj6L8kPiQHLg3gW+yfJpzw
         mdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725819769; x=1726424569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2idfAWkFdYYhqtf5N/5jWe/6MHCVAFh03fQfQe/bH4=;
        b=wh9WnGa4N8TfiFDIT/eXMtFVsjVAObw6vkt5v3Mu25bI8Fd/0/Bam+iHYq+S3w51fZ
         PxK5I6aJWoQtVzqTRPqxNoU5tH+c7XChUPVfOQ7xKCB/q4htZ2YJkZZxeYYcbRWsaErC
         AVPkPSeehZkQcUjOLTGnGFMk6zyT0Ge/gnZfKUxdt1Yn+obWWidFayPAZz6nEf7wi0ef
         LWPTwLbm/5320ae7+PlF4CKJen3kY5ToTSQGY58gpBhtjGBDNAafptPMGW+LPpM8iXX/
         xbaN67gfnx0ndvFHPQE1Mmnhyrle2RZOLOmTHbRcWCCcZOzZJeeOLwwvgfvpKxYOl5hG
         eZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc2yjaOadJoSbDkND2+xrmhzxeJm/qBjC4I+s+fnmSE2J1nQj8wmKKPJnhCCVvDrWh8q+YK64sKR3en36m@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYpBobEP93hqQkT/6xH7+amf++CRyfymMg0e7gswGzPdELaAE
	4wXykZI7GNxDhpBfkpwZZTC/xZiMGc5Nq6z4LUjXxnzUcGFys8Yrs8cZNWUpjQQ=
X-Google-Smtp-Source: AGHT+IHSxs4pKNJuIObymEtcBuUC4cen0FYSqMItRehwPjNMnvp9O6H5yttlWIcPql9O05MV6UzF1Q==
X-Received: by 2002:a17:907:72d1:b0:a86:8f66:e5cf with SMTP id a640c23a62f3a-a8a885bfcb7mr1062124766b.2.1725819768569;
        Sun, 08 Sep 2024 11:22:48 -0700 (PDT)
Received: from linaro.org ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf4a1fsm232213366b.181.2024.09.08.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 11:22:48 -0700 (PDT)
Date: Sun, 8 Sep 2024 21:22:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <Zt3rdqPs4Kpa4O3T@linaro.org>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <v6jzz6q5eutbmdy6vwagdhenjnvxucf3u3nl5qdjte65wlc77e@tzvxcm3xnuht>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v6jzz6q5eutbmdy6vwagdhenjnvxucf3u3nl5qdjte65wlc77e@tzvxcm3xnuht>

On 24-09-07 22:19:42, Bjorn Andersson wrote:
> On Sat, Sep 07, 2024 at 06:25:21PM GMT, Abel Vesa wrote:
> > Enable runtime PM support by adding proper ops which will handle the
> > clocks and regulators. These resources will now be handled on power_on and
> > power_off instead of init and exit PHY ops. Also enable these resources on
> > probe in order to balance out the disabling that is happening right after.
> 
> Sounds good, I assume there's a good reason for doing this?

Replied to Dmitry's comment about this already, but will summarize here
as well. Basically, this PHY is usually left enabled as part of display
SS by the bootloader on most of the platforms it is used. My rationale
here was initially that maybe incrementing device's usage counter would
be wrong considering that it is already enabled. But then enabling
clocks and regulators here would move the wrong logic to their generic
framework. This I haven't thought through initially. So I decided to
just drop the votes entirely on probe. The resources will be enabled on
power_on via runtime PM get call.

> 
> Please provide a proper problem description, as defined in:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Yep, will describe the impact/necessity better in the next version.

> 
> > Prevent runtime PM from being ON by default as well.
> > 
> 
> Why?

Also replied to Dmitry to his similar comment. Long story short, if any
of the platforms that use this PHY have any missing/wrong resources
voted for, it might render display broken on the first runtime suspend,
if runtime PM is allowed by default. Plus, all other Qcom PHY drivers
follow the same logic. Anyway, will drop in the next version.

> 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-edp.c | 105 ++++++++++++++++++++++++++----------
> >  1 file changed, 77 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> > index da2b32fb5b45..3affeef261bf 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> > @@ -192,14 +192,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> >  	int ret;
> >  	u8 cfg8;
> >  
> > -	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > -	if (ret)
> > -		goto out_disable_supplies;
> > -
> >  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> >  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> >  	       edp->edp + DP_PHY_PD_CTL);
> > @@ -246,11 +238,6 @@ static int qcom_edp_phy_init(struct phy *phy)
> >  	msleep(20);
> >  
> >  	return 0;
> > -
> > -out_disable_supplies:
> > -	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -
> > -	return ret;
> >  }
> >  
> >  static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
> > @@ -721,6 +708,8 @@ static int qcom_edp_phy_power_on(struct phy *phy)
> >  	u32 val;
> >  	u8 cfg1;
> >  
> > +	pm_runtime_get_sync(&phy->dev);
> > +
> >  	ret = edp->cfg->ver_ops->com_power_on(edp);
> >  	if (ret)
> >  		return ret;
> > @@ -841,6 +830,8 @@ static int qcom_edp_phy_power_off(struct phy *phy)
> >  
> >  	writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
> >  
> > +	pm_runtime_put(&phy->dev);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -856,23 +847,12 @@ static int qcom_edp_phy_set_mode(struct phy *phy, enum phy_mode mode, int submod
> >  	return 0;
> >  }
> >  
> > -static int qcom_edp_phy_exit(struct phy *phy)
> > -{
> > -	struct qcom_edp *edp = phy_get_drvdata(phy);
> > -
> > -	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > -	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > -
> > -	return 0;
> > -}
> > -
> >  static const struct phy_ops qcom_edp_ops = {
> >  	.init		= qcom_edp_phy_init,
> >  	.configure	= qcom_edp_phy_configure,
> >  	.power_on	= qcom_edp_phy_power_on,
> >  	.power_off	= qcom_edp_phy_power_off,
> >  	.set_mode	= qcom_edp_phy_set_mode,
> > -	.exit		= qcom_edp_phy_exit,
> >  	.owner		= THIS_MODULE,
> >  };
> >  
> > @@ -1036,6 +1016,32 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
> >  	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
> >  }
> >  
> > +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> > +{
> > +	struct qcom_edp *edp = dev_get_drvdata(dev);
> > +
> > +	dev_err(dev, "Suspending DP phy\n");
> > +
> > +	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > +	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused qcom_edp_runtime_resume(struct device *dev)
> > +{
> > +	struct qcom_edp *edp = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_err(dev, "Resuming DP phy\n");
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > +}
> > +
> >  static int qcom_edp_phy_probe(struct platform_device *pdev)
> >  {
> >  	struct phy_provider *phy_provider;
> > @@ -1091,20 +1097,57 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > -	if (ret)
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable regulators, err=%d\n", ret);
> >  		return ret;
> > +	}
> > +
> > +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks, err=%d\n", ret);
> > +		goto err_disable_regulators;
> > +	}
> > +
> > +	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register PHY clocks, err=%d\n", ret);
> > +		goto err_disable_clocks;
> > +	}
> >  
> >  	edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
> >  	if (IS_ERR(edp->phy)) {
> >  		dev_err(dev, "failed to register phy\n");
> > -		return PTR_ERR(edp->phy);
> > +		ret = PTR_ERR(edp->phy);
> > +		goto err_disable_clocks;
> >  	}
> >  
> > +	pm_runtime_set_active(dev);
> > +	ret = devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		goto err_disable_clocks;
> > +	/*
> > +	 * Prevent runtime pm from being ON by default. Users can enable
> > +	 * it using power/control in sysfs.
> 
> That is what this call do, please describe why it's done instead.

Will drop, as mentioned above.

> 
> Regards,
> Bjorn
> 
> > +	 */
> > +	pm_runtime_forbid(dev);
> > +
> > +	dev_set_drvdata(dev, edp);
> >  	phy_set_drvdata(edp->phy, edp);
> >  
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > -	return PTR_ERR_OR_ZERO(phy_provider);
> > +	if (IS_ERR(phy_provider))
> > +		goto err_disable_clocks;
> > +
> > +	return 0;
> > +
> > +err_disable_clocks:
> > +	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> > +
> > +err_disable_regulators:
> > +	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct of_device_id qcom_edp_phy_match_table[] = {
> > @@ -1117,10 +1160,16 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
> >  
> > +static const struct dev_pm_ops qcom_edp_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(qcom_edp_runtime_suspend,
> > +			   qcom_edp_runtime_resume, NULL)
> > +};
> > +
> >  static struct platform_driver qcom_edp_phy_driver = {
> >  	.probe		= qcom_edp_phy_probe,
> >  	.driver = {
> >  		.name	= "qcom-edp-phy",
> > +		.pm	= &qcom_edp_pm_ops,
> >  		.of_match_table = qcom_edp_phy_match_table,
> >  	},
> >  };
> > 
> > ---
> > base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> > change-id: 20240907-phy-qcom-edp-enable-runtime-pm-6fad07af8947
> > 
> > Best regards,
> > -- 
> > Abel Vesa <abel.vesa@linaro.org>
> > 
> > 

