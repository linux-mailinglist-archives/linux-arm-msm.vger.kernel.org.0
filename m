Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A34343B06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbfFMPZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:25:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37968 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732931AbfFMPZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:25:22 -0400
Received: by mail-pf1-f194.google.com with SMTP id a186so12056799pfa.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1l+mlQKavcUarVEpPnOPtdAlkYZp032eTcvrbr+7PcU=;
        b=oyyTmmVLNcdXiYRgJuvDjaFmohkymY9IZxl/dz0JtYt1SyU+hS7kqWKKjTLRKpv/sL
         Xc1Gv0WFm/yF6RsqhWTkI7Mm8rxkEBdzlbQkQk+bTyO5K6PBUZTrm1BjJZ1f7Eym4ODV
         LTG2cFipgMSNZTFmFvL3HTxlTg6stkENzr5031Vt/gDKaozyDanCBeI0xTJ/4XScE5qG
         qLEFS4Nunc0QE+bIo167Ch6165xGMShIN0pDLxqnYhtrot1O/K0NK6U6XAQVDbYZiJ/o
         q218z9hg1rjvtpyhTHb8hgmNuct8dVq2gKB8l3dsvGJeD0Vg3t0rYVBmBJaNi33XAkn1
         YPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1l+mlQKavcUarVEpPnOPtdAlkYZp032eTcvrbr+7PcU=;
        b=j5NBSVXr2nIdN22/v7wipCiAcVVNd86JJxXHsBB9PgYMlez/xFKNOBKHvOQ5aPsoKn
         U3qmwktpG067i2Xw2rr6FBr0Jd2UXqNNAHVY8gTyNRCrbzlw1aKYtzCPJsduipeNMvjo
         Hpp8WRjK/ljsG3gECIlUDyGCt+/YtAxV2bqrbWqXsOtZ6MhniApGVupeixU02yEw/OaX
         vmEhkJm0i7iG8nquAGZLZuCyK507839W6LX5XjJohnTX/+qr0lPExWmPYoyiOzWpiYJo
         JaS+CNIuI9Iu6lMsHYrpfFvcYHgEGVDRY7a/c/EZr09J8XrLahWZEGRgQorbkSdk7qXG
         jnMA==
X-Gm-Message-State: APjAAAXOcEh8KvjIjIXKMMDsL8BrcrUUihbIDog0+WnhDBaNjbfoIoob
        0MK8IPh/VJNCvq9o0o+5hNVf4w==
X-Google-Smtp-Source: APXvYqy/hd5IZGIW+xKrGr1+v92aXYQfBgKI8TtNGZuZbGTQbRMdJGovoY2XjizQ0HdUuaZwjXXr5Q==
X-Received: by 2002:a62:5387:: with SMTP id h129mr96255380pfb.6.1560439522048;
        Thu, 13 Jun 2019 08:25:22 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h12sm396229pje.12.2019.06.13.08.25.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:25:21 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:25:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190613152519.GD6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142334.8882-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613142334.8882-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 07:23 PDT 2019, Jeffrey Hugo wrote:

