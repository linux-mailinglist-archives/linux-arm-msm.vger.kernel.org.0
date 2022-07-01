Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E88562EC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 10:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbiGAIsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 04:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbiGAIr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 04:47:59 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFEC735A5;
        Fri,  1 Jul 2022 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656665277; x=1688201277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wsRGwE1+4MYukcnB7TzFkOlQUtnJSohqmaxAXlKx2U4=;
  b=a5jKpYWZFck9eyr+zdGpZQ3vtCA9bVS6bxsDwqWy6Cp4vX9Lzh0Ztiv0
   0bbIFlGN9K9JeVerEsclwTQWK17cTjd/Z86fl67eT9JYsd+JIF7VPGhW0
   X9YWsOXHSiRwcnKl5Z/py4lkcevWEJOysRNDwLUiykjsr44WntcM0bN1X
   c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2022 01:47:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 01:47:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Jul 2022 01:47:55 -0700
Received: from [10.50.62.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Jul 2022
 01:47:51 -0700
Message-ID: <52c6ab15-1cd8-324e-4bcc-c449d8bceb19@quicinc.com>
Date:   Fri, 1 Jul 2022 14:17:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V15 6/9] mfd: pm8008: Use i2c_new_dummy_device() API
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>,
        <quic_jprakash@quicinc.com>
References: <a11732d6-a9b1-7ead-e89a-564a57a7192b@quicinc.com>
 <503f1a8b-eadb-d3a6-6e24-d60437f778b6@quicinc.com>
 <YrlfF+DMlGFsVBdk@google.com>
 <a1c6e3c9-962d-411e-7fbf-9e760e9dc8c0@quicinc.com>
 <Yrqw1YRyCGG+d4GL@google.com>
 <4112b5af-15de-007c-fcc2-c31ce9f9e426@quicinc.com>
 <YrxtXdOsIZ5LKhdV@google.com>
 <f8e70198-d0d8-5500-2869-be9e3a34f3c1@quicinc.com>
 <Yr18M9dzTOWL0m2c@google.com>
 <de1f3f33-0a8c-eb87-694c-16ebf2835720@quicinc.com>
 <Yr6oLlmfWRkiAZG7@google.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
