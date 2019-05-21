Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFDC25805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 21:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbfEUTJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 15:09:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46713 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEUTJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 15:09:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id t187so9027254pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=67JYBQJp6gKHg5KWzYO1IDzsFGK/r5ICkditkwMbrNs=;
        b=Gowlq3M5IeXr9hbwicwXN+ICtdCvzXXDL5YA5fNVL6mR/oatI2qR40KVofVUCwSshJ
         uhFN77JqES7GuhUuMsJMtgGgE5K0cegzS4AQgOzhOyu6Wi2sh2aSqGvDxuoSuiRJUgxK
         IqalZ6BPYMntPuvSD05N/bALAPeh8E0usSdxylqKq7+RAe0gq9F3XBnT8NcsA7q1EMNW
         4z2mPxLu7M+/S4eQ7JNCiVnmlYJEvSnGeDREQfsOvmJE6OUvqHVDBwu/ikLFTO1inuIE
         OiSE5+1Vv56W92DHZcHzJY/+8HWr6QaWBklZbOJuczXg+2mhm7MeNrl3+lODmJ+LavdX
         MiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=67JYBQJp6gKHg5KWzYO1IDzsFGK/r5ICkditkwMbrNs=;
        b=K/lC1Ym2EckfTNdLxH6wd7JYp3boDqVL1EARemP6whDmUWT3ngQPUg2Vf3OqDpWEQL
         lmTHS2NnGLtehYBHDtehN8NeOcMnPt4VtOtzx1rd8iez/3NSX9yUIKBR1+nFzrXLiAs/
         V7rN5ARQQRnxIFyWP7RmFtfsmRyErf293NXIoI8ri3zIjF79ssZCBckUqLxgu/ymIWU0
         ROyfesImwO1/WlvBmqvtr+LmMZBUlAkIYxKP8XvUSePt+0mlcNDdhxZG+S6QJCssx5Yl
         Md//iBOYEugJB4d5lqRn6wumesE67QOk3rDLLVnhCWzJJv2jjQ8ZIcJaoAAF5XYX8oZM
         Kb5w==
X-Gm-Message-State: APjAAAWzBxNN02BqgoMozO6W69BPNfNJF/4IFh9MTvN0QY8gx3czPVxc
        4ezWl8zkfAwTHQcjAuni/0B1lQ==
X-Google-Smtp-Source: APXvYqxqV1nc3tbZQ06mCE2YSbtykG9rRjWk0ZN8EReBy2kZ8+uTQ7iwAKiytGUCKKNGc9s0Z6CmfQ==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr88851941pff.104.1558465767487;
        Tue, 21 May 2019 12:09:27 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e62sm25970446pfa.50.2019.05.21.12.09.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 12:09:26 -0700 (PDT)
Date:   Tue, 21 May 2019 12:09:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        david.brown@linaro.org, jcrouse@codeaurora.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190521190953.GD2085@tuxbook-pro>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 May 09:53 PDT 2019, Jeffrey Hugo wrote:

