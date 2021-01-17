Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63112F9472
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 19:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbhAQSQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 13:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbhAQSQl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 13:16:41 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234ABC061573;
        Sun, 17 Jan 2021 10:16:01 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BC9C81F50A;
        Sun, 17 Jan 2021 19:15:58 +0100 (CET)
Subject: Re: [PATCH v2 3/7] regulator: qcom-labibb: Implement pull-down,
 softstart, active discharge
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-4-angelogioacchino.delregno@somainline.org>
 <YAEfrIR/HZmQLeQM@builder.lan>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <87a5d2bb-12d2-a4b8-d4fd-a5a39135cb34@somainline.org>
Date:   Sun, 17 Jan 2021 19:15:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YAEfrIR/HZmQLeQM@builder.lan>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 15/01/21 05:53, Bjorn Andersson ha scritto:
> On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:
> 
>> Soft start is required to avoid inrush current during LAB ramp-up and
>> IBB ramp-down, protecting connected hardware to which we supply voltage.
>>
>> Since soft start is configurable on both LAB and IBB regulators, it
>> was necessary to add two DT properties, respectively "qcom,soft-start-us"
>> to control LAB ramp-up and "qcom,discharge-resistor-kohms" to control
>> the discharge resistor for IBB ramp-down, which obviously brought the
>> need of implementing a of_parse callback for both regulators.
>>
>> Finally, also implement pull-down mode in order to avoid unpredictable
>> behavior when the regulators are disabled (random voltage spikes etc).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/regulator/qcom-labibb-regulator.c | 94 +++++++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>
>> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
>> index d364f54ad294..38ab1eba1c59 100644
>> --- a/drivers/regulator/qcom-labibb-regulator.c
>> +++ b/drivers/regulator/qcom-labibb-regulator.c
>> @@ -29,12 +29,23 @@
>>   #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>>   #define LABIBB_CONTROL_ENABLE		BIT(7)
>>   
>> +#define REG_LABIBB_PD_CTL		0x47
>> + #define LAB_PD_CTL_MASK		GENMASK(1, 0)
>> + #define IBB_PD_CTL_MASK		(BIT(0) | BIT(7))
>> + #define LAB_PD_CTL_STRONG_PULL		BIT(0)
>> + #define IBB_PD_CTL_HALF_STRENGTH	BIT(0)
>> + #define IBB_PD_CTL_EN			BIT(7)
>> +
>>   #define REG_LABIBB_CURRENT_LIMIT	0x4b
>>    #define LAB_CURRENT_LIMIT_MASK		GENMASK(2, 0)
>>    #define IBB_CURRENT_LIMIT_MASK		GENMASK(4, 0)
>>    #define LAB_CURRENT_LIMIT_OVERRIDE_EN	BIT(3)
>>    #define LABIBB_CURRENT_LIMIT_EN	BIT(7)
>>   
>> +#define REG_IBB_PWRUP_PWRDN_CTL_1	0x58
>> + #define IBB_CTL_1_DISCHARGE_EN		BIT(2)
>> +
>> +#define REG_LABIBB_SOFT_START_CTL	0x5f
>>   #define REG_LABIBB_SEC_ACCESS		0xd0
>>    #define LABIBB_SEC_UNLOCK_CODE		0xa5
>>   
>> @@ -60,6 +71,8 @@ struct labibb_regulator {
>>   	struct labibb_current_limits	uA_limits;
>>   	u16				base;
>>   	u8				type;
>> +	u8				dischg_sel;
>> +	u8				soft_start_sel;
>>   };
>>   
>>   struct labibb_regulator_data {
>> @@ -120,6 +133,70 @@ static int qcom_labibb_get_current_limit(struct regulator_dev *rdev)
>>   	return (cur_step * lim->uA_step) + lim->uA_min;
>>   }
>>   
>> +static int qcom_labibb_set_soft_start(struct regulator_dev *rdev)
>> +{
>> +	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u32 val = 0;
>> +
>> +	if (vreg->type == QCOM_IBB_TYPE)
>> +		val = vreg->dischg_sel;
>> +	else
>> +		val = vreg->soft_start_sel;
>> +
>> +	return regmap_write(rdev->regmap, rdev->desc->soft_start_reg, val);
>> +}
>> +
>> +static int qcom_labibb_get_table_sel(const int *table, int sz, u32 value)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < sz; i++)
>> +		if (table[i] == value)
>> +			return i;
>> +	return -EINVAL;
>> +}
>> +
>> +/* IBB discharge resistor values in KOhms */
>> +static const int dischg_resistor_values[] = { 300, 64, 32, 16 };
>> +
>> +/* Soft start time in microseconds */
>> +static const int soft_start_values[] = { 200, 400, 600, 800 };
>> +
>> +static int qcom_labibb_of_parse_cb(struct device_node *np,
>> +				   const struct regulator_desc *desc,
>> +				   struct regulator_config *config)
>> +{
>> +	struct labibb_regulator *vreg = config->driver_data;
>> +	u32 dischg_kohms, soft_start_time;
>> +	int ret;
>> +
>> +	ret = of_property_read_u32(np, "qcom,discharge-resistor-kohms",
>> +				       &dischg_kohms);
>> +	if (ret)
>> +		dischg_kohms = 300;
> 
> Nit, if you just initialize dischg_kohms to 300 during definition you
> can rely on of_property_read_u32() not updating the value on failure...
> 

I can change it if that's really necessary, I did it like this in an
attempt of spoon-feed the logic to the reader, but perhaps just
initializing it during definition would achieve the same, anyway.

Should I?

> That said, I think this patch looks good.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 

Thank you!

> Regards,
> Bjorn
> 

