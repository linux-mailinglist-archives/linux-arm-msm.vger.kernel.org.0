Return-Path: <linux-arm-msm+bounces-78653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2189C03BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 00:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A8904E4551
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 22:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C986E285C9F;
	Thu, 23 Oct 2025 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SW34gp/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17736C2E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260383; cv=none; b=eIGij1t34ek5exDCC6ELUa8ovq6NcJcRvsAFaKfbDEUPR1uoFhxddC/I1suyJe4YaczdGaolJ1pwMniwJwOvG2jnZ5mnzrgwdH3/gJrlCHnVqaQchjE/hMal2dO+Q9827I2FhmudISNDO7x8YNKUTzWxxOZjk9+8H9rcoJqU4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260383; c=relaxed/simple;
	bh=bFeH/C4FMR4iuNXtRq7pzw267IeFmnHLM0bg3L8ikOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSOb5oxATArPUcaYGhHqkKfU/0UZtpuyWYFjTxd1B8Ombt6XsSkHU7VL/qM0g0YId8lAfpGwN9Js43GXw6+HGx+COfpRTTJ7Ojc/PduyJqC8X5QZ2YDzIYUeRvd7CDFtZAK2h8s4n0HFPcU5mXSLh/6gl+p6EMU1fMovhIX904E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SW34gp/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEHiiL018600
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	469MVkdM4tlBeR1KDgd7vEW2/LS3FomPXkmwr2wH4Xs=; b=SW34gp/f2bfuWLb5
	btmLFbgoz/D4jEB1LvPR1PGuzlEe8Xa50DJiHXqMN1PXWwoEp570EAjzL/pvqf32
	zRZSEtMzi/vMj+RA2lYepTaMGaHe0SuiBoUEELypApunGplBpHrMW5yvtlb4luH/
	nUDEu7S2kEOmtBrIAzVzn4dnekeE6Mfd5BuJL9lgI611KYB1pzNqJwjG0elo4FDV
	AQ3dp8YqG6PINCxfWcNICvSqtVquUxbaNBxTjZui6DRl5eiubzdj67H5T2nXH9GL
	T3j7zWi0F49Urmr/5KognNXsMePFCV1Rd31Wke3Kx/jhJw5pAQTWVzb0EWAseFZr
	06d2dQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08ptck7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 22:59:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290cd61855eso12110645ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761260380; x=1761865180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=469MVkdM4tlBeR1KDgd7vEW2/LS3FomPXkmwr2wH4Xs=;
        b=OOrsBxe6MR1zf2mxoPjX8/mBBBN7p0DfNzAOxgpOiq7flT4kKKhg32DqxpCKje0CNe
         IaVhFAwf0fUb1mOpqal8lcNG0b2Cta61ozjdoxJkeDrX98YHUY16VbR3x0G8OhUgegiL
         Gomq+gvP/XRciI0GJDDhnTgk+f5YxBnGuZ3aCiN7XWtLDlhoGnqUtfRGxbCOmCNzZ2BR
         7/xablAUk5kbEO41J5ffhSbNupSxIYd+yjLRRbkZ9r+En6I/db54pjhTDFxLV0qG+HXp
         RoAwgzbZOs9dphkko0pNG2kUmTFV17r7KNxx+zc445Q5uDYPjqN0ZBprxndPUGYglJuY
         TSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVXzvGascpaFAYIEouTgPZ6blsMZ0SzrKcGsvsFCab+hY/cXZUrl1mmIE/EJYezqPUxqoRP8MeYpltPmAzm@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEBRZIxZGaTRaT89QL8KmxE03utpR7mVZd6jHJ3Vhpf/NG4KD
	ami1fxxQrioSDA+jDYtbPR18XuVdihV4Ms/CT/jEGK4ezGvUx+iV2hWrJrJV2F9KYiSfPkPts1x
	WLgXkTNqLL6mlBK7e1Fyz1yG/UwzKZbGBNAfmnohyah80OnH8dbLO7NI7E/tU0MaN+wcj
X-Gm-Gg: ASbGnct8ogcnYBMoAyJuGUSGPwgawBJppOxEL0GHtz2N+zCFonEfH2kcz+cf7ZyFQeQ
	69gdXOEYU05wspyO2/ybFAO0zRuCYdSip3fc92gUPEyr4TNHLgVt7DaZW+ZRwKr5Oofov623cqt
	N9yCFqJr3czl883rEE6qI9Y3fal9OseU8xaMKnldiLN9PRPGyhF8FNyl+0usTpo/cm8gYHJGiDA
	Tc+OTgEVnh1gzmqmSEX/jjecAtsoSIwmgfaF9hO2pLIngQz0dBUN02BIbf1KDhBG4gPvfwtMzvX
	rsHASto1a0HoysEG0QP0NZYqAaJslkN5xEFs+6SIhC+NNEVZvJBanNYhH/VhedmCnuru2SHVWcH
	qvvEvOOOBjU21W4U4OSLGThI=
X-Received: by 2002:a17:903:2345:b0:28d:1815:6382 with SMTP id d9443c01a7336-290cb65b674mr335551665ad.46.1761260379734;
        Thu, 23 Oct 2025 15:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJbBbKKW0DFk7iDHJKQ3h/G/P4s0gD6I2OLQk44UpbQebnNfbRHLEqoXFR2CkmDt6YK8syMA==
