Return-Path: <linux-arm-msm+bounces-106421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHuSBZee/Gn3RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:15:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29D4E9F29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EECA3067039
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898593FBEBD;
	Thu,  7 May 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npjLD5L3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAPivs0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E82388E61
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163008; cv=none; b=SnWbKoZKnrFlVuy/9zmrIehw2HuRgAR92EN4Ib5lv5zqt/Haha0KEjzxODUB0wWOhm5KGvmr+Ee18e5IBczhcPY1be6PDETJmHdigD2DPpQYLrEyRFdNdiq4VC48sYHk0tvNxHjkFLqaW0ONEsgIgiZ9U1rGLk5H9BqLkp18UdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163008; c=relaxed/simple;
	bh=vZcnE/e8LQ9WOIBHibr0IDXRpScsLhebMjSN4wiggfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlkXKUfMJcfvVN5eeTMZ6pV2wq+pJBvNdXUetsK9qLjc89nCWdux6dTkkXQTtjfYz5yC3hxKjIgKydq2/6NrCBAu0bqt9AUt84QX2zDEhfKv0Rz5ppO+Z/LLnnJfqtEYCpwztmHeSKfEHXwby7K0B7FE1meLwyJWcRsqEvL+BoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npjLD5L3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAPivs0a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647APIpb880188
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n32FPL48jUWDBVk1qxVmjMmAGF0l1K/hWXAEUvGcTKU=; b=npjLD5L3SZAAgp8l
	buIRqV9iUN9RJe9Nq08o60OQkFcl6vsEIaHtoIETwfVcC+UZc2ohLdbtuns3YQJx
	535SWxeJ01+j140Scg7B0nHXotnLlu3f+2tior//teHYDs14phCCFs0aZSqGcBdZ
	Vb8SHt9V0NEWJEb+tDgn9vo1wShDFQkD7d1OG9MyO+sMUaraJqnBE1dvyqJdksA7
	X/1SMITIgKhnH6W5qxytUPuEHVS8SdNJchMS3YUOg73ldQyu6e20zBfY08LHTGEo
	L8dvuC+YTS52PMG4u8IaOlkk+i/k47s+zDq4yb2wo9kuUwtVa44FGDspBVzTubMY
	XO86gw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq25ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:10:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso180439a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163004; x=1778767804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n32FPL48jUWDBVk1qxVmjMmAGF0l1K/hWXAEUvGcTKU=;
        b=JAPivs0afNkrmQRBB63WgPwDeXn8vPloPPFWFW5v9iI7duZ8wEcupCSr/IrHzurN8b
         tKw8QIbPk99hnjaEcxDcEXd7JmwDE60FVzcbqSejI9kMUMHGmtuZp8HJ59CByrzMx/R5
         z851yaYB0h7wluSg9NEu7hK+SkRZ9Qxje4YFgRuTIiTYH/hoZGGl22dykadUrSP65Lw8
         p1IfE00CubGBmADs71ATxZVd5NUNDVzaXAHBHRYA/L4SeaBeVIffbWBqK//fPAImt0zP
         kBf3vvzyHNAfPF3FrzR4BmE9aXEI2+PUXKY9sOW3ndm9CoNT2L46wdO376I/uO9535mv
         LwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163004; x=1778767804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n32FPL48jUWDBVk1qxVmjMmAGF0l1K/hWXAEUvGcTKU=;
        b=I6tcTz9sJuFCbBl00QB68VYpPS+rKliKFeq+UWp91TM4idICky47VHuiZaxd7UYAB+
         ymP5/XGjX4VwcYtqhRUGWDuF3sMdV2To32RQfGe6EgzaM5ys9pgA4HYIhfcHd+/BokeH
         FtHpCrs3GVHZFuvRsthxLUGtWKTj5Ba6PELRcOGDQx1bK+9dNylvc3sVbLkerdqz165Q
         IdOYY4dPpkODEfIrUNVYJ/HQlz1LZ8w4ZGJpy6LHwgouigOzrx+9YcZbCHFSjMsb4e6/
         rG3zgvLlvru8+KF+hbyNWjhVSzMdVg4V1lLJF8hbjIjYOl97xlOm7PMOeq2CrAPDLDzx
         nlrQ==
