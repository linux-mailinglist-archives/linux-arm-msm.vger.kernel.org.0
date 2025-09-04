Return-Path: <linux-arm-msm+bounces-72127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6CB4459E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0505B7AA659
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC7D2FE04B;
	Thu,  4 Sep 2025 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUKuYwzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83351251791
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757011159; cv=none; b=f5I0uYCOlIV0wzrjpi5cAF6nHQ1udI5ZUS6HKeb61Xbwh1guehgjHG98F/qBfrpZ3ITWh/cR+GnS9hZaXCQYqFYSQG3KuEHOL8etTvpSJJQZVz793xIolBevDWshK7M4beRIGgyAu/KUcJAaGcfRf0U2yL225Murwy6slEbvqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757011159; c=relaxed/simple;
	bh=8/MK1xQAeLBWcNZwrwLd8CntYlqvCN0pwOtNjjpT6ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBTwCaCXG7pzeFIda3q3gwsUiHzx4FEXqsvJ++l6re3agQzlLtOfFG0E96JnFLVqr9UJkJ8Nxhxg6bMZ8ToE+c/LGtW9GbW5xuohP7+Bo42uSuTgkLqjt1u7xCeX8txPXlgNeuXDFGm5aChqrso9lo093KOEYvO2cUWS4lfW8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUKuYwzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJYjp022166
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 18:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=; b=pUKuYwzvgy5mPAG1
	g47p4h4g7JfiSoMpdvi8U/i/P8t1Fm2QeKguuxHSm1Ap9c5xRQTOaOTTK2WG/g89
	b6vgaT7PJDl9PQVv4hJV019kB5+94eAF8iWIO59/I6bLKac8RM76rGMPbvupprAe
	xDuRSeTTd4niCrn+FPuwv/sHsXKpxQgf10xgpdFICh90LUF3a+zcBNDTNirem8Yn
	/tL2NfQ8QllvIsjRO5vk7IW/fVzhSeJGA3SJO4j7AWHdQdyeIcK/GoNSJ+LYjHRB
	j+tlH23jH4nbX53XUUAET2u+kG62cjPkcVpU3OMbj9QHqEKyR6xWO3hYQpkOfqqO
	fcKS6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk98cn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 18:39:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso17184355ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757011156; x=1757615956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=;
        b=tlZ2dS04rCCd1UOVct9MyI1bqJYXIpBVCMjme+U6W24mI7dsGpf1JmsP2OOm1xrqSv
         6fL94bHoIhiL643udMt4ZcRPxe46Ih4Ydklbuf4Z+zJmelgPQYVLDcH/p6TaVQW23ZDf
         1YWWGDk/J9TWE9fsb98eoxF07ytGZ1/CvJkAkU6gVB+oxvyCp3AJNYqQakJ9KQLNIItC
         IqsWkgbLlQaeqMhbvnxnjnyYU7EY+FrfJg29oyVxKnvVmKsI2hmsQanBUqCDv9sPuI9C
         JM/3ezUbgVKZ/XjLXIdzfzxE9x51Cz4a2LX1XGeLbAIGo0b24wf0A7fXyhhSrWzYEv0o
         7o2g==
X-Gm-Message-State: AOJu0YxxVYBBBdb3Gzki+xaC914rKrKMZ4QPGBzlFKmMU3jEh5GelQc9
	JSPh34ytAsT+UWMmyexDFDdf8l4G+eO9bB2rYXxkLMlYi+iK+toTwEVYWxvyl12I51O1XHluKGP
	bM/PARgMvJPhVTxVb1b/3L4Wve9iHPT9Wwg5gF0HGXABdW4BwyEwkX13XndDdtfqBVSkQ
X-Gm-Gg: ASbGncvX5pZc9RSZ5K2RZQVbkCPDZscK+qrilbTgKpt9pBHY6+AU07nMnTkVHDAhb4U
	71Q94OvWuhX5OmV2aOlZaisc9kY97jgOzGacmG5rL10Ouz9jPiv1sFaCs03TurRxZGXfJZymz4Z
	EiQCuJ/D9kESSpnKXOK1DvwUduD3CDex3URULYdmpCL5bhjWD0bFwh7R0n1XH07EbqZAekuJFCR
	1hYt+P1BhtRkrAfGLQdaj9HLmY6fMEosgosQTvzFrr3gBQVD1puDd/IKkKfPR8+Que+s+jbG+AW
	QEBUkp6aWTjtPfuVihHEYXsQDiPShFzRL2CV1uGrZnjsQfq8VRXYmthe1LfOIWW0V3w7+ipIT5D
	YPB5b2Pk3RTAHPDfki06m9A==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id d9443c01a7336-24c9c5c318amr78060455ad.47.1757011155833;
        Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGt8vlrmccO/zKDOpTjvGT8zqU0R03/eoM8Qk0vuGXWCzN2nGB8EZel9xPgSfcY7c/FvHbGw==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id d9443c01a7336-24c9c5c318amr78060015ad.47.1757011155125;
        Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b7eesm50520415ad.102.2025.09.04.11.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:39:14 -0700 (PDT)
Message-ID: <d312c946-38e1-4ab1-b038-19239d10720a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:39:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xhv-N59bUUf3eESq570WQ26jtLR3Xb8F
X-Proofpoint-ORIG-GUID: xhv-N59bUUf3eESq570WQ26jtLR3Xb8F
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b9dcd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k66G2MeTsQAVc7QBSiAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX8JT7kwtrkuvo
 LrnshjfuJo3TLCSZzmmwbZSWfykjMr24sIgo0eEVKjUXI8gRw+Fcxrn681+U+LAkgvw6r70B+/G
 l7IIbJZViUlkFKtFAnuasXKYsSOoNVR1zmtVkSzszbYjhFZ2elkpWHjRMMpKkF1TNvoHT5UUppZ
 4a6mFGRjH48+G9RR+ePneXwvWUWttcrvyoL2WXb1OkC35hOhIWkW8/lvv6hZs8g7Oi9fBqO9gpG
 4GSL/qha0PnHpFwGNcuEMpC6Ki/7tqisrYJ0/VaJSI1/msjAB7JW6P9m+/oAguuyRoPz//1BKMl
 ZTs7yrKpV5PgOgtzav3cXWPHLsAgCXWB6uXEFp1QS9u/6kSgzNwE2nhmzhr8q7uZmql38Z8kjt1
 5HhZ0cHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Interleaved YUV formats use only one plane for all pixel data. Specify
> num_planes = 1 for those formats. This was left unnoticed since
> _dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(UYVY,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YUYV,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YVYU,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	/* 3 plane YUV */
>   	PLANAR_YUV_FMT(YUV420,
> 


