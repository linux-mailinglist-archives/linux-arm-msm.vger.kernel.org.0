Return-Path: <linux-arm-msm+bounces-73967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2783B80824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C721146682B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683133064A2;
	Wed, 17 Sep 2025 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmYGJNOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05453397D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122707; cv=none; b=eMMmK1G0nEeEgIcwleIHCQ7RgNUmarfX/yOaXdj7fjcbB/SpCd57Avd6Zz9lrg1WdZ11mTYzM8d8e95QO1ySkLrVIlvsvqz5Y9kyVdGhI1M5gjwif1RpHiz4DLE5opTfsl4p1nJ8CV2dvUahqqL2Qiub6IukPt2J6N8/MyD/GNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122707; c=relaxed/simple;
	bh=gwgIsDRVRYX2HhF1a8Tduga7fOLhZSoXaPH0ZHLIBKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwYDepaQZhEmNv9H9Vi4UAXQySE7WtODth8MSQhzpIRDBI0E+LLcgt2knyTwGxaJAx7Ea/FDxradM1AfZgSjsPjvlVkrIxMDJn6h3gi2pSxu1voBCln3937S4nqqetBqilPZlL4tzGnRrcXIlrdwNkrhf5XkS3wq9ItUnPYPqWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmYGJNOg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xai1032429
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=; b=AmYGJNOg7ZI9mNqf
	ohNuYKzbBoNUXLEe1XfqGDT4QPC1lDgzm60HYvILfn8U4Nb2JNLHsmA5N4FM/Gob
	ve1MgvnBFB/mDsoUTMlag1zyMHHND41OJ4NYgFi8UOty8+wxv8JXM1Do4h40WBAv
	gSu5FehDq+UXNv7Ek9dbdUO/rGo/9PBhhIl5qxCIhOMUFTKxV8xKZJnZRtmGDKOZ
	9qOki9ZUjt6ML7mu4WCIiaepLLxHqltbO2n8xiA29SU/hzHmGwcaDd5Pk/Qxa/8z
	GzQT676WCBNS2ho43eiSvKFqtoylv1Tg+uzRd/98I9Nj2fWNvBVZVym7us9PczmG
	eCNGtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyjwm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 15:25:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54b7cb9d30so6275654a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122704; x=1758727504;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=;
        b=gC3jZDoGe7EqJYfV2Z5h+X90Gt54x4TMKPlsKKeY6Uz6ds8JNVmvl8zjRE4p0WqLIF
         9v7VN0QM2F6+8tIqmXf3o0oRSMAGsgi3t8fL5EdDtSUKCmZTvzmfCNX7/e9EniPr6Tx3
         jzikvHKCRVRu7kcchHoWskqNt06Z15LWQYXRACjpZ2TEXMVTby6R9HAUv6cQYwPtlV1M
         ojEe3I1umZhep5XTNY2OR9NWdbaUHhFVjNEBg3CIWl+6NpLooShnVkibmPG5Gnwi92YR
         Qq9/I+cniCUA6jeMwAV3iOP6mu9B8ZqZY6JWFjldsL11rMNz5ZRr+BRInMFAH2DTWMnA
         EyVg==
X-Gm-Message-State: AOJu0YwIaEhXczfW+acJsidfYD3LNoCpuOqwJVqSWglCLG8isfqKUA8Z
	LxWL71r4L4YklGs/3FLgk3IgQPqbtQ0pHSf1g5DCwTlGqEMvhsGaZtcxKVDy94CYqLgXbRmsUlL
	PJgNBqEWGtRZNcHLoQkfEDTV7CpSlsI8eWhVmnENCl5A1ClUR2vOtw6RFk9PkgYSHEfqk
X-Gm-Gg: ASbGncsGlOD3SlSGP1fdeV5VVoHTiPTZmCdB3K9nKIrw/KQSUllRbokgVJXovzETBHO
	d8soZdjb0bTyRtTo2iLB2hptXfoZSISHNaERsasLTqj2NeW8srKuGD9J2tE2+z1/pWtCfhnniNt
	BGagQLv9MbrW09erRUy7zvY6t/0WE/az7yu8pTReJtE0p3fSgdHVSM1TsBcvUyhShrJN8lYnvCf
	hcatz6rOq6HpzZX2vYsayIDRScJfuKV2KV9yWmQ4WMPxWJrKUgZT6nSRjlXhtiIiegn4OjcLx+p
	i3qR9FMmeZ1T/29PbGhEPNcvB/jqTm7QbpLWDyWwYytFfQvsG1qvWJHDTTwmvw==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id d9443c01a7336-26811ba45b9mr26940405ad.13.1758122703762;
        Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmORI6sNcePUHDL1ea7LBwUjWJDxDDKVUaaJcRzC/M+TlpMhiORpT2SoIF305qk9daBSB9Zw==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id d9443c01a7336-26811ba45b9mr26940035ad.13.1758122703239;
        Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a80asm193499715ad.90.2025.09.17.08.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:25:02 -0700 (PDT)
Message-ID: <16701111-9e8c-42d6-8fac-2f4b9a5e5e5d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 20:54:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/registers: Sync GPU registers from mesa
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cad2d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=wfxb_XhhgxZQwQkhXVMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 8CexbHE1ZRepilRTVVeF4zbY4wUQ9EDg
X-Proofpoint-ORIG-GUID: 8CexbHE1ZRepilRTVVeF4zbY4wUQ9EDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6RtM31Y81W9H
 iGv5IlxmHUB0OAfQEuAXbAGSI4O/obbAn2TXBCBtHM/ZCVo22SANpDViYwT4jvX2NDZgRHywyw3
 pxX7WjcKHHPWFwVWCGS7RRf0KjUCBly/oEhUpbI++hs0LTmbDSV4PNjT52aOrn7fT5eOMngEe/t
 /87Y5V+3z5kMgiLUumPoVQUZ29mNRk/sreykBDD5eP+sw5QhUSzwGDlVLEycMECpO5iCMeILjxK
 t8RgEYNsEGUJziCaakXPD5CtzXzc0zQM38zuK8HbqQUGGDN0BoxRkG64BAJV47+0/7cpO2kO8O6
 ehEYe3NkKwq9W3DCsRTAgV/P1NxzyYtbIbMfulW7sneCBtcWrETEvK/JZjbLwctUGoG+YggwpKX
 AChwkzVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
> In particular bring in `CP_ALWAYS_ON_CONTEXT`
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> index 9459b603821711a1a7ed44f0f1a567cf989b749b..6ea5479670970cc610ca25e71aa41af5f328f560 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -254,6 +254,7 @@ by a particular renderpass/blit.
>  		<bitfield name="CONTEXT" low="4" high="5"/>
>  	</bitset>
>  	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
> +	<reg64 offset="0x0982" name="CP_ALWAYS_ON_CONTEXT"/>
>  	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>
> 

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil


