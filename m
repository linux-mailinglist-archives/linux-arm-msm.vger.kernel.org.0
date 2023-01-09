Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8383766318C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 21:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbjAIUcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 15:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235387AbjAIUcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 15:32:31 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE08C2AD3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 12:32:28 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309Hk0Ja004259;
        Mon, 9 Jan 2023 20:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nJ62XCvUBpPdQwG8T/VOiteSABGArKKYnRZtqhbGgiQ=;
 b=gZmflo/EmD7R2cxXxlAdbDURKECScRXg0AG/lqhi8vk4LmQb5Z2nIOY41pDvGOShehrl
 Ms33n2S34A/0kj3FMxdZCmM+Aw9CToyd+4g09SigEp+CWY4rVOKKPGHjb978HHo3+LWM
 6R0LcOk3MAJCmF3fTI4oFVMfrX4VLLZ3ykstrdZg0Mjoa9HM+5gzCXyksM6jdHY6b+jN
 wJiP6DKAIj1VC0pfSvi05pYUTrDWkmJSAXzN9gQ9f3UHIMTYyNNJSAqafiup8EQD0AEL
 ILrkwsCP8oNVmAlfTtQ15T8f76XDrARwz/HoYCU0+Erenez7a6P8isKK4cKkP51Zrwvg yQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q2arc7s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 20:32:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 309KWK2a025632
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Jan 2023 20:32:20 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 12:32:19 -0800
Message-ID: <5aa47cf1-0589-4830-c1fb-22e15bac974a@quicinc.com>
Date:   Mon, 9 Jan 2023 12:32:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match
 data
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
 <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
 <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b40vZe7ULkQxZxZU7OowTdXFE8BHo4QI
X-Proofpoint-ORIG-GUID: b40vZe7ULkQxZxZU7OowTdXFE8BHo4QI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090144
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/9/2023 12:17 PM, Dmitry Baryshkov wrote:
> On 09/01/2023 21:53, Abhinav Kumar wrote:
>>
>>
>> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
>>> To simplify adding new platforms and to make settings more obvious,
>>> rewrite the UBWC setup to use the data structure to pass platform config
>>> rather than just calling the functions direcly.
>>
>> Why not use the catalog to store this information rather than using 
>> the platform device match data?
>>
>> This seems more appropriate for the catalog.
> 
> Which catalog?
> 
> If you are talking about the DPU hw catalog, it's not possible. DPU and 
> MDSS are two distinct drivers even if they are built into the same module.
> 
> And if you are talking about adding mdss_catalog, I'd abstain from that 
> idea. It is too easy to update one piece and forget the other one. Using 
> match data is what other drivers are using (and it ensures that each new 
> supported device gets its correct match data).
> 

Yes, I was referring to the DPU catalog.

But now I recall the mess because of the UBWC register being part of 
mmio base which the DPU doesnt map.

I do think that the platform match data is a bit of an overkill just to 
store the UBWC values but the msm_mdss driver today doesnt program 
anything else today so lets go with this.

But ... some comments below.

