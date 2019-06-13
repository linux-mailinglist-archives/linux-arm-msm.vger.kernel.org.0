Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF20A43BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731815AbfFMPdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:33:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43831 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfFMPdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:33:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so11157605pgv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7C1f1C5uhHgrsCyslhIHxZEDisNbcyzQwjds3pYprRw=;
        b=N7sbRlvDX4SDO0+K68ItEnXY8fSYiXCSdNUVA+g9o87sdLJRL+xldFdZ3LctZFLO/9
         47vQYKlqGpknu37lJnhmLR38SUFk2uCG7Ps5L/Q5aCtNeMZczF+LVPKKPDbW8VaeL7WI
         CZtN6dN09nfE6hSRbkEzbIv9Xts6tolEHB6biiE/P463ykfCrMw99cdLHSs5Pv6Zgrnm
         OdoqqlAkgHd0Nz5cwRyl3M+81Szrrqxn6cRe+Y1g0ke1swc/KpTVLF3qrcnHGPgv0B+B
         DoZVWM0gAsQUjHuBGO0fdY4CSffZ2oRPq2et87I3Eo5NCgcms1xPZLWNsD04qcleRH6D
         TjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7C1f1C5uhHgrsCyslhIHxZEDisNbcyzQwjds3pYprRw=;
        b=JczNNfoX8d0eYpfzqhTZHaFrFnPHYrskDP6qWLwVxa19vwj7SloFQqYc896EXDTZjI
         gQRx3AVQqvKewtlGeyaxCDbNErOQUlbf29ozrRg+6u3vZuhAXslqZTNWnZMFHpcs6xvn
         ZeFLMXX/u0rfbUD0mK1Mof/NJAcdptm+kEoh8UIQZ68OroYNioEfTbpfBY9Wg1BRNtoX
         1l6YtoZ6/4roHKsWlb48de1yBypDglMl880ZeZa0nM6OXdymKhQUtxQcm7ryCRbop1mP
         aop8ApXNhmhttNANfRkOizsiYOZGe6cnN5GRp/m5EhfhfyQNUJOFZtko3xA0i/Gv8haD
         K9Jg==
X-Gm-Message-State: APjAAAVb+E87ROXewicqtbjy37kqTdDJTCzrIdsTJCAG2+J/ryQTpSfS
        q6jVXdQzE06RBx1+QV2Xeuo1Xg==
X-Google-Smtp-Source: APXvYqyA/IMQ4v74PvaT1O81Pu4QVkZmpbfKJ38ReyWVQDkM5h8Bqq0eH6icu1+9y/fCF4fE6m2u9A==
X-Received: by 2002:a63:fc61:: with SMTP id r33mr31334396pgk.294.1560439999108;
        Thu, 13 Jun 2019 08:33:19 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l1sm170783pgj.67.2019.06.13.08.33.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:33:18 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:33:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v3 7/7] drivers: regulator: qcom: add PMS405 SPMI
 regulator
Message-ID: <20190613153316.GE6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142425.9036-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613142425.9036-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 07:24 PDT 2019, Jeffrey Hugo wrote:

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
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 41 +++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index c7880c1d4bcd..975655e787fe 100644
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
> @@ -1397,12 +1406,24 @@ static struct regulator_ops spmi_ftsmps426_ops = {
>  	.set_pull_down		= spmi_regulator_common_set_pull_down,
>  };
>  
> +static struct regulator_ops spmi_hfs430_ops = {
> +	/* always on regulators */
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
> @@ -1570,7 +1591,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
>  	return ret;
>  }
>  
> -static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
> +static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
> +						   int clock_rate)
>  {
>  	int ret;
>  	u8 reg = 0;
> @@ -1587,7 +1609,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
>  	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
>  
>  	/* slew_rate has units of uV/us */
> -	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
> +	slew_rate = clock_rate * range->step_uV;
>  	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
>  	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
>  	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
> @@ -1739,7 +1761,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
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
> @@ -1907,6 +1936,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
>  	{ }
>  };
>  
> +static const struct spmi_regulator_data pms405_regulators[] = {
> +	{ "s3", 0x1a00, }, /* supply name in the dts only */

Not sure what this comment is trying to say. The third element here
should be the string that is used to find the supply as specified in DT.
For s3 this is "vdd_s3".


So please drop the comment and make this:
	{ "s3", 0x1a00, "s3" },

Regards,
Bjorn

> +	{ }
> +};
> +
>  static const struct of_device_id qcom_spmi_regulator_match[] = {
>  	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
>  	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
> @@ -1914,6 +1948,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
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
