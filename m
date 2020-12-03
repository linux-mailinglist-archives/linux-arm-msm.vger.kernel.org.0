Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677EE2CE2DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgLCXqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgLCXqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:46:00 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498EDC061A51
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 15:45:20 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id h19so3564188otr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uS7KQLK0U5gabPQdDiHHbCBP4og7myvp4pgL7QMqsmk=;
        b=iQYjQ/3Cp+Bagku5Jo6rhYtUkaXeSP1S1/VBJjWvrSGgzBbeqV8ZoRpL6Olgx463EV
         kUgp+jzxr0e7t57Q63kHX3gFR8TXs8et6vPaNeS4Yvdhxm8UhCx3Mo8DDbgF3Sf6nzuD
         Yg2/ZecVWm/TEsBRws4neuIBL77pQikTa7MoMZqlCfYehCvUAAJETH+nIKVwRtR1His7
         LZL43ITgi55guLkJ0iRx5EU9/9IQDKQCJPWtid353PXHYG4ddFqiUVn8Tz6h+mI0e57H
         zbVezEHXap/vZLrXKBmEnPzmB34hVissh1U+UDNm+pfO/CgPDG3+Dt4KAAeFaPu6afRH
         Nygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uS7KQLK0U5gabPQdDiHHbCBP4og7myvp4pgL7QMqsmk=;
        b=bpkeuS+cRXPuyMLjLhYFBjhygOF+rmytzzRgm7Z+jc9hCyPi+66HodBGDica9OURcd
         keqA6pSD35JsAALdtmfNbU0qlyd8mTMYzasNfVaxPPajt0uSi+zmr/ooPY+wv13Y8IK1
         81GggCjmqP1C1uNx9GIKiut8jEZIMCJgmn4KZv8lp2oTYvLl3Q/vNqTC1fUnwIxkM/MI
         fQntTml4EocMcsezXamXfEyHcAlYO7DIHRly+9TQRxth6SRE7rC+ISAToOPWvguTzYJP
         zkoS9jaeROuQSKwNy/VrBB6jLoIHk9iO4PO5BpA8wB0ZMiMPLU5sGPTCcb+u1KLkSnkU
         05Jw==
X-Gm-Message-State: AOAM531O6iigISIzA+pK8XqitCb8aq90LI1nwxQAh7ouPbQ98Xq4Nd3E
        72Nd+5jzb/K0N8Nn5J6clbGN1w==
X-Google-Smtp-Source: ABdhPJywp8aHWzZXEymU0Z/dLtlfTIGsbKnetdQeOLD4UqK8xE0zsHXz6HBHWCdx7XcSX6tyfPNCIw==
X-Received: by 2002:a9d:5388:: with SMTP id w8mr1435765otg.311.1607039119614;
        Thu, 03 Dec 2020 15:45:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t21sm223571otr.77.2020.12.03.15.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:45:18 -0800 (PST)
Date:   Thu, 3 Dec 2020 17:45:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350/PM8350c
Message-ID: <X8l4jThf8XlRnyjy@builder.lan>
References: <20201203071244.2652297-1-vkoul@kernel.org>
 <20201203071244.2652297-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203071244.2652297-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Dec 01:12 CST 2020, Vinod Koul wrote:

> Add support from RPMH regulators found in PM8350 and PM8350c PMICs
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 62 +++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index d488325499a9..800072b90efd 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -865,6 +865,60 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
>  	{},
>  };
>  
> +static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
> +	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
> +	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
> +	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
> +	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
> +	RPMH_VREG("smps10", "smp%s10", &pmic5_hfsmps510, "vdd-s10"),
> +	RPMH_VREG("smps11", "smp%s11", &pmic5_hfsmps510, "vdd-s11"),
> +	RPMH_VREG("smps12", "smp%s12", &pmic5_hfsmps510, "vdd-s12"),
> +	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l4"),
> +	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
> +	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l5"),
> +	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l1-l4"),
> +	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l5"),
> +	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
> +	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
> +	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
> +	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
> +	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
> +	{},
> +};
> +
> +static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
> +	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
> +	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
> +	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
> +	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
> +	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
> +	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l12"),
> +	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo_lv,   "vdd-l2-l8"),
> +	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
> +	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
> +	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
> +	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l6-l9-l11"),
> +	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
> +	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l2-l8"),
> +	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l6-l9-l11"),
> +	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l10"),
> +	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l6-l9-l11"),
> +	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
> +	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
> +	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
> +	{},
> +};
> +
>  static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
>  	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
>  	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps515, "vdd-s2"),
> @@ -984,6 +1038,14 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
>  		.compatible = "qcom,pm8150l-rpmh-regulators",
>  		.data = pm8150l_vreg_data,
>  	},
> +	{
> +		.compatible = "qcom,pm8350-rpmh-regulators",
> +		.data = pm8350_vreg_data,
> +	},
> +	{
> +		.compatible = "qcom,pm8350c-rpmh-regulators",
> +		.data = pm8350c_vreg_data,
> +	},
>  	{
>  		.compatible = "qcom,pm8998-rpmh-regulators",
>  		.data = pm8998_vreg_data,
> -- 
> 2.26.2
> 
