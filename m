Return-Path: <linux-arm-msm+bounces-3762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ED4808E47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 18:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D324D28138E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3193481D9;
	Thu,  7 Dec 2023 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="qp8mDFiu";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="anIFPgBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523281703;
	Thu,  7 Dec 2023 09:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701969146; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WlDpJqaFilDIrpYaAaXn5KWgiW96Bhr7iMx7QTSotm0BFuuvpQFvRVDmX3grbJInyu
    1FzHswsnEO7rXo+fweNrMxc2LllZJYOy31CzspFgTWWZp3PYk/UrsdcPmAYNmTalOK+1
    YmR3dUYQivnPZ7GFTNutZOwW108+Q9dG7PwyVOcwARsq2QGiL6QgxNFmST0EFeuq3LXH
    4IOwMLoSxTXiWre3wFYe1JSQz9th+YnXQrHEgpxlPOadCjsHWM1XF9UqU1B5KMVlTWQf
    WRXt4iC3Xplvqq5C2cKOkmCJ6PPHUW+GdIIdhDG4kaOoZIHX3CME3hQIabdlF3+q+rFS
    IkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701969146;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wg6wN9zlVSXlR+Rtz/C9diKOkif1ZOSm/YVWWFvcg/A=;
    b=GOLiPKgfSiH31zOsAaY2yogrwwR0UxX6sJO4LDUzpR9R3Xoq/mZsTRne9t4NTK1iwT
    BaJqcFJH0+fl0dUm8zSS0aY/DWKUEO2oB4Kcg+I+U4rcVLLwf7WuUYLbHjRHE4WF1YQ+
    kTmn7Po6GoSgInbpoS47XQ0h2fFJqDIccq5uYGC9+Tr39Yrs8o6SFehx0ajU1LejuwPL
    0dg5MqohCku+IVkjtyXS2Zk0wMhA3cFAP9UwhTi+EURLvKorskx9ofijnWa4gwbupK2F
    sBlOJLUW906QEFA948iUGdN4Ag1obfHjF0vvFO4t0dFTzNyoeAGyhX9xsAvpN7VYQ0dQ
    DbeA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701969146;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wg6wN9zlVSXlR+Rtz/C9diKOkif1ZOSm/YVWWFvcg/A=;
    b=qp8mDFiuZit9dUcxGqwYbKHfcOvcC/zp85tuVzOr8OcZOyvuTdMeNXJ5OoIrb2dMJ4
    o8AQxJAhTeYUQhiG4fOm6P4iaHj3hbclGiASAjSpkt3sMcWv/VlirUoBkcbZo7Xt67Ro
    DRjihNw8Vjfqd0V/0q34pRIUth2+TczNialbjnCOXqMHqL0k5GjbepRGHMvbNBkkPaha
    2ziJSZbrrHOE8Znb6bGzR4FDlWjWoDgJNGvS6O0Knm6u+OFr1rrw8sBYLDlWsYElLNPL
    HBb3q4Nal3vygriDirr2wd2gVeYCDJ3A3gbQ6ohaT3uXDBNr3gp0hZaM/1fWRR60hHoJ
    hDmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701969146;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wg6wN9zlVSXlR+Rtz/C9diKOkif1ZOSm/YVWWFvcg/A=;
    b=anIFPgBFKnqGeb8r+q5czCBhvD0kWDN6DL78HQNUqEz81yPhxbEJweNeBi8A6LE0k1
    aHqNCBN37oukhiYpUqCQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8paF1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.10.0 SBL|AUTH)
    with ESMTPSA id 58bb61zB7HCQA7s
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 7 Dec 2023 18:12:26 +0100 (CET)
Date: Thu, 7 Dec 2023 18:12:19 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 03/10] soc: qcom: spm: add support for voltage
 regulator
Message-ID: <ZXH88_nwT_3g6MS9@gerhold.net>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
 <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207130703.3322321-4-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit

On Thu, Dec 07, 2023 at 04:06:56PM +0300, Dmitry Baryshkov wrote:
> The SPM / SAW2 device also provides a voltage regulator functionality
> with optional AVS (Adaptive Voltage Scaling) support. The exact register
> sequence and voltage ranges differs from device to device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

There is some overlap here with the spmi_saw_set_vdd() functionality in
qcom_spmi-regulator.c, at least for the SoCs with SPMI PMICs (e.g.
MSM8974 etc). You don't add support for these in this patch series yet
but I think it would be good to clarify how we would expect to handle
those. In other words:

 - Would we handle them in qcom_spmi-regulator.c and keep the code in
   the spm.c driver only for the non-SPMI platforms?

 - Should we add this in a SSBI regulator driver instead for consistency?

 - Or should we move the existing functionality in qcom_spmi-regulator.c
   to here?

