Return-Path: <linux-arm-msm+bounces-108829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ0fGD7bDWrE4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:03:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C559166B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A848301BA76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AF4332ED0;
	Wed, 20 May 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gC+SUY9T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKzR4tjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4CC34040C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292513; cv=none; b=aCcYivQNbHmx10DbXnzN1vq9WrJ0BSLwGnuagjnO+Kyun3QsplGD1WYxiEU+dGAqkrUhvXVFU+2pluGqX4NwzBYBIcTndRUeDXwZOiLEKrbpeQStxjp+C4Wi4egxFjiB99VAoqZOySvJsJJEHAiL08+l54dZiPl2LwILF4SVUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292513; c=relaxed/simple;
	bh=MydiYcdXJJMPGn73m/PQRjZzWFHIM0/ltWmmjFvlNTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbTq05KOgDsI0t0aQBcnkF/5pfhuOV2QSBEpXRR8IqwnNMG1KbNVn/We9jmGTLckJHAJ64b9M+YjVHz7ipp3o6BLrTo9hpKKKnIcNxgdjSmBZfvub1v52xAkRguAMeSAQ6XtLmCLP/r3G74lbQqvmpoEaBF14WSdOYHS+W5H2Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gC+SUY9T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKzR4tjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6aGW119115
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=; b=gC+SUY9TytPD84Lz
	nLaz2UD3iJnhCx15pYJ5krXjDqdfFIH+mIEwZS/s+SLrOTtf3eSqZFDM9SXAVLua
	WB1gLIuPa5PMDk9TLXs9P6vwENE2ofXr90KVU117ph1CMvAYR6duFwc2oufgQNjY
	WgpWGuSKgoCzzoOXf8EZDVX47dLqNJ6jIVvwg7h2f4mygRDgzYlenbWplDTYMfcQ
	ykREZLuniKH7yDTTQY7VxhRWTXwFCilkA4+OZMvRi4eJj3qF3he+DmXaW+tATTSA
	/bDWXg6ai6o+8m8sQ+473k38WD4MpeJjGGGSBxstpxe3vzQYXe/eKa+C2iEiyGbo
	vcQF2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88fus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 15:55:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so4678047a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292507; x=1779897307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=;
        b=IKzR4tjfee9WZP4bf2suY4IM13RcajAMVn/q6vjV+k4oHBNlZYU+3n4lqAHPzTyvBT
         Ewm9bKBdGbQnK4eaORHAyrdGQeWb8l69FLJ+srjS4vxPKe+hfas/biZHWwxAIcw2LLV0
         oAfC3DRBIDVNICqxiGoLrvWPRA8XnU/x3CAsACo9tQAZPzQCrdACESNIG6aVIXF+KBV3
         HUHiix7pAwuVksMSxAON9U09kdkTyF8McWG2otGigDNZoQ1v1Bnud0Qo6vLpY9Md4132
         soO7+x5zsV8gxGXxA3zNjsvEe+s31wH+QPPmWhxfCH/AqZmNl1gPmYphvWI2BJlLSj6C
         CSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292507; x=1779897307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=;
        b=X7TdL9kPbFfEeF4j48gQHqGbzLZZut3XIXEVMw1yUnJvw0lVL/NUHoKGKfIkTyicyr
         fFtqON32nweg0GKsEvIgIj4k87EZH1GfjotcgapW7kh7Qkli+cAK/hvhzy5AFkRkr9yA
         tStlbwkV1dKidRGhi4xQsP75X3E6nnL+dbbyDK54ZghGPRIu/TgI5/xhIe00C8CVR5ic
         HMeZggnrRezYTBEohN8tLijQdhwD4FWr8EiL0UxQVXzebtFKqgbjQTIyuHKco0LVPjeM
         uhk1YcNlgIXpNrOzyW7UOH/fqzhEHaNH6/6bB0uKKHTxocHPzsKY0vukby/+ElO1XVvt
         hryw==
X-Forwarded-Encrypted: i=1; AFNElJ8i6cZR3fAK2Zy0RLC/StY1rjX449CJXv5Zg2sc2fKQXSdaLWy0fOa7o2fNjW1xmVAnhR1x0WYePo9B0tqf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiuh0fnAYHOg0hDxGWGmp7s1HVkBl9tDUOANu15skClcw83A8x
	FFaDlSaVrzNFgNBavPWDH+9cGuZA2XEIPMlON2Oz6pBjMwLgCGhgmR+2KgVOJQB6a3SnvZk8woo
	83IQF3QcYE66L9Ahc+940fSsxXpdg8gU0eUi4zaApDhdtlwNyytDZQoWBLrW9KsnO7O8e
X-Gm-Gg: Acq92OGoWdoeQBloNcLKucwweqXesYHflmg8nKXLQP6gEpr6VaFRB8SIbeIOVaPNLT1
	29ACrglvahMLgOp4quw4IUzmpWLnG9J+hx6u5hg2JEo15FmM0BVrGZ5+mzPRaTn3EoaoLHMPmq7
	9lh9TduCsQsN9pyK41p3ZooA9BCJOrx0dEqeGxFkKaiGSOb13F0S8lA8EXurvTJtjL1zcc6Ikxx
	ucb86c6isloY3Bgb4jvCWLQgn2m8RVd/OG6+dloC2n2G+oGO2HEdJfSro89iCmI6YBBgufShK4O
	+6F+IRJ4XWUACwsr4o3asWQEF57s5AVWxgC+9h2dEBcgo/AwpYjaU7KMlad9kD6CuK1WqjgjKxW
	97QXRfrO7lZSPcZA1YZyi4Ac9TpZ4voBRjG82Iw1NyQVWnE8npmG0nXfOIZnlIuNbbw==
X-Received: by 2002:a17:90b:3149:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-36951cc9a37mr23651355a91.26.1779292506791;
        Wed, 20 May 2026 08:55:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-36951cc9a37mr23651323a91.26.1779292506292;
        Wed, 20 May 2026 08:55:06 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369f59656a9sm3939235a91.2.2026.05.20.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:55:05 -0700 (PDT)
Message-ID: <bdc1bd01-f9ab-4101-b9e6-5799d63ed1f6@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:25:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <c6789e1e-db42-4546-8a98-d75a2443747a@oss.qualcomm.com>
 <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JhlwoE0jYCAmaFUVoFVBQhzH0sKarhcM
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dd95b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=ivBWRc-cjDWwkC4WAK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NCBTYWx0ZWRfX1E9qR2KfvTt9
 czNdVKN8LaJ6SHRvUouTQ2B1XDx08SO7XrIUba1z7+bLYnH/x7DJrzk6nHo9VhG2M9/cmc/gmJV
 k6FgB5SKMUN6aiZbCAT94w7aPpMjiwYK2r/uGApQk9kipfpJ2jhwCk0pM8HqCgYFmGJSIpfgjg2
 +tbr7aCt+DC706yntm7v55sJaGUrqgyLzuPuItd1jUxPInLc65ZBbbiu5SBkLXvmR7W5/pKwwDC
 hOqAPcc/6JfLpv7qAVLCzcoIY6mc2N96+MyERcWLU7c8pxi+6EXD2Wt/PeEgCghT9zi/P9MBEMi
 +rR4zrCMffMRT+g8nIR3iStuNRYpf2GgxoqFdoQ32pZhfDc76sBHnxHH3IT0YUQQata6Agm8UPt
 frTxVfD+J0lo45DeQ+bDZv0jz0nzdJr88jyv6Fn8ZiqlPOqkb7DgNOuhXO28vhX5spuzaHaZLrQ
 +LZtx4h3/I7UdijO/hA==