X-Gm-Message-State: AOJu0YxhMtktczMzFxeRLq7Zq/24dA+r8QbrN4DzLKLduDXSa1FoRSoP
	fOibgiO6U7bI2FL76cnqPUasXU7eIJgL4nCDc4+xBtEIcSTHEMtmJPy0IN5pMNM6AmS+zdqLQyu
	GyVU9vGnlH5oBgJEpn6dSaBMq3BMytelSLrXDxeioDZGUapyAxllTxJ9SXxQV+QzdV8/z
X-Gm-Gg: AeBDiesl+mSGd/WpTDBL6rftzul0Kkti5JLr3hgW0abQQXG3FBTKk6VdI86P2RCy1dK
	+otEEubhgF0Lzouopl62gQ4Zf+sg7mqH/q9cqNt89TCGFoUF3TUla0HcaQQRlgFPfGmklZ4X2C7
	pTAca9+JMOOLVaUTYEp+taYg6CRZem3mr4Hgv3POR6DCHO4P920/HMOlTECMACxoTBCgVnvJY/j
	Uc4faSAWBI3EPZojw8TQ5SEvHCeHEuSpDFaHq8cNycQ9adTDyKtwRuHLKfDBiyG7Tczel6v9uZ2
	8XeBT7lcaXzNHAUyAiZHklUZDvtxRR6jYDjzbfcf20CHlN21Z2YUV6l0Fmqq1A7Awk8HoXeI3Fy
	t+H+oI/NO/A/aSk6OvpvmzpwyPr7qYIsDX91R+w2ZI4IFKnkJ7nAWTGg=
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr3785119a91.25.1778163004498;
        Thu, 07 May 2026 07:10:04 -0700 (PDT)
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr3785084a91.25.1778163004032;
        Thu, 07 May 2026 07:10:04 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4fb5e7esm6536089a91.15.2026.05.07.07.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:10:03 -0700 (PDT)
Message-ID: <89fbbbb0-1a0a-4ba5-ae49-7a19aa50e638@oss.qualcomm.com>
Date: Thu, 7 May 2026 19:39:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/29] drm/msm/adreno: use new helper to set
 ubwc_swizzle
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-13-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-13-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc9d3d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BTchm6ImzknZz8NDhdQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: eZfz9PzstQpvmowOFk2oglxCp2rZ5YvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MSBTYWx0ZWRfX+PcCeGzhfIVf
 d6JscPa9/kp5h3lDptsRMc4cv0INgy8Zo76AYo8VNGFFKVhcFwO0Wm72+wVKhQ9LP+nVKCBCpqg
 2W5y+WcaoYQhYZO9zI9WHzjsF8ptjuWCxLA5Wiw0PQm+ESIRAMTJoyEyRwzJC2ipDFVFAobM+Af
 H8zgwTtHAtftuoyJxqFrwgUStzSWdk3gIv+vpw+VhKD5Q9VgWW9c1pS9ZJ6ycF8C2d6JvqipaRy
 k7u7BaowMeqx6lx3Wd5uC3lFDfSOchVXRweiAQZEr/rIuGj9RoSPrQDMIJGKdDvvivRQErD8tQy
 papMYBFtgdlgNDHh2jOQfAiUGVDfu0bIORs/P4vTrD28admhyHsGusZ851TP8CCLtEemTUjUqyg
 wodlnKhvVMM/Ld8vdUC4tnOLFZQMjSe3p1g1e1vV4aEQIJyzE69d6f63VD2k9/5CqRRuqNTd6oa
 y1SdyIg9VUgIUZM/klQ==
X-Proofpoint-GUID: eZfz9PzstQpvmowOFk2oglxCp2rZ5YvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070141
X-Rspamd-Queue-Id: 5A29D4E9F29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of using the raw value from the
> database.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 76c681614416..5c17565b0499 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -745,7 +745,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	BUG_ON(cfg->highest_bank_bit < 13);
>  	u32 hbb = cfg->highest_bank_bit - 13;
>  	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
> -	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
> +	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	bool min_acc_len_64b;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 1923f904d37d..53def136e0fc 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -275,8 +275,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
> -	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
> -	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
> +	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
> +	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
>  	bool rgba8888_lossless = false, fp16compoptdis = false;
>  	bool yuvnotcomptofc = false, min_acc_len_64b = false;
>  	bool rgb565_predicator = false, amsbc = false;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index bf1572156b0b..d26985c88115 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -430,7 +430,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->has_ray_tracing;
>  		return 0;
>  	case MSM_PARAM_UBWC_SWIZZLE:
> -		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
> +		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
>  		return 0;
>  	case MSM_PARAM_MACROTILE_MODE:
>  		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
> 


