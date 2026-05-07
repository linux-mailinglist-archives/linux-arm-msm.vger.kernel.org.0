Return-Path: <linux-arm-msm+bounces-106453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHjCCrKm/GmwSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D704EA8C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA8F730368D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ECC3ED5C8;
	Thu,  7 May 2026 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSWA7BgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMd0Q0yw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A897402437
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165294; cv=none; b=tp9RJSdbZVffv2MZXf7T5aoJ8p4ZzZlObtBBLdQi6QRULfNboUgwHRc41akQkj0E7OMc5gBzKFIVqU1IJDlr92jRW8B6/uQRcQfSFrHQrtL5UyGbKzwXnMNUx7pVWeCwQL+Vm8bXoNQY+hgEMa3k21VSNaZo1xC6BPwhfbxFC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165294; c=relaxed/simple;
	bh=doSKqAywgZG0zfP01dCotawEVBqSKyhp7tUDohMKP/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVqKfCEqa+2duhQxA1qIGZJOvOmOtFi8R3MNTc1nl2X/EHYp2HZ3xYzMgR3hr0nrKc/X3VXPTmzCZrXAoQCkPD5QD73uUOcFTTYQVtQHQCFScLxJJirFCwCW8bDfWAYHPXhmpZvTWEFj3eIDndlwfgEy0vEU30TsTN0PuW9NDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSWA7BgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMd0Q0yw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BkZeC682839
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKXU0I6LMH/BMCj9EeRl1cnpVQr3dSMcJSJRMFTrF9M=; b=NSWA7BgPgkyxZqm5
	9/yjPKr19EdktGHjzpulRC8gXOTgu5o4o5Og3iJPp3IQDycJCdTQAXsMPwkdj+Fy
	eIqK3cbrvmW7VKTCC7BxNH40BefUhXMjp8kz1zI/mdaJc3AnszyxElK6D9GT3Y47
	Bmo0MWn0Bkuhn3ue64sz6QxUCv3TZFWaLWvHhc/Y/i7JYr+y9PLACAQFVSUzPc/W
	MUmD9JF1n8FTnov7EI2QsEZ7i1eSVYBYjetCuVmS/IpaIQq0VNSii1DmQBmN4ugO
	HPy43xDbIAZeOQnpqpCrtjb6Li+l47fK0TDNA3Kb+imSbYeWkC48UhsgWDRHRWLd
	yJahuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhat2ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:48:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so13114725ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778165289; x=1778770089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKXU0I6LMH/BMCj9EeRl1cnpVQr3dSMcJSJRMFTrF9M=;
        b=GMd0Q0ywIb2Z+isRHLg9IVEtSrxZ5+TUPhsRIwtLby2iHDlDfA7w0yF+ikilCOosDG
         nK6CZ1J/+piq1F5NRJAXscx7jmQ7OEVKY6uuKWrcfqGZONLVBRrHk1TmKe5bFl+j1U/Q
         99vkNFG8xJLATnmj4a4O58c5nveocXpALVXA1rt7YtjgabVwJmjfpFJ5qMpnxrkbFfOr
         /d2bd8eOdbQzEsnVrgqtSakwQ96l/P39vBgxDKwNv7Ux0+3B+7oefWRtgE1xpl9gEC2P
         PxGLNIRWtCl/o1g+a7gOVtt5qgRBq/tTqLyT/CI6eF/wPm2Cfb7+dWI1ryX3DhQ/GpJd
         Lkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165289; x=1778770089;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKXU0I6LMH/BMCj9EeRl1cnpVQr3dSMcJSJRMFTrF9M=;
        b=b48HbBqruTwQDfQG0rbyLEf+tV3TF+uLRyQ102hRaVJpD/QY1eirXsLsWECQcv9Ian
         sKjLgh42T5PPOnTIC5CH6UgoLqYpTjTyqoo04bBQBuaB9ELj2b8b5GNtMxuDvp929Pjs
         EhS26DXMFuBjdEOTSaJsE/YAMVS5Czu5PvcEMKlUscKwnwHbPwMNj3TSV8TR7Goq8VNj
         TUIiVkwSsL317S+6KiH5sFhx6sjo7fPQFEh85a3CTKKCXH3VM5owFECjgWqRAWL7cJWH
         9Q5A6DKmUU+pAgcRT7jxLMj6odOMYcnlcPFM+O4s6m62EHxPxNswIXvBBqu0BWumoL2d
         Kc0w==
X-Gm-Message-State: AOJu0YzG6orwPRxHCKCkuDepU6LrRuiNNyZ7ZQkGCx1rV2S69KO/sVDw
	OuX0kHbYUOS9QNlNuX0XO+1yZOyEucoSFc5ov0f4v9MokmAZvQZA0MSMhH8uUxO6gw50Vr72dKa
	FjHvlpIAPSH1HTNeuZiEqlhhYYSl3+/Sz4XkQD2pfdHEd6NTJgAyU/Ug9g6UHXtpG1hfBNNoh1+
	jF