X-Proofpoint-GUID: JhlwoE0jYCAmaFUVoFVBQhzH0sKarhcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108829-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D13C559166B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:09 PM, Neil Armstrong wrote:
> On 5/13/26 21:39, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> Add the necessary bits into the gen2 platforms tables and handlers
>>> to allow decoding streams into 10bit pixel formats.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++ 
>>> ++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c
>>> index 0541e02d7507..b6d815c01f1d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> @@ -542,6 +542,15 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       pixmp_ip->width = width;
>>>       pixmp_ip->height = height;
>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>>> +    else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
>>> +
>>>       switch (pixmp_op->pixelformat) {
>>>       case V4L2_PIX_FMT_P010:
>>>           pixmp_op->width = ALIGN(width, 128);
>>> @@ -625,7 +634,12 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>>>       inst->fw_caps[TIER].value = subsc_params.tier;
>>> -    if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8)
>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
>>> +    else
>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
>>> +
>>> +    if ((subsc_params.bit_depth != BIT_DEPTH_8 && 
>>> subsc_params.bit_depth != BIT_DEPTH_10) ||
>>>           !(subsc_params.coded_frames & 
>>> HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
>>>           dev_err(core->dev, "unsupported content, bit depth: %x, 
>>> pic_struct = %x\n",
>>>               subsc_params.bit_depth, subsc_params.coded_frames);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/ 
>>> drivers/media/platform/qcom/iris/iris_instance.h
>>> index 16965150f427..16424d1e94a6 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>> @@ -25,6 +25,8 @@ enum iris_fmt_type_out {
>>>   enum iris_fmt_type_cap {
>>>       IRIS_FMT_NV12,
>>>       IRIS_FMT_QC08C,
>>> +    IRIS_FMT_TP10,
>>> +    IRIS_FMT_QC10C,
>>>   };
>>>   struct iris_fmt {
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/ 
>>> drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> index 5da90d47f9c6..ceed4b5d96ca 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap 
>>> inst_fw_cap_sm8550_dec[] = {
>>>       {
>>>           .cap_id = PROFILE_HEVC,
>>>           .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> -        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>
>> what about gen1 platforms ?
> 
> With this patchset gen platforms will reject 10bit since all the
> plumbing in the HFI response handling is missing.
> 
> Once the Gen1 HFI gets the bit_depth and calculates the buffer sizes, it
> should work. But looking at Venus, the 10bit buffer calculation seems much
> more complex in Gen1.

Is it more than accommodating higher buffer size by adding 25% extra for 
higher bits for decode scenario ?

> 
>>
>>>           .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>>> -                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
>>>           .value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>>           .hfi_id = HFI_PROP_PROFILE,
>>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> @@ -287,7 +288,7 @@ static const struct platform_inst_fw_cap 
>>> inst_fw_cap_sm8550_dec[] = {
>>>       {
>>>           .cap_id = BIT_DEPTH,
>>>           .min = BIT_DEPTH_8,
>>> -        .max = BIT_DEPTH_8,
>>> +        .max = BIT_DEPTH_10,
>>>           .step_or_mask = 1,
>>>           .value = BIT_DEPTH_8,
>>>           .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>>> @@ -866,6 +867,7 @@ static const u32 
>>> sm8550_vdec_output_config_params[] = {
>>>       HFI_PROP_OPB_ENABLE,
>>>       HFI_PROP_COLOR_FORMAT,
>>>       HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>> +    HFI_PROP_UBWC_STRIDE_SCANLINE,
>>>   };
>>>   static const u32 sm8550_venc_output_config_params[] = {
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>>> media/platform/qcom/iris/iris_vdec.c
>>> index f4d9951ed04c..65cf509e4aef 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -70,6 +70,14 @@ static const struct iris_fmt 
>>> iris_vdec_formats_cap[] = {
>>>           .pixfmt = V4L2_PIX_FMT_QC08C,
>>>           .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>       },
>>> +    [IRIS_FMT_TP10] = {
>>> +        .pixfmt = V4L2_PIX_FMT_P010,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>> +    },
>>> +    [IRIS_FMT_QC10C] = {
>>> +        .pixfmt = V4L2_PIX_FMT_QC10C,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>> +    },
>>>   };
>>>   static const struct iris_fmt *
>>>
>>
>> Regards,
>> Vikash
>>
> 