> ---
>  drivers/soc/qcom/spm.c | 221 ++++++++++++++++++++++++++++++++++++++++-
>  include/soc/qcom/spm.h |   9 ++
>  2 files changed, 225 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index 2f0b1bfe7658..595e2afb2141 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> [...]
> @@ -238,6 +273,181 @@ void spm_set_low_power_mode(struct spm_driver_data *drv,
>  	spm_register_write_sync(drv, SPM_REG_SPM_CTL, ctl_val);
>  }
>  
> +static int spm_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> +{
> +	struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> +
> +	drv->volt_sel = selector;
> +
> +	/* Always do the SAW register writes on the corresponding CPU */
> +	return smp_call_function_single(drv->reg_cpu, drv->reg_data->set_vdd, drv, true);
> +}
> +
> +static int spm_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +	struct spm_driver_data *drv = rdev_get_drvdata(rdev);
> +
> +	return drv->volt_sel;
> +}
> +
> +static const struct regulator_ops spm_reg_ops = {
> +	.set_voltage_sel	= spm_set_voltage_sel,
> +	.get_voltage_sel	= spm_get_voltage_sel,
> +	.list_voltage		= regulator_list_voltage_linear_range,
> +	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
> +};
> +
> +static void smp_set_vdd_v1_1(void *data)
> +{
> +	struct spm_driver_data *drv = data;
> +	unsigned int vctl, data0, data1, avs_ctl, sts;
> +	unsigned int vlevel, volt_sel;
> +	bool avs_enabled;
> +
> +	volt_sel = drv->volt_sel;
> +	vlevel = volt_sel | 0x80; /* band */
> +
> +	avs_ctl = spm_register_read(drv, SPM_REG_AVS_CTL);
> +	vctl = spm_register_read(drv, SPM_REG_VCTL);
> +	data0 = spm_register_read(drv, SPM_REG_PMIC_DATA_0);
> +	data1 = spm_register_read(drv, SPM_REG_PMIC_DATA_1);
> +
> +	avs_enabled = avs_ctl & SPM_1_1_AVS_CTL_AVS_ENABLED;
> +
> +	/* If AVS is enabled, switch it off during the voltage change */
> +	if (avs_enabled) {
> +		avs_ctl &= ~SPM_1_1_AVS_CTL_AVS_ENABLED;
> +		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> +	}
> +
> +	/* Kick the state machine back to idle */
> +	spm_register_write(drv, SPM_REG_RST, 1);
> +
> +	vctl = FIELD_SET(vctl, SPM_VCTL_VLVL, vlevel);
> +	data0 = FIELD_SET(data0, SPM_PMIC_DATA_0_VLVL, vlevel);
> +	data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MIN_VSEL, volt_sel);
> +	data1 = FIELD_SET(data1, SPM_PMIC_DATA_1_MAX_VSEL, volt_sel);
> +
> +	spm_register_write(drv, SPM_REG_VCTL, vctl);
> +	spm_register_write(drv, SPM_REG_PMIC_DATA_0, data0);
> +	spm_register_write(drv, SPM_REG_PMIC_DATA_1, data1);
> +
> +	if (read_poll_timeout_atomic(spm_register_read,
> +				     sts, sts == vlevel,
> +				     1, 200, false,
> +				     drv, SPM_REG_STS1)) {
> +		dev_err_ratelimited(drv->dev, "timeout setting the voltage (%x %x)!\n", sts, vlevel);
> +		goto enable_avs;
> +	}
> +
> +	if (avs_enabled) {
> +		unsigned int max_avs = volt_sel;
> +		unsigned int min_avs = max(max_avs, 4U) - 4;
> +
> +		avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MIN_VLVL, min_avs);
> +		avs_ctl = FIELD_SET(avs_ctl, SPM_AVS_CTL_MAX_VLVL, max_avs);
> +		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> +	}
> +
> +enable_avs:
> +	if (avs_enabled) {
> +		avs_ctl |= SPM_1_1_AVS_CTL_AVS_ENABLED;
> +		spm_register_write(drv, SPM_REG_AVS_CTL, avs_ctl);
> +	}
> +}
> +
> +static int spm_get_cpu(struct device *dev)
> +{
> +	int cpu;
> +	bool found;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct device_node *cpu_node, *saw_node;
> +
> +		cpu_node = of_cpu_device_node_get(cpu);
> +		if (!cpu_node)
> +			continue;
> +
> +		saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
> +		found = (saw_node == dev->of_node);
> +		of_node_put(saw_node);
> +		of_node_put(cpu_node);
> +
> +		if (found)
> +			return cpu;
> +	}
> +
> +	/* L2 SPM is not bound to any CPU, tie it to CPU0 */

Is this necessary? I would kind of expect that it's only important that
this doesn't happen in parallel on multiple CPUs. The lock in the
regulator core should already ensure that, though. It's somewhat
expensive to schedule on other cores, especially if they are currently
idle and power collapsed.

I don't have too much experience with these really old platforms but at
least on MSM8916 I can't think of any reason that would make the CPU0
more special for the L2 cache than the others (MSM8916 has the regulator
stuff only in the L2 SAW since there is just one CPU power rail).

Thanks,
Stephan

