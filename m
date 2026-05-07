Return-Path: <linux-arm-msm+bounces-106419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pf2hOJ+d/Gn3RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:11:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD954E9E03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C39A3043FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEE33F20F4;
	Thu,  7 May 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0/AVF2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhmYsUcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D23016E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162735; cv=none; b=W4Gdk7q/63EMgTaWPTFlZzZt59rwBw03tzXRjE3ye7yVE6kEhsiQN9b2PXZlwU5nvjS7+gM2ZpNRa7oz0tIpDh9kTaCjKqFpte0bUYkZiOi80PiZV4eQCaKEczA3EWSXZKA2/QdzQppJ+9ojzSSwkLJV7cDP96fcgBTsk0Uskpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162735; c=relaxed/simple;
	bh=VJeYUAA2309q9lgbKbdvm0r7x9iaF4653LBeP4JcpaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZzFb8JaWKPEwr2K4k9xoybgibhw9ksUPPlVeaqpdYODIOVg/Hqh47AD/KiiUctX250YZ0qfg5G/cvvMU+7XCjmhnTLQMq3nQYtFUKBBPykqGtqTJIvkrjpVs1tZIWznjUG7dKHECtWetWKx1dPqYSdXY1be8PsGoF/tAfcieec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0/AVF2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhmYsUcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479liSH1669559
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BC6FDv/KCnHxFRu2JFlqNIRoVxvZm/nujJQr/xP2ew=; b=i0/AVF2HZDo/BLCb
	WvTrxhYA/bVoEZuS4GZc+d3L8vOAe+VW1AYGfT5VqQ/4dzbA7/BHCAUjM3Draws5
	nXR2cPrSskwlYT/6Bl8SflTbYzKpdblgCQ4EzeV2AVMbFk4Nw+SsHjxnjPqs1cnT
	81Y+5E6tvM1nv2c9CdbtUFVNss0W4Ev/7WItpilLA7O60BU0cs+HUu46R4Y2qMS/
	gXd1v6CphbUbeolHiUZeGbN+3R+kkMu9WhylTuSg9DgTrMorCBFbqjGc/EDyLoZg
	wfS3WeJJsgHDDew3ILgRQZ89oEr/DHkgKo0gdTvjw4fiOkbRSOdeLYyjDob+ikV0
	xu7rKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p26jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:05:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so65342a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778162733; x=1778767533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BC6FDv/KCnHxFRu2JFlqNIRoVxvZm/nujJQr/xP2ew=;
        b=WhmYsUcHAdRe8H/PK9Buedh617eAPGQIDdBIjR9LYm81NTDC66C+Q3U/kwATrwbCgB
         uko/gk8huxl9Yc/BjqacSnizEaF/XZkOgHl5tHUHG4BgNPvM/11xdaqxz1Rn0Gaqwxdy
         QkSdOuv+IyLYfegUclByfbImS2M+CpXg7KQIpeAH5QO2ahEXwYRN/+NAR4ce8TGsBvmv
         X/NE4eBULznjDE51LEAAuxCBTcGrRVqLk+tQ94kykvdW1zirSeKW+pqeut5jHFN3elup
         hcETSW4VKVWJhicQoTkMfQfARo8DP64C9w8AB3GMx2QaQVTW4Dic1CDCqHbkijUCEw6i
         sf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162733; x=1778767533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BC6FDv/KCnHxFRu2JFlqNIRoVxvZm/nujJQr/xP2ew=;
        b=nznL3fJGnvwSulLAg7Ly6RqZpzIknHvUijUdB1rbX45vOwUHRcbAhV+VyEt6gV6/nX
         7kBcHhUUaiEK7vHaHqVZuX4LbCtVO/9jZNV4/yi+ku097QfkplI6F04cmHl3kE7yJgAr
         vhcZzeS6muGtU3O8Z290EDZyIzB36bdMtJqHN5SyxrfvrpbgaNp5EVzEHf1q6+qlo2+r
         PZxVCiCljv3TtRCJlhEYhmJ4YA0y+E4W+hMca6jc8uX70jZFKN6Z4Up066VgIyZt+6zK
         7WIbnrsdQd/5jkgNL7Hr101F3zK6DlAiESnQWZA+ubfCjJ9bwf6CsuKNCjy7V9WSFIym
         jMOQ==
X-Gm-Message-State: AOJu0YykveBcLccPdSQQ4Cq8YKY2B0t5A88g1hIU2ftPwXePZkwK7Q+x
	UuTllfSGZwlO7MUkKqBc/vW+VT6id0dzxQamecIt7DyjvT3fQKPujIn4rdtaX1WM2DRtnfcMvA9
	5PRdlOVVoVNB+QvS9N7VH22ZAgQTMSjmPDciSbqA6MDD1OFRkVnl0LRJ0DI425BdfDRQR
