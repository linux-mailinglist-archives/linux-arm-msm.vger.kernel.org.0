Return-Path: <linux-arm-msm+bounces-41843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF69EFC2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1EB28A3FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D1D18C035;
	Thu, 12 Dec 2024 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cvPMGS5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF6189B8B;
	Thu, 12 Dec 2024 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030961; cv=none; b=dJR3kir8o1UOzmPkU0YHyZdYGD2yzlXfsAs61Fr1HbR9eXTr/4uvOh/tBBhCeIrDEQS7hEUzy5wffEWYbaRMFgihAzmReWVDeTgHsaAT8SuAXs4W14ya0GYpf3a975GKMrVAGhvJ/5Tv2+RpsoFsg4kFdzA6fGA4lspQMucPKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030961; c=relaxed/simple;
	bh=LGfX5ZgX2lsQWXfVjlgNlPppx3VLClAQOW8XBHOQHLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U6VNcRR2oASes8pZezO5wGqLt5ekq9s4uM/HoElzM/CudhFB8oWuGVXQWrfWqoZsvORyT35W+MejhO8BgauwsMC9pBTWpjMMM1kwt2vzb2aQBB3Sg6QDJuimDPQb+lIOwIhXQXSxAsCJPctAJoKVCUcwe2QxkzgJcuO2dQY3+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cvPMGS5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCwqYX000445;
	Thu, 12 Dec 2024 19:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si5rphHa4Zkvnkh6M8fFKZ5yl3Cn3vMgEo7wPFfWRo8=; b=cvPMGS5SpoG9fjFF
	XMI1NUHYPt9jdACaimDjswf8GD4xRdbDr5hVVYhHVm1NBF/7XqchCuGXpB+Z+uAu
	z3jpfDfOgMvAHRV0lV5gS/zmJCQwczGRF04xsiQBjUYMS5kgZApsybQ/CC6C602h
	jxQ6pK1Vs9U9/2bJpZn5hKRZNJ4qXGgCp8eOdT5f1ios7bXm9lZr6oA55955CmC3
	eVr0MdSLgiTS1dwd0EagoELqO162Dz2b44Pc9Hx11FJmw6OEej7WLq39iNE8EMGv
	fvJx7k4h9jla6s5fggnpwkAuGW9+ubOHnnl/73XH6+cHhcQlIZxg7ix6izET/RL2
	rPZWQA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes2grh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:15:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCJFo8j027764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:15:50 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 11:15:49 -0800
Message-ID: <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
Date: Thu, 12 Dec 2024 11:15:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org>
 <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
 <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eLEz5zxPoOm2eDuCCX5cE5IukOzJBz05
X-Proofpoint-ORIG-GUID: eLEz5zxPoOm2eDuCCX5cE5IukOzJBz05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120139



On 12/12/2024 12:52 AM, Dmitry Baryshkov wrote:
> On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
>>> Having I/O regions inside a msm_dp_catalog_private() results in extra
>>> layers of one-line wrappers for accessing the data. Move I/O region base
>>> and size to the globally visible struct msm_dp_catalog.
>>>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
>>>    2 files changed, 197 insertions(+), 272 deletions(-)
>>>
>>
>>
>> Fundamentally, the whole point of catalog was that it needs to be the
>> only place where we want to access the registers. Thats how this really
>> started.
>>
>> This pre-dates my time with the DP driver but as I understand thats what
>> it was for.
>>
>> Basically separating out the logical abstraction vs actual register writes .
>>
>> If there are hardware sequence differences within the controller reset
>> OR any other register offsets which moved around, catalog should have
>> been able to absorb it without that spilling over to all the layers.
>>
>> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
>>
>> Then the reset_ctrl op of the catalog should manage any controller
>> version differences within the reset sequence.
> 
> The problem is that the register-level writes are usually not the best
> abstraction. So, instead of designing the code around dp_catalog I'd
> prefer to see actual hw / programming changes first.
> 

So thats the issue here. If we did end up with registers and sequences 
different for controller versions, the ctrl layer was expected to just 
call a reset() op for example similar to the DPU example you gave. And 
as you rightly noted, the dpu_hw_xxx files only expose the ops based on 
version and the upper layers were supposed to just call into the ops 
without knowing the register level details. Thats pretty much what 
dp_ctrl tried to do here. We did not want to expose all the register 
defines in those layers. This series is doing exactly opposite of that.

>>
>> We do not use or have catalog ops today so it looks redundant as we just
>> call the dp_catalog APIs directly but that was really the intention.
>>
>> Another reason which was behind this split but not applicable to current
>> upstream driver is that the AUX is part of the PHY driver in upstream
>> but in downstream, that remains a part of catalog and as we know the AUX
>> component keeps changing with chipsets especially the settings. That was
>> the reason of keeping catalog separate and the only place which should
>> deal with registers and not the entire DP driver.
>>
>> The second point seems not applicable to this driver but first point
>> still is. I do admit there is re-direction like ctrl->catalog
>> instead of just writing it within dp_ctrl itself but the redirection was
>> only because ctrl layers were not really meant to deal with the register
>> programming. So for example, now with patch 7 of this series every
>> register being written to i exposed in dp_ctrl.c and likewise for other
>> files. That seems unnecessary. Because if we do end up with some
>> variants which need separate registers written, then we will now have to
>> end up touching every file as opposed to only touching dp_catalog.
> 
> Yes. I think that it's a bonus, not a problem. We end up touching the
> files that are actually changed, so we see what is happening. Quite
> frequently register changes are paired with the functionality changes.
> 

Not exactly. Why should dp_ctrl really know that some register offset or 
some block shift happened for example. It only needs to know when to 
reset the hardware and not how. Thats the separation getting broken with 
this.

> For example (a very simple and dumb one), when designing code around
> dp_catalog you ended up adding separate _p1 handlers.
> Doing that from the data source point of view demands adding a stream_id param.
> 

I have not checked your comment on that series here but if your concern 
is stream_id should not be stored in the catalog but just passed, thats 
fine, we can change it. stream_id as a param is needed anyway because 
the register programming layer needs to know which offset to use. This 
series is not mitigating that fact.

> In the DPU driver we also have version-related conditionals in the HW
> modules rather than pushing all data access to dpu_hw_catalog.c &
> counterparts.

The dpu_hw_catalog.c and the dp_catalog.c are not the right files to 
compare with each other. dp_catalog.c should be compared with 
dpu_hw_xxx.c and as you noted, DPU version dependencies are handled in 
those files only and not all over the files like what this series is doing.

> I think it's better to make DP driver reflect DPU rather than keeping
> a separate wrapper for no particular reason (note, DPU has hardware
> abstractions, but on a block level, not on a register level).
> 

Thats the issue here. DPU hardware blocks are arranged according to the 
sub-blocks both in the software interface document and hence the code 
matches it file-by-file. DP registers are grouped by clock domains and 
the file separation we have today does not match that anyway. Hence 
grouping link registers writes or pixel clock register writes into 
dp_ctrl is also not correct that way. Let catalog handle that separation 
internally which it already does.

