Return-Path: <linux-arm-msm+bounces-80217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C0C2F599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41B3189D904
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69652C029E;
	Tue,  4 Nov 2025 05:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grwGwWlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avl0e7/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A3029B8E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233120; cv=none; b=knaaEoZp0c+cdChzxvZXjxuH2SUoYS6ZcY45RgdIqRDJGqK/WzF0umanvWXk/0qURszSRGcjDC7GbTCK9WZzOQsaSuG9MmGpMd1nzhAhdijueH121wUHtusGC/Dba39KLC5M93LKXR+rGJfQ4zQRTt6CMSAYnfPT1+1tTW36k/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233120; c=relaxed/simple;
	bh=snt4a6gM1yB1+dwnBzQjliDYl2oTTCrQgWqYYKjuSTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkuSdGvTjz2F3Yf6uRk6qe2N6W+F5TZVeXhWEZwr7pqE7rQnNVHLXLd6LPM8Ob9coq8vpq6otjI9E+MFhVQRF8ehr4to9Svs88GnuNYwWEM682B8l4NzljnODenoNuLFkQommbklNmimnGAvg6jX3pS5o7MbHInSUaye+tzDXWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grwGwWlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avl0e7/0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43jHwS3693546
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGryW4CEc87/Tt1XZQLnliN/v9v2MGDye/ECRBVzEMs=; b=grwGwWlKn4tmUIKP
	U0W2QorHqK61yGh4jLf34SkYX9RUZv0DHaxXjwNrRSRuq/rF9ofwyqN91ugck4Qz
	CK8/1+twFEhx7QT2qw1gD9sDbx2eGS3GTCo/AnL6nowAbMVLtcElZMjaksERjCwZ
	1+CWgEeKDXE8Q6OVoWTnY017km5wmQz9LQF5674qv7CPFbkFc1Wjt2ukAwwtfjub
	ttyFOkAd8lJLsE+KhBXLovk+Q3obVlXwlIN4kS7gWuba9gFrokjdIZsvvOKEDyKE
	senTp/8EScPkrsuedUxAekU0yqrIKZs3Amwl5FmSsgj7wLV/VjaD5ET4pReXZz49
	DEhXyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70gm9pp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:11:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295592eb5dbso30412655ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762233117; x=1762837917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGryW4CEc87/Tt1XZQLnliN/v9v2MGDye/ECRBVzEMs=;
        b=avl0e7/0MVD1GxP5VxxOO7d4nQuu96TpqAb8/mRyztUlxKSBuWGYzb0fxsQGpGJEGc
         qjuKInu8FLDqfYCQR/VA7am81kv5qJmlajX+xbOacI0HuOnpTLR64Z4yWLl9oFWdj6ao
         gZDbA/+DnbyQpovUtE3+oIXvaFzJx033WcKoQMSNzpKUp2Z0DBeCmZOAppZVURQ8Mx2G
         ohieIwFgZpLJW7q5KRyorOYJvK2Mj4frZQ4m2nbusIT03dvXzY5DN6SXqYr9bwhGNmjV
         S/G8nskm3GeFQEMHt2VwLm20UFOlr/2ssvN6VzBun+Ecs6eDN7NS+T2R0g7uUpCWkt6i
         u8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762233117; x=1762837917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGryW4CEc87/Tt1XZQLnliN/v9v2MGDye/ECRBVzEMs=;
        b=T9x1YscZOT3A5l8+PUunJCDJmwii0odSYsr1jw4cZ1f8qOqRZ2oh/ZNvxxczcD7DIu
         oxb5BDT56zg9nuekhK9zm3e7zWgMq94n7Ma1NOay6lcb9Erdte8MJsXRLspEICa3YLh3
         sEs2eGwQ9FGL1dm+Mji1SBVz3tDkm9YfRxrk+kX2aT8t/z2fxCYCLS3OT7Jznt45BRCg
         PrrXHO6LTw/Ju3bitQmtLwOBmmBUR4I7A00CD6nlqi+zE/MFM4aD63NlFJ16+3Xo7HrW
         jgvf0SsIhUJy60AQaYdDOzeb0NzdG/E3o54rGCHCtYc8912+0M77KolVUrWfophwPCfO
         GaeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgu552gd4wx6xx+F/sXn20a7oBmtdchlWTZvxGwW4xIsPX3L1FXsgbNF8pH7+PoKAymqXUI2eSqTeSvEkw@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZljE2xhnR+g0i+6SOACZ35vjQdgNsQ8jD9aKGCPxGTpNgvdM
	UgaPvifC1T8HuidmS/sYSxtqVOk46JypniF9O0lrj8/GNR8kg7qpqdoZWutpNbt9ecHV+mA9ur3
	sRUsTuvi6X0rvWQM8dnVWGxgC1UZEWdLfbMeUb2EDDHnc2B8x8c1JAy6FwCyOSkBeXyVZ
