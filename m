Return-Path: <linux-arm-msm+bounces-82120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D57C64936
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE48A364D64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C1B33436F;
	Mon, 17 Nov 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDTM5GSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpUBrVvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A423ABA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388192; cv=none; b=pAS8vG0rgHNAFYfaTLeMxGszkOsPqTXiuAPkKxqcKlpYhFtwjEMjNO3QJ8IYbosT6oXlRCEo0Tao8wLTfYS8EN0fUvGAyaqo8LmaBHUktUpfjCn3xJrXOdu5QR8DFUphIIL/bzTftX5xWJqwVV4oKhtyNabVT9my9FKHYh3xJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388192; c=relaxed/simple;
	bh=zBQN61tksf2025UCtOB0ANMv1Fzpi+dfcrv4CPkZ9hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2MO10RvFQMIuh5nU6R2rC7vHZ1F5jeeUj0QNUMErichdHzA8M7JHHRXv6stbzHKwLfDmkzM0Xjs0Gs9ZMcd/8bv3hdpUOkF5782A5KOJviSrBpRAjbPldtdoznHtvFw4nDnw3t8t11q+5UDenJJRXgZ5pG4aEBkAixhQXUKteo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDTM5GSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpUBrVvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKPos3932626
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=; b=fDTM5GSlpZlpE+F/
	Yll2WAWkbz5B8FIvh+LLqnK1wha3+V5evOq5StyQ7/yXVwQT99HwrK/QQ4DYrHib
	YtYZPmUrhDwQm775l1eMYeL7T7GtlcSFk7oBYn7+4zKsHI6uYcAVX9OQxSwoefKf
	GjtudtcbJIo83ojArDZNAUoHitTo40vVyCMMoa7qn+VvQ+tsj/XAetXK1E39DJGe
	347eDqJ2DEZjLYzsHIsLIm15nbZSeUeOoQMsLTF8ZU1pYIgtJZXDewAui6xuE33p
	LG63nW6tGf1brkpBHO8HJtDS6ySSN5V9rFmrd2bcDUCkKiSzLN/dM+qUNgsYgVAp
	t+ki2Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90kf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:03:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55954914f9fso260604e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388189; x=1763992989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
        b=KpUBrVvwetEWta06MHM4XN4pB3QMnive1thj2UnT49561t9GcaVyS6z6UmAeu9n2HU
         CZxxz4Jmx8dR72g7SLO34ToD4xjnuXL1tkhRxwk6Hxzoz8JrCJoeOWdNVqKKm1RAyTUT
         juamchXHDH3uE9LznFnHD9Z0vbSSQUkx362a4CDcU7AnDJb8iYRuhqw7UCl8xCGUgsOQ
         q+AWCJvP7NEw7YBdp/Atc+DlysrpPZQj4j0Yw2JHoGb5NRMUqjg/kdGo+Wa/kKyW5FVR
         78v9ydKrkOxD5Ls4QMoFB269OUtiTi6f5eCgml9MqDkE53gK9hjVLE6oLlVqO7hQ08Sp
         FJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388189; x=1763992989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
        b=tL6tdrPS9t90gifj9z13bOu2wOZ4ISAkduUKwSNGSeIGSX87TCZg9oFtYjv9MMAWr2
         CN4Rn2Axj9EQgfIonAwsAfn81iNReScWO9pm/KRuyaChNobWiVrZmdDXtG4SEf6M8QMt
         Om4UBMrI1C3blfetj7xondtlVU36ouOFvb3etJXnFf/E1RMi23QXGHJTFFtLB0msIvtC
         LFzr9t2++cRrxJMV9jT2XS+sUUb3McofcrqFzOBWprAJ6R/qVjfGpT2rAmITrfx6sVx8
         3xNTVeXkyRxfG2UYDUrLF9Gxnb1ChjEveRSpH/Kau6u0faUk4iXtfG5mnpJCS/Xjzota
         CTaQ==
X-Gm-Message-State: AOJu0YyHJMzLx+5FQnX675Wptyg7dZpBXN5dSg9YQwoyYU7dg2C2e0jQ
	smQApqSrSwckU79QKuoeBD6a14Uxa2SucFsw5vZGGgvQeS2VTn0lnacOyTvA+G+TSx+Am3sigTd
	4u8HF2jbefLFAvgqLC2H9HqXacGuMCSeU4eGcUIfkaU/6PRY6leO9sDF5/tLQXUMAMB9s
X-Gm-Gg: ASbGnctVPneCw7ANmwZ/iabYqfx/Fjj53uG+9MEuO2PYUj+UedOGEvIr0dcbcC0zCjv
	WRfWW89TAXr10dDWBOGDuuNp/1L0IvlbryhXLqNEVznh3/jfLvUdVt24D6npUl46Tdz6tC3KoyS
	/IoMrorQQvhOlBpof2tumZDmeFYmoCjrnOW6PVnB0h+ew4FIsFgoPtRMOeUZoIUXG7NjEfESyhT
	aUfVgkcxNfhnRbuowgxwUktEn1xQwS19GTRzyqFTWqh2H6bhO4o7P7hVxxHc/DXnDuY0+n+5cR1
	pJaIB7NYPUxb6zlmZzbYdDiXyfYQt88rsM8ftcqXwCfFwMY4GLNv0tbDwJXrf/rkGHjMPUgqkEC
	Iz3gj+ULhTHJM2cj5+yspD8fDedB/DDXjv5fN8U63xFFn178fV3H9vJGW
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-55b1ebefba4mr1296481e0c.2.1763388188167;
        Mon, 17 Nov 2025 06:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZZTHOOdfEqa9ER8hemxiu6HJtbROxsxg4EQg/rySnc9YSfY+WhVEbc35EghFcBXcleB9lbg==
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-55b1ebefba4mr1296341e0c.2.1763388186109;
        Mon, 17 Nov 2025 06:03:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm10428680a12.14.2025.11.17.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:03:04 -0800 (PST)
Message-ID: <922abf06-c75f-45b6-9653-492a00d414bd@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:03:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zn3uqRqI3Lu2ptYwylya8h3-MXrT1wU7
X-Proofpoint-GUID: Zn3uqRqI3Lu2ptYwylya8h3-MXrT1wU7
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b2b1e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX5XxJfmR+jq2E
 7wsSohcWYYzoDJ6ILimCJZ2LLT/GiF8W0Dm/cEXu8sJ3NEWjKHqkPXU6lII92zx64ImWj0a7YSF
 puI7P3spj4SHq23+b/JG1Xz8rxFi64NMQvK0nITaV5xJ1v5Wssv9bk+ZN+KWdCsQEnHQ43xOH6Y
 U4hvDailyNVrjJYWU5qDhqorFM/iT09Jc0hPIev0hzZh/hhFKYVRpK2UgVBQyaL1kN34r335EYr
 6h3vurCN3bjERCTewJeVe0tfPEZD9yMKQsIsauhoD/pH4Td8ygkZ2elCM4HyT29YRkQt9fRSpfJ
 4odnHgctY9cWqbQFu+SmyQV8VNC0EctsSd9DgyRA1UqcN09PEoT7wubOFWDdQFgsANhMRT3AHOt
 yrg/Q5DacfdV2NGfjXS2+NsPKeYy/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170119

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 20dbdad6e2e8..ef79f4cfb80b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");

You need to unpin and _put this in a6xx_destroy()

Konrad

