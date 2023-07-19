Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8FB759032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 10:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjGSIY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 04:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjGSIYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 04:24:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F17B1FD8;
        Wed, 19 Jul 2023 01:24:49 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J7FR6p008986;
        Wed, 19 Jul 2023 08:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=H+O6Yp3xPIWjA9OKGLDxtr2q96GWQkwFtj0ckfaib60=;
 b=FabjcaJJhRdHIkqaopurrcKYNBul9FsxMTdE48L4YhZ+FtGfLVVj/4qqyrLddrUwRlZ2
 ga9pAOCFk5BYIFLqEIJRSknzVAOsBe7ELGgBR776LoudsGSEciQo9crys6wXvUMIxcce
 usNJ0DYrwuMkIWqdkD1VHoI+RhMq7lDZ+4s1S1f2/1Upf1EEUxNz8ukx9W3g9zSCwHB5
 bEaA87kq2ehxbfq4Tt67zvJKxKu4UbTZN0dycA8cl7VciTVgOc5hpBR1c4V6lFAHk0xp
 DixK+Z8bUdNCdGtPUUkC3VWIYgy0i4LFpAB2zg/B58ja0l/H5e90uyxxYc3ZfNr5VyB+ Kw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rx728rk8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 08:24:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36J8OAqx004044
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 08:24:10 GMT
Received: from [10.239.154.73] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 01:24:07 -0700
Message-ID: <89e5a091-b775-35cf-bfc6-c48abf185b26@quicinc.com>
Date:   Wed, 19 Jul 2023 16:24:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] Input: pm8xxx-vib - Add support for more PMICs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <quic_collinsd@quicinc.com>,
        <quic_subbaram@quicinc.com>, <quic_kamalw@quicinc.com>,
        <jestar@qti.qualcomm.com>, <quic_huliu@quicinc.com>
References: <20230718062639.2339589-1-quic_fenglinw@quicinc.com>
 <20230718062639.2339589-3-quic_fenglinw@quicinc.com>
 <CAA8EJpq_DGu3+kc_ex_2MUyiQFJvZhbWOc7NO6x1pO1Wx4RbNw@mail.gmail.com>
 <86631cb4-6b99-c3a7-428e-4534891da4c7@quicinc.com>
 <CAA8EJpr--XZnFJX96etagAa0uT0yNBcgZTfFDuu8gH2C5sgoCg@mail.gmail.com>
 <501bc7d0-1f97-1c53-a7f8-701ab9dfdf8e@quicinc.com>
 <CAA8EJppjshTCqeYQL1QUbLd03bopZjGHuOhoFqy7P8XuzYXc9w@mail.gmail.com>
 <138fac39-8c28-2c14-0b16-ec08189179cf@quicinc.com>
 <CAA8EJpoeFwu7P7jEqhmwttAeF4VAhaCSaKP4XrUQz1YVsg9zvw@mail.gmail.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
