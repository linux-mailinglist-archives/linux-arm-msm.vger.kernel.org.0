Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C8A44E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfFMVhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:37:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43058 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbfFMVhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:37:15 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so56139pfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EAfKH7tAM4h0aru1Fkunlu52rVOc+t3kkhQ9nawBZuU=;
        b=yO6RPOYok9+8prOAUMzsdIICPq7pwtF3PF6YGWn7nAPZew6iXGkuCyc9KcPLIs2s9M
         sWzt5Ndx1XTL2BnZSjpvrEHl3HYdZchbUAojn2u41aK/v0gzZ595k8LZnGxeDoACgajn
         IlFkEEdRIvmTsytxtzUdnNEJRi/jkgXZG4VKvxDmsadiVeNgKs/2F3y5nt5MZj8lWYbw
         ibDjadP40QmSKBKlTzGyrMFn06HFOtE3H7UwySkWj7y9tsIQUPWBmMluPUTZ/ilkqClY
         Z9lm5z3+YV4i5q793gaLEIUFGVAsTbEteERoiizmooFrEi/6AnXFbPXkYKzTLLALEu8V
         iBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EAfKH7tAM4h0aru1Fkunlu52rVOc+t3kkhQ9nawBZuU=;
        b=co/9BdR+J5rBeEUYqOAXy+IL2BqeB2fpF/4jbc6GNqBzdBtJSmzeHXve7GzpptKdcw
         XL4lrf3qSsGFfald7cUXdXUsTcyIKdyssCLWXTQXqaP6vW2XXAILBVntZ/2ZVDYRIAxX
         jLR8Cf3RoimpJV/kxp0Hob6qGHoATDQ4OBKvReTASxwT19ezwYCssBtGLh2ZJqDlj2L4
         Ynh35s5VvYY8DE76Pi57eETABuWT/pALg5VdDdJXl4PX2kUyjyIUExX4e+9gR1vu/meW
         Ov08JX/WWu9CNoKKtnrM+YR2nR0zIrnpviWr2KROXFqxgpasK7C2TwprNEVkpXYCyMOq
         h60g==
X-Gm-Message-State: APjAAAUptVkznJZ0M3oBKxPz4JSDQEK1KwF2VW7WCxg43b9EP+P8zNq3
        pUASdEURSO0bZ6/wRA5Bm4VQxw==
X-Google-Smtp-Source: APXvYqwVJrm8wq9NauWWZNXRHPMjbKG1CK8c7otj3AYjTyKnPtpiwAXInA4lwkZ3dIRbH5Z8Zc+n/A==
X-Received: by 2002:a63:1f48:: with SMTP id q8mr15348249pgm.417.1560461834228;
        Thu, 13 Jun 2019 14:37:14 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d6sm663267pjo.32.2019.06.13.14.37.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 14:37:13 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:37:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v4 7/7] regulator: qcom_spmi: add PMS405 SPMI regulator
Message-ID: <20190613213711.GD4814@minitux>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
 <20190613212707.5966-2-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613212707.5966-2-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 14:27 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> 
