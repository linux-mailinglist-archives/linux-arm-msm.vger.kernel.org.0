Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DBF747889
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 21:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjGDTBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 15:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGDTBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 15:01:14 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BB210D9
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 12:01:13 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 364Irefk017669;
        Tue, 4 Jul 2023 19:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xSvYHS8wj++FsP6awhoFjhBhv1r9P6VsBY1xo//lDXQ=;
 b=mXQzz9A/Sfwigq8yhIT/nyeYwg8Lsptax64jt7itDB6BJo2BZVqN79RtEUHEZmjB10dr
 A83TKJAmx6EBAHjYh6uFKgh8k7rH1+ifYWd/tEiD4Y74psCIn5gfhTWgotxe4cDCQQy6
 4q/88hqDjUnFawNxfPPJ0O6Hgy0npbZEs6i1F5qzZuVyXeKvh9c2+uL5zZ8xvhEZj7Ze
 D6D3mt0/qjpxee27MpQ/JcwK1IGtacDR67uEad5iXuta7O0ia0vqg98aaofMtc7l590P
 KoQ3FWWATJr0mGSsH7iTdI21LqAk+OHYltefZGkavLutf8ZxoR5obpetErRFdzX90O0/ mg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm00639e7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 19:01:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 364J12ag014623
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Jul 2023 19:01:02 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 12:01:01 -0700
Message-ID: <f2722ecc-6ad7-a2ea-111a-96e665385849@quicinc.com>
Date:   Tue, 4 Jul 2023 12:01:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
 <0aafbba0-52dd-96d9-94a6-0452996e1eba@quicinc.com>
 <974a294c-d85d-a79f-5b83-bbbac12ff7a2@linaro.org>
 <50855184-1fbf-8e36-f0eb-a46be70b1eca@quicinc.com>
 <CAA8EJprQLpRNHShWWWZeSyKx3erat3Q7WUXhVV1pYp9UtQEgng@mail.gmail.com>
 <CAA8EJpqysGpZzEs1QGDec9Jian6gDy+SG6a_VormPF_cdq47hA@mail.gmail.com>
 <99ec07f7-8892-9cfe-e843-c0f2d9eef658@quicinc.com>
 <CAA8EJprnPzQz2Nj+iA-M63YeE=esdPZs5dYrnkNEmH1wdMn-Xg@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprnPzQz2Nj+iA-M63YeE=esdPZs5dYrnkNEmH1wdMn-Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AnoRDXf0GG0_rsRgPc-85vnKZ13TfEP2
X-Proofpoint-GUID: AnoRDXf0GG0_rsRgPc-85vnKZ13TfEP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_12,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040164
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/4/2023 10:28 AM, Dmitry Baryshkov wrote:
> On Tue, 4 Jul 2023 at 19:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/4/2023 4:52 AM, Dmitry Baryshkov wrote:
>>> On Tue, 4 Jul 2023 at 13:06, Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Tue, 4 Jul 2023 at 07:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 7/3/2023 7:20 PM, Dmitry Baryshkov wrote:
>>>>>> On 03/07/2023 05:01, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>>>>>>>> There is always a single MDP TOP block. Drop the mdp_count field and
>>>>>>>> stop declaring dpu_mdp_cfg instances as arrays.
>>>>>>>>
>>>>>>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>
>>>>>>> The change drops mdp_count and stops using the array which is fine and
>>>>>>> I will support that.
>>>>>>>
>>>>>>> But looking at the pattern I saw while using core_revision, both
>>>>>>> DPU_MDP_VSYNC_SEL and DPU_MDP_AUDIO_SELECT can also be dropped from
>>>>>>> the catalog in favor of using core_revision.
>>>>>>>
>>>>>>> Hence for that, I request you not to stop passing dpu_mdss_cfg to
>>>>>>> dpu_hw_mdptop_init as that has the necessary information of
>>>>>>> core_revision.
>>>>>>
>>>>>> Sure, I'll restore it. Please note, however, that it might be better to
>>>>>> pass struct dpu_caps instead of the full struct dpu_mdss_cfg.
>>>>>>
>>>>>
>>>>> Thanks for restoring.
>>>>>
>>>>> Can you pls explain this better? dpu_core_rev is part of dpu_mdss_cfg,
>>>>> so dpu_caps wont be enough for this one.
>>>>
>>>> Oh, true. For some reason I thought that version is a part of dpu_caps.
>>>
>>> And after additional thought. Maybe it would be better to add a
>>> separate struct dpu_mdss_version and pass it to the hw block init
>>> functions?
>>>
>>
>> I would like to see this evolve. Today, we are assuming that only the hw
>> block init functions are the places we would use those.
>>
>>   From what I recall, the DSC over DP series needed the core_revision in
>> the timing gen code somewhere.
> 
> I hope you are talking about the DPU driver here, not about the DP
> driver. For the DP driver please use struct msm_dp_desc.
> 

Yes DPU driver.

>>
>> If we see that pattern is possible once that lands, why not.
>>
>> Right now, I would leave it at dpu_mdss_cfg.
>>
>>>>
>>>>>
>>>>>>>
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 +---
>>>>>>>>     .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 +---
>>>>>>>>     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 38 +++----------------
>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 ++--
>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>>>>>>>>     19 files changed, 41 insertions(+), 115 deletions(-)
>>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>
>>>
>>>
> 
> 
> 
