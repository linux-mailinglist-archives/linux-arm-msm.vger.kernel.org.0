Return-Path: <linux-arm-msm+bounces-107426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMidNeXEBGrdNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:37:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DE953911A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A5DC305CAD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2416D3921D0;
	Wed, 13 May 2026 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+HhnP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdT7ZP0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959243A641D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696762; cv=none; b=e4iYi2w9fn0oBA5U6m4H9xmak0zCl0VidVa74ztP5Kvyhqhgv2MY5iEoP07mZzoSrEVwE3CPr7WOLMZ7S8JulgZcqyDkEKS9LENkF3LzYNVnLObFAMXH1R61MKbZRK42aZdZDrvY8rWw2Ap16td3aHinR12cgnoZVGYFo776ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696762; c=relaxed/simple;
	bh=7rnvyRlJhuUqIb2oFq7ELJ1mpCOYsn/9XpIh0Ol9Ujc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Km1oV+CiUjEN/dAfDx/r1/rNrIsD77kyIwPsVmnaA1TErYHZxopLfhqWJhF42LixBZVKwSG7g+mGxj2SWVX+cRU2ob97noa6LPf2MIu9qRClmgA3dh3LnItbDXwFKrOzpTqqeqiFe4i2BSMOYfKSSSxL/9nH8u/K9Nr1rVaiWlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW+HhnP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdT7ZP0d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuIGI3995531
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=; b=HW+HhnP+KdOA4P9A
	cabJOyD2Jle8/bcceY1r8HZ9My1jMTRsWiOyCn9QUzkUs9Z4ZD0IVyy/VtLT1Bwg
	20HshiV5Qtc0Kl38U3KRxmVNwU5PaiyXmzhqFn6KJ/oSwyYXLbV7XXWNulWQG0aL
	k2iYWzNYDnwwVeskrKZdT7OV7A9e5ssWhZ6/Dpcln6T1Cycnjm/UO1nMPIIUwEK8
	ZtBtg9CS2x7QVTM/v2q8PjBcE7IVA6HJnUQBwauHNfrLby+5MFw4tjrTA9pSf57e
	kyNfhy24FVUkXRZBi0TZWGZR/ZSBh75+Bt0tYINTSv2aswqWwr+rp+ZHKbqjxBOK
	qBK14g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urbep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:25:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so92701385ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696758; x=1779301558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=;
        b=LdT7ZP0dF0fQZdxILWKE8zverskU78fbZ4exmoU4QT+OboPErrr97U6oxEbNHp+uVG
         Nk1rYvshPOANDd3oN26u5lb9hfNZTo6dctZp+GDgQsmHNUsiXD1CSZjzoeSux83x6m1K
         goVI1sJ1OTXhlLysNtN/Ye9Iaw4SYduwzWxJOfOjmOqgxjx7oxg9J0qLnHLQnVjI6BNZ
         Yk0pCkKH2+F/0gtcqSipM2HAdB+nTWtwXDFHr3TogoZaZDGjoEGCk8VmJxMRnDWTIfda
         iseJ5Th1evEFV5Y5rr0bRFE67CDZEQeTl9ii6vMwvYRVH/vjnl/OCoBal+IZtn6rC2M7
         N8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696758; x=1779301558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzZbszvrmLucZ4gFsiU1bkMESXXLy06AymspFyubZyA=;
        b=XHwpHql6TtB+LdRt647j/6iZ62MtSmngR2MmH24VecaLolJa0pA6nmCYp98kbKQGIN
         WXnb7QLV+SsaMoYa2mEXPQYaWV3Czesog2W7A3K1y7WfCb2spnM9sav1rxkqPLaP1E4H
         1rJAFcPvCt+jeLDp6L4QghzFUcg9w062R1F0+q1zuumZjqxvNpDFCDT/OfkdmUQMP1n8
         gYmbiAtDri8tAgh69/o7Hyt+tmpWygrLQjSsgVisBTJtwDu9nbvdpIqYR3tVCg7oXIAq
         0YNWLvbRy67WiALokr+BUwNOVROSGmSkJFPKSCJn1ZAi4cqTptkmIXB3TJeFYaM6Z7+2
         UEZw==
X-Forwarded-Encrypted: i=1; AFNElJ+tOhxEHzy+TjyQi2g4wV1iIm1exIovUS7KYE6kIyC4xWtj/tO4R06+MkC4o+/FdC4STw0zWajj75JX4RkA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywad3rWbNfGXC9rbyVUy4X+0orSSvBUH/GRlw/cCqsLtqnT32LU
	rLpscDDsEU2jrKWjX72k0hrWZ9v5jNuriStk0WMnLQIwEyHB8oEF8g3SpZJvbwsJRkktIfSnpLD
	tsR0Iq9huoV4d+wCXRsA1mnAExBQ/idJuKn25X5kfLP0/CvNWG0SgvD8SsnSyZsNjt1bK
