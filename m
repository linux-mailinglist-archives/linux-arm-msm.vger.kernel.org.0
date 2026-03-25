Return-Path: <linux-arm-msm+bounces-99806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPMyMnuUw2ncrgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:53:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EA320F01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD22630088AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D8E274B58;
	Wed, 25 Mar 2026 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocIvucwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYJqwdBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6903909B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425205; cv=none; b=Ts/1bnYoCuWQQt+l+22wPQCZs9nCO8M3Ru+CgQ/d1Ws+Ob/ubVnBiCcZJWOOxLAcrEy1HnTKqQfA/iXEzrx/o+s701+ReJ3wEn15WyEUqBgg7DVOFmCSZzcDWF77RO5X4HX9YmxdoeQ1YoH4gIqEaVpJh9Ppv6OA9eAm1NERZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425205; c=relaxed/simple;
	bh=VXkJN4Kl+ZASyeCC/VdbGUtIGaTdV9woIEAznZCxA64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqyq1z4pidFPOf5y7XxGx7fUKQnBMovxG1qG3NF/IvDAWqUnR02BXXwUmgAa3bUwuO9dDedrQ1S4KJedEokqkzAQOz6+MKJLSB3xU5dTpxQ0eL3Tl3+uL+Faaa1qUK3vLwx0I/UvVitWQZnU/GQYMeeT2Yi4m1TpG+KKesFMXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocIvucwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYJqwdBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4Vlr73110452
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=; b=ocIvucwTxpdsQmPK
	eruF0N7ZtHsEuBs1RHNS+e/ckAp6Sd8fVmYEdYg6Fe8ZSYcMNgimdylqCd7UcuG7
	4ocfMVfOUmt4egh34JUwc6p6wR2xbMOMO4zT1JoZ7RpA9rbAXzcL35aNoGIjrf1Y
	U1fQiz5lf5GzqF7OAg959YiLz9kIOJ5TV8tFIr/+HVDSlILcq7sbmcvX0WtKlNdx
	qJl01izb75z8ZORmVMLyqKIOz38WR7BixuV+Fx7ytUrVVJhho92bqV5/WliH1a1s
	tAdXHQsxgxrTrWsOiaTuEVCZNW9hsY0YiSBTD39U3G0yLjMZkERAGLP99APyY1Zd
	4ZnpLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvucdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:53:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b08025f240so10147195ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774425196; x=1775029996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=;
        b=hYJqwdBWqpa1yrUEQYW52KB2Ajcdm0ImJ4Be8BHeu3Zuoie8hKJN94ldxdCZkMcD/x
         H3d+v61SYk5L8E76UFUE6KmoOPput1BKoGBcW+dgVy3bekSyp9TzIEbktH+WZ6H/XCf4
         /SQQUZNcui29zIXnlRjgcMt9ETzIrTITmNMaCZi6eACPOAiYPau6M/RP+xgFjKfK3jnI
         HWxZZY3rQsV7gcIlX+TD2qxmMMHE5ZJb+6RGg3nHJ31mbIaAZqqDIS6Hk7DXzcx/hm+C
         38565JwZsnkvTfuCI/e+yti2VXUzFWpLion1ji0guc1SzYpSsCrYXyWGbAqdnbqg/Ar5
         XOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425196; x=1775029996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DySCntb1zXYgrtxOMXpVWEI01R8xxlo7pSRoUDAwyFw=;
        b=sxXm8PGc/ZqpmRQyRn+BEy6U2b8WT8gQzwgUQr7LybXbEsK7gH0aPl43UOqxMwOeZc
         ov0d9HCei5XlzcoWpVArz8vDzuOha2CAR+lhTUGb5IJtGeSSfb2AMk5F1cnkeKyJ/QUM
         69Ab1r4kXLz0NR5eC7RMg4lAQnI+60XvWuRPXIo5XuLHYR7LsvtGuGT1I0NpIH7l0zEI
         TA3X97xbeMv3G8unHxQpnOg3YnjWlsiAcZXj/eLoEYuiQ4iAquJ+B8MVI5gOtZl6IJuZ
         +udQguKAMfyiJrjJDHivASGfFpYf2jLfYLCmHeAKwUC21BY+D7dybMBAn8HsKDWzMwoR
         uhBg==
X-Forwarded-Encrypted: i=1; AJvYcCW8WFWl46g+RgDX6IWCtAbxoo65JPsSEFmJ71mT12gs118MLJ0U71m1HKlQYw+7y2sDsHg03LyZCe4vuFMc@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFgQaE0WIG6L3T4Pdlrk5bxOW+T0PI4nchcrG9o8L3LqzY+3B
	3QVNsoTUldO3a1vPStk9flQULBtTRHfYlWr+tQ00LsLfOLS/p/ji7adCGvDeNOTzY9vDsFCinAm
	81ZezM1zUkg3Ts0j1/8rsDLr3vyWOA3Wp4c0k8RjfrWvmSgHsFix2KeigmDsZvnDUgk1S
X-Gm-Gg: ATEYQzy80vU0i41CBATBH4h1zo+eAAIVaWf3NFpzVX5P6Lrau+O5rePF3w0y9jfGbWL
	0o4V1KhEtlyTR6PBjXBtMmvondzTkcZtKQgnvsUbD8v+YpOrjRlVno3h0QX0GcPklHbyxNeAqub
	2slf0ngTq2eP1E7AVQRqTCKXywSCm8Y3ZLRKQlFaVTOIwc4K7xUT8HmW4xpDznXUz0w034vZ4Nl
	YdfebFrkCRROXuQJMQ4gGA2IhxdqHrl1Zve3PMG+MLhTYYiYm6stigoS0SzlBlFhvmTn6MHnC8O
	MW5cy8izDoT9fa4vw3JYdmlAZThxkGqO+bDiYdECvs8YWl4oygZviiFAfJJntA9emCGEEJqmTGs
	oWloydEAFJdfNtKIPBZ1Lv+mUFwMBeVD46OYfpR9gQMA7wFfsctP1YQ==
