Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F313E5189
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 05:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbhHJDhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 23:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhHJDhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 23:37:20 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A09BC061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 20:36:59 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id y18so26932765oiv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 20:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eTjxoRBCQf02cbggSfOkoEwcbBOIkEA4E5gk33oPnVc=;
        b=HI+OeeQMtFnPj3845sY6EwA1BoQN7PnMqX4s0kBeaQEy962s9e+m/V8O1/tsu5xs1I
         bddJOLO4l8wk5180sqxqoxp62aRFAM2baGVKrC4P/y3KRBVhjdJRsymDBL+60PrfM4Ja
         mZIbL1Hu1/uDpQ5c/qYcIY5bH3moOyO6Eyg7LR2+0Jzww+2RQTzDxHIXLs0JFhhYGXUo
         FxdLENJvCsVPWKnMc6mS+kE8iycdYnVrPjbprWb54i23OVLalKrDeRipM776pBngwAQI
         5BhyJuiinLxKB70SapQTYKjtAFtKvneJrzJ2kIVAnoqeKEAFIixrGJ8oewiMS+7WHN6f
         DNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eTjxoRBCQf02cbggSfOkoEwcbBOIkEA4E5gk33oPnVc=;
        b=D6rE+DoF17QoXt2UMBef2DtMg5pIkKhuFzJaT2OYvSEF5KVzcHPAN9OVT+oP08+etQ
         ZtRzJSyA22W23fszE7HGJ+iLrgQmYCQ6bhn4zDtl3fhX7qaLucaW/S5BnJjlkQO/Tlgy
         9DCClbHqDNn7FkU+jWfYlUuwtR+yI8vPqH4oKx+94kCoeM4FMm4D8fl5LCIGS79cU7DK
         iO8NpOYBMJ/R54j7qGdG5cISpGY3Nx7PBLPFUvSylmTcZoZloqP25gMr95rBoHubtpF/
         BZNJ/V7RsK6iJTytMAkXpKSeBl/blLu61Vm5hEJbyf6qm2FHkmFSGeaum7mY3pDnXxBI
         Oo2Q==
X-Gm-Message-State: AOAM533hb7YGxY24yMt0ZmrwwJHX5ZerGpiLbBgSmsecjuD/cRiW276F
        4YxWH5Hs4fPwZUwFGgNcABa/IA==
X-Google-Smtp-Source: ABdhPJwKehZHzcNRMXQY8NdGSws5hczPtVMVLb1J3K4obntfjmhpHUTzFkDBPgDMATv7wErZVOd5Jg==
X-Received: by 2002:a05:6808:4a:: with SMTP id v10mr11504245oic.171.1628566618843;
        Mon, 09 Aug 2021 20:36:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n67sm3466362oib.44.2021.08.09.20.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 20:36:58 -0700 (PDT)
Date:   Mon, 9 Aug 2021 22:36:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sbillaka@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
Message-ID: <YRH0WFvWmemHIHqc@builder.lan>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org>
 <20210511041930.592483-2-bjorn.andersson@linaro.org>
 <7708925ad4d973b4e5f291cdcbdbe406@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7708925ad4d973b4e5f291cdcbdbe406@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Aug 22:15 CDT 2021, sbillaka@codeaurora.org wrote:
> On 2021-05-11 09:49, Bjorn Andersson wrote:
> > diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c
[..]
> > +#define DP_PHY_AUX_CFG0				0x0020
> > +#define DP_PHY_AUX_CFG1				0x0024
> > +#define DP_PHY_AUX_CFG2				0x0028
> > +#define DP_PHY_AUX_CFG3				0x002c
> > +#define DP_PHY_AUX_CFG4				0x0030
> > +#define DP_PHY_AUX_CFG5				0x0034
> > +#define DP_PHY_AUX_CFG6				0x0038
> > +#define DP_PHY_AUX_CFG7				0x003c
> > +#define DP_PHY_AUX_CFG8				0x0040
> > +#define DP_PHY_AUX_CFG9				0x0044
> 
> The DP_PHY_AUX_CFG0 offset for sc8180x eDP phy is 0x0024.
> Some of the eDP PHY offset addresses are shifted by 4 address locations,
> compared to the DP QMP PHY offset addresses for sc8180x.
> The DP_PHY_AUX_CFG* offsets for this eDP phy driver are as below:
> 
> #define DP_PHY_AUX_CFG0                         0x0024
> #define DP_PHY_AUX_CFG1                         0x0028
> #define DP_PHY_AUX_CFG2                         0x002c
> #define DP_PHY_AUX_CFG3                         0x0030
> #define DP_PHY_AUX_CFG4                         0x0034
> #define DP_PHY_AUX_CFG5                         0x0038
> #define DP_PHY_AUX_CFG6                         0x003c
> #define DP_PHY_AUX_CFG7                         0x0040
> #define DP_PHY_AUX_CFG8                         0x0044
> #define DP_PHY_AUX_CFG9                         0x0048
> 

I noticed this as well. During development I just used the numbers
directly in the code and I must have screwed up as I replaced them with
defined - and somehow missed this in the testing before posting.

Sorry about that.

[..]
> > +static int qcom_edp_phy_init(struct phy *phy)
> > +{
> > +	struct qcom_edp *edp = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> > +	if (ret)
> > +		goto out_disable_supplies;
> 
> I think the number of clk and regulator resources can vary based on
> platform.
> 

If that's the case we should replace the ARRAY_SIZE() with an integer.
But I prefer to wait with that until the number actually is variable.

[..]
> > +static int qcom_edp_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev = &pdev->dev;
> > +	struct qcom_edp *edp;
> > +	int ret;
> > +
> > +	edp = devm_kzalloc(dev, sizeof(*edp), GFP_KERNEL);
> > +	if (!edp)
> > +		return -ENOMEM;
> > +
> > +	edp->dev = dev;
> > +
> > +	edp->edp = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(edp->edp))
> > +		return PTR_ERR(edp->edp);
> > +
> > +	edp->tx0 = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(edp->tx0))
> > +		return PTR_ERR(edp->tx0);
> > +
> > +	edp->tx1 = devm_platform_ioremap_resource(pdev, 2);
> > +	if (IS_ERR(edp->tx1))
> > +		return PTR_ERR(edp->tx1);
> > +
> > +	edp->pll = devm_platform_ioremap_resource(pdev, 3);
> > +	if (IS_ERR(edp->pll))
> > +		return PTR_ERR(edp->pll);
> > +
> > +	edp->clks[0].id = "aux";
> > +	edp->clks[1].id = "cfg_ahb";
> > +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	edp->supplies[0].supply = "vdda-phy";
> > +	edp->supplies[1].supply = "vdda-pll";
> > +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies),
> > edp->supplies);
> > +	if (ret)
> > +		return ret;
> 
> I believe, the combination of the number of regulator and clk resources may
> vary based on the platform.
> I think we should not fail probe if all these resources are not present in
> the device tree file.
> I think, these resources can be optional. We can get these resources if they
> are present in the device tree file and enable them as required.
> 

It's quite helpful to the DTS writer to actually encode in the driver
which resources the driver expects and provide useful error messages
when these expectations aren't met - so I think in line with most other
drivers this should be decided based on the compatible.

What clocks and regulators do you have on sc7280?


Thanks for the feedback, I see that I have a few more pieces of feedback
from others that I need to incorporate. I'll make sure to do that and
repost this patch shortly.

Regards,
Bjorn
