Return-Path: <linux-arm-msm+bounces-81025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9288C4707D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13261881B01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EBA223DF9;
	Mon, 10 Nov 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzjsP0iU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMx9iuqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE183054D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782722; cv=none; b=SJJOpCYoPnPscCqIVxMCKfxVFVBIMyH81IEqM/UAEvxtj3nm4pFaHAwb9FE2NTgq29RqBPRcV9if4NrU5G6mES8jI5KnILXnsJYcbuzbr9Z/ek026t5VlXZpY2joDgqA+2uVT1drhOt9q1CtAyvhGzDpy/XZg8zg4rZLyBVWroc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782722; c=relaxed/simple;
	bh=4H2fw1nZerKjCesvxPE/tv7CG+Zj55dfVDI0escuNWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJa8iA9v2EiSY5q9p1OjFtaQqM2PaLuASoqy38mHk/LZJZsm4Qiq0jwxuvhfovgWpfeGDA8GNM3fzQ1XFIGtjZwzuL8q+KeTJ/CNs+INWof1p+dqx+wjgw447IStCpRkqEDRGmFxG+fNYjdTCOfFn0d810qD47G8mgI0RRuIKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzjsP0iU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMx9iuqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9CgNg3146226
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZlV3jIxROciPtUCqpcLAitOvegR1QpOAc5SMbgsl7k=; b=KzjsP0iU+L0zRHhL
	Z0MFLqIYsKYfVMR418odKMNhC4UYcKfQVBqErdGlrvXdAYI4gx4qzTGpDdLMlkAs
	F828rcYyNa1j4PAz2ZlpGIh+0wDD3FEUlVau6j3tXMBUsvlL2HyMW6SpHVMhVWYy
	UK9mAFTKrkH2ZTQ1dMDJl/2RlrVNjYZgoZkDIHhM5ikQ0S1G7wnkC09QSGC4USW5
	4zk3MGw+76iUb6wuQsFABEUD1T1mWczuf786DKmT/+AKVzBZ2kziuBhdmOQmEMei
	QFzMG6V1pyet4V5kRZt3WxQsPtbRUiqmYQRbLNt18ikznKHjOpbundYfMqFyWnxw
	61GU5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7hrsys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:51:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29557f43d56so39387835ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762782718; x=1763387518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZlV3jIxROciPtUCqpcLAitOvegR1QpOAc5SMbgsl7k=;
        b=OMx9iuqPENASHMh9jiIpA0ouxHqXs8cgxWB9Gmq8GAXbEAE5ROiKU+OnlcX7GqFzmo
         +v/9HvrnkmM4EE1+l4xkxAKWZaPoSKD28BC8ncPpRYnDGPeWqbBCCijafizFY+vuqxZ0
         wuq2jCj2yHHBrkrSWQ/tRFW/TRAsFvHpU5bM4QjRrfSdNa1XYUZrL9CvdamzCTp8Ceuq
         HVTJS6lO9Ec6mTJ4M4rYSs4UnxIAN2G6HWgk8Z90RugUquFG3zIHIu7M6u+SY2XPXXx6
         x0aLUqmp+PAnMkFD+fKcdxTF2cFAheAbiZDaAV66Z27Xnr+3drLoDbf/XU4m2udboHDZ
         oGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782718; x=1763387518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZlV3jIxROciPtUCqpcLAitOvegR1QpOAc5SMbgsl7k=;
        b=LYwCPKdyRRj5q3W2/Gdc66fkAE21KAJO8wMrie6qiDgcw3pxrFljl4B/qdaY+GQH7J
         5tGxr7UtlC/EvA+CBVPnI6RLRqKFfN8hHsiMW+EtLjsVFZzlFGADMcac+Lz5putpCLkX
         AuJT1MLAQVA0mJ/89XWCkdvOmTKB8a/EghLY0c7kJLoXqwGcWwCg8euhFjQQWHqKJ+qT
         0FDBWVpZM2MGoVL4XHMZvUnUIhbbmzRDg5emoVaJ9QNx4GmbIMUr0OMSRmA+HvzYhmLT
         A7iLBLanGP51EU8q7rAlGMPNey7PAJgY+n8bwSHi//L703uBNr9d5ybUkDaiOSqymMbx
         4N+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7qRjkc/hhph5Q93Im3KUWA5PJqMoILRa8e0bNtFqAC/1fo+y9fqQayp3QyVGWoH4h7tGC+h0a9J17c0fw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65qTFktnDiu5qbzeGOfmC4+lq04HlgP1ojGEnvag+zscQS3N9
	T6JQs/YbWGcX4zorG3JYiNpJElQjOrTBUMr+TjyNV55IR8VjSt8gSl3yoRK8MtVje2QXFnTHJkW
	lfovsKpe3lOdxS/p+k+BxFXYucppTtn1RPtCbYE+A66NyPVA22FQ+C3mRn5bp3t5XZQBo
X-Gm-Gg: ASbGncsLNROIfhC+jA/9S/qCiWUajtKI4ZUMf6iwr53h9aEDcDsS7+m7IacXD7T1Kk9
	SWiG8z7E4Xf/NaWZpBbzS0Nz9H8T7PDQZBTPsdrfEyXyjqK15V5k9LsWBKn7rf4/VXYLLrYbM05
	Av75ddBX8Endsg+6JUWw4QQBQd76B2JqTTajnRMhiF4L03esvkrzLPlWQSMl3vj7xpaZ4Afv93m
	Z0oZZhXvh0rgOD9Vrt48/J6St54Qts3hf2k7aYEhjYYBBFy6WM8b4ZZuXtXEe3JVuGpRfUPbO1S
	BnFg1oWDA4Me6ryT65zgfytNf8rUoSYIJWUJvlmqrwE7rDTNFbuvUJgqB5BzHd7uzoAiMoexLTH
	fwy6Ff8VzAwUIsHuDI4CrfhNmba0iZeA=
