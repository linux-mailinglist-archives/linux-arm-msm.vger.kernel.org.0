Return-Path: <linux-arm-msm+bounces-91971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ZYjJAVVhWmnAAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 03:42:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E51F965D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 03:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D3FE300B9DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 02:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0227226B777;
	Fri,  6 Feb 2026 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzDJUKAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZkoNjC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274E257854
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 02:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345730; cv=none; b=QkyN9XYp3IgicOqixEvJBJyh9dJRRXCxA++PsCsOcpRcxX4w+hnUEsArus5bOnNxdsOgOnSKNcdeAWwvKONnPWTMqpm8bhW1IA4UahnZ7gRaBwiGS/3c+/zXdshfPqn3VZ9JB+xlWKu8D7F/N8dA6zCN66Ghujf5YRF4zWMwT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345730; c=relaxed/simple;
	bh=ksr2lcOAzAjEvzHUJmQgSRlgYT57MjEzGRV/tMTgUXA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XKVbDZSafpozXFAIdSFFvZ/bxYDQo/ElsbpRMkZFKM9c9Ai3wPD5kG4xkXdIFXXJ7o8GDWOAF4voTUjBUNjyDEz1Zi6qHfUliMxfN1LbBHhX2CiTQ+/qXJScKnXwCH/TYnrlqDozB3gYLhi7pDVmb3dQta7xjJclIFQIFgYe3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzDJUKAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZkoNjC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xdOB1638238
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 02:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf5z0lQJncwdyjILWejtIHYcqO4ZW+jUcKeWyUcI4YI=; b=LzDJUKAuLoCLzj0y
	AGAUylLRFMM8n7uUGhErnk+P3JU+YMwoQDWwPolBUwSu2DEIYCVceQ5KXJL/3b+9
	/lb9K2eWkpVTOFwQaFToiXx05V/+I1i5vzF7CwJt1PwXV1wfHi5AHyxf5maSoDeW
	aljVhPkJbMMie+48H4Y6Jgc+poNcEs3NtgzmJhm1ql1LpIXv0MtUPzRBkJOk4Lhg
	1w3I3lJsulOYuDOA4PY7NWZbLmZAiUYnrtmXRKx9GaznRyIVxg28GVp+xMgS7He+
	ZZ62vWQE+WW/0fLjceex+t0ZBxRnHw0LEV1hrNtuJaY7MrXqEgOCl6M1ur9BhwkZ
	Npl3OA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tn42thq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:42:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a377e15716so4938155ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 18:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770345729; x=1770950529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf5z0lQJncwdyjILWejtIHYcqO4ZW+jUcKeWyUcI4YI=;
        b=MZkoNjC1V3OmQTytS8LlgjR2sHS9g2vuyRNuzTouwd4MiruZdXAQbIEpV9gqxA55np
         r1aWhmqbBGa8IYNLjFDF2vJBDu6r3YHGkzdJB/yV9Hx77U4MlQB1Rh0FI4KCNn8H+7Ru
         wNRmYNH6t8yVMnj1LcyWqi8qZotuNsWPYFPRQiPPi2S5ZrmF5v1P0HjvEM0e3nEyDvGW
         GIArKj6OZwjd7hobWkebpoevcJjCm/PBbNH4QuMl157eq/y9oRSdtGrRg2apSuHIUoVZ
         ODjLddxDiF36GmEXphxA+F+nLloYvBJ3OuEvja1gAqILIXN12sTDcy6Sab42DKMDNcnr
         fLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345729; x=1770950529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf5z0lQJncwdyjILWejtIHYcqO4ZW+jUcKeWyUcI4YI=;
        b=JQoS3zrmUpww9wCUC+GKaO8cgdxxJ1VDgz3fuYcvzp03VSyh35oZmYJvS6a8QvLd3L
         tfPy/jBoYjz8mEJ12MdAHbM8HSPNZP5uaUWEvsXWvIcM0s5+/B26EukzdZXqV9kjWzrJ
         ddx/G66o4P7RfEcDmwFYocbAxHLkGwSoEHi3yGvHd3PlskWrpQiLLDS/Fshx56yYxwYr
         pvQGpOLc85oBLlPojV0t6W07Z+gV3pn4rSRrefRTHgVUMoO45uGvJkCPohIEuu4e02lO
         t5vhvngCug8er8bJzm4meqAnMlKJm1FMOU3XoOMjHrk0unTVXDKva7RI2nJaXb01RptK
         YGzA==
X-Forwarded-Encrypted: i=1; AJvYcCXYluXlXSN8WQO9aR/o383CjG6fzQR6hsFVUS6Ii5FnBgZi1o0cLtvTYFloDQ/WGH/uAVzLDITHxg0wARox@vger.kernel.org
X-Gm-Message-State: AOJu0Yy901l+uRPH9EDuwzXlN76hnjhSr7Hugx3ySoeJ7iq91+dHD+PC
	77t6UXlNjeqCV+s20VrtHxk60lle0HdGQLnbs74hM4/CFMW1+WUK0jbpFjpN1Xa+OWChOh/D4zH
	4RZwWpCvl+pKT3EKtI/zqsgCYrvondzelCCR33p8RJlXZHX0Xor+WDqFIBJoHIhJcLePV
