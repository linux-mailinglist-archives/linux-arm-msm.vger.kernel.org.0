Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954E82F946C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 19:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbhAQSOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 13:14:22 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:36997 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729496AbhAQSOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 13:14:19 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0DAF01F50A;
        Sun, 17 Jan 2021 19:13:20 +0100 (CET)
Subject: Re: [PATCH v2 2/7] regulator: qcom-labibb: Implement current limiting
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-3-angelogioacchino.delregno@somainline.org>
 <YAEcFhFFsYIumI2e@builder.lan>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <dcc2b3ae-445d-1fcc-a654-2c0384247e72@somainline.org>
Date:   Sun, 17 Jan 2021 19:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YAEcFhFFsYIumI2e@builder.lan>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 15/01/21 05:37, Bjorn Andersson ha scritto:
> On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:
> 
>> LAB and IBB regulators can be current-limited by setting the
>> appropriate registers, but this operation is granted only after
>> sending an unlock code for secure access.
>>
>> Besides the secure access, it would be possible to use the
>> regmap helper for get_current_limit, as there is no security
>> blocking reads, but I chose not to as to avoid having a very
>> big array containing current limits, especially for IBB.
>>
>> That said, these regulators support current limiting for:
>> - LAB (pos): 200-1600mA, with 200mA per step (8 steps),
>> - IBB (neg):   0-1550mA, with  50mA per step (32 steps).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/regulator/qcom-labibb-regulator.c | 92 +++++++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>
>> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
>> index 9f51c96f16fb..d364f54ad294 100644
>> --- a/drivers/regulator/qcom-labibb-regulator.c
>> +++ b/drivers/regulator/qcom-labibb-regulator.c
>> @@ -29,6 +29,15 @@
>>   #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>>   #define LABIBB_CONTROL_ENABLE		BIT(7)
>>   
>> +#define REG_LABIBB_CURRENT_LIMIT	0x4b
>> + #define LAB_CURRENT_LIMIT_MASK		GENMASK(2, 0)
>> + #define IBB_CURRENT_LIMIT_MASK		GENMASK(4, 0)
>> + #define LAB_CURRENT_LIMIT_OVERRIDE_EN	BIT(3)
>> + #define LABIBB_CURRENT_LIMIT_EN	BIT(7)
>> +
>> +#define REG_LABIBB_SEC_ACCESS		0xd0
>> + #define LABIBB_SEC_UNLOCK_CODE		0xa5
>> +
>>   #define LAB_ENABLE_CTL_MASK		BIT(7)
>>   #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
>>   
>> @@ -37,11 +46,18 @@
>>   #define IBB_ENABLE_TIME			(LABIBB_OFF_ON_DELAY * 10)
>>   #define LABIBB_POLL_ENABLED_TIME	1000
>>   
>> +struct labibb_current_limits {
>> +	u32				uA_min;
>> +	u32				uA_step;
>> +	u8				ovr_val;
>> +};
>> +
>>   struct labibb_regulator {
>>   	struct regulator_desc		desc;
>>   	struct device			*dev;
>>   	struct regmap			*regmap;
>>   	struct regulator_dev		*rdev;
>> +	struct labibb_current_limits	uA_limits;
>>   	u16				base;
>>   	u8				type;
>>   };
>> @@ -53,6 +69,57 @@ struct labibb_regulator_data {
>>   	const struct regulator_desc	*desc;
>>   };
>>   
>> +static int qcom_labibb_set_current_limit(struct regulator_dev *rdev,
>> +					 int min_uA, int max_uA)
> 
> I was under the impression that a regulator driver should either
> implement set_voltage_* or set_current_limit, depending on which type of
> regulator it is - i.e. this API isn't supposed to be setting the current
> limit. Perhaps I'm wrong though?
> 

As far as I've understood, these are two entirely different things - set 
voltage and set current limits - that's how I'm using them, exactly, and 
I'm really sure that I'm right on this.

Besides what I think, though, obviously Mark has the last word on this.

>> +{
>> +	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
>> +	struct regulator_desc *desc = &vreg->desc;
>> +	struct labibb_current_limits *lim = &vreg->uA_limits;
>> +	u32 mask, val;
>> +	int i, ret, sel = -1;
>> +
>> +	if (min_uA < lim->uA_min || max_uA < lim->uA_min)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < desc->n_current_limits; i++) {
>> +		int uA_limit = (lim->uA_step * i) + lim->uA_min;
>> +
>> +		if (max_uA >= uA_limit && min_uA <= uA_limit)
> 
> I presume here you rely on the client passing something like min_uA = 0
> and max_uA 500? Because if the client where to
> regulator_set_current_limit(475, 475) you will pass through this loop
> without finding a match, but 450 would probably be a really good
> pick...

This regulator does not support setting a minimum limit, but only a 
ceiling limit, and that's used to raise an interrupt for over-current 
protection.
As far as I've understood, the Portable Batch System does its job only 
in the specific case of *short circuit* detection, but the OCP is 
totally left to the driver.

The reason why I am restricting the match in a sort of paranoid way is 
that this regulator can set the current limit in steps, but what I 
wanted to avoid was a scenario like:

- My display hardware draws a maximum of 475mA
- I set the current limit on LAB/IBB to 475mA
- The driver picks 450mA because it likes that value more
- I get Over Current Protection interrupts and I think that my hardware
   will get fried if I keep going on
- This points me to fix the display driver
   - Wrong! It was the regulator driver doing something different from
     what I asked it to.

So that's what I am avoiding here. I don't want developers to go crazy 
over their eventually new driver design for their new HW for "no reason".

> 
> But what does it even mean to pass min/max uA for a current limit?
> 

As I explained above, in this specific case, it means setting a limit to 
trigger the over current interrupt in order to protect the hardware that 
is attached to this regulator.

In other cases, meanings may be *slightly* different (at least, from my 
understanding of it).

> That said, I think this loop would be better expressed as a single
> subtract uA_min and then divide by uA_step.
> 
> 
Yes I can write it shorter... and even more... but I wanted to improve 
human readability of this function (and this entire driver) because 
regulators may be dangerous, if badly understood and/or badly set.

I just wanted two things:
1. Whoever reviewed my patches couldn't misunderstand what I wrote
    as much as possible;
2. Any other developer reading this driver (which may not be really
    familiar with this HW) gets the meaning of what I'm doing in less
    time, without doing too much time-expensive research.

After all, sometimes, writing shorter code decreases human readability
without improving performance in any way, and I think that this would
be one of these times... so... :))