In-Reply-To: <CAA8EJpoeFwu7P7jEqhmwttAeF4VAhaCSaKP4XrUQz1YVsg9zvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Aw2Uc3L5oHTWaWLG69Zo2xQlnsjHoyMP
X-Proofpoint-ORIG-GUID: Aw2Uc3L5oHTWaWLG69Zo2xQlnsjHoyMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_04,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190077
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/19/2023 4:02 PM, Dmitry Baryshkov wrote:
> On Wed, 19 Jul 2023 at 07:09, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>>
>>
>>
>> On 7/18/2023 7:04 PM, Dmitry Baryshkov wrote:
>>> On Tue, 18 Jul 2023 at 13:55, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/18/2023 5:41 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 18 Jul 2023 at 09:58, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 7/18/2023 2:44 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 18 Jul 2023 at 09:27, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> Add support for vibrator module inside PMI632, PM7250B, PM7325B.
>>>>>>>> It is very similar to vibrator inside PM8xxx but just the drive
>>>>>>>> amplitude is controlled through 2 bytes registers.
>>>>>>>>
>>>>>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>>>>>> ---
>>>>>>>>      drivers/input/misc/pm8xxx-vibrator.c | 48 ++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 48 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
>>>>>>>> index 04cb87efd799..213fdfd47c7f 100644
>>>>>>>> --- a/drivers/input/misc/pm8xxx-vibrator.c
>>>>>>>> +++ b/drivers/input/misc/pm8xxx-vibrator.c
>>>>>>>> @@ -25,6 +25,9 @@ struct pm8xxx_regs {
>>>>>>>>             unsigned int drv_addr;
>>>>>>>>             unsigned int drv_mask;
>>>>>>>>             unsigned int drv_shift;
>>>>>>>> +       unsigned int drv_addr2;
> 
> Unused
> 
>>>>>>>> +       unsigned int drv_mask2;
>>>>>>>> +       unsigned int drv_shift2;
>>>>>>>>             unsigned int drv_en_manual_mask;
>>>>>>>>      };
>>>>>>>>
>>>>>>>> @@ -44,6 +47,42 @@ static struct pm8xxx_regs pm8916_regs = {
>>>>>>>>             .drv_en_manual_mask = 0,
>>>>>>>>      };
>>>>>>>>
>>>>>>>> +static struct pm8xxx_regs pmi632_regs = {
>>>>>>>> +       .enable_addr = 0x5746,
>>>>>>>> +       .enable_mask = BIT(7),
>>>>>>>> +       .drv_addr = 0x5740,
>>>>>>>> +       .drv_mask = 0xff,
>>>>>>>> +       .drv_shift = 0,
>>>>>>>> +       .drv_addr2 = 0x5741,
>>>>>>>> +       .drv_mask2 = 0x0f,
>>>>>>>> +       .drv_shift2 = 8,
>>>>>>>
>>>>>>> I see that you are just expanding what was done for SSBI PMICs and
>>>>>>> later expanded to support pm8916. However it might be better to drop
>>>>>>> the hardcoded .drv_addr (and drv_addr2) and read address from DT
>>>>>>> instead.
>>>>>>>
>>>>>>
>>>>>> Right, this is the simplest change without updating the code logic too
>>>>>> much. If we decided to read .drv_addr and .drv_add2 from DT, we will
>>>>>> have to read .enable_addr along with all other mask/shift for each
>>>>>> register address from DT as well because they are not consistent from
>>>>>> target to target. I don't know how would you suggest to add the DT
>>>>>> properties for all of them, but if we end up to add a property for each
>>>>>> of them, it won't be cleaner than hard-coding them.
>>>>>
>>>>> No, we (correctly) have device compatibles for that. The issue with
>>>>> hardcoding register addresses is that it adds extra issues here.
>>>>>
>>>>> If I understand correctly, we have several 'generation':
>>>>> - SSBI PMIC, shifted 5-bit mask, en_manual_mask, no enable_register.
>>>>> - older SPMI PMIC, 5 bit drv_mask, 0 en_manual_mask, enable register at +6
>>>>> - new SPMI PMIC, 12 bit drv_mask, 0 en_manual_mask, enable register at +6
>>>>>
>>>>> For the last generation you are adding three independent entries,
>>>>> while the block looks the same. If you remove drv_addr (and get it
>>>>> from reg property), it would allow us to keep only the functional data
>>>>> in struct pm8xxxx_regs (masks / shifts).
>>>>>
>>>>
>>>> Okay, let me know if I understood it correctly, this is what you are
>>>> suggesting:
>>>>
>>>>      - hard code the mask/shifts and still keep them in struct pm8xxx_regs,
>>>>        combine the drv_mask2 to the upper byte of the drv_mask, so we will
>>>>        have following data structure for the 3rd generation vibrator
>>>>
>>>>        static struct pm8xxx_regs pm7250b_regs = {
>>>>            .enable_addr = 0x5346,
>>>>            .enable_mask = BIT(7),
>>>>            .drv_mask = 0xfff,
>>>>            .drv_shift = 0,
>>>>            .drv_en_manual_mask = 0,
>>>>        };
>>>>
>>>>
>>>>      - move the drv_addr/drv_addr2 into DT, read them from 'reg' property.
>>>>        Because of 'mfd/qcom,spmi-pmic.yaml' has defined the 'address-cells'
>>>>        as 1 and the 'size-cells' as 0 for qcom spmi devices, we couldn't
>>>>        specify the address size to 2 even the drv_addr for the 3rd
>>>>        generation vibrator is 2 adjacent bytes. So we will end of having
>>>>        following DT scheme:
>>>>
>>>>          For the 2nd generation which only has drv_addr
>>>>           vibrator@c041 {
>>>>                 compatible = "qcom,pm8916-vib";
>>>>                 reg = <0xc041>;  /* drv_addr */
>>>
>>> No. This is <0xc000>.
>>>
>>>>                 ...
>>>>           };
>>>>
>>>>          For the 3rd generation which has both drv_addr and drv_addr2
>>>>            vibrator@5340 {
>>>>                 compatible = "qcom,pm7250b-vib";
>>>>                reg = <0x5340>,  /* drv_addr */
>>>>                      <0x5341>;  /* drv_addr2 */
>>>>                ...
>>>>           };
>>>>
>>>> Not sure how do you feel, I actually don't see too much benefit than
>>>> hard-coding them in the driver.
>>>> We will end up having code to check how many u32 value in the 'reg' and
>>>> only assign it to drv_addr2 when the 2nd is available, also when
>>>> programming drv_addr2 register, the driver will always assume the mask
>>>> is in the upper byte of the drv_mask and the shift to the drive level is
>>>> 8 (this seems hacky to me and it was my biggest concern while I made
>>>> this change, and it led me to defining drv_shift2/drv_mask2 along with
>>>> drv_addr2).
>>>
>>> We only need drv_addr2 if drv_mask has more than 8 bits. So you don't
>>> have to specify it in the DT. It is always equal to base_reg + 0x41.
>>> The same way drv_addr is always equal to base_reg + 0x40 for all
>>> SPMI-based PMIC vibrator devices.
>>>
>>
>> Thanks. I got it now, I agree this will be beneficial for the case that
>> different PMICs have the same vibrator module but with different
>> register base address. I am going to change it to this way, let me know
>> if this is what you thought:
>>
>> @@ -25,6 +29,9 @@ struct pm8xxx_regs {
>>           unsigned int drv_addr;
>>           unsigned int drv_mask;
>>           unsigned int drv_shift;
>> +       unsigned int drv_addr2;
>> +       unsigned int drv_mask2;
>> +       unsigned int drv_shift2;
>>           unsigned int drv_en_manual_mask;
>>    };
>>
>> +static struct pm8xxx_regs spmi_vib_regs = {
>> +       .enable_mask = BIT(7),
>> +       .drv_mask = 0xff,
>> +       .drv_shift = 0,
>> +       .drv_mask2 = 0xf,
>> +       .drv_shift2 = 8,
>> +       .drv_en_manual_mask = 0,
>> +};
> 
> Ideally the static data should be const. I'd suggest moving
> drv_addr/drv_addr2 to struct pm8xxx_vib.
> 
>> +
>>
>> +#define SPMI_VIB_VSET_LB_REG   0x40
>> +#define SPMI_VIB_VSET_UP_REG   0x41
>> +#define SPMI_VIB_EN_CTL_REG    0x46
>> +
>>
>>           regs = of_device_get_match_data(&pdev->dev);
>>
>> +       if (regs->drv_addr == 0) {
>> +               rc = fwnode_property_read_u32(pdev->dev.fwnode,
>> +                               "reg", &reg_base);
>> +               if (rc < 0)
>> +                       return rc;
>> +
>> +               regs->enable_addr = reg_base + SPMI_VIB_EN_CTL_REG;
>> +               regs->drv_addr = reg_base + SPMI_VIB_VSET_LB_REG;
>> +               regs->drv_addr2 = reg_base + SPMI_VIB_VSET_UP_REG;
> 
> Yes, this looks good (except s/regs->/vib->/). Moreover this also
> applies to pm8916. I'd suggest splitting this into two patches: first,
> refactor pm8916 support to use reg, then add support for new devices.

Thanks. I will refactor this, test it, and send it out. The only problem 
  is I don't have a pm8916 device with me, but I guess the change should 
be straightforward and I will rely on the test result on my PM7550BA 
device which has the vibrator with the latest generation.

> 
>> +       }
>> +
>>
>>
>> @@ -242,6 +277,7 @@ static const struct of_device_id
>> pm8xxx_vib_id_table[] = {
>>           { .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
>>           { .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
>>           { .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
>> +       ( .compabitle = "qcom,spmi-vib", .data = &spmi_vib_regs },
>>           { }
>>
>>
>>>>
>>>>
>>>>
>>>>>>
>>>>>>
>>>>>>>> +       .drv_en_manual_mask = 0,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static struct pm8xxx_regs pm7250b_regs = {
>>>>>>>> +       .enable_addr = 0x5346,
>>>>>>>> +       .enable_mask = BIT(7),
>>>>>>>> +       .drv_addr = 0x5340,
>>>>>>>> +       .drv_mask = 0xff,
>>>>>>>> +       .drv_shift = 0,
>>>>>>>> +       .drv_addr2 = 0x5341,
>>>>>>>> +       .drv_mask2 = 0x0f,
>>>>>>>> +       .drv_shift2 = 8,
>>>>>>>> +       .drv_en_manual_mask = 0,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static struct pm8xxx_regs pm7325b_regs = {
>>>>>>>> +       .enable_addr = 0xdf46,
>>>>>>>> +       .enable_mask = BIT(7),
>>>>>>>> +       .drv_addr = 0xdf40,
>>>>>>>> +       .drv_mask = 0xff,
>>>>>>>> +       .drv_shift = 0,
>>>>>>>> +       .drv_addr2 = 0xdf41,
>>>>>>>> +       .drv_mask2 = 0x0f,
>>>>>>>> +       .drv_shift2 = 8,
>>>>>>>> +       .drv_en_manual_mask = 0,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * struct pm8xxx_vib - structure to hold vibrator data
>>>>>>>>       * @vib_input_dev: input device supporting force feedback
>>>>>>>> @@ -87,6 +126,12 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>>>>>>>>                     return rc;
>>>>>>>>
>>>>>>>>             vib->reg_vib_drv = val;
>>>>>>>> +       if (regs->drv_addr2 != 0 && on) {
>>>>>>>> +               val = (vib->level << regs->drv_shift2) & regs->drv_mask2;
>>>>>>>> +               rc = regmap_write(vib->regmap, regs->drv_addr2, val);
>>>>>>>> +               if (rc < 0)
>>>>>>>> +                       return rc;
>>>>>>>> +       }
>>>>>>>>
>>>>>>>>             if (regs->enable_mask)
>>>>>>>>                     rc = regmap_update_bits(vib->regmap, regs->enable_addr,
>>>>>>>> @@ -242,6 +287,9 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
>>>>>>>>             { .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
>>>>>>>>             { .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
>>>>>>>>             { .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
>>>>>>>> +       { .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
>>>>>>>> +       { .compatible = "qcom,pm7250b-vib", .data = &pm7250b_regs },
>>>>>>>> +       { .compatible = "qcom,pm7325b-vib", .data = &pm7325b_regs },
>>>>>>>>             { }
>>>>>>>>      };
>>>>>>>>      MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