X-Gm-Gg: Acq92OHVG5tkgRv0pu2GFl7PRqfZvK9weTInCKNG7NQf8m3mqfyF2lcPTyjl7M/w+P/
	U0AjJBTXtg+Z1Y02tTmgA+tif0tmNgmJSFOsBNCXVUJzQKtGyWATXTVg6HLG+vjCAm1DYITiibx
	0C3P+j0MPnfShUvEJAHdJeSOfbIY6jFQlz+b02gxhAG+KEMYDJ0pH/9yMI5HmtHLR3+mtDX83qq
	EroAYFMuRVqohmjLpZZNRN5o+xGUs5RiAUZGHDzU4U5LMEOVvq2UYRIgaj2dzxgTENwbW1vhr/b
	JDxeYarQWNOvCOvy50d/AYdDYlTtWtalaBbeFCiIfW52N5CejESE3RDuzoBqiGSfn4cOG5KwhhR
	E9lf2FfSgFkGHtyCDhLs0hFRa0gJleUPLnqPeRGK/J1OJAXUNGvQVnwa9
X-Received: by 2002:a17:902:ef11:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd276f2e1dmr51757835ad.23.1778696758410;
        Wed, 13 May 2026 11:25:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd276f2e1dmr51757375ad.23.1778696757877;
        Wed, 13 May 2026 11:25:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27083sm186116005ad.13.2026.05.13.11.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:25:57 -0700 (PDT)
Message-ID: <487a1bd7-3ce2-4a78-be18-f3d3469e1b93@oss.qualcomm.com>
Date: Wed, 13 May 2026 23:55:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c237 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=1v4LsqrUVehaW6lpU9YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oqZoWqb3IkvjQHLXH0yEGgqE7nj5M_0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX58Wfejm+gdmK
 14SARxJtC3mkVuT6gwlpiMAwrPxO6jHaVDjYhfWkZA7qYDWwj6rbOLIiRUemz/cmXJIr7WpY9r7
 3GwT5aQP8s5cywb+WyfpBuoZWKprVgkgZC8nTZwg2rHLktpLYTFUrxTbBKWJ5SDaGHp+n7FtGbr
 qj0KsOl+Tq0zVPT3MTOfG3IJ7ksfzAdlPm2FY08rmaq6+yIUsSadbve7Xjv6gMs9KDtE1I0D4LW
 vAEwJuF2/1izkGdLoJyHD8jd4Z1jHwSMeHt52UjXuH/E1u7jKFUcNFiWAV3gpPggbivhqtwKOhd
 vZKw1+MeQFbLPBT+8t0px1Wkgs/ajYXvrtEuq4catXWZdtaonngQPiH3mUq6tGkWoilzW2uicJ1
 j63+2slu0/6tQK0/ql5fNH7jg4Nb8TuBGq8QvAmJqh8OrrvhHXDeGjcTsDS76hp2KkanR6ZSGZp
 Z430riEKBcsus3pPpwQ==
X-Proofpoint-ORIG-GUID: oqZoWqb3IkvjQHLXH0yEGgqE7nj5M_0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130183
X-Rspamd-Queue-Id: C5DE953911A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107426-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Action: no action


On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>   drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..bdedd6bfa87a 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>   		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>   }
>   
> +bool iris_fmt_is_8bit(__u32 pixelformat)

u32 please, to maintain consistency with other

> +{
> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
> +		pixelformat == V4L2_PIX_FMT_QC08C;
> +}
> +
> +bool iris_fmt_is_10bit(__u32 pixelformat)

same

> +{
> +	return pixelformat == V4L2_PIX_FMT_P010 ||
> +		pixelformat == V4L2_PIX_FMT_QC10C;
> +}
> +
>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>   			      enum vb2_buffer_state state)
>   {
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index b5705d156431..35337c5da005 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
>   			   u32 ref_width, u32 ref_height);
>   int iris_get_mbpf(struct iris_inst *inst);
>   bool iris_split_mode_enabled(struct iris_inst *inst);
> +bool iris_fmt_is_8bit(__u32 pixelformat);
> +bool iris_fmt_is_10bit(__u32 pixelformat);
>   struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>   			      enum vb2_buffer_state state);
> 

Regards,
Vikash