> The PM8005 is used on the msm8998 MTP.  The S1 regulator is VDD_GFX, ie
> it needs to be on and controlled inorder to use the GPU.  Add support to
> drive the PM8005 regulators so that we can bring up the GPU on msm8998.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 169 ++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 1c18fe5969b5..c7880c1d4bcd 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -104,6 +104,7 @@ enum spmi_regulator_logical_type {
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LO_SMPS,
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
> +	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
>  };
>  
>  enum spmi_regulator_type {
> @@ -150,6 +151,7 @@ enum spmi_regulator_subtype {
>  	SPMI_REGULATOR_SUBTYPE_5V_BOOST		= 0x01,
>  	SPMI_REGULATOR_SUBTYPE_FTS_CTL		= 0x08,
>  	SPMI_REGULATOR_SUBTYPE_FTS2p5_CTL	= 0x09,
> +	SPMI_REGULATOR_SUBTYPE_FTS426_CTL	= 0x0a,
>  	SPMI_REGULATOR_SUBTYPE_BB_2A		= 0x01,
>  	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL1	= 0x0d,
>  	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2	= 0x0e,
> @@ -170,6 +172,18 @@ enum spmi_common_regulator_registers {
>  	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
>  };
>  
> +/*
> + * Second common register layout used by newer devices starting with ftsmps426
> + * Note that some of the registers from the first common layout remain
> + * unchanged and their definition is not duplicated.
> + */
> +enum spmi_ftsmps426_regulator_registers {
> +	SPMI_FTSMPS426_REG_VOLTAGE_LSB		= 0x40,
> +	SPMI_FTSMPS426_REG_VOLTAGE_MSB		= 0x41,
> +	SPMI_FTSMPS426_REG_VOLTAGE_ULS_LSB	= 0x68,
> +	SPMI_FTSMPS426_REG_VOLTAGE_ULS_MSB	= 0x69,
> +};
> +
>  enum spmi_vs_registers {
>  	SPMI_VS_REG_OCP				= 0x4a,
>  	SPMI_VS_REG_SOFT_START			= 0x4c,
> @@ -229,6 +243,14 @@ enum spmi_common_control_register_index {
>  #define SPMI_COMMON_MODE_FOLLOW_HW_EN0_MASK	0x01
>  #define SPMI_COMMON_MODE_FOLLOW_ALL_MASK	0x1f
>  
> +#define SPMI_FTSMPS426_MODE_BYPASS_MASK		3
> +#define SPMI_FTSMPS426_MODE_RETENTION_MASK	4
> +#define SPMI_FTSMPS426_MODE_LPM_MASK		5
> +#define SPMI_FTSMPS426_MODE_AUTO_MASK		6
> +#define SPMI_FTSMPS426_MODE_HPM_MASK		7
> +
> +#define SPMI_FTSMPS426_MODE_MASK		0x07
> +
>  /* Common regulator pull down control register layout */
>  #define SPMI_COMMON_PULL_DOWN_ENABLE_MASK	0x80
>  
> @@ -274,6 +296,23 @@ enum spmi_common_control_register_index {
>  #define SPMI_FTSMPS_STEP_MARGIN_NUM	4
>  #define SPMI_FTSMPS_STEP_MARGIN_DEN	5
>  
> +#define SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK	0x03
> +#define SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT	0
> +
> +/* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
> +#define SPMI_FTSMPS426_CLOCK_RATE		4800
> +
> +/* Minimum voltage stepper delay for each step. */
> +#define SPMI_FTSMPS426_STEP_DELAY		2
> +
> +/*
> + * The ratio SPMI_FTSMPS426_STEP_MARGIN_NUM/SPMI_FTSMPS426_STEP_MARGIN_DEN is
> + * used to adjust the step rate in order to account for oscillator variance.
> + */
> +#define SPMI_FTSMPS426_STEP_MARGIN_NUM	10
> +#define SPMI_FTSMPS426_STEP_MARGIN_DEN	11
> +
> +
>  /* VSET value to decide the range of ULT SMPS */
>  #define ULT_SMPS_RANGE_SPLIT 0x60
>  
> @@ -447,6 +486,10 @@ static struct spmi_voltage_range ftsmps2p5_ranges[] = {
>  	SPMI_VOLTAGE_RANGE(1,  160000, 1360000, 2200000, 2200000, 10000),
>  };
>  
> +static struct spmi_voltage_range ftsmps426_ranges[] = {
> +	SPMI_VOLTAGE_RANGE(0,       0,  320000, 1352000, 1352000,  4000),
> +};
> +
>  static struct spmi_voltage_range boost_ranges[] = {
>  	SPMI_VOLTAGE_RANGE(0, 4000000, 4000000, 5550000, 5550000, 50000),
>  };
> @@ -480,6 +523,7 @@ static DEFINE_SPMI_SET_POINTS(ln_ldo);
>  static DEFINE_SPMI_SET_POINTS(smps);
>  static DEFINE_SPMI_SET_POINTS(ftsmps);
>  static DEFINE_SPMI_SET_POINTS(ftsmps2p5);
> +static DEFINE_SPMI_SET_POINTS(ftsmps426);
>  static DEFINE_SPMI_SET_POINTS(boost);
>  static DEFINE_SPMI_SET_POINTS(boost_byp);
>  static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
> @@ -747,6 +791,23 @@ spmi_regulator_common_set_voltage(struct regulator_dev *rdev, unsigned selector)
>  	return spmi_vreg_write(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, buf, 2);
>  }
>  
> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> +					      unsigned selector);
> +
> +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +	int mV;
> +
> +	mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> +
> +	buf[0] = mV & 0xff;
> +	buf[1] = mV >> 8;
> +	return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +}
> +
>  static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
>  		unsigned int old_selector, unsigned int new_selector)
>  {
> @@ -778,6 +839,16 @@ static int spmi_regulator_common_get_voltage(struct regulator_dev *rdev)
>  	return spmi_hw_selector_to_sw(vreg, voltage_sel, range);
>  }
>  
> +static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +
> +	spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> +
> +	return (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
> +}
> +
>  static int spmi_regulator_single_map_voltage(struct regulator_dev *rdev,
>  		int min_uV, int max_uV)
>  {
> @@ -921,6 +992,23 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
>  	}
>  }
>  
> +static unsigned int spmi_regulator_ftsmps426_get_mode(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 reg;
> +
> +	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
> +
> +	switch (reg) {
> +	case SPMI_FTSMPS426_MODE_HPM_MASK:
> +		return REGULATOR_MODE_NORMAL;
> +	case SPMI_FTSMPS426_MODE_AUTO_MASK:
> +		return REGULATOR_MODE_FAST;
> +	default:
> +		return REGULATOR_MODE_IDLE;
> +	}
> +}
> +
>  static int
>  spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  {
> @@ -943,6 +1031,28 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
>  }
>  
> +static int
> +spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_FTSMPS426_MODE_MASK;
> +	u8 val;
> +
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
> +		val = SPMI_FTSMPS426_MODE_HPM_MASK;
> +		break;
> +	case REGULATOR_MODE_FAST:
> +		val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> +		break;
> +	default:
> +		val = SPMI_FTSMPS426_MODE_LPM_MASK;
> +		break;
> +	}
> +
> +	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
> +}
> +
>  static int
>  spmi_regulator_common_set_load(struct regulator_dev *rdev, int load_uA)
>  {
> @@ -1272,6 +1382,21 @@ static struct regulator_ops spmi_ult_ldo_ops = {
>  	.set_soft_start		= spmi_regulator_common_set_soft_start,
>  };
>  
> +static struct regulator_ops spmi_ftsmps426_ops = {
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
> +	.set_load		= spmi_regulator_common_set_load,
> +	.set_pull_down		= spmi_regulator_common_set_pull_down,
> +};
> +
>  /* Maximum possible digital major revision value */
>  #define INF 0xFF
>  
> @@ -1307,6 +1432,7 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
>  	SPMI_VREG(BOOST, 5V_BOOST, 0, INF, BOOST,  boost,  boost,       0),
>  	SPMI_VREG(FTS,   FTS_CTL,  0, INF, FTSMPS, ftsmps, ftsmps, 100000),
>  	SPMI_VREG(FTS, FTS2p5_CTL, 0, INF, FTSMPS, ftsmps, ftsmps2p5, 100000),
> +	SPMI_VREG(FTS, FTS426_CTL, 0, INF, FTSMPS426, ftsmps426, ftsmps426, 100000),
>  	SPMI_VREG(BOOST_BYP, BB_2A, 0, INF, BOOST_BYP, boost, boost_byp, 0),
>  	SPMI_VREG(ULT_BUCK, ULT_HF_CTL1, 0, INF, ULT_LO_SMPS, ult_lo_smps,
>  						ult_lo_smps,   100000),
> @@ -1444,6 +1570,34 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
>  	return ret;
>  }
>  
> +static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
> +{
> +	int ret;
> +	u8 reg = 0;
> +	int delay, slew_rate;
> +	const struct spmi_voltage_range *range = &vreg->set_points->range[0];
> +
> +	ret = spmi_vreg_read(vreg, SPMI_COMMON_REG_STEP_CTRL, &reg, 1);
> +	if (ret) {
> +		dev_err(vreg->dev, "spmi read failed, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	delay = reg & SPMI_FTSMPS426_STEP_CTRL_DELAY_MASK;
> +	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
> +
> +	/* slew_rate has units of uV/us */
> +	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
> +	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
> +	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
> +	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
> +
> +	/* Ensure that the slew rate is greater than 0 */
> +	vreg->slew_rate = max(slew_rate, 1);
> +
> +	return ret;
> +}
> +
>  static int spmi_regulator_init_registers(struct spmi_regulator *vreg,
>  				const struct spmi_regulator_init_data *data)
>  {
> @@ -1583,6 +1737,12 @@ static int spmi_regulator_of_parse(struct device_node *node,
>  		ret = spmi_regulator_init_slew_rate(vreg);
>  		if (ret)
>  			return ret;
> +		break;
> +	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
> +		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
> +		if (ret)
> +			return ret;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -1739,7 +1899,16 @@ static const struct spmi_regulator_data pmi8994_regulators[] = {
>  	{ }
>  };
>  
> +static const struct spmi_regulator_data pm8005_regulators[] = {
> +	{ "s1", 0x1400, "vdd_s1", },
> +	{ "s2", 0x1700, "vdd_s2", },
> +	{ "s3", 0x1a00, "vdd_s3", },
> +	{ "s4", 0x1d00, "vdd_s4", },
> +	{ }
> +};
> +
>  static const struct of_device_id qcom_spmi_regulator_match[] = {
> +	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
>  	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
>  	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
>  	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
> -- 
> 2.17.1
> 
