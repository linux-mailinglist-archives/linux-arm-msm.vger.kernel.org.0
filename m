Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A0562B681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 10:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiKPJ31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 04:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbiKPJ30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 04:29:26 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A324912088;
        Wed, 16 Nov 2022 01:29:23 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AG8I4i9022554;
        Wed, 16 Nov 2022 09:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Sn2Rwg8Ovu5uRdzho4YFoTsFPAoN8+w2c+IpVXlzcXg=;
 b=ZWjHWCY5dntJqQb4HPwkC5vEQ9GRIYPR/yLY3emQCsdB6NzdbEhynW488Xbr07LMt9wN
 YGyLxgmG6GP3JTH2Lju2n4SLyV46Miy+Z7dvQhxwfAcAx44cJd0iHJwg7PQn2qCz6gFe
 ZHHCcp2wXg5NWD86y0MTh2shf5rOwU5syXFM4/hMKNwxVB1xEarcEju/zrkeC2qSceks
 I1xZK3PFWvohSRiWgvHnwfxKbcEW/Rf+nXvG5FvMlDPoRpIqv1kGWKxGczUmMrG0+0fE
 2XQNeAw4Ku/Npt/+0cTL8onpjqMXgMUXQttxVT4xvqJUpOpjWYawowwl4t7uWL8S487c 7g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvt8g8hbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Nov 2022 09:29:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AG9TB2X000714
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Nov 2022 09:29:11 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 01:29:05 -0800
Message-ID: <3041e527-f955-3582-e41f-5f5dc4d04e26@quicinc.com>
Date:   Wed, 16 Nov 2022 01:29:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
 <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
 <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
 <65ab13cb-93ae-eb71-531a-79cf99c7fcdd@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <65ab13cb-93ae-eb71-531a-79cf99c7fcdd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EJMxyt6UQbcsXYw1XDHgLKWLQK5-8sOw
X-Proofpoint-GUID: EJMxyt6UQbcsXYw1XDHgLKWLQK5-8sOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211160066
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/16/2022 1:18 AM, Dmitry Baryshkov wrote:
> On 16/11/2022 11:30, Abhinav Kumar wrote:
>>
>>
>> On 11/16/2022 12:19 AM, Dmitry Baryshkov wrote:
>>> On 16/11/2022 10:50, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>>>>> On sm8450 a register block was removed from MDP TOP. Accessing it 
>>>>> during
>>>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>>>> these registers during snapshot.
>>>>>
>>>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> I am confused with both the ordering and the split of this patch.
>>>>
>>>> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header file 
>>>> in this patch but used it in the next.
>>>>
>>>> But you also have code in this patch which relies on setting of this 
>>>> bit.
>>>>
>>>> So if this patch is taken without the next, it will still crash.
>>>
>>> It will not crash if this patch is taken without the next one. 
>>> Without the next patch the DPU driver will not match and bind against 
>>> the qcom,sm8450-dpu device.
>>
>> Ah okay, I just now saw that you have the compatible change also in 
>> the next patch.
>>
>>>
>>> So, the ordering is quite logical from my point of view:
>>> - add support for all the features required for the device
>>> - add the device compat string & catalog entry
>>>
>>>>
>>>> Rather, you should combine the define part of this patch to the next 
>>>> patch in the series 
>>>> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 
>>>> , then move that one in front of this patch.
>>>
>>> No. This way we'll have a state (after adding the next patch) when 
>>> the sm8450 support is enabled, but the top-hole is not handled, 
>>> leading to a crash.
>>>
>>
>> What if you split the compatible to a separate patch like what SM8350 
>> did.
>>
>> https://patchwork.freedesktop.org/patch/511659/?series=110924&rev=1
>>
>> So, we have hw catalog changes ---> snapshot fix ---> add the compatible.
> 
> I don't see any good reason to do this. Adding a define without backing 
> implementation is a bad idea in my opinion.
> 

The define is used in two places today. First in the catalog and second 
in the snapshot (which is your change).

Even with the split i am suggesting the define and usage will be together.

In fact, in my opinion thats more coherent because you defined the 
macro, used it to show that sm8450 has this TOP_HOLE.

Then, you are using the hw->caps which will be set in the previous patch 
to avoid that region in the snapshot.

The good reason to do it this way is that, with this current ordering of 
patch, this patch is essentially a dummy patch because technically no 
chipset has set this capability.

But if you follow the order i am suggesting, it actually has more 
meaning because we know sm8450 has set it in its caps before you use it.

> Regarding splitting the hw_catalog and compat. I have always considered 
> the hw catalog entry as of_device_id.data. In other words, a devices' 
> match data, which makes a little sense without compat entry.
> 
> With the current approach each patch is atomic, it changes single point 
> or adds a single feature, etc.
> 
>>
>> That will make both of us happy?
>>
>>>>
>>>> So that its much more coherent that you defined 
>>>> DPU_MDP_PERIPH_0_REMOVED both in the catalog header and used it in 
>>>> the catalog.c file and the in the next change you used the caps to 
>>>> avoid touching that register.
>>>
>>> I'd say it's rather strange way. When I see a define/feature 
>>> addition, I'd prefer to seethe implementation too.
>>>
>>>> Regarding the TOP hole itself, I need one day to investigate this. I 
>>>> am waiting for permissions to the documentation.
>>>>
>>>> If i cannot get access by the time you have re-ordered this, I will 
>>>> ack this once the reorder is done within a day.
>>>
>>>
>>> For the reference: [1]
>>>
>>> [1] 
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1 
>>>
>>>
>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>> index 38aa38ab1568..4730f8268f2a 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>> @@ -92,6 +92,7 @@ enum {
>>>>>       DPU_MDP_UBWC_1_0,
>>>>>       DPU_MDP_UBWC_1_5,
>>>>>       DPU_MDP_AUDIO_SELECT,
>>>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>>>       DPU_MDP_MAX
>>>>>   };
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index f3660cd14f4f..95d8765c1c53 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>>>> msm_disp_state *disp_state, struct msm_k
>>>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>>>> 0x3a8,
>>>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>>>> +    } else {
>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>> +    }
>>>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>>   }
>>>
> 