X-Received: by 2002:a17:902:e80a:b0:2b0:b7c6:4ae7 with SMTP id d9443c01a7336-2b0b7c64d78mr3400225ad.1.1774425196059;
        Wed, 25 Mar 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2b0:b7c6:4ae7 with SMTP id d9443c01a7336-2b0b7c64d78mr3399995ad.1.1774425195495;
        Wed, 25 Mar 2026 00:53:15 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368ea1bsm210836495ad.68.2026.03.25.00.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 00:53:15 -0700 (PDT)
Message-ID: <4a81a54d-2dc5-476c-82ed-9481aee8515b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:23:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1NCBTYWx0ZWRfX/YjNXuDnQHHz
 rVrhEWZw4uMLgYoyCdA4Og6iy8yppbPzcn2C5EXILipongdsN/zm7snvESP2NIuDABAZCWyHJWe
 ufGC7EfkOVgA2JUY62l3a3/p+btpIYvoblpwC2r9VPQ9mT66oKJSK5wIlZeCnJiCXK+JKxZp9XL
 hS8OLtocBzKf6e3jW7EbMhRUjMP/4LIaU/EKtwxWwVZNXAOZLOTVnwFDO/q3UWbCSZTotRP7Wwc
 QsA13KcqE3GzkPteAlH5a0clAiMyK5Lv0/n8g8vXIRRXvf1uo7/F2FyDk8ml6OnERFIXenR0wOC
 5mk+djFxCcznd1RjB5mFwVHDbEQUIZ0sRi66fyOA8VpXAVgGWtF9qkFAR1QjBSMRKgOdEoDjXyq
 NxoEGmTn/dc+QJqymmyhZtSpOe2KhslUM06fLcpUlqkIe2kLN3eXul/YcB8t0ssoZLAnfuIo9St
 jEkyYOnWwKDkzgXwRXQ==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3946c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zq2kz8iOUWQeT6CNkjIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: O3zZYDfm7MucNZh_3OYhnrbuOI15kYHJ
X-Proofpoint-GUID: O3zZYDfm7MucNZh_3OYhnrbuOI15kYHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,tor.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99806-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 433EA320F01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 9:58 AM, Vishnu Reddy wrote:
> The driver was using a fixed default FPS value when calculating the VPU
> frequency. This caused wrong frequency requests for high‑frame‑rate
> streams, for example 4K at 240 FPS. Because of this, the hardware was
> running at a lower frequency than needed.
> 
> Add the FPS measurement based on the decoder input buffer arrival rate.
> The measured FPS is stored per instance and used in frequency calculation
> instead of the fixed default FPS. The value is clamped so that it does
> not exceed platform limits. Add a VPP firmware overhead when running in
> STAGE_2.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the frame_count condition check
> - Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
> 
> Changes in v2:
> - Replaced div_u64 with mult_frac
> - Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..180cba36a7f2 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -109,6 +109,8 @@ struct iris_inst {
>   	u32				metadata_idx;
>   	u32				codec;
>   	bool				last_buffer_dequeued;
> +	u64				last_buf_recv_time_ns;

s/last_buf_recv_time_ns/last_buf_ns

> +	u32				frame_count;

s/frame_count/frame_counter

>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..6d982802e5d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>   	if (ret)
>   		return ret;
>   
> +	inst->frame_count = 0;
> +
>   	return iris_process_streamon_input(inst);
>   }
>   
> @@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   {
>   	struct iris_buffer *buf = to_iris_buffer(vbuf);
>   	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
> +	u64 cur_buf_recv_time_ns, time_delta_ns;
>   	struct vb2_queue *q;
>   	int ret;
>   
> @@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>   		return 0;
>   	}
>   
> +	if (buf->type == BUF_INPUT) {
> +		cur_buf_recv_time_ns = ktime_get_ns();

s/cur_buf_recv_time_ns/cur_buf_ns

> +
> +		if (!inst->frame_count) {
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
> +			inst->frame_rate = MAXIMUM_FPS;

move this to default initialization

> +		}
> +		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
> +
> +		if (time_delta_ns >= NSEC_PER_SEC) {
> +			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
> +						   MAXIMUM_FPS);
> +			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;

drop this

> +			inst->frame_count = 0;
> +		}
> +		inst->frame_count++;

move this above IF block, so that the reset of 
inst->last_buf_recv_time_ns can be handled in first IF block

> +	}
> +
>   	iris_scale_power(inst);
>   
>   	return iris_queue_buffer(inst, buf);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..d621ccffa868 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	u32 height, width, mbs_per_second, mbpf;
>   	u64 fw_cycles, fw_vpp_cycles;
>   	u64 vsp_cycles, vpp_cycles;
> -	u32 fps = DEFAULT_FPS;
> +	u32 fps = inst->frame_rate;
>   
>   	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>   	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   	if (inst->fw_caps[PIPE].value > 1)
>   		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>   
> +	/* 1.05 is VPP FW overhead */
> +	if (inst->fw_caps[STAGE].value == STAGE_2)
> +		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
> +
>   	vsp_cycles = fps * data_size * 8;
>   	vsp_cycles = div_u64(vsp_cycles, 2);
>   	/* VSP FW overhead 1.05 */
> 
> ---
> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
> change-id: 20260304-update_fps_calculation-98ee7f7507b1
> 
> Best regards,


