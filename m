Return-Path: <linux-arm-msm+bounces-8948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E6841BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67BA28891B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50597381B6;
	Tue, 30 Jan 2024 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I3aGg/la"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A32381B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706594622; cv=none; b=o29k1pelIF8lCwJq02bcabhcS2Nx72HHWePW1L9K+bGp1vHwkFEbB/ZvW7jJ7BlmMnF1KHw37f5jvKQh6EmWjJfbIW6+BfJU9nHbdtiHuLu4EHsTPTBngm9oobBNsoCLvsx5VowssdDE8CpFfc2tmhcyify+5CsCfcwawLx2TKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706594622; c=relaxed/simple;
	bh=AZscpL+9PrHP3WclzIvT7OFXpBXdEw4id8dghiu/gQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bgqIx631f1fuzWk4ad7VrFq8DkigpC35PSZlPWFIBj5pelme36ih4CfT4jtjjw719AXe6nPNvf7VtNoe+AEHzP/d0oJ+cCX18gHPxLiSeH3Wbaz6q5S+uhQOXRArywJV8LDVS5CcxEImA7vvIm7+TL5nJyJZhytAeQjH7X+8ENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I3aGg/la; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U2omLT004649;
	Tue, 30 Jan 2024 06:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Pk7nS8nM01A3Vh0RhXya7/xihKQB34wXMNGjXxZ0GYc=; b=I3
	aGg/laEjpDoG0lc5dQr35dqr4hK0PDJLXB805y8lBBZP8MNZBWiofGiFb1dC78IF
	+4Ynv46vCJdIFxZuB6k1JJejkpbbDUTQnNQkMprCzdTtetEDFPP7JUASOgP/QWZK
	VDkn9sG5Jj71+uoQgIYOtc/wtTf8a59IMQCGgyw8Tl0/5InAtyjhwJuyl7ewAz83
	pjF1A5pj6WuUV4i+YXiPqC5WxBie727NLi5mWKz052QguSKlnmrk/Szd4u+T7KSf
	QXaD6iZ3ev1zOXoholWZc5Qu32ftolGnhtO1BbGT4dvW1pqjUR28+rbqp8BaM+W8
	+6TP6FIhqsDNT6aftv6g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxr2v0bm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:03:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U63U4s018934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:03:30 GMT
