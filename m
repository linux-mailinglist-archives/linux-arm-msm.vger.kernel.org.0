Return-Path: <linux-arm-msm+bounces-8936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4784181B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 02:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B18E1F246FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 01:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3616836113;
	Tue, 30 Jan 2024 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="asLbpb4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669122C868
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 01:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706576877; cv=none; b=MEhTH7rXmqLmILSAKnQp1O/Y09W1dCFAYDmUNDmM0SJk7cguv7iIuPa/KBy1rJgByOj11V7zcV1we5OWRMZBX0AARdJSDRDn0dusufKth42flpKLOJ4mff4O/+chcGerhxnr7UgCns7OMxFOlq0ePXgBiemKDu1tS2Sx8dj4zVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706576877; c=relaxed/simple;
	bh=VbhT7DvP8+2oLBGQwI7EPYDGdOVSxx5vMsQYRKgIhp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Uja3bitENNbgwP9eaX4Rx42F+z/Ln/Rdm9MHW9cdqGswSKMG+jdoloAyXEuoy365QwQow4LVCvcoKEx+ralv6dVxNr0PStN2AWvgKQBgZBwm+l8gRUYA0TLKLc21M40ANWapW0RUF9iKrucvrD36zJaYFan/1mhIOSs/tdcmszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=asLbpb4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U0BZeL031420;
	Tue, 30 Jan 2024 01:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EX8vk7iwfWKbd5yKzKUwC3SVejcb2f4408uJYvbXWzc=; b=as
	Lbpb4U/ydQnccKV4zQM4vCJGHJFpdO8MQ+Kz6ZdIigBeeKwYqG68wnKeyzIB88eP
	GWdhNDzW6z1d882tLJo4VkxIxOg77KY9V4kjq31dciBi9nBArbL05x4QjmYU9Fi7
	0s1oD/9Wb89X3C+T2VvUhDOeodEFrHMFloXN6xv5qKcdjsKSYV4lvwf7X12CWIja
	zRr2u+IKJX1Mi3kL5H1iZbQ2aJIw2QNwPOBslnqJYa4+CCe8AzBM3N6Bjwrggg2n
	RAPGZNLtAbfberw4RO0vvJ8rrtfRetbR6godDcPbQgXW+Ob90twRBigrkAq7RpOr
	tGcrSv9f8iyen1TOiwPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxexr92qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:07:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U17lrt009524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:07:47 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 17:07:46 -0800
Message-ID: <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com>
Date: Mon, 29 Jan 2024 17:07:46 -0800
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p6D88WY8O4P3dQW5aIx5_s09RaNls33M
X-Proofpoint-ORIG-GUID: p6D88WY8O4P3dQW5aIx5_s09RaNls33M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=803 bulkscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300007



On 1/29/2024 4:03 PM, Dmitry Baryshkov wrote:
> On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
>>> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>>
>>>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
>>>>>> YUV420. Therefore, program the INTF to send 1 ppc.
>>>>>
>>>>> I think this is handled in the DP driver, where we disallow wide bus
>>>>> for YUV 4:2:0 modes.
>>>> Yes we do disallow wide bus for YUV420 modes, but we still need to
>>>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
>>>> this check.
>>>
>>> As I wrote in my second email, I'd prefer to have one if which guards
>>> HCTL_EN and another one for WIDEN
>>>
>> Its hard to separate out the conditions just for HCTL_EN . Its more
>> about handling the various pixel per clock combinations.
>>
>> But, here is how I can best summarize it.
>>
>> Lets consider DSI and DP separately:
>>
>> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
>>
>> This is same the same condition as widebus today in
>> msm_dsi_host_is_wide_bus_enabled().
>>
>> Hence no changes needed for DSI.
> 
> Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
> enabled, while you have written that HCTL_EN should be set in all
> cases on a corresponding platform.
> 

Agreed. This is true, we should enable HCTL_EN for DSI irrespective of 
widebus for the versions I wrote.

Basically for the non-compressed case.

I will write something up to fix this for DSI. I think this can go as a 
bug fix.

But that does not change the DP conditions OR in other words, I dont see 
anything wrong with this patch yet.

>>
>> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
>> as they are independent cases. We dont support YUV420 + DSC case.
>>
>> There are other cases which fall outside of this bucket but they are
>> optional ones. We only follow the "required" ones.
>>
>> With this summary in mind, I am fine with what we have except perhaps
>> better documentation above this block.
>>
>> When DSC over DP gets added, I am expecting no changes to this block as
>> it will fall under the widebus_en case.
>>
>> With this information, how else would you like the check?
> 
> What does this bit really change?
> 

This bit basically just tells that the data sent per line is programmed 
with INTF_DISPLAY_DATA_HCTL like this cap is suggesting.

         if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
                 DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
                 DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, 
display_data_hctl);
                 DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
         }

Prior to that it was programmed with INTF_DISPLAY_HCTL in the same function.

>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> @@ -168,7 +168,9 @@ static void
>>>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>>>>>          * video timing. It is recommended to enable it for all cases,
>>>>>> except
>>>>>>          * if compression is enabled in 1 pixel per clock mode
>>>>>>          */
>>>>>> -    if (p->wide_bus_en)
>>>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
>>>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>>>>>> +    else if (p->wide_bus_en)
>>>>>>             intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>>>>>           data_width = p->width;
>>>>>
>>>
>>>
>>>
> 
> 
> 