X-Gm-Gg: AZuq6aJCmF5yAgzes75CWdipYLTN6KaPYJw8hCyYN1omKsAAwC6BG7NPa5m1SNvgnGA
	6YUkqsHbSEyp6iBqFqpHXwaPrXCLaIxn29cczqQryRtgXICJSayJwFNjPTrMSJ/g0N0MP5zHVDK
	ELfwXHlE0gfRm1Tdav9JKWa6+hFuCvr327yyjvtHOC7y63hs6qvkiA5JYhPOw+BjB4d/U8JWvK9
	R7BEQJVUpV4J4v69mwyfwkpeqLL4IE2+c+CBX8Gd++zMboBZGRI2pYgqF22geU1hM/CrGY1/x1L
	MsNMPubOwAg1Td1YybJc9TV8vv5aREFifOQBuN+4KV7kJXQj+EWircgNSJtdkMFAuKIc6sXwDe/
	j55AOV3FJ20uswkjNJHHXQQOd1G8pAR7MHbzzyKS/3wnQRR+Q0Cme2iYOY6/DXaecN1K86FZOsF
	DsuyVr
X-Received: by 2002:a17:902:cccf:b0:2a0:acf6:3de9 with SMTP id d9443c01a7336-2a9519ba4c2mr13991065ad.58.1770345729134;
        Thu, 05 Feb 2026 18:42:09 -0800 (PST)
X-Received: by 2002:a17:902:cccf:b0:2a0:acf6:3de9 with SMTP id d9443c01a7336-2a9519ba4c2mr13990955ad.58.1770345728649;
        Thu, 05 Feb 2026 18:42:08 -0800 (PST)
Received: from [10.249.28.233] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c8b041sm7532115ad.34.2026.02.05.18.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 18:42:08 -0800 (PST)
Message-ID: <a0436a80-9080-4a6d-9fad-d319efdf498f@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:42:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
 <20260129-batch2_iris_encoder_enhancements-v4-4-efaac131a5f7@oss.qualcomm.com>
 <22af9d61-fdbe-4347-a1b0-1f8696a77f38@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <22af9d61-fdbe-4347-a1b0-1f8696a77f38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LHGW3_dSVIiW45TSrA3mInLjbwOZ8op6
X-Proofpoint-ORIG-GUID: LHGW3_dSVIiW45TSrA3mInLjbwOZ8op6
X-Authority-Analysis: v=2.4 cv=Dfgaa/tW c=1 sm=1 tr=0 ts=69855501 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=86qbpROpL-4TFvkmW_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAxNyBTYWx0ZWRfXxo89cSmEcKeV
 fe4c3FIcPZAd+qtKNEjaJwgT/EOxwOgMPW8rCblR0OiftIIkgqMm5P7DBYVDfma/n6TeMbkVoXA
 UP9geRJ6bgfMeNtwmwtgv4KuDq9caZ1KPNvcgkJvvN0Msdaz5vvzmxK3a8XfRBNyR3n8d23ekpR
 ROaWxHzrpZm5xQ01NV2v0retDF8dwANGjsPEC303qjeRX/uMWuclx9kdu29qJp293soXWpDzyDK
 sWPnzIYcAESxH08SeTm837qqlQTbjYHqsKRiLUtaEWeJutaPLH9omkYD/O1lv87/3h5fPJHIGDR
 zXqtOMwT3R96zyrJQnbJpYAREIDsKyf6Cr7XQz6T4typB8c2EcoaURMeESQbYVYLxrhQWdge3KC
 JAIUaPWttAUeknAoxCUp+20wPmuTb8exPt29WIsm9k4b510iY7zinPAiEVycOFMnRnuW7tA548D
 P/OsLrpPkBNdz4yS9SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91971-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8E51F965D
X-Rspamd-Action: no action



On 2026/1/29 19:37, Vikash Garodia wrote:
>> +
>> +    if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        max_bitrate = CABAC_MAX_BITRATE;
>> +
>> +    if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
>> +        max_bitrate = CABAC_MAX_BITRATE;
>> +    else
>> +        max_bitrate = CAVLC_MAX_BITRATE;
> 
> check this logic, for hevc, its reassiging
> 

This is a bug and will be fixed in v5.

>> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum 
>> platform_inst_fw_cap_type cap_id)
>> +{
>> +    const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +    struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>> +    struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>> +    u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
>> +    u32 layer_count = inst->fw_caps[cap_id].value;
>> +    u32 hfi_id, ret;
>> +
>> +    if (!layer_enable || !layer_count)
>> +        return -EINVAL;
>> +
>> +    inst->hfi_layer_count = layer_count;
> 
> does it include base layer as well ? It does for gen2, so keep the 
> uniformity.
> 

This API is designed for Gen1. The description below is taken from the 
HFI definition.

The parameter ( N enh layers ) conveyed through this property specifies 
the number of enhancement layers to be encoded.
        N: base layer + N enhancement layers

Layer ids: 0 for base layer, 1 for 1st enh layer and so on.

>> +    {
>> +        .cap_id = LAYER_TYPE_H264,
>> +        .min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
>> +        .max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
>> +        .step_or_mask = 
>> BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
>> +                BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
>> +        .value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
>> +        .hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> 
> no setter for h264 ?
> 

will be added in v5.

>> +    {
>> +        .cap_id = LAYER5_BITRATE_HEVC,
>> +        .min = 1,
>> +        .max = BITRATE_MAX,
>> +        .step_or_mask = 1,
>> +        .value = BITRATE_DEFAULT,
>> +        .hfi_id = HFI_PROP_BITRATE_LAYER5,
> 
> HFI_PROP_BITRATE_LAYER6 ?
> 

This is a bug and will be fixed in v5.

-- 
Best Regards,
Wangao


