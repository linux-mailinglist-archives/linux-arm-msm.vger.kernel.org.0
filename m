Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679C02C5AB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 18:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404169AbgKZRfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 12:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403842AbgKZRfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 12:35:51 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CC4C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:35:51 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id o25so3033824oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jXRWgBkcCar10/HFUqu1XeMHw3BU4LMAJKWRFNlNPJE=;
        b=QYWwF5bQ19HsdP7eN+nzWMeKGdRMZ3nIg9cIX6eqkbtKmoz2PQAsEItEuiAUJhFsj6
         l3zsaj0YijlFdsXCTBsEkMuF0gn8RzcqGWxdicredRcBkcw208wBGKUJs1FUxw2FlmVb
         6kJbVbWfmiFGSXJoRIGUa8pg+8qijHknZnK/xFLmLmAF124BJDw4pqVUKAiGuakO1xAg
         5nKp6JHowbL2FjPd0/xso6d4mdZVDqOxS9N3ZMqMJnHZCZ9htFsrZ+Er3/oZjMUdx6lg
         yQTEpxcmaNC3nfW0h5otmoa7rgumvizs+Y/JoRn5AF8J1D3e8UaIkaTsZMRM8ORLW3Vh
         a5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jXRWgBkcCar10/HFUqu1XeMHw3BU4LMAJKWRFNlNPJE=;
        b=Dtl4NUfHs5K+Np+ShCJ3ZaVDcFMn51+yjCb2qeBu8z6r1ndBophbTUXLKp3iv9LEFf
         KYXqDH6+HwOqp+3smy578j9P7PyviCnCwaL5S2NqfQAKiMBDs6TztAH1zQSGTDGuQ1gX
         y8HFfWGEsIBlG/FX9tcmJMNKQzUUdL1CX5F+dkuM0BWSb4eON70EMuOXR7Ep9jSgbLi8
         IaROYIJ6L/COIewf/u9/RfUqdIee+bWsYw2NgccJdJ/XvHOxSLRPnKjXAoNPuNvkyGvJ
         R6ivmqFgEfCqxyHWfvNo0AWUWEzbecGGNwTtvTJxaC50Q8PUzdwmplTAeYn2gHuYOUD6
         coYA==
X-Gm-Message-State: AOAM532MunJ3gzi1fCPf9B3/MaWKl+t0+eJMt9DXFMm9J09FaxMOvvZ8
        BUJXBzTfrROQA0oYTiiJ++NL47zghNAkxQ==
X-Google-Smtp-Source: ABdhPJxX5a371w/DpR/MK/IFWBYEx1W6uSAqDhguLOSgJP4+ra58Jl9NPbHyu8Acw++1zzIsQ8cO5Q==
X-Received: by 2002:aca:38c6:: with SMTP id f189mr2676928oia.61.1606412150567;
        Thu, 26 Nov 2020 09:35:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 11sm3206406oty.65.2020.11.26.09.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:35:49 -0800 (PST)
Date:   Thu, 26 Nov 2020 11:35:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for SDX55
Message-ID: <X7/ndJsUbRkdmQPq@builder.lan>
References: <20201126093018.1085594-1-vkoul@kernel.org>
 <20201126093018.1085594-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126093018.1085594-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Nov 03:30 CST 2020, Vinod Koul wrote:

> Add support from RPMH regulators found in SDX55 platform
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 31 +++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index d488325499a9..e673d48b31a1 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -930,6 +930,33 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
>  	{},
>  };
>  
> +static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
> +	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps510, "vdd-s1"),
> +	RPMH_VREG("smps2",   "smp%s2",    &pmic5_hfsmps510, "vdd-s2"),
> +	RPMH_VREG("smps3",   "smp%s3",    &pmic5_hfsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",   "smp%s4",    &pmic5_hfsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",   "smp%s5",    &pmic5_hfsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps510, "vdd-s6"),
> +	RPMH_VREG("smps7",   "smp%s7",    &pmic5_hfsmps510, "vdd-s7"),
> +	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo,      "vdd-l1-l2"),
> +	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo,      "vdd-l1-l2"),
> +	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo,      "vdd-l3-l9"),
> +	RPMH_VREG("ldo4",    "ldo%s4",    &pmic5_nldo,      "vdd-l4-l12"),
> +	RPMH_VREG("ldo5",    "ldo%s5",    &pmic5_pldo,      "vdd-l5-l6"),
> +	RPMH_VREG("ldo6",    "ldo%s6",    &pmic5_pldo,      "vdd-l5-l6"),
> +	RPMH_VREG("ldo7",    "ldo%s7",    &pmic5_nldo,      "vdd-l7-l8"),
> +	RPMH_VREG("ldo8",    "ldo%s8",    &pmic5_nldo,      "vdd-l7-l8"),
> +	RPMH_VREG("ldo9",    "ldo%s9",    &pmic5_nldo,      "vdd-l3-l9"),
> +	RPMH_VREG("ldo10",   "ldo%s10",   &pmic5_pldo,      "vdd-l10-l11-l13"),
> +	RPMH_VREG("ldo11",   "ldo%s11",   &pmic5_pldo,      "vdd-l10-l11-l13"),
> +	RPMH_VREG("ldo12",   "ldo%s12",   &pmic5_nldo,      "vdd-l4-l12"),
> +	RPMH_VREG("ldo13",   "ldo%s13",   &pmic5_pldo,      "vdd-l10-l11-l13"),
> +	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
> +	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
> +	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
> +	{},
> +};
> +
>  static int rpmh_regulator_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1000,6 +1027,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
>  		.compatible = "qcom,pm6150l-rpmh-regulators",
>  		.data = pm6150l_vreg_data,
>  	},
> +	{
> +		.compatible = "qcom,pmx55-rpmh-regulators",
> +		.data = pmx55_vreg_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
> -- 
> 2.26.2
> 