> Apart from that, this patch looks good to me.
> 

Thank you!

> Regards,
> Bjorn
> 
>> +			sel = i;
>> +	}
>> +	if (sel < 0)
>> +		return -EINVAL;
>> +
>> +	/* Current limit setting needs secure access */
>> +	ret = regmap_write(vreg->regmap, vreg->base + REG_LABIBB_SEC_ACCESS,
>> +			   LABIBB_SEC_UNLOCK_CODE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mask = desc->csel_mask | lim->ovr_val;
>> +	mask |= LABIBB_CURRENT_LIMIT_EN;
>> +	val = (u32)sel | lim->ovr_val;
>> +	val |= LABIBB_CURRENT_LIMIT_EN;
>> +
>> +	return regmap_update_bits(vreg->regmap, desc->csel_reg, mask, val);
>> +}
>> +
>> +static int qcom_labibb_get_current_limit(struct regulator_dev *rdev)
>> +{
>> +	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
>> +	struct regulator_desc *desc = &vreg->desc;
>> +	struct labibb_current_limits *lim = &vreg->uA_limits;
>> +	unsigned int cur_step;
>> +	int ret;
>> +
>> +	ret = regmap_read(vreg->regmap, desc->csel_reg, &cur_step);
>> +	if (ret)
>> +		return ret;
>> +	cur_step &= desc->csel_mask;
>> +
>> +	return (cur_step * lim->uA_step) + lim->uA_min;
>> +}
>> +
>>   static const struct regulator_ops qcom_labibb_ops = {
>>   	.enable			= regulator_enable_regmap,
>>   	.disable		= regulator_disable_regmap,
>> @@ -61,6 +128,8 @@ static const struct regulator_ops qcom_labibb_ops = {
>>   	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>>   	.list_voltage		= regulator_list_voltage_linear_range,
>>   	.map_voltage		= regulator_map_voltage_linear_range,
>> +	.set_current_limit	= qcom_labibb_set_current_limit,
>> +	.get_current_limit	= qcom_labibb_get_current_limit,
>>   };
>>   
>>   static const struct regulator_desc pmi8998_lab_desc = {
>> @@ -73,6 +142,9 @@ static const struct regulator_desc pmi8998_lab_desc = {
>>   	.vsel_mask		= LAB_VOLTAGE_SET_MASK,
>>   	.apply_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
>>   	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
>> +	.csel_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_CURRENT_LIMIT),
>> +	.csel_mask		= LAB_CURRENT_LIMIT_MASK,
>> +	.n_current_limits	= 8,
>>   	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>>   	.owner			= THIS_MODULE,
>>   	.type			= REGULATOR_VOLTAGE,
>> @@ -94,6 +166,9 @@ static const struct regulator_desc pmi8998_ibb_desc = {
>>   	.vsel_mask		= IBB_VOLTAGE_SET_MASK,
>>   	.apply_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
>>   	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
>> +	.csel_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_CURRENT_LIMIT),
>> +	.csel_mask		= IBB_CURRENT_LIMIT_MASK,
>> +	.n_current_limits	= 32,
>>   	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>>   	.owner			= THIS_MODULE,
>>   	.type			= REGULATOR_VOLTAGE,
>> @@ -167,6 +242,23 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
>>   		vreg->base = reg_data->base;
>>   		vreg->type = reg_data->type;
>>   
>> +		switch (vreg->type) {
>> +		case QCOM_LAB_TYPE:
>> +			/* LAB Limits: 200-1600mA */
>> +			vreg->uA_limits.uA_min  = 200000;
>> +			vreg->uA_limits.uA_step = 200000;
>> +			vreg->uA_limits.ovr_val = LAB_CURRENT_LIMIT_OVERRIDE_EN;
>> +			break;
>> +		case QCOM_IBB_TYPE:
>> +			/* IBB Limits: 0-1550mA */
>> +			vreg->uA_limits.uA_min  = 0;
>> +			vreg->uA_limits.uA_step = 50000;
>> +			vreg->uA_limits.ovr_val = 0; /* No override bit */
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +
>>   		memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
>>   		vreg->desc.of_match = reg_data->name;
>>   		vreg->desc.name = reg_data->name;
>> -- 
>> 2.29.2
>>