Received: from [10.110.15.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 22:03:29 -0800
Message-ID: <8f834e24-cfa4-cf58-5c60-d26c042fc034@quicinc.com>
Date: Mon, 29 Jan 2024 22:03:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
 <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
 <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
 <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
 <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com>
 <CAA8EJprhZ+AyjjUM46_qmYeOytX60ncLbFw0mC7V5bBT4MoN6w@mail.gmail.com>
 <697b153b-fb8e-6b58-fc4f-92f814f86d0f@quicinc.com>
 <CAA8EJpp+k9u4L4O9_V4Ypu-8ROUkVkRt3pL5Tot+eGC39EqNaw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp+k9u4L4O9_V4Ypu-8ROUkVkRt3pL5Tot+eGC39EqNaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L4XVTkUKcnp5tpbWatLwPHanG5BVfAFe
X-Proofpoint-ORIG-GUID: L4XVTkUKcnp5tpbWatLwPHanG5BVfAFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=868
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300041



On 1/29/2024 9:28 PM, Dmitry Baryshkov wrote:
> On Tue, 30 Jan 2024 at 06:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/29/2024 5:43 PM, Dmitry Baryshkov wrote:
>>> On Tue, 30 Jan 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/29/2024 4:03 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>>>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
>>>>>>>>>> YUV420. Therefore, program the INTF to send 1 ppc.
>>>>>>>>>
>>>>>>>>> I think this is handled in the DP driver, where we disallow wide bus
>>>>>>>>> for YUV 4:2:0 modes.
>>>>>>>> Yes we do disallow wide bus for YUV420 modes, but we still need to
>>>>>>>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
>>>>>>>> this check.
>>>>>>>
>>>>>>> As I wrote in my second email, I'd prefer to have one if which guards
>>>>>>> HCTL_EN and another one for WIDEN
>>>>>>>
>>>>>> Its hard to separate out the conditions just for HCTL_EN . Its more
>>>>>> about handling the various pixel per clock combinations.
>>>>>>
>>>>>> But, here is how I can best summarize it.
>>>>>>
>>>>>> Lets consider DSI and DP separately:
>>>>>>
>>>>>> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
>>>>>>
>>>>>> This is same the same condition as widebus today in
>>>>>> msm_dsi_host_is_wide_bus_enabled().
>>>>>>
>>>>>> Hence no changes needed for DSI.
>>>>>
>>>>> Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
>>>>> enabled, while you have written that HCTL_EN should be set in all
>>>>> cases on a corresponding platform.
>>>>>
>>>>
>>>> Agreed. This is true, we should enable HCTL_EN for DSI irrespective of
>>>> widebus for the versions I wrote.
>>>>
>>>> Basically for the non-compressed case.
>>>>
>>>> I will write something up to fix this for DSI. I think this can go as a
>>>> bug fix.
>>>>
>>>> But that does not change the DP conditions OR in other words, I dont see
>>>> anything wrong with this patch yet.
>>>>
>>>>>>
>>>>>> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
>>>>>> as they are independent cases. We dont support YUV420 + DSC case.
>>>>>>
>>>>>> There are other cases which fall outside of this bucket but they are
>>>>>> optional ones. We only follow the "required" ones.
>>>>>>
>>>>>> With this summary in mind, I am fine with what we have except perhaps
>>>>>> better documentation above this block.
>>>>>>
>>>>>> When DSC over DP gets added, I am expecting no changes to this block as
>>>>>> it will fall under the widebus_en case.
>>>>>>
>>>>>> With this information, how else would you like the check?
>>>>>
>>>>> What does this bit really change?
>>>>>
>>>>
>>>> This bit basically just tells that the data sent per line is programmed
>>>> with INTF_DISPLAY_DATA_HCTL like this cap is suggesting.
>>>>
>>>>            if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>>>>                    DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>>>>                    DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL,
>>>> display_data_hctl);
>>>>                    DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>>>>            }
>>>>
>>>> Prior to that it was programmed with INTF_DISPLAY_HCTL in the same function.
>>>
>>> Can we enable it unconditionally for DPU >= 5.0?
>>>
>>
>> There is a corner-case that we should not enable it when compression is
>> enabled without widebus as per the docs :(
> 
> What about explicitly disabling it in such a case?
> I mean something like:
> 
> if (dpu_core_rev >= 5.0 && !(enc->hw_dsc && !enc->wide_bus_en))
>     intf_cfg |= INTF_CFG2_HCTL_EN;
> 

Condition is correct now. But we dont have enc or dpu version in this 
function.

We need to pass a new parameter called compression_en to 
dpu_hw_intf_timing_params and set it when dsc is used and then do this. 
We have widebus_en already in dpu_hw_intf_timing_params.

This was anyway part of the DSC over DP but we can add that here and 
then the if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) is indicative 
of dpu version >=5 so we can move this setup there.

> 
>>
>> For DP there will not be a case like that because compression and
>> widebus go together but for DSI, it is possible.
>>
>> So I found that the reset value of this register does cover all cases
>> for DPU >= 7.0 so below fix will address the DSI concern and will fix
>> the issue even for YUV420 cases such as this one for DPU >= 7.0
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 6bba531d6dc4..cbd5ebd516cd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -168,6 +168,8 @@ static void dpu_hw_intf_setup_timing_engine(struct
>> dpu_hw_intf *ctx,
>>            * video timing. It is recommended to enable it for all cases,
>> except
>>            * if compression is enabled in 1 pixel per clock mode
>>            */
>> +
>> +       intf_cfg2 = DPU_REG_READ(c, INTF_CONFIG2);
>>           if (p->wide_bus_en)
>>                   intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN |
>> INTF_CFG2_DATA_HCTL_EN;
>>
>>
>> But, this does not still work for DPU < 7.0 such as sc7180 if we try
>> YUV420 over DP on that because its DPU version is 6.2 so we will have to
>> keep this patch for those cases.
>>
>>>>
>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>>>>>>>>>>       1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>>>> @@ -168,7 +168,9 @@ static void
>>>>>>>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>>>>>>>>>            * video timing. It is recommended to enable it for all cases,
>>>>>>>>>> except
>>>>>>>>>>            * if compression is enabled in 1 pixel per clock mode
>>>>>>>>>>            */
>>>>>>>>>> -    if (p->wide_bus_en)
>>>>>>>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
>>>>>>>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>>>>>>>>>> +    else if (p->wide_bus_en)
>>>>>>>>>>               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>>>>>>>>>             data_width = p->width;
>>>>>>>>>
>>>>>>>
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