> The PMS405 has 5 HFSMPS and 13 LDO regulators,
> 
> This commit adds support for one of the 5 HFSMPS regulators (s3) to
> the spmi regulator driver.
> 
> The PMIC HFSMPS 430 regulators have 8 mV step size and a voltage
> control scheme consisting of two  8-bit registers defining a 16-bit
> voltage set point in units of millivolts
> 
> S3 controls the cpu voltages (s3 is a buck regulator of type HFS430);
> it is therefore required so we can enable voltage scaling for safely
> running cpufreq.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom_spmi-regulator.c | 43 +++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index c8791b036c53..debe4dc74d27 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -105,6 +105,7 @@ enum spmi_regulator_logical_type {
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
>  	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
> +	SPMI_REGULATOR_LOGICAL_TYPE_HFS430,
>  };
>  
>  enum spmi_regulator_type {
> @@ -157,6 +158,7 @@ enum spmi_regulator_subtype {
>  	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2	= 0x0e,
>  	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL3	= 0x0f,
>  	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL4	= 0x10,
> +	SPMI_REGULATOR_SUBTYPE_HFS430		= 0x0a,
>  };
>  
>  enum spmi_common_regulator_registers {
> @@ -302,6 +304,8 @@ enum spmi_common_control_register_index {
>  /* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
>  #define SPMI_FTSMPS426_CLOCK_RATE		4800
>  
> +#define SPMI_HFS430_CLOCK_RATE			1600
> +
>  /* Minimum voltage stepper delay for each step. */
>  #define SPMI_FTSMPS426_STEP_DELAY		2
>  
> @@ -515,6 +519,10 @@ static struct spmi_voltage_range ult_pldo_ranges[] = {
>  	SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
>  };
>  
> +static struct spmi_voltage_range hfs430_ranges[] = {
> +	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
> +};
> +
>  static DEFINE_SPMI_SET_POINTS(pldo);
>  static DEFINE_SPMI_SET_POINTS(nldo1);
>  static DEFINE_SPMI_SET_POINTS(nldo2);
> @@ -530,6 +538,7 @@ static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
>  static DEFINE_SPMI_SET_POINTS(ult_ho_smps);
>  static DEFINE_SPMI_SET_POINTS(ult_nldo);
>  static DEFINE_SPMI_SET_POINTS(ult_pldo);
> +static DEFINE_SPMI_SET_POINTS(hfs430);
>  
>  static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
>  				 int len)
> @@ -1399,12 +1408,26 @@ static struct regulator_ops spmi_ftsmps426_ops = {
>  	.set_pull_down		= spmi_regulator_common_set_pull_down,
>  };
>  
> +static struct regulator_ops spmi_hfs430_ops = {
> +	.enable			= regulator_enable_regmap,
> +	.disable		= regulator_disable_regmap,
> +	.is_enabled		= regulator_is_enabled_regmap,
> +	.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
> +	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
> +	.get_voltage		= spmi_regulator_ftsmps426_get_voltage,
> +	.map_voltage		= spmi_regulator_single_map_voltage,
> +	.list_voltage		= spmi_regulator_common_list_voltage,
> +	.set_mode		= spmi_regulator_ftsmps426_set_mode,
> +	.get_mode		= spmi_regulator_ftsmps426_get_mode,
> +};
> +
>  /* Maximum possible digital major revision value */
>  #define INF 0xFF
>  
>  static const struct spmi_regulator_mapping supported_regulators[] = {
>  	/*           type subtype dig_min dig_max ltype ops setpoints hpm_min */
>  	SPMI_VREG(BUCK,  GP_CTL,   0, INF, SMPS,   smps,   smps,   100000),
> +	SPMI_VREG(BUCK,  HFS430,   0, INF, HFS430, hfs430, hfs430,  10000),
>  	SPMI_VREG(LDO,   N300,     0, INF, LDO,    ldo,    nldo1,   10000),
>  	SPMI_VREG(LDO,   N600,     0,   0, LDO,    ldo,    nldo2,   10000),
>  	SPMI_VREG(LDO,   N1200,    0,   0, LDO,    ldo,    nldo2,   10000),
> @@ -1572,7 +1595,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
>  	return ret;
>  }
>  
> -static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
> +static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
> +						   int clock_rate)
>  {
>  	int ret;
>  	u8 reg = 0;
> @@ -1589,7 +1613,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
>  	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
>  
>  	/* slew_rate has units of uV/us */
> -	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
> +	slew_rate = clock_rate * range->step_uV;
>  	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
>  	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
>  	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
> @@ -1741,7 +1765,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
>  			return ret;
>  		break;
>  	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
> -		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
> +		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
> +						SPMI_FTSMPS426_CLOCK_RATE);
> +		if (ret)
> +			return ret;
> +		break;
> +	case SPMI_REGULATOR_LOGICAL_TYPE_HFS430:
> +		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
> +							SPMI_HFS430_CLOCK_RATE);
>  		if (ret)
>  			return ret;
>  		break;
> @@ -1909,6 +1940,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
>  	{ }
>  };
>  
> +static const struct spmi_regulator_data pms405_regulators[] = {
> +	{ "s3", 0x1a00, "vdd_s3"},
> +	{ }
> +};
> +
>  static const struct of_device_id qcom_spmi_regulator_match[] = {
>  	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
>  	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
> @@ -1916,6 +1952,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
>  	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
>  	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
>  	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
> +	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
> -- 
> 2.17.1
> 
