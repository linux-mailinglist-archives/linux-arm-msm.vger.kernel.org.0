Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D67C881D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 19:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437084AbfHIR6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 13:58:42 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45371 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfHIR6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 13:58:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so46199647pgp.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2019 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LlLA+dnG4ZkTEc41QsLV4XWz9oTQiCmZF9OkaLLzc6c=;
        b=yBV5iWeZwHmG3XrqEFbneMC8UFqPAdRFp5bRi1D3Ng/DDyL+4vO8aeQ0XuEXbVvBok
         EorDmE3icvA2OLlSgjdUrRxVs4BJhhKwKkDkRp/Ul5iP3ISoWRmxdckaSAkrpLzCqDlB
         b5sXJ8UNI09zYA3rkrkiYZOjawpa8l7sZjm6cjmRStCWXegRFbYSnjqIE042znocsP5Q
         ll8ACnWZt+e4a9WC/O3poc0r2TlpOJw/uxCuAcc+2KpHFkQQXO9FKJ6Wx6q7R7PaxaNv
         EalFxujTFbcA7wPnqD36XG2ZnP2f1iap7CILWYgWFYzEl1kFuU4C1l+2c8C62L8vjUCx
         UYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LlLA+dnG4ZkTEc41QsLV4XWz9oTQiCmZF9OkaLLzc6c=;
        b=JWtZ4TU3CBb2OeOtFpzuo/WmkrYzn5P9icJ5n5EpMXqmcdaqpet5uyb1BvDhgFxwYc
         rCtVjSJNDfpdXfEpEuzhPV3ijE6uw8baX4CHkAjil/CQoYJhI6+8/Oe1ZOXQiRdksKmc
         w0oZzoQ+wLNyGHOlIHt48lvadZ7vRHKLGSzBMHnRVh2aBNELJhx9VS6FXJ8iDOPRMGD+
         roMxB5+BwwVZdiPaDqGckpK6322JWqJ1vPrx7TIr/SXCT+ZqoNti5h2X6aK0npzMNB8P
         QeSjDV/En0+sXW1EG3njomLSxLhJxbA6eWwQI/Qr7gtBn7xyJTfi33LuRKnfImMkEfmn
         BmMQ==
X-Gm-Message-State: APjAAAW9p+LHn9ieX8kOe0grko8bHTPusCkQP+N+iuLJRjACCpGcDJX/
        k8oorJVG3+zCF9/8x5hLjtoFbgOGyuU=
X-Google-Smtp-Source: APXvYqzS3LI5n1rXpGNRltWYfpuSUy/O4jZJTAdn7Ytp39OYj2LKSWjzntJMGH0mbr0Uu5Js+GX7Ig==
X-Received: by 2002:a17:90a:8c18:: with SMTP id a24mr10337156pjo.111.1565373520745;
        Fri, 09 Aug 2019 10:58:40 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cx22sm5325658pjb.25.2019.08.09.10.58.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 10:58:40 -0700 (PDT)
Date:   Fri, 9 Aug 2019 11:00:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: Update PMIC modes for PMIC5
Message-ID: <20190809180014.GP26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
 <20190809073616.1235-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-4-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> Add the PMIC5 modes and use them pmic5 ldo and smps
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 52 +++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 391ed844a251..db6c085da65e 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -50,6 +50,20 @@ enum rpmh_regulator_type {
>  #define PMIC4_BOB_MODE_AUTO			2
>  #define PMIC4_BOB_MODE_PWM			3
>  
> +#define PMIC5_LDO_MODE_RETENTION		3
> +#define PMIC5_LDO_MODE_LPM			4
> +#define PMIC5_LDO_MODE_HPM			7
> +
> +#define PMIC5_SMPS_MODE_RETENTION		3
> +#define PMIC5_SMPS_MODE_PFM			4
> +#define PMIC5_SMPS_MODE_AUTO			6
> +#define PMIC5_SMPS_MODE_PWM			7
> +
> +#define PMIC5_BOB_MODE_PASS			2
> +#define PMIC5_BOB_MODE_PFM			4
> +#define PMIC5_BOB_MODE_AUTO			6
> +#define PMIC5_BOB_MODE_PWM			7
> +
>  /**
>   * struct rpmh_vreg_hw_data - RPMh regulator hardware configurations
>   * @regulator_type:		RPMh accelerator type used to manage this
> @@ -488,6 +502,14 @@ static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = -EINVAL,
>  };
>  
> +static const int pmic_mode_map_pmic5_ldo[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = PMIC5_LDO_MODE_RETENTION,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_LDO_MODE_LPM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_LDO_MODE_HPM,
> +	[REGULATOR_MODE_FAST]    = -EINVAL,
> +};
> +
>  static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
>  {
>  	unsigned int mode;
> @@ -518,6 +540,14 @@ static const int pmic_mode_map_pmic4_smps[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = PMIC4_SMPS_MODE_PWM,
>  };
>  
> +static const int pmic_mode_map_pmic5_smps[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = PMIC5_SMPS_MODE_RETENTION,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_SMPS_MODE_PFM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_SMPS_MODE_AUTO,
> +	[REGULATOR_MODE_FAST]    = PMIC5_SMPS_MODE_PWM,
> +};
> +
>  static unsigned int
>  rpmh_regulator_pmic4_smps_of_map_mode(unsigned int rpmh_mode)
>  {
> @@ -552,6 +582,14 @@ static const int pmic_mode_map_pmic4_bob[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = PMIC4_BOB_MODE_PWM,
>  };
>  
> +static const int pmic_mode_map_pmic5_bob[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = -EINVAL,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_BOB_MODE_PFM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_BOB_MODE_AUTO,
> +	[REGULATOR_MODE_FAST]    = PMIC5_BOB_MODE_PWM,
> +};
> +
>  static unsigned int rpmh_regulator_pmic4_bob_of_map_mode(unsigned int rpmh_mode)
>  {
>  	unsigned int mode;
> @@ -643,7 +681,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
>  	.n_voltages = 256,
>  	.hpm_min_load_uA = 10000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -653,7 +691,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo_lv = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 62, 8000),
>  	.n_voltages = 63,
>  	.hpm_min_load_uA = 10000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -663,7 +701,7 @@ static const struct rpmh_vreg_hw_data pmic5_nldo = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
>  	.n_voltages = 124,
>  	.hpm_min_load_uA = 30000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -672,7 +710,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
>  	.n_voltages = 216,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -681,7 +719,7 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 263, 4000),
>  	.n_voltages = 264,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -690,7 +728,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 1600),
>  	.n_voltages = 5,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -699,7 +737,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
>  	.ops = &rpmh_regulator_vrm_bypass_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
>  	.n_voltages = 136,
> -	.pmic_mode_map = pmic_mode_map_pmic4_bob,
> +	.pmic_mode_map = pmic_mode_map_pmic5_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
>  
> -- 
> 2.20.1
> 
