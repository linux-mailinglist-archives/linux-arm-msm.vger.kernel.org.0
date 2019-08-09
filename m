Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EF887030
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 05:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404791AbfHIDbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 23:31:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45282 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733258AbfHIDbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 23:31:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so45248254pfq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2019 20:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8mOaONbQIagSdJ4scl2hu9XLlJCapqfCQXNLNTlJDAM=;
        b=JG5j09Ckfh88SlbgQq2fowNEBhoJu3CqiqU13VdP0+EHZrUK57Hwcpp7ncz474b2Qa
         3X2+xEEb47PsdWA+I15QkU1fyOZypORAZ85xcdXnD+6IrB9d9PprLkNkkTBUWJCr8EHb
         dj9FqWUI5C5eouktQwq24BYenAgkORnaw82YHU/gbflTRwRne+l4KWGBflTFhnEOuicO
         UYG/ToflKEoDj6WStjmu8fBgFNauOTbQnoQRrMpF/gaV4GydcD5q+ZGM9nMTmwyyvhQn
         UuZIC7V/kqUNEzcgfjODcMk6/ttR9EnVchZhr0RHk88eSn/V8eyNKhApDafcUWmfXfYw
         id3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8mOaONbQIagSdJ4scl2hu9XLlJCapqfCQXNLNTlJDAM=;
        b=VDvHmZ3otwYPyU7jMIYjxkrLuGMQNYQiFad02YiqjiybqHAmHttABL5XbD4TL1szQ+
         o9bjewXgezuspOoI+Z41pPE1N0dvzxZQNT047GcXmSru6PuQjqzCFmtAvYHmvB2uXBsM
         SbCmQ55/FkbDZzLbllN61rXJ345L8jcuXkb9e25MQXz+D26+Up2rYgksCMd0REYTKF57
         RV6t5/T35o25+Zf0wTpb5yGGtc1HPkscclA5YyWmAtrS1rGDU74f5rmrHjqpP/U7oPoX
         NL5nEW//EE5LMWq10lNfshJ7TtiZ0XAPHSYjVcGDPtmjOWjY5vKL/D1SV25YU0i+zgFA
         Hkhg==
X-Gm-Message-State: APjAAAURcmwQ20cGcTDmp2FmHvAArnECqeN3AJi9qb+tqGCNhEC5v8ZV
        gGYaDBoKySCN4bc4eEUNMIpvZA==
X-Google-Smtp-Source: APXvYqwPQLcbYoC7IQrEKTJfa5wSrqNMVp1E/hA5pk7ynvnkI3COuoNbD8Qonx0+mtzPR+dhnm9ruQ==
X-Received: by 2002:a17:90a:710c:: with SMTP id h12mr7181024pjk.36.1565321482989;
        Thu, 08 Aug 2019 20:31:22 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b6sm83794448pgq.26.2019.08.08.20.31.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 20:31:22 -0700 (PDT)
Date:   Thu, 8 Aug 2019 20:32:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for SM8150
Message-ID: <20190809033255.GL26807@tuxbook-pro>
References: <20190808093343.5600-1-vkoul@kernel.org>
 <20190808093343.5600-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808093343.5600-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
[..]
> +static const struct rpmh_vreg_hw_data pmic5_bob = {
> +	.regulator_type = VRM,
> +	.ops = &rpmh_regulator_vrm_bypass_ops,
> +	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
> +	.n_voltages = 135,

There are 136 voltages in [0,135]

> +	.pmic_mode_map = pmic_mode_map_pmic4_bob,
> +	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
> +};
> +
[..]
> @@ -755,6 +890,18 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
>  		.compatible = "qcom,pm8005-rpmh-regulators",
>  		.data = pm8005_vreg_data,
>  	},
> +	{
> +		.compatible = "qcom,pm8150-rpmh-regulators",
> +		.data = pm8150_vreg_data,
> +	},
> +	{
> +		.compatible = "qcom,pm8150l-rpmh-regulators",
> +		.data = pm8150l_vreg_data,
> +	},
> +	{
> +		.compatible = "qcom,pm8009-rpmh-regulators",
> +		.data = pm8009_vreg_data,
> +	},

Sort order...

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);

Apart from these nits this looks good.

Regards,
Bjorn