X-Gm-Gg: AeBDievMbAutyNbbv8OtqAjyl41jy3vEPXYY3rIJBh2WkWLhk+PyulubjloVj+ZNdFt
	YHqfmUotW/4adeSG2Q6QKuRPI1g7oxZjVcPiIN9VO5inZpoPQvJqkanjFOc0cvAOiKUBnwTWvXX
	Cne6pwouJeIBsr+J4e2erx3VigsmTCDtXRIgNwbYDJoA7JQHOPKNONlBw+0Y6qSYAv0RRpFSkkM
	MAt9HITHKtiTiBwgY5GhyV5kqOVX1q45T2gJU9HBBRRuVnwcCUC8A2/8oGHjDAt7AIArbvunD9p
	kLqilNdtBWFKqXBJo6g/XV+Os7SQUzQHY2sgrBADAzO7gsFgv1rmQy5V4Fuk9aRdD4RXx3Xzwz9
	qQteFcGCPCJ0k3q8xrqD71Pssggv69fmjybcou5MmFE3HIh0Ea121rNLA6TfVoYwmbg==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr93506325ad.33.1778165289014;
        Thu, 07 May 2026 07:48:09 -0700 (PDT)
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr93505935ad.33.1778165288547;
        Thu, 07 May 2026 07:48:08 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaed237sm27158205ad.27.2026.05.07.07.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:48:08 -0700 (PDT)
Message-ID: <6ea04749-d432-486a-b04e-46adaa9d0666@oss.qualcomm.com>
Date: Thu, 7 May 2026 20:18:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/29] drm/msm/adreno: use new helper to set amsbc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-18-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-18-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0OCBTYWx0ZWRfX+5fVJiKaFVeR
 gIdICiM62Wd1zhK0r+Gj/V3IxnDFMCgrz+u+lFPm22YFs29+yRHJJC76PGXyOxv4qoDhhix2pxG
 8RKs3mh94PNIcxERhbg+VY1O2XQckVbIClC097mDdDStENYn4itVa9MIDyvaDWXS25Wcj49elaW
 EAPW+qZlGn3IW1uqSVz1h6ikcnpC+A0aZHlEPqzLnIK/WMGLV9ELXrBDvdWBgvZx5sjSdHJftq6
 QrSd4BntR/WdLexDGfRTIFffd6YLUvr9O3QlNuAG8tx5t0A1l+ay45MG5O91KYdVoRNB7jGXRWC
 G71pvVz8TJSggYx+bzbNeJORAbcaPSOrk4uZSm29+iyMvTtnPKfgQGhvvJbnj882+3shRm+0GZu
 O1KBGqx3/4ZgFI/nerXRBkyu56ZS8VpbGC47bAntlIuzF/y4IN9jPiXAuSkbUT9RyCgSItd0GeR
 9IpJ3tKXU74irUpWu9w==
X-Proofpoint-ORIG-GUID: oNLQu9fEfJrUQ8weuIyCf-7H0kT0YdH3
X-Proofpoint-GUID: oNLQu9fEfJrUQ8weuIyCf-7H0kT0YdH3
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fca629 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BTchm6ImzknZz8NDhdQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070148
X-Rspamd-Queue-Id: C7D704EA8C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of checking the UBWC version
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5c17565b0499..a88489bdad9a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -747,7 +747,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
>  	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
> -	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
> +	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
>  	bool min_acc_len_64b;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 867c7d05f670..5c73a9ebb22b 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -279,7 +279,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
>  	bool rgba8888_lossless = false, fp16compoptdis = false;
>  	bool yuvnotcomptofc = false, min_acc_len_64b = false;
> -	bool rgb565_predicator = false, amsbc = false;
> +	bool rgb565_predicator = false;
> +	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	u32 ubwc_version = cfg->ubwc_enc_version;
>  	u32 hbb, hbb_hi, hbb_lo, mode;
> @@ -288,21 +289,17 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	switch (ubwc_version) {
>  	case UBWC_6_0:
>  		yuvnotcomptofc = true;
> -		amsbc = true;
>  		rgb565_predicator = true;
>  		break;
>  	case UBWC_5_0:
> -		amsbc = true;
>  		rgb565_predicator = true;
>  		break;
>  	case UBWC_4_0:
> -		amsbc = true;
>  		rgb565_predicator = true;
>  		fp16compoptdis = true;
>  		rgba8888_lossless = true;
>  		break;
>  	case UBWC_3_0:
> -		amsbc = true;
>  		fp16compoptdis = true;
>  		break;
>  	default:
> 