X-Received: by 2002:a17:902:d581:b0:293:623:3260 with SMTP id d9443c01a7336-297e572957amr115879055ad.57.1762782717730;
        Mon, 10 Nov 2025 05:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfqiqS1BOPe+VMlfkJU0zIOGZuKtCtWI9NqPiJ0S4bKUKfTOQjBnZhjxrbV+/OQHnCK4jKBg==
X-Received: by 2002:a17:902:d581:b0:293:623:3260 with SMTP id d9443c01a7336-297e572957amr115878545ad.57.1762782717110;
        Mon, 10 Nov 2025 05:51:57 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c344838sm11109221a91.15.2025.11.10.05.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:51:56 -0800 (PST)
Message-ID: <f28068ea-c14b-8502-f252-3ddfe4eb874d@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 19:21:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
 <l2djrmw5i7dfvlrqyn3a5yrohbtpxr72xwwrgojvsfwo7w4feb@254rjgan2fyz>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <l2djrmw5i7dfvlrqyn3a5yrohbtpxr72xwwrgojvsfwo7w4feb@254rjgan2fyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t4modngGq3QA8NbbgzKlHo8UuYKhnxNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyMSBTYWx0ZWRfX/DmsJQXpIu6u
 DbGNLKmu5fi+n5QOYfdQrZ/VqfOQ4qQKtqGiOvFwIfuyYUhuu91kfipfAjPsozFHGDDeHg/Etlq
 ZFQrvEhgRaaWwb0sCTc/RFR7qmNM3d1aHXR4wl9Duh0GI4Lavkmrd/fa6AmoBZyG249Kq2AaUng
 VKQGA6wOnO3RXBPkl1B9Kz6xC6pITsZOS0NTc1QHfJXVBVewR6qroth1FslGwBSx3/f4NQEA1g8
 SyZbIbd/XGbcBC9R+sfJ2VxeqLI4nDDyINAQ47ZsOuUoj5D73yBKCtZPlPJth2qhJGb8XdzMCWf
 7GIAK9dq+XvHFz/FgXS+xsvacpTQsVSxN2Ac5QhwALT9ayFy1xoalL3g6nspcGSQDkckls1n4OM
 JJw+P9upoMdw1jIasjO/mhgzky6VKw==
X-Proofpoint-ORIG-GUID: t4modngGq3QA8NbbgzKlHo8UuYKhnxNN
X-Authority-Analysis: v=2.4 cv=Yt4ChoYX c=1 sm=1 tr=0 ts=6911edfe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mVG3C3KJgNa-X6cAQn4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100121



On 11/10/2025 7:05 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 05, 2025 at 11:17:37AM +0530, Dikshita Agarwal wrote:
>> Improve the condition used to determine when input internal buffers need
>> to be reconfigured during streamon on the capture port. Previously, the
>> check relied on the INPUT_PAUSE sub-state, which was also being set
>> during seek operations. This led to input buffers being queued multiple
>> times to the firmware, causing session errors due to duplicate buffer
>> submissions.
>>
>> This change introduces a more accurate check using the FIRST_IPSC and
>> DRC sub-states to ensure that input buffer reconfiguration is triggered
>> only during resolution change scenarios, such as streamoff/on on the
>> capture port. This avoids duplicate buffer queuing during seek
>> operations.
>>
>> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
>> Cc: stable@vger.kernel.org
>> Reported-by: Val Packett <val@packett.cool>
>> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - Fixed the compilation issue
>> - Added stable@vger.kernel.org in Cc
>> - Link to v2: https://lore.kernel.org/r/20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com
>>
>> Changes in v2:
>> - Removed spurious space and addressed other comments (Nicolas)
>> - Remove the unnecessary initializations (Self) 
>> - Link to v1: https://lore.kernel.org/r/20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com
>> ---
>>  drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
>> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..7f1c7fe144f707accc2e3da65ce37cd6d9dfeaff 100644
>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>> @@ -91,12 +91,14 @@ int iris_process_streamon_input(struct iris_inst *inst)
>>  int iris_process_streamon_output(struct iris_inst *inst)
>>  {
>>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> -	bool drain_active = false, drc_active = false;
>>  	enum iris_inst_sub_state clear_sub_state = 0;
>> +	bool drain_active, drc_active, first_ipsc;
>>  	int ret = 0;
>>  
>>  	iris_scale_power(inst);
>>  
>> +	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
>> +
>>  	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>>  		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
>>  
>> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>>  	else if (drain_active)
>>  		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>>  
>> -	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
>> +	/* Input internal buffer reconfiguration required in case of resolution change */
>> +	if (first_ipsc || drc_active) {
> 
> Another question: can this now result in PIPE being sent for the ENCODER
> instance?

This state check will never be true for Encoder.

Thanks,
Dikshita
> 
>>  		ret = iris_alloc_and_queue_input_int_bufs(inst);
>>  		if (ret)
>>  			return ret;
>>
>> ---
>> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
>> change-id: 20251103-iris-seek-fix-7a25af22fa52
>>
>> Best regards,
>> -- 
>> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>
> 

