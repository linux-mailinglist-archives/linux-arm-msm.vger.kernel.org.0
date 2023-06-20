Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8407377F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 01:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjFTXiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 19:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjFTXiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 19:38:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E627170D;
        Tue, 20 Jun 2023 16:38:03 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KNHMmC004144;
        Tue, 20 Jun 2023 23:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2/SpucmImkJt3+6zEOwv9vXtPfBgs48jEHI4k2mpSbs=;
 b=CYaaJLColwWHonAGssdHwffbKONJppvfrkfQ/yf19+cK6M5un9+6kVxCrxZBP6Pet1Ri
 FR+p5B7GmTDAG0wE7Iv+u81ahbmYlYAEzNyVbd3axQyZB719gkdeRUQ8L+ob5PE4YJU/
 1LaL6Jl5K3cU+HrfnxZgelvhkGVQHIfGezjW1Uw0faExT27zRecdFyzJxNuqvii/R5EM
 K/SmoXPhS5/NyZ/xX6ay84isW3LICicBtTJaOoX4mgTC8rqOVzSggsRpEsw47dXeKEsv
 dTgnx1qxEfYYiHEyg3tbqLe/uMzBw+mwsBRdRJZv2rVrMuF4nzsPfGIUwAxlBA+KwOiz dg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rax7n2vf3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Jun 2023 23:37:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KNbu5U017257
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Jun 2023 23:37:56 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 16:37:56 -0700
Message-ID: <4a211b3e-7edd-3d55-58de-d69af294f712@quicinc.com>
Date:   Tue, 20 Jun 2023 16:37:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <6d11e420-1b95-0029-ec7a-17fbc8acb5ca@linaro.org>
 <827875ad-a446-10e7-6608-f9b0fa830a00@quicinc.com>
 <2b01b53a-9d8a-3b7d-d1bd-7d25eb77a9c0@linaro.org>
 <6ebab21c-5b1a-f9d7-e0c6-6a091e27761a@quicinc.com>
 <CAA8EJpoqnW08rtx0T5OhOUs5+5k8jgza7sLwqwqyU2_o-wH1cg@mail.gmail.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpoqnW08rtx0T5OhOUs5+5k8jgza7sLwqwqyU2_o-wH1cg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vgSP9r-JjPNEjj26smaayxQx5E23kLNT
X-Proofpoint-ORIG-GUID: vgSP9r-JjPNEjj26smaayxQx5E23kLNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200213
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/20/2023 3:11 PM, Dmitry Baryshkov wrote:
> On Wed, 21 Jun 2023 at 00:37, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 6/16/2023 5:37 PM, Dmitry Baryshkov wrote:
>>> On 17/06/2023 00:10, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/14/2023 1:43 PM, Dmitry Baryshkov wrote:
>>>>> On 14/06/2023 23:39, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 6/14/2023 12:54 PM, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/14/2023 12:35 PM, Abhinav Kumar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 6/14/2023 5:23 AM, Marijn Suijten wrote:
>>>>>>>>> On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
>>>>>>>>>> On 14/06/2023 14:42, Marijn Suijten wrote:
>>>>>>>>>>> On 2023-06-13 18:57:11, Jessica Zhang wrote:
>>>>>>>>>>>> DPU 5.x+ supports a databus widen mode that allows more data
>>>>>>>>>>>> to be sent
>>>>>>>>>>>> per pclk. Enable this feature flag on all relevant chipsets.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>>>>>>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>>>>>>>>>>>     2 files changed, 4 insertions(+), 1 deletion(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> index 36ba3f58dcdf..0be7bf0bfc41 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>>>>> @@ -103,7 +103,8 @@
>>>>>>>>>>>>         (BIT(DPU_INTF_INPUT_CTRL) | \
>>>>>>>>>>>>          BIT(DPU_INTF_TE) | \
>>>>>>>>>>>>          BIT(DPU_INTF_STATUS_SUPPORTED) | \
>>>>>>>>>>>> -     BIT(DPU_DATA_HCTL_EN))
>>>>>>>>>>>> +     BIT(DPU_DATA_HCTL_EN) | \
>>>>>>>>>>>> +     BIT(DPU_INTF_DATABUS_WIDEN))
>>>>>>>>>>>
>>>>>>>>>>> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.
>>>>>>>>>>> In the
>>>>>>>>>>> last patch for DSI you state and enable widebus for DSI 6G 2.5+
>>>>>>>>>>> only,
>>>>>>>>>>> meaning DPU and DSI are now desynced, and the output is completely
>>>>>>>>>>> corrupted.
>>>>>>>>>
>>>>>>
>>>>>> I looked at the internal docs and also this change. This change is
>>>>>> incorrect because this will try to enable widebus for DPU >= 5.0 and
>>>>>> DSI  >= 2.5
>>>>>>
>>>>>> That was not the intended right condition as thats not what the docs
>>>>>> say.
>>>>>>
>>>>>> We should enable for DPU >= 7.0 and DSI >= 2.5
>>>>>>
>>>>>> Is there any combination where this compatibility is broken? That
>>>>>> would be the strange thing for me ( not DPU 5.0 and DSI 2.5 as that
>>>>>> was incorrect)
>>>>>>
>>>>>> Part of this confusion is because of catalog macro re-use again.
>>>>>>
>>>>>> This series is a good candidate and infact I think we should only do
>>>>>> core_revision based check on DPU and DSI to avoid bringing the
>>>>>> catalog mess into this.
>>>>>
>>>>> I have just a single request here: can we please have the same
>>>>> approach for both DSI and DP? I don't mind changing DP code if it
>>>>> makes it better. If you don't have better reasons, I like the idea of
>>>>> DSI/DP dictating whether wide bus should be used on the particular
>>>>> interface. It allows us to handle possible errata or corner cases
>>>>> there. Another option would be to make DPU tell DSI / DP whether the
>>>>> wide bus is enabled or not, but I'd say, this is slightly worse
>>>>> solution.
>>>>>
>>>>
>>>> Today, DP's widebus does not check if DPU supports that or not.
>>>>
>>>> DPU encoder queries the DP whether widebus is available and enables it.
>>>>
>>>> We can also do the same thing for DSI.
>>>>
>>>> So for intf_type of DSI, DPU encoder will query DSI if it supports
>>>> widebus.
>>>
>>> Not if it supports wide bus. But the check is whether enabling wide bus
>>> is requested by the output driver (DSI/DP).
>>
>> Hi Dmitry,
>>
>> Can you explain what you mean by "requested by output driver"? FWIW, if
>> the DSI version supports wide bus && if DSC is enabled, then wide bus
>> will be enabled in DSI.
> 
> Like for DP, let DSI select whether a wide bus should be enabled or
> not, then let DPU get this flag from DSI.