X-Gm-Gg: AeBDieue5mxg/I2P0Woc/g9q2IeQotVW4TFOMr0iXCi5Sv2TFMsTXOZ5Tsx6y8iyMNJ
	k8vg2i7gCD6NmCuzMXsBUgWViTkD9wThT867hcbfxrfMpTNvTz2UWiaHdVcdsYQMwpV5LYpwZJk
	XkvX/bj4tRcB/tpbXgL0qyrIhkIJ3qoFk3/uG8GqhAVyAcI6I83qu4oX684dSqR03Fj/KzUUYzd
	pLJdQVWfhj6xvhSerGutaIFNSF5n6HWBogwehULrh0qAmUEIcQN5h7J01rqMHONCsveusdjrFny
	4eareWbzxvpNPxtfAl4vWkbR6q4vS1umBKn9BSgQp232kl9IpYl+cWZBtFnE2Sv9M8SUEZ94dL3
	ourcYyirC6TMrz93Y5L4tpZ/vFJAi1QAjsIdvD5D3XFEN9XJw5DtiXmo=
X-Received: by 2002:a17:90b:2f4e:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-365abadd261mr7941370a91.7.1778162731057;
        Thu, 07 May 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2f4e:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-365abadd261mr7941240a91.7.1778162729807;
        Thu, 07 May 2026 07:05:29 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bd8debsm6158400a91.2.2026.05.07.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:05:29 -0700 (PDT)
Message-ID: <09031221-51cd-4a6e-b87e-f2d8290f8ac2@oss.qualcomm.com>
Date: Thu, 7 May 2026 19:35:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/29] drm/msm/adreno: use qcom_ubwc_version_tag()
 helper
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
 <20260507-ubwc-rework-v4-6-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-6-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MCBTYWx0ZWRfX2KTxksC0AJi+
 auqcGuceAURRFC2EnXeDxHF0B6VwYSF05i36g3qYllbOSJja8jL0zbcUoRpiv2KBXJqqFevypY2
 J4MNGwaMsNo6zhBM+wfg8P8QGZPzkvh/cvMoeINbrX1psUfwqAjMs2liaL/JxMWBEffiQfdzMlf
 gBWI2LUUcbtg2+R+q1xvaiXcRNINqKxwtCuMIXFcDLAKF9BT3JbxGY5CB4KdYuI5MeZ6VYKFCwX
 ZMZxUtE0hT7VqtYIwuPOMAfTLrsYMfqdJ0+Bex86O4v+cT99aN7GkC0Xdr0KfENmAesIRfdXMjJ
 SG5BLnLIByNApatPHwxv/aJ278fO70QFrwz7NhYDbdtWAXonR3Su+BZs06YRojKXpv4VkHRc3yr
 Dr1qF8Tc1h4VqUvqY8cMWDT5qUbJV5b4CiUcK9Kl2/PASyeDf0UU0pFTmAZIX9prKD82G/1c9Tv
 tKq3x8OCYRHt49I1G/w==
X-Proofpoint-GUID: WDFQw2yzLL1o0uFDtCeIz5QMI6zK1isZ
X-Proofpoint-ORIG-GUID: WDFQw2yzLL1o0uFDtCeIz5QMI6zK1isZ
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc9c2d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GMbUkbxl-BqPewUEXpgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070140
X-Rspamd-Queue-Id: 3CD954E9E03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106419-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> Use new helper defined to program UBWC version to the hardware.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index ccfccc45133f..1923f904d37d 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -282,35 +282,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	bool rgb565_predicator = false, amsbc = false;
>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	u32 ubwc_version = cfg->ubwc_enc_version;
> -	u32 hbb, hbb_hi, hbb_lo, mode = 1;
> +	u32 hbb, hbb_hi, hbb_lo, mode;
>  	u8 uavflagprd_inv = 2;
>  
>  	switch (ubwc_version) {
>  	case UBWC_6_0:
>  		yuvnotcomptofc = true;
> -		mode = 5;
>  		break;
>  	case UBWC_5_0:
>  		amsbc = true;
>  		rgb565_predicator = true;
> -		mode = 4;
>  		break;
>  	case UBWC_4_0:
>  		amsbc = true;
>  		rgb565_predicator = true;
>  		fp16compoptdis = true;
>  		rgba8888_lossless = true;
> -		mode = 2;
>  		break;
>  	case UBWC_3_0:
>  		amsbc = true;
> -		mode = 1;
>  		break;
>  	default:
>  		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
>  		break;
>  	}
>  
> +	mode = qcom_ubwc_version_tag(cfg);
> +
>  	/*
>  	 * We subtract 13 from the highest bank bit (13 is the minimum value
>  	 * allowed by hw) and write the lowest two bits of the remaining value
> 