>>
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/msm_mdss.c | 158 ++++++++++++++++++++-------------
>>>   1 file changed, 94 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>>> b/drivers/gpu/drm/msm/msm_mdss.c
>>> index 92773e0a8fda..2219c1bd59a9 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -29,6 +29,14 @@
>>>   #define MIN_IB_BW    400000000UL /* Min ib vote 400MB */
>>> +struct msm_mdss_data {
>>> +    u32 ubwc_version;
>>> +    u32 ubwc_swizzle;
>>> +    u32 ubwc_static;
>>> +    u32 highest_bank_bit;
>>> +    u32 macrotile_mode;
>>> +};
>>> +
>>>   struct msm_mdss {
>>>       struct device *dev;
>>> @@ -40,6 +48,7 @@ struct msm_mdss {
>>>           unsigned long enabled_mask;
>>>           struct irq_domain *domain;
>>>       } irq_controller;
>>> +    const struct msm_mdss_data *mdss_data;
>>>       struct icc_path *path[2];
>>>       u32 num_paths;
>>>   };
>>> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct 
>>> msm_mdss *msm_mdss)
>>>   #define UBWC_3_0 0x30000000
>>>   #define UBWC_4_0 0x40000000
>>> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>>> -                       u32 ubwc_static)
>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>>>   {
>>> -    writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>> +
>>> +    writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>   }
>>> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>>> -                       unsigned int ubwc_version,
>>> -                       u32 ubwc_swizzle,
>>> -                       u32 highest_bank_bit,
>>> -                       u32 macrotile_mode)
>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
>>>   {
>>> -    u32 value = (ubwc_swizzle & 0x1) |
>>> -            (highest_bank_bit & 0x3) << 4 |
>>> -            (macrotile_mode & 0x1) << 12;
>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>> +    u32 value = (data->ubwc_swizzle & 0x1) |
>>> +            (data->highest_bank_bit & 0x3) << 4 |
>>> +            (data->macrotile_mode & 0x1) << 12;
>>> -    if (ubwc_version == UBWC_3_0)
>>> +    if (data->ubwc_version == UBWC_3_0)
>>>           value |= BIT(10);
>>> -    if (ubwc_version == UBWC_1_0)
>>> +    if (data->ubwc_version == UBWC_1_0)
>>>           value |= BIT(8);
>>>       writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>   }
>>> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>>> -                       unsigned int ubwc_version,
>>> -                       u32 ubwc_swizzle,
>>> -                       u32 ubwc_static,
>>> -                       u32 highest_bank_bit,
>>> -                       u32 macrotile_mode)
>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>>   {
>>> -    u32 value = (ubwc_swizzle & 0x7) |
>>> -            (ubwc_static & 0x1) << 3 |
>>> -            (highest_bank_bit & 0x7) << 4 |
>>> -            (macrotile_mode & 0x1) << 12;
>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>> +    u32 value = (data->ubwc_swizzle & 0x7) |
>>> +            (data->ubwc_static & 0x1) << 3 |
>>> +            (data->highest_bank_bit & 0x7) << 4 |
>>> +            (data->macrotile_mode & 0x1) << 12;
>>>       writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>> -    if (ubwc_version == UBWC_3_0) {
>>> +    if (data->ubwc_version == UBWC_3_0) {
>>>           writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>>           writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>>       } else {
>>> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss 
>>> *msm_mdss)
>>>   {
>>>       int ret;
>>>       u32 hw_rev;
>>> +    u32 ubwc_dec_hw_version;
>>>       /*
>>>        * Several components have AXI clocks that can only be turned 
>>> on if
>>> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss 
>>> *msm_mdss)
>>>        * HW_REV requires MDSS_MDP_CLK, which is not enabled by the 
>>> mdss on
>>>        * mdp5 hardware. Skip reading it for now.
>>>        */
>>> -    if (msm_mdss->is_mdp5)
>>> +    if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>>>           return 0;
>>>       hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);

hw_rev is not used anymore now so why not just drop that reg read 
altogether.

>>>       dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>>> +
>>> +    ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio + 
>>> UBWC_DEC_HW_VERSION);

If we are going to tie UBWC version to the HW compatible match, then 
even this register read can be skipped and instead you can add 
ubwc_dec_hw_version to your match data struct and skip this read as well.

That way we get rid of all register reads in this path which have 
continuously bugged us with crashes.

>>>       dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
>>> -        readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
>>> +        ubwc_dec_hw_version);
>>>       /*
>>>        * ubwc config is part of the "mdss" region which is not 
>>> accessible
>>>        * from the rest of the driver. hardcode known configurations here
>>>        *
>>>        * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
>>> -     * UBWC_n and the rest of params comes from hw_catalog.
>>> -     * Unforunately this driver can not access hw catalog, so we 
>>> have to
>>> -     * hardcode them here.
>>> +     * UBWC_n and the rest of params comes from hw data.
>>>        */
>>> -    switch (hw_rev) {
>>> -    case DPU_HW_VER_500:
>>> -    case DPU_HW_VER_501:
>>> -        msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
>>> -        break;
>>> -    case DPU_HW_VER_600:
>>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>>> -        break;
>>> -    case DPU_HW_VER_620:
>>> -        /* UBWC_2_0 */
>>> -        msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>>> +    switch (ubwc_dec_hw_version) {
>>> +    case UBWC_2_0:
>>> +        msm_mdss_setup_ubwc_dec_20(msm_mdss);
>>>           break;
>>> -    case DPU_HW_VER_630:
>>> -        /* UBWC_2_0 */
>>> -        msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
>>> +    case UBWC_3_0:
>>> +        msm_mdss_setup_ubwc_dec_30(msm_mdss);
>>>           break;
>>> -    case DPU_HW_VER_700:
>>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>>> +    case UBWC_4_0:
>>> +        msm_mdss_setup_ubwc_dec_40(msm_mdss);
>>>           break;
>>> -    case DPU_HW_VER_720:
>>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>>> -        break;
>>> -    case DPU_HW_VER_800:
>>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
>>> -        break;
>>> -    case DPU_HW_VER_810:
>>> -        /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>>> -        msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>>> +    default:
>>> +        dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
>>> +            ubwc_dec_hw_version);
>>>           break;
>>>       }
>>> @@ -487,6 +474,8 @@ static int mdss_probe(struct platform_device *pdev)
>>>       if (IS_ERR(mdss))
>>>           return PTR_ERR(mdss);
>>> +    mdss->mdss_data = of_device_get_match_data(&pdev->dev);
>>> +
>>>       platform_set_drvdata(pdev, mdss);
>>>       /*
>>> @@ -516,20 +505,61 @@ static int mdss_remove(struct platform_device 
>>> *pdev)
>>>       return 0;
>>>   }
>>> +static const struct msm_mdss_data sc7180_data = {
>>> +    .ubwc_version = UBWC_2_0,
>>> +    .ubwc_static = 0x1e,
>>> +};
>>> +
>>> +static const struct msm_mdss_data sc7280_data = {
>>> +    .ubwc_version = UBWC_3_0,
>>> +    .ubwc_swizzle = 6,
>>> +    .ubwc_static = 1,
>>> +    .highest_bank_bit = 1,
>>> +    .macrotile_mode = 1,
>>> +};
>>> +
>>> +static const struct msm_mdss_data sc8280xp_data = {
>>> +    .ubwc_version = UBWC_4_0,
>>> +    .ubwc_swizzle = 6,
>>> +    .ubwc_static = 1,
>>> +    .highest_bank_bit = 2,
>>> +    .macrotile_mode = 1,
>>> +};
>>> +
>>> +static const struct msm_mdss_data sm8150_data = {
>>> +    .ubwc_version = UBWC_3_0,
>>> +    .highest_bank_bit = 2,
>>> +};
>>> +
>>> +static const struct msm_mdss_data sm6115_data = {
>>> +    .ubwc_version = UBWC_2_0,
>>> +    .ubwc_swizzle = 7,
>>> +    .ubwc_static = 0x11f,
>>> +};
>>> +
>>> +static const struct msm_mdss_data sm8250_data = {
>>> +    .ubwc_version = UBWC_4_0,
>>> +    .ubwc_swizzle = 6,
>>> +    .ubwc_static = 1,
>>> +    /* TODO: highest_bank_bit = 2 for LP_DDR4 */
>>> +    .highest_bank_bit = 3,
>>> +    .macrotile_mode = 1,
>>> +};
>>> +
>>>   static const struct of_device_id mdss_dt_match[] = {
>>>       { .compatible = "qcom,mdss" },
>>>       { .compatible = "qcom,msm8998-mdss" },
>>>       { .compatible = "qcom,qcm2290-mdss" },
>>>       { .compatible = "qcom,sdm845-mdss" },
>>> -    { .compatible = "qcom,sc7180-mdss" },
>>> -    { .compatible = "qcom,sc7280-mdss" },
>>> +    { .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
>>> +    { .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
>>>       { .compatible = "qcom,sc8180x-mdss" },
>>> -    { .compatible = "qcom,sc8280xp-mdss" },
>>> -    { .compatible = "qcom,sm6115-mdss" },
>>> -    { .compatible = "qcom,sm8150-mdss" },
>>> -    { .compatible = "qcom,sm8250-mdss" },
>>> -    { .compatible = "qcom,sm8350-mdss" },
>>> -    { .compatible = "qcom,sm8450-mdss" },
>>> +    { .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>>> +    { .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>>> +    { .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
>>> +    { .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>>> +    { .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
>>> +    { .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
>>>       {}
>>>   };
>>>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
> 