In-Reply-To: <Yr6oLlmfWRkiAZG7@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/1/2022 1:24 PM, Lee Jones wrote:
> On Fri, 01 Jul 2022, Satya Priya Kakitapalli (Temp) wrote:
>
>> On 6/30/2022 4:04 PM, Lee Jones wrote:
>>> On Thu, 30 Jun 2022, Satya Priya Kakitapalli (Temp) wrote:
>>>
>>>> On 6/29/2022 8:48 PM, Lee Jones wrote:
>>>>> On Wed, 29 Jun 2022, Satya Priya Kakitapalli (Temp) wrote:
>>>>>
>>>>>> On 6/28/2022 1:12 PM, Lee Jones wrote:
>>>>>>> On Tue, 28 Jun 2022, Satya Priya Kakitapalli (Temp) wrote:
>>>>>>>
>>>>>>>> On 6/27/2022 1:11 PM, Lee Jones wrote:
>>>>>>>>> On Mon, 27 Jun 2022, Satya Priya Kakitapalli (Temp) wrote:
>>>>>>>>>
>>>>>>>>>> Hi Lee,
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 6/20/2022 4:37 PM, Satya Priya Kakitapalli (Temp) wrote:
>>>>>>>>>>> On 6/20/2022 1:50 PM, Lee Jones wrote:
>>>>>>>>>>>> On Mon, 20 Jun 2022, Satya Priya Kakitapalli (Temp) wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> On 6/17/2022 2:27 AM, Lee Jones wrote:
>>>>>>>>>>>>>> On Tue, 14 Jun 2022, Satya Priya wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Use i2c_new_dummy_device() to register pm8008-regulator
>>>>>>>>>>>>>>> client present at a different address space, instead of
>>>>>>>>>>>>>>> defining a separate DT node. This avoids calling the probe
>>>>>>>>>>>>>>> twice for the same chip, once for each client pm8008-infra
>>>>>>>>>>>>>>> and pm8008-regulator.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> As a part of this define pm8008_regmap_init() to do regmap
>>>>>>>>>>>>>>> init for both the clients and define pm8008_get_regmap() to
>>>>>>>>>>>>>>> pass the regmap to the regulator driver.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
>>>>>>>>>>>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>> Changes in V15:
>>>>>>>>>>>>>>>         - None.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Changes in V14:
>>>>>>>>>>>>>>>         - None.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Changes in V13:
>>>>>>>>>>>>>>>         - None.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>         drivers/mfd/qcom-pm8008.c       | 34
>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++--
>>>>>>>>>>>>>>>         include/linux/mfd/qcom_pm8008.h |  9 +++++++++
>>>>>>>>>>>>>>>         2 files changed, 41 insertions(+), 2 deletions(-)
>>>>>>>>>>>>>>>         create mode 100644 include/linux/mfd/qcom_pm8008.h
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>>>>>>>>>>>>>>> index 569ffd50..55e2a8e 100644
>>>>>>>>>>>>>>> --- a/drivers/mfd/qcom-pm8008.c
>>>>>>>>>>>>>>> +++ b/drivers/mfd/qcom-pm8008.c
>>>>>>>>>>>>>>> @@ -9,6 +9,7 @@
>>>>>>>>>>>>>>>         #include <linux/interrupt.h>
>>>>>>>>>>>>>>>         #include <linux/irq.h>
>>>>>>>>>>>>>>>         #include <linux/irqdomain.h>
>>>>>>>>>>>>>>> +#include <linux/mfd/qcom_pm8008.h>
>>>>>>>>>>>>>>>         #include <linux/module.h>
>>>>>>>>>>>>>>>         #include <linux/of_device.h>
>>>>>>>>>>>>>>>         #include <linux/of_platform.h>
>>>>>>>>>>>>>>> @@ -57,6 +58,7 @@ enum {
>>>>>>>>>>>>>>>         struct pm8008_data {
>>>>>>>>>>>>>>>             struct device *dev;
>>>>>>>>>>>>>>> +    struct regmap *regulators_regmap;
>>>>>>>>>>>>>>>             int irq;
>>>>>>>>>>>>>>>             struct regmap_irq_chip_data *irq_data;
>>>>>>>>>>>>>>>         };
>>>>>>>>>>>>>>> @@ -150,6 +152,12 @@ static struct regmap_config
>>>>>>>>>>>>>>> qcom_mfd_regmap_cfg = {
>>>>>>>>>>>>>>>             .max_register    = 0xFFFF,
>>>>>>>>>>>>>>>         };
>>>>>>>>>>>>>>> +struct regmap *pm8008_get_regmap(const struct pm8008_data *chip)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +    return chip->regulators_regmap;
>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(pm8008_get_regmap);
>>>>>>>>>>>>>> Seems like abstraction for the sake of abstraction.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Why not do the dereference inside the regulator driver?
>>>>>>>>>>>>> To derefer this in the regulator driver, we need to have the
>>>>>>>>>>>>> pm8008_data
>>>>>>>>>>>>> struct definition in the qcom_pm8008 header file.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I think it doesn't look great to have only that structure in
>>>>>>>>>>>>> header and all
>>>>>>>>>>>>> other structs and enum in the mfd driver.
>>>>>>>>>>>> Then why pass 'pm8008_data' at all?
>>>>>>>>>>> There is one more option, instead of passing the pm8008_data, we could
>>>>>>>>>>> pass the pdev->dev.parent and get the pm8008 chip data directly in the
>>>>>>>>>>> pm8008_get_regmap() like below
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> struct regmap *pm8008_get_regmap(const struct device *dev)
>>>>>>>>>>>       {
>>>>>>>>>>>           const struct pm8008_data *chip = dev_get_drvdata(dev);
>>>>>>>>>>>
>>>>>>>>>>>           return chip->regulators_regmap;
>>>>>>>>>>> }
>>>>>>>>>>> EXPORT_SYMBOL_GPL(pm8008_get_regmap);
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> By doing this we can avoid having declaration of pm8008_data also in the
>>>>>>>>>>> header. Please let me know if this looks good.
>>>>>>>>>>>
>>>>>>>>>> Could you please confirm on this?
>>>>>>>>>>
>>>>>>>>>>>> What's preventing you from passing 'regmap'?
>>>>>>>>>>> I didn't get what you meant here, could you please elaborate a bit?
>>>>>>>>> Ah yes.  I authored you a patch, but became distracted. Here:
>>>>>>>>>
>>>>>>>>> -----8<--------------------8<-------
>>>>>>>>>
>>>>>>>>> From: Lee Jones <lee.jones@linaro.org>
>>>>>>>>>
>>>>>>>>> mfd: pm8008: Remove driver data structure pm8008_data
>>>>>>>>> Maintaining a local driver data structure that is never shared
>>>>>>>>> outside of the core device is an unnecessary complexity.  Half of the
>>>>>>>>> attributes were not used outside of a single function, one of which
>>>>>>>>> was not used at all.  The remaining 2 are generic and can be passed
>>>>>>>>> around as required.
>>>>>>>> Okay, but we still need to store the regulators_regmap, which is required in
>>>>>>>> the pm8008 regulator driver. Could we use a global variable for it?
>>>>>>> Look down ...
>>>>>>>
>>>>>>>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>>>>>>>> ---
>>>>>>>>>       drivers/mfd/qcom-pm8008.c | 53 ++++++++++++++++++-----------------------------
>>>>>>>>>       1 file changed, 20 insertions(+), 33 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>>>>>>>>> index c472d7f8103c4..4b8ff947762f2 100644
>>>>>>>>> --- a/drivers/mfd/qcom-pm8008.c
>>>>>>>>> +++ b/drivers/mfd/qcom-pm8008.c
>>>>>>>>> @@ -54,13 +54,6 @@ enum {
>>>>>>>>>       #define PM8008_PERIPH_OFFSET(paddr)	(paddr - PM8008_PERIPH_0_BASE)
>>>>>>>>> -struct pm8008_data {
>>>>>>>>> -	struct device *dev;
>>>>>>>>> -	struct regmap *regmap;
>>>>>>>>> -	int irq;
>>>>>>>>> -	struct regmap_irq_chip_data *irq_data;
>>>>>>>>> -};
>>>>>>>>> -
>>>>>>>>>       static unsigned int p0_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_0_BASE)};
>>>>>>>>>       static unsigned int p1_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_1_BASE)};
>>>>>>>>>       static unsigned int p2_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_2_BASE)};
>>>>>>>>> @@ -150,7 +143,7 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
>>>>>>>>>       	.max_register	= 0xFFFF,
>>>>>>>>>       };
>>>>>>>>> -static int pm8008_init(struct pm8008_data *chip)
>>>>>>>>> +static int pm8008_init(struct regmap *regmap)
>>>>>>>>>       {
>>>>>>>>>       	int rc;
>>>>>>>>> @@ -160,34 +153,31 @@ static int pm8008_init(struct pm8008_data *chip)
>>>>>>>>>       	 * This is required to enable the writing of TYPE registers in
>>>>>>>>>       	 * regmap_irq_sync_unlock().
>>>>>>>>>       	 */
>>>>>>>>> -	rc = regmap_write(chip->regmap,
>>>>>>>>> -			 (PM8008_TEMP_ALARM_ADDR | INT_SET_TYPE_OFFSET),
>>>>>>>>> -			 BIT(0));
>>>>>>>>> +	rc = regmap_write(regmap, (PM8008_TEMP_ALARM_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
>>>>>>>>>       	if (rc)
>>>>>>>>>       		return rc;
>>>>>>>>>       	/* Do the same for GPIO1 and GPIO2 peripherals */
>>>>>>>>> -	rc = regmap_write(chip->regmap,
>>>>>>>>> -			 (PM8008_GPIO1_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
>>>>>>>>> +	rc = regmap_write(regmap, (PM8008_GPIO1_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
>>>>>>>>>       	if (rc)
>>>>>>>>>       		return rc;
>>>>>>>>> -	rc = regmap_write(chip->regmap,
>>>>>>>>> -			 (PM8008_GPIO2_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
>>>>>>>>> +	rc = regmap_write(regmap, (PM8008_GPIO2_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
>>>>>>>>>       	return rc;
>>>>>>>>>       }
>>>>>>>>> -static int pm8008_probe_irq_peripherals(struct pm8008_data *chip,
>>>>>>>>> +static int pm8008_probe_irq_peripherals(struct device *dev,
>>>>>>>>> +					struct regmap *regmap,
>>>>>>>>>       					int client_irq)
>>>>>>>>>       {
>>>>>>>>>       	int rc, i;
>>>>>>>>>       	struct regmap_irq_type *type;
>>>>>>>>>       	struct regmap_irq_chip_data *irq_data;
>>>>>>>>> -	rc = pm8008_init(chip);
>>>>>>>>> +	rc = pm8008_init(regmap);
>>>>>>>>>       	if (rc) {
>>>>>>>>> -		dev_err(chip->dev, "Init failed: %d\n", rc);
>>>>>>>>> +		dev_err(dev, "Init failed: %d\n", rc);
>>>>>>>>>       		return rc;
>>>>>>>>>       	}
>>>>>>>>> @@ -207,10 +197,10 @@ static int pm8008_probe_irq_peripherals(struct pm8008_data *chip,
>>>>>>>>>       				IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW);
>>>>>>>>>       	}
>>>>>>>>> -	rc = devm_regmap_add_irq_chip(chip->dev, chip->regmap, client_irq,
>>>>>>>>> +	rc = devm_regmap_add_irq_chip(dev, regmap, client_irq,
>>>>>>>>>       			IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
>>>>>>>>>       	if (rc) {
>>>>>>>>> -		dev_err(chip->dev, "Failed to add IRQ chip: %d\n", rc);
>>>>>>>>> +		dev_err(dev, "Failed to add IRQ chip: %d\n", rc);
>>>>>>>>>       		return rc;
>>>>>>>>>       	}
>>>>>>>>> @@ -220,26 +210,23 @@ static int pm8008_probe_irq_peripherals(struct pm8008_data *chip,
>>>>>>>>>       static int pm8008_probe(struct i2c_client *client)
>>>>>>>>>       {
>>>>>>>>>       	int rc;
>>>>>>>>> -	struct pm8008_data *chip;
>>>>>>>>> -
>>>>>>>>> -	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>>>>>>>>> -	if (!chip)
>>>>>>>>> -		return -ENOMEM;
>>>>>>>>> +	struct device *dev;
>>>>>>>>> +	struct regmap *regmap;
>>>>>>>>> -	chip->dev = &client->dev;
>>>>>>>>> -	chip->regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
>>>>>>>>> -	if (!chip->regmap)
>>>>>>>>> +	dev = &client->dev;
>>>>>>>>> +	regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
>>>>>>>>> +	if (!regmap)
>>>>>>>>>       		return -ENODEV;
>>>>>>>>> -	i2c_set_clientdata(client, chip);
>>>>>>>>> +	i2c_set_clientdata(client, regmap);
>>>>>>> Here ^
>>>>>> I have added a dummy device and set the client data by passing regmap, see
>>>>>> below:
>>>>>>
>>>>>> +       regulators_client = i2c_new_dummy_device(client->adapter,
>>>>>> client->addr + 1);
>>>>>> +       if (IS_ERR(regulators_client)) {
>>>>>> +               dev_err(dev, "can't attach client\n");
>>>>>> +               return PTR_ERR(regulators_client);
>>>>>> +       }
>>>>>> +
>>>>>> +       regulators_regmap = devm_regmap_init_i2c(regulators_client,
>>>>>> &qcom_mfd_regmap_cfg[1]);
>>>>>> +       if (!regmap)
>>>>>> +               return -ENODEV;
>>>>>> +
>>>>>> +       i2c_set_clientdata(client, regulators_regmap);
>>>>>>
>>>>>> Now if i try to get this regmap from regulator driver by doing
>>>>>>
>>>>>> struct regmap *regmap = dev_get_drvdata(pdev->dev.parent);
>>>>>>
>>>>>> it still gets me the regmap of pm8008@8 device and not the regulator device
>>>>>> regmap (0x9). Not sure if I'm missing something here.
>>>>> So you need to pass 2 regmap pointers?
>>>>>
>>>>> If you need to pass more than one item to the child devices, you do
>>>>> need to use a struct for that.
>>>> I need to pass only one regmap out of the two, but i am not able to retrieve
>>>> the correct regmap simply by doing i2c_set_clientdata
>>>>
>>>> probably because we are having all the child nodes under same DT node and
>>>> thus not able to distinguish based on the dev pointer
>>> You can only pull out (get) the pointer that you put in (set).
>>>
>>> Unless you over-wrote it later in the thread of execution, you are
>>> pulling out whatever regulators_regmap happens to be.
>>>
>>> Is qcom_mfd_regmap_cfg[1] definitely the one you want?
>>
>> Yes, I need qcom_mfd_regmap_cfg[1]
>>
>> Pasting code snippet for reference:
>>
>> static struct regmap_config qcom_mfd_regmap_cfg[2] = {
>>       {
>>
>>           .name = "infra",
>>           .reg_bits   = 16,
>>           .val_bits   = 8,
>>           .max_register   = 0xFFFF,
>>       },
>>       {
>>           .name = "regulators",
>>           .reg_bits   = 16,
>>           .val_bits   = 8,
>>           .max_register   = 0xFFFF,
>>       },
>>
>> };
>>
>>
>> Inside pm8008_probe:
>>
>>
>>       regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg[0]);
>>       if (!regmap)
>>           return -ENODEV;
>>
>>       i2c_set_clientdata(client, regmap);
>>
>>
>>       regulators_client = i2c_new_dummy_device(client->adapter, client->addr
>> + 1);
>>       if (IS_ERR(regulators_client)) {
>>           dev_err(dev, "can't attach client\n");
>>           return PTR_ERR(regulators_client);
>>       }
>>
>>       regulators_regmap = devm_regmap_init_i2c(regulators_client,
>> &qcom_mfd_regmap_cfg[1]);
>>       if (!regmap)
>>           return -ENODEV;
>>
>>       i2c_set_clientdata(regulators_client, regulators_regmap);
> You can't call this twice.
>
> Doing so with over-write regmap with regulators_regmap.
>
> You said you only needed one?
>
>    "I need to pass only one regmap out of the two, but i am not able to retrieve"


I thought you asked whether we have to pass two regmaps to the child 
regulator driver.


>> In qcom-pm8008-regulator.c I tried to get the regmap using
>>
>> dev_get_regmap(pdev->dev.parent, "regulators");
> I haven't looked at this API before.  I suggest that this would be
> used *instead* of passing the regmap pointer via driver_data.
>
> It looks like you're using different devices to init your regmaps;
> 'client' and 'regulator_client' (derived from client->adapter).
>
> "regulators" is registered using regulators_regmap which was *not*
> init'ed with pdev->dev.parent (same as client->dev), so trying to
> dev_get_regmap() with that device pointer will not work.


Okay, So I will leave the driver as is then?