Got it -- so basically have DSI do the version check *and* the DSC check 
in some `msm_dsi_is_widebus_enabled()` helper and have DPU use that 
helper to check if widebus is enabled.

I think that should be fine.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>>
>>>> Then DSI will do its version checks and for DSC it will say yes.
>>>>
>>>> This way, we will never check for the DPU's core revision for DSI and
>>>> purely rely of DP/DSI's hw revisions.
>>>>
>>>> Thats fine with me because that way we again just rely on the hw
>>>> revision to enable the feature.
>>>>
>>>> But as a result I am still going to drop this patch which adds widebus
>>>> to the catalog as a dpu cap which I always wanted to do anyway as we
>>>> will just rely on the DSI and DP hw revisions.
>>>
>>> Yep.
>>>
>>>>
>>>>>>
>>>>>>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
>>>>>>>>> corrupted with this series so something else on this series might be
>>>>>>>>> broken.
>>>>>>>>>
>>>>>>>
>>>>>>> Missed this response. That seems strange.
>>>>>>>
>>>>>>> This series was tested on SM8350 HDK with a command mode panel.
>>>>>>>
>>>>>>> We will fix the DPU-DSI handshake and post a v2 but your issue
>>>>>>> needs investigation in parallel.
>>>>>>>
>>>>>>> So another bug to track that would be great.
>>>>>>>
>>>>>>>>>>> Is the bound in dsi_host wrong, or do DPU and DSI need to
>>>>>>>>>>> communicate
>>>>>>>>>>> when widebus will be enabled, based on DPU && DSI supporting it?
>>>>>>>>>>
>>>>>>>>>> I'd prefer to follow the second approach, as we did for DP. DPU
>>>>>>>>>> asks the
>>>>>>>>>> actual video output driver if widebus is to be enabled.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I was afraid of this. This series was made on an assumption that
>>>>>>>> the DPU version of widebus and DSI version of widebus would be
>>>>>>>> compatible but looks like already SM8150 is an outlier.
>>>>>>>>
>>>>>>>> Yes, I think we have to go with second approach.
>>>>>>>>
>>>>>>>> DPU queries DSI if it supports widebus and enables it.
>>>>>>>>
>>>>>>>> Thanks for your responses. We will post a v2.
>>>>>>>>
>>>>>>>>> Doesn't it seem very strange that DPU 5.x+ comes with a widebus
>>>>>>>>> feature,
>>>>>>>>> but the DSI does not until two revisions later?  Or is this
>>>>>>>>> available on
>>>>>>>>> every interface, but only for a different (probably DP) encoder
>>>>>>>>> block?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Yes its strange.
>>>>>>>>
>>>>>>
>>>>>> I have clarified this above. Its not strange but appeared strange
>>>>>> because we were checking wrong conditions.
>>>>>>
>>>>>>
>>>>>>>>> - Marijn
>>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
>>>
> 
> 
> 
> -- 
> With best wishes
> Dmitry