X-Gm-Gg: ASbGncukLfISJrxOLuIwZFLBQKGhjb2quVn30nfXg4Ah9HGmhNdHu+Zm9h27jpQNAGw
	1ag3e0eCakRmKOqRGIZv55lc4Nl3roobTaM9ySAl9DRC5/yjuRfoyf4SWNEbcVqeqnu9U3vTmkB
	VqT9dLg7ZA5maj6noK9K/FAJ7d9eUplxNJ39RFItXPQeDrYqQF7gFd/sG66xZRXfRLG/6OXTAdW
	26nRFNUu7f+qZ2CpZ+6ZbMQGLzJTe2yF+3/e79jpcjPkqZLyutGzARGUMddu0JlToCBPgVcO748
	zwHIpa0SRYFkdB33AYiOAFtFsfILA6Vqe5FGsl/dSND5KooCS/KlYohwtMYnQCqUjTwaMoWveLd
	HH7HMQiv2wAI32u1qcJH1nA2IK0YgJQE=
X-Received: by 2002:a17:902:e543:b0:295:64ed:849f with SMTP id d9443c01a7336-29564ed8764mr128372565ad.23.1762233117256;
        Mon, 03 Nov 2025 21:11:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq5Co6GL9Lldr0BhRr6y6fUMskpIrdSMHFXTmXxUU05T4qw1TBL7h3nimrsBrliTc5uNVPLw==
X-Received: by 2002:a17:902:e543:b0:295:64ed:849f with SMTP id d9443c01a7336-29564ed8764mr128372185ad.23.1762233116696;
        Mon, 03 Nov 2025 21:11:56 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a3a2edsm10446185ad.67.2025.11.03.21.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 21:11:56 -0800 (PST)
Message-ID: <f5bc74d2-5d41-9682-68e8-fafd8953040e@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 10:41:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Refine internal buffer reconfiguration logic
 for resolution change
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
References: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
 <41ef734f56c0168e65e149cabf28d585ee5f2428.camel@ndufresne.ca>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <41ef734f56c0168e65e149cabf28d585ee5f2428.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 49e4W6scpMiQT8iHIgHQKaMhVumFVvJM
X-Proofpoint-GUID: 49e4W6scpMiQT8iHIgHQKaMhVumFVvJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0MCBTYWx0ZWRfXwv5Ht+O7Lgeu
 tjHFhU+HvVOaKX1rYBb8GZPTjGhZNyT3SmRZ2frgk6rXdSmywBsho8Mwn3I5tqCgf1VVmu7InFu
 PpKDIRl2U2rPnDjAANCRfi8T72qPXmXeoA6nDa2Clpan5hS+l3z8DJYjqOQKGnrKW/jJojEPCYw
 hZuC+UK5YUAaqTMXOUs/o7TrhRKo3heF1CR1hHuMRiHvMwomIgJa2Az7EAc6i4iHkRBCCVuCe+t
 08Zr7xqQ/WmENE0hRIa7tUdaKm7KXiRJ/K2tPvlHv/j2+2w2107grnut/OIvhAAttwjOJcKeeNd
 V2RDONmf/wXEZt0eEO8JX0efsqxdqHBW/3MeJWDafe+dbrADBJedhXSFWebG/rHodoKqxY1Iq3y
 yWSwYTxYvNy/Ic9J4QfMNyMzs1B4NA==
X-Authority-Analysis: v=2.4 cv=CeMFJbrl c=1 sm=1 tr=0 ts=69098b1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=ijreM6O3ZO-Kawz5C4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040040



On 11/4/2025 12:03 AM, Nicolas Dufresne wrote:
> Le lundi 03 novembre 2025 à 16:35 +0530, Dikshita Agarwal a écrit :
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
>> Reported-by: Val Packett <val@packett.cool>
>> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Thanks for working on this.
> 
>> ---
>>  drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
>> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25c1e5bca0abe501f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>> @@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *inst)
>>  
>>  int iris_process_streamon_output(struct iris_inst *inst)
>>  {
>> +	bool drain_active = false, drc_active = false, first_ipsc = false;
>>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> -	bool drain_active = false, drc_active = false;
>>  	enum iris_inst_sub_state clear_sub_state = 0;
>>  	int ret = 0;
>>  
>>  	iris_scale_power(inst);
>>  
>> +	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
>> +
>>  	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>>  		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
>>  
>> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>>  	else if (drain_active)
>>  		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>>  
>> -	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
>> +	 /* Input internal buffer reconfiguration required incase of resolution change */
> 
> There is a spurious space here and also, "incase" -> "in case"

Sure, addressed in v2.

Thanks,
Dikshita
> 
>> +	if (first_ipsc || drc_active) {
>>  		ret = iris_alloc_and_queue_input_int_bufs(inst);
>>  		if (ret)
>>  			return ret;
> 
> cheers,
> Nicolas
> 
>>
>> ---
>> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
>> change-id: 20251103-iris-seek-fix-7a25af22fa52
>>
>> Best regards,