X-Received: by 2002:a17:903:2345:b0:28d:1815:6382 with SMTP id d9443c01a7336-290cb65b674mr335551455ad.46.1761260379120;
        Thu, 23 Oct 2025 15:59:39 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9259sm3169412a12.2.2025.10.23.15.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 15:59:38 -0700 (PDT)
Message-ID: <b7b1648f-91b5-4259-8d7d-6d4645f065c0@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 04:29:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <202510212140.4YWihsB7-lkp@intel.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <202510212140.4YWihsB7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX5hyC2PEO3tGB
 12J5izrbuB9RjdzTCNT8kQu6NFIK9WWnsTtngY9JvkGbNDhh/0OQm7ifBrEKyXke9jcZS9BxvgZ
 cvqCktYjtsNqMm3r+hK9Nf1Omrua2TAwtJWRx3EcNHSMKueQvYCMwJk8fAgYFWQbJp6p2fFBUHq
 KOUsyzhR8XDJeHXWbN9+eSo8lS78zwL6tmkU6P11XE7vDLEf8SFr1TC/5QEs65nPLiI2fHxGAu9
 BiK0K1Ia0mC7hnVGlkXeh7JalNVNaVuO5PTTdWzHsz/PmpkFNinnOsISkWhHD9t7mQbe/nlaAd0
 Wrf0EaQDMAyMOOSN+gX/HMkcDrcEKpWwbZ2xq2/jpF7Sfp0S/WjJOHQsMjzYIRAbtF9PuyYNzh5
 p/20XtE+3fuUZKw7lfIJtgEa4FoZ1g==
X-Proofpoint-GUID: cLvBgnfe4QpOFBljYJOvzbKiJYUkFlB4
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fab35d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=IvkCWOmhgfTTPoLh6GMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cLvBgnfe4QpOFBljYJOvzbKiJYUkFlB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/21/2025 7:45 PM, Dan Carpenter wrote:
> Hi Akhil,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
> base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
> patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-1-0baa44f80905%40oss.qualcomm.com
> patch subject: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
> config: powerpc-randconfig-r073-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212140.4YWihsB7-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510212140.4YWihsB7-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:641 a6xx_set_hwcg() error: uninitialized symbol 'cgc_hyst'.
> 
> vim +/cgc_hyst +641 drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> 
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  600  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  601  {
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  602  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  603  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  604  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  605  	const struct adreno_reglist *reg;
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  606  	unsigned int i;
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  607  	u32 cgc_delay, cgc_hyst;
> 51682bc4abf4b55 Konrad Dybcio  2024-08-28  608  	u32 val, clock_cntl_on;
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  609  
> dff2f69f3e8a6ea Rob Clark      2024-06-18  610  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  611  		return;
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  612  
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  613  	if (adreno_is_a630(adreno_gpu))
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  614  		clock_cntl_on = 0x8aa8aa02;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  615  	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
> e7fc9398e608a7b Konrad Dybcio  2023-06-16  616  		clock_cntl_on = 0xaaa8aa82;
> 18397519cb62248 Konrad Dybcio  2024-02-23  617  	else if (adreno_is_a702(adreno_gpu))
> 18397519cb62248 Konrad Dybcio  2024-02-23  618  		clock_cntl_on = 0xaaaaaa82;
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  619  	else
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  620  		clock_cntl_on = 0x8aa8aa82;
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  621  
> 5cb9695ccef2305 Jie Zhang      2025-10-17  622  	if (adreno_is_a612(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  623  		cgc_delay = 0x11;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  624  	else if (adreno_is_a615_family(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  625  		cgc_delay = 0x111;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  626  	else
> 5cb9695ccef2305 Jie Zhang      2025-10-17  627  		cgc_delay = 0x10111;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  628  
> 5cb9695ccef2305 Jie Zhang      2025-10-17  629  	if (adreno_is_a612(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  630  		cgc_hyst = 0x55;
> 
> Only initialized here and not on other paths.
> 
> 5cb9695ccef2305 Jie Zhang      2025-10-17  631  	else if (adreno_is_a615_family(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  632  		cgc_delay = 0x555;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  633  	else
> 5cb9695ccef2305 Jie Zhang      2025-10-17  634  		cgc_delay = 0x5555;

Aah! Looks like there is a copy-paste bug that missed my eyes. Thanks.

-Akhil

> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  635  
> af66706accdf5af Konrad Dybcio  2023-09-25  636  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
> 51682bc4abf4b55 Konrad Dybcio  2024-08-28  637  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
> af66706accdf5af Konrad Dybcio  2023-09-25  638  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  639  			state ? cgc_delay : 0);
> af66706accdf5af Konrad Dybcio  2023-09-25  640  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28 @641  			state ? cgc_hyst : 0);
>                                                                                 ^^^^^^^^
> Uninitialized
> 
> af66706accdf5af Konrad Dybcio  2023-09-25  642  
> dff2f69f3e8a6ea Rob Clark      2024-06-18  643  	if (!adreno_gpu->info->a6xx->hwcg) {
> d2bcca0ccccfa5e Neil Armstrong 2024-02-16  644  		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> 