> The PM8005 is used on the msm8998 MTP.  The S1 regulator is VDD_GFX, ie
> it needs to be on and controlled inorder to use the GPU.  Add support to
> drive the PM8005 regulators so that we can bring up the GPU on msm8998.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 203 +++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 53a61fb65642..e4b89fbaf426 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -104,6 +104,7 @@ enum spmi_regulator_logical_type {
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LO_SMPS,
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
>  	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
> +	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2,
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
> @@ -170,6 +172,20 @@ enum spmi_common_regulator_registers {
>  	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
>  };
>  
> +/*
> + * Second common register layout used by newer devices
> + * Note that some of the registers from the first common layout remain
> + * unchanged and their definition is not duplicated.
> + */
> +enum qpnp_common2_regulator_registers {
> +	SPMI_COMMON2_REG_VOLTAGE_LSB		= 0x40,
> +	SPMI_COMMON2_REG_VOLTAGE_MSB		= 0x41,
> +	SPMI_COMMON2_REG_MODE			= 0x45,
> +	SPMI_COMMON2_REG_STEP_CTRL		= 0x61,
> +	SPMI_COMMON2_REG_VOLTAGE_ULS_LSB	= 0x68,
> +	SPMI_COMMON2_REG_VOLTAGE_ULS_MSB	= 0x69,
> +};
> +
>  enum spmi_vs_registers {
>  	SPMI_VS_REG_OCP				= 0x4a,
>  	SPMI_VS_REG_SOFT_START			= 0x4c,
> @@ -229,6 +245,15 @@ enum spmi_common_control_register_index {
>  #define SPMI_COMMON_MODE_FOLLOW_HW_EN0_MASK	0x01
>  #define SPMI_COMMON_MODE_FOLLOW_ALL_MASK	0x1f
>  
> +/* Second common regulator mode register values */
> +#define SPMI_COMMON2_MODE_BYPASS_MASK		3
> +#define SPMI_COMMON2_MODE_RETENTION_MASK	4
> +#define SPMI_COMMON2_MODE_LPM_MASK		5
> +#define SPMI_COMMON2_MODE_AUTO_MASK		6
> +#define SPMI_COMMON2_MODE_HPM_MASK		7
> +
> +#define SPMI_COMMON2_MODE_MASK			0x07
> +
>  /* Common regulator pull down control register layout */
>  #define SPMI_COMMON_PULL_DOWN_ENABLE_MASK	0x80
>  
> @@ -274,6 +299,23 @@ enum spmi_common_control_register_index {
>  #define SPMI_FTSMPS_STEP_MARGIN_NUM	4
>  #define SPMI_FTSMPS_STEP_MARGIN_DEN	5
>  
> +#define SPMI_FTSMPS2_STEP_CTRL_DELAY_MASK	0x03
> +#define SPMI_FTSMPS2_STEP_CTRL_DELAY_SHIFT	0
> +
> +/* Clock rate in kHz of the FTSMPS2 regulator reference clock. */
> +#define SPMI_FTSMPS2_CLOCK_RATE		4800
> +
> +/* Minimum voltage stepper delay for each step. */
> +#define SPMI_FTSMPS2_STEP_DELAY		2
> +
> +/*
> + * The ratio SPMI_FTSMPS2_STEP_MARGIN_NUM/SPMI_FTSMPS2_STEP_MARGIN_DEN is used
> + * to adjust the step rate in order to account for oscillator variance.
> + */
> +#define SPMI_FTSMPS2_STEP_MARGIN_NUM	10
> +#define SPMI_FTSMPS2_STEP_MARGIN_DEN	11
> +
> +
>  /* VSET value to decide the range of ULT SMPS */
>  #define ULT_SMPS_RANGE_SPLIT 0x60
>  
> @@ -447,6 +489,10 @@ static struct spmi_voltage_range ftsmps2p5_ranges[] = {
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
> @@ -480,6 +526,7 @@ static DEFINE_SPMI_SET_POINTS(ln_ldo);
>  static DEFINE_SPMI_SET_POINTS(smps);
>  static DEFINE_SPMI_SET_POINTS(ftsmps);
>  static DEFINE_SPMI_SET_POINTS(ftsmps2p5);
> +static DEFINE_SPMI_SET_POINTS(ftsmps426);
>  static DEFINE_SPMI_SET_POINTS(boost);
>  static DEFINE_SPMI_SET_POINTS(boost_byp);
>  static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
> @@ -647,17 +694,31 @@ static int spmi_hw_selector_to_sw(struct spmi_regulator *vreg, u8 hw_sel,
>  static const struct spmi_voltage_range *
>  spmi_regulator_find_range(struct spmi_regulator *vreg)
>  {
> -	u8 range_sel;
> +	int uV;
> +	u8 range_sel, lsb, msb;
>  	const struct spmi_voltage_range *range, *end;
>  
>  	range = vreg->set_points->range;
>  	end = range + vreg->set_points->count;
>  
> -	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
> +	/* second common devices don't have VOLTAGE_RANGE register */
> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2) {
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
> +
> +		uV = (((int)msb << 8) | (int)lsb) * 1000;
>  
> -	for (; range < end; range++)
> -		if (range->range_sel == range_sel)
> -			return range;
> +		for (; range < end; range++)
> +			if (range->min_uV <= uV && range->max_uV >= uV)
> +				return range;
> +	} else {
> +		spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel,
> +			       1);
> +
> +		for (; range < end; range++)
> +			if (range->range_sel == range_sel)
> +				return range;
> +	}

While I think the patch looks good it suffers from the same design
issue that Mark objected to in:
https://lore.kernel.org/lkml/1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org/

I think we need a better strategy, as we now at least have to support
the three cases of:
* range selector + voltage selector
* multi range voltage selector
* single range voltage selector

Regards,
Bjorn

>  
>  	return NULL;
>  }
> @@ -747,6 +808,23 @@ spmi_regulator_common_set_voltage(struct regulator_dev *rdev, unsigned selector)
>  	return spmi_vreg_write(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, buf, 2);
>  }
>  
> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> +					      unsigned selector);
> +
> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
> +					      unsigned selector)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 buf[2];
> +	int mV;
> +
> +	mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> +
> +	buf[0] = mV & 0xff;
> +	buf[1] = (mV >> 8) & 0xff;
> +	return spmi_vreg_write(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, buf, 2);
> +}
> +
>  static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
>  		unsigned int old_selector, unsigned int new_selector)
>  {
> @@ -778,6 +856,17 @@ static int spmi_regulator_common_get_voltage(struct regulator_dev *rdev)
>  	return spmi_hw_selector_to_sw(vreg, voltage_sel, range);
>  }
>  
> +static int spmi_regulator_common2_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 lsb, msb;
> +
> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
> +
> +	return (((int)msb << 8) | (int)lsb) * 1000;
> +}
> +
>  static int spmi_regulator_single_map_voltage(struct regulator_dev *rdev,
>  		int min_uV, int max_uV)
>  {
> @@ -920,6 +1009,22 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
>  	return REGULATOR_MODE_IDLE;
>  }
>  
> +static unsigned int spmi_regulator_common2_get_mode(struct regulator_dev *rdev)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 reg;
> +
> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_MODE, &reg, 1);
> +
> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
> +		return REGULATOR_MODE_NORMAL;
> +
> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
> +		return REGULATOR_MODE_FAST;
> +
> +	return REGULATOR_MODE_IDLE;
> +}
> +
>  static int
>  spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  {
> @@ -935,6 +1040,21 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
>  }
>  
> +static int
> +spmi_regulator_common2_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> +	u8 mask = SPMI_COMMON2_MODE_MASK;
> +	u8 val = SPMI_COMMON2_MODE_LPM_MASK;
> +
> +	if (mode == REGULATOR_MODE_NORMAL)
> +		val = SPMI_COMMON2_MODE_HPM_MASK;
> +	else if (mode == REGULATOR_MODE_FAST)
> +		val = SPMI_COMMON2_MODE_AUTO_MASK;
> +
> +	return spmi_vreg_update_bits(vreg, SPMI_COMMON2_REG_MODE, val, mask);
> +}
> +
>  static int
>  spmi_regulator_common_set_load(struct regulator_dev *rdev, int load_uA)
>  {
> @@ -1264,6 +1384,21 @@ static struct regulator_ops spmi_ult_ldo_ops = {
>  	.set_soft_start		= spmi_regulator_common_set_soft_start,
>  };
>  
> +static struct regulator_ops spmi_ftsmps426_ops = {
> +	.enable			= regulator_enable_regmap,
> +	.disable		= regulator_disable_regmap,
> +	.is_enabled		= regulator_is_enabled_regmap,
> +	.set_voltage_sel	= spmi_regulator_common2_set_voltage,
> +	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
> +	.get_voltage_sel	= spmi_regulator_common2_get_voltage,
> +	.map_voltage		= spmi_regulator_common_map_voltage,
> +	.list_voltage		= spmi_regulator_common_list_voltage,
> +	.set_mode		= spmi_regulator_common2_set_mode,
> +	.get_mode		= spmi_regulator_common2_get_mode,
> +	.set_load		= spmi_regulator_common_set_load,
> +	.set_pull_down		= spmi_regulator_common_set_pull_down,
> +};
> +
>  /* Maximum possible digital major revision value */
>  #define INF 0xFF
>  
> @@ -1299,6 +1434,7 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
>  	SPMI_VREG(BOOST, 5V_BOOST, 0, INF, BOOST,  boost,  boost,       0),
>  	SPMI_VREG(FTS,   FTS_CTL,  0, INF, FTSMPS, ftsmps, ftsmps, 100000),
>  	SPMI_VREG(FTS, FTS2p5_CTL, 0, INF, FTSMPS, ftsmps, ftsmps2p5, 100000),
> +	SPMI_VREG(FTS, FTS426_CTL, 0, INF, FTSMPS2, ftsmps426, ftsmps426, 100000),
>  	SPMI_VREG(BOOST_BYP, BB_2A, 0, INF, BOOST_BYP, boost, boost_byp, 0),
>  	SPMI_VREG(ULT_BUCK, ULT_HF_CTL1, 0, INF, ULT_LO_SMPS, ult_lo_smps,
>  						ult_lo_smps,   100000),
> @@ -1436,6 +1572,48 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
>  	return ret;
>  }
>  
> +/* slew rate init for common register layout #2 */
> +static int spmi_regulator_init_slew_rate2(struct spmi_regulator *vreg)
> +{
> +	int ret, i;
> +	u8 reg = 0;
> +	int delay, slew_rate;
> +	const struct spmi_voltage_range *range = NULL;
> +
> +	ret = spmi_vreg_read(vreg, SPMI_COMMON2_REG_STEP_CTRL, &reg, 1);
> +	if (ret) {
> +		dev_err(vreg->dev, "spmi read failed, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Regulators using the common #2 register layout do not have a voltage
> +	 * range select register.  Choose the lowest possible step size to be
> +	 * conservative in the slew rate calculation.
> +	 */
> +	for (i = 0; i < vreg->set_points->count; i++)
> +		if (!range || vreg->set_points->range[i].step_uV <
> +		    range->step_uV)
> +			range = &vreg->set_points->range[i];
> +
> +	if (!range)
> +		return -EINVAL;
> +
> +	delay = reg & SPMI_FTSMPS2_STEP_CTRL_DELAY_MASK;
> +	delay >>= SPMI_FTSMPS2_STEP_CTRL_DELAY_SHIFT;
> +
> +	/* slew_rate has units of uV/us */
> +	slew_rate = SPMI_FTSMPS2_CLOCK_RATE * range->step_uV;
> +	slew_rate /= 1000 * (SPMI_FTSMPS2_STEP_DELAY << delay);
> +	slew_rate *= SPMI_FTSMPS2_STEP_MARGIN_NUM;
> +	slew_rate /= SPMI_FTSMPS2_STEP_MARGIN_DEN;
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
> @@ -1575,6 +1753,12 @@ static int spmi_regulator_of_parse(struct device_node *node,
>  		ret = spmi_regulator_init_slew_rate(vreg);
>  		if (ret)
>  			return ret;
> +		break;
> +	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2:
> +		ret = spmi_regulator_init_slew_rate2(vreg);
> +		if (ret)
> +			return ret;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -1731,7 +1915,16 @@ static const struct spmi_regulator_data pmi8994_regulators[] = {
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
