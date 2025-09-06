Return-Path: <linux-arm-msm+bounces-72401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D81B47683
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 20:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037721B25E40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 18:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15BD281341;
	Sat,  6 Sep 2025 18:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHrzSljn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64827E7C8
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Sep 2025 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184962; cv=none; b=fCBONom63KoPNL2zcMT9ZDDKyj+vf+C8T3D4QQoOXP6sAmsE70tYlARrvtPa9BCkKIzE8nr8izRO732wp2tz7cHb1GHfFw4OS5TJwCkekf6xK4/KIOXGQp5sqgr/+l+AASF/XFAyWhWlVdtAtQ3zidY1h9Ufb574xNGnV4/bykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184962; c=relaxed/simple;
	bh=Iaqj0OhDVTAuU0kQm+z2u31WVUifYRwVIz7KlG+NqTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0Id411IXgBjGTOrI/TLmkyt4ReAu2oU2yAQZSEhheoLbHBDYzjZsyxl7d8MVQkqAz+n1pyE9+Qb4bRHBkxvl/pcMvAGQjGeLjr8gQ4Un1DNy46D/O0DNxdqYbR8T4VE3aUdPfz6SM5zwtColjz557zr9VobMIdCSiMH11Vr+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHrzSljn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586ECL34024785
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Sep 2025 18:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBadVXj3Q8VcKxqT6ZVVuFSs
	Ahvpg9kD+kwZrFZMdNI=; b=bHrzSljnjF72+ruJYJwyQHL3pG4UX3ioW9g4EbaJ
	/2VZZ3jQZPZ5PbAlOrObCT0b7stJhli43PRwUSobQAjnyib2Wrb1QH3i46AeS6DY
	yKCjLFt6Sf8qVtCvuMcaZCsq6VoDAVPL99hKtIlK3KbseuJi1iLGNVNZoSp2/V6e
	qTbdI03SxLVLNe0uPb2tDWjY+n7fS63isjIKfHWRmcEjWJNP3c9BT/H/rhK6uI0h
	8WxL++bQoHFZRY42yhNS29LeDzlR9hieu0hcu7uhSF4Kx/lB9Osb1DBuBLi8kHbF
	+fEshDCYnG6DO+TxKkN6j77LbpMjhCgdq9iTgwOhsfHqTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws151u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 18:55:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e178be7eso83677701cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 11:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184958; x=1757789758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBadVXj3Q8VcKxqT6ZVVuFSsAhvpg9kD+kwZrFZMdNI=;
        b=Z3LBTfHKiQOaZv33rAW1FM2DpQGQrf7h2DXCQ6NzFbX4BVFAHAOJdUMOJteMTor/t5
         +gebf2CyfyU1mkl5inOh1DqCX4eAjqbfncLjISp65ponkUIkfQ1sEmDP82nITuSfRjvR
         mJxRc5Akm/5xUzQSzIri62t5YpDBGU46hm2RvWio+Vms1I3xroKVzdOfcVIXRrQ1BCzX
         Cy6ch4Elj+wQxrL3GUZbbGZg2nwHas0COJX4LLhdsogfoMCb2yMjRWoXtjNYSiJrq9x2
         NKCd72WNoudjrvZnP324Ml8KftpnTrSi3M0KIkKpq5hKhez0fjwev6YdNGN6eHW19o4r
         bUfw==
X-Forwarded-Encrypted: i=1; AJvYcCUy4CabBB/FLu00Jyv3YPxCwdLX+kh0mHkz1DASvGYEUT5Y/8as3Ks1DXqkhLVWWuX4gRjmBfbGR+mL7PHt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73ibUi1SuD0Lds9W1yFrERk2M0mXF9O/D8jF+9iFh3nt0ll+Y
	K20zH9Ts/Y9lBLp507T8lEmqs1Qp42P0oWm+oh1dpd5e1mT8R7aqs30M3ub4DSyeKexkgws0IVo
	6t598HRZ0P+Ms3FtfJmIvnV8Ex/UCEd/wlbKW/W7nQWRiiIC/dheYK1/T+YM0AZUr+9QQ
X-Gm-Gg: ASbGnctAmmY2mhV6YyPYZLY8hhWrG5ud2yyi/9Cf42f9ZPpoSrC8riiVRK3i9HjTFc7
	0b6GLMoOiD8aJLgzuf/jbBItFweA4xwmltb0oMtut32R9GuAGh295qEB2LJTiekmgd/2uvHDirb
	eWVitUf/mjeGShqMBhSOEWOOmQuM2vBV1B3XTGBpLbVc+n/jfBQCTLUz+kOufIMyhBtlhxyozwY
	qt0aZGxmMAgcT+zbPIcJJwLeZWdFsp96BwTF63nxn5NddjdmkG1i4voC7KbEUr7YHtR4Ye0cIX7
	7H+Zuvsgbom4xbt6BDddRrcw9SvoI4EzH1GvkvVsEx0TwoTK2lFne8ws8MhhRMqNjOiGQwQp6LU
	fxupdmicKH7U3Q9ZnSsVrmokX4IxPjO6oIRxA4vDgLpWZD6XEdWy1
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id d75a77b69052e-4b5f8467913mr33200431cf.64.1757184958539;
        Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0q6LYwp7XVK/CoJjAl4rMPEW6+vPupVUdTnPMLr7cWeFfZ0htils1UjwNfk68K1j5RCHU/g==
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id d75a77b69052e-4b5f8467913mr33200141cf.64.1757184958027;
        Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfbfa8sm2534700e87.96.2025.09.06.11.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 11:55:57 -0700 (PDT)
Date: Sat, 6 Sep 2025 21:55:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync GPU registers from mesa
Message-ID: <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
References: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DJVk9A0l9UIrnqtxFFqHGckHp11aXjJJ
X-Proofpoint-GUID: DJVk9A0l9UIrnqtxFFqHGckHp11aXjJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX6mnhQlgNQQoo
 e3MqQoXJzYDkcqghBcSaKxv9FMAkM3FT5EHBrPT1aTr8pcb1F0yhw1BPrDwg/t0VUXDRqpsDWJL
 Z31tvJHNEORrS09o7HqdtgVH5u/Qoy59+wlyp5m/Mmn+PQJ2rlBuk2BemRfBFl053SYsF27j9FL
 FsN2Szp/oMsYNMHEk1YO1rhrgUPBcDtaxgProPcotFJdNbERkMKIKeqRkh+Vafob24tA3L/u+zn
 ubKVk2Zjww6yVZ3Z1xiyWmAyC5+1G/uEabczY/NSjaobhhkqjFVd0yx+SbegF1twvc7XcAnclSF
 N3aZHTHS/GTD4J16JhcytgyYJ2OLeiebQ4g439OGwrWdFUn9iceF/fq6dfYBBcp3eJItCuE25r/
 WmBQVpY2
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bc83c0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=PNsBLs71VRkgtwFNylsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Sat, Sep 06, 2025 at 10:05:40AM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_DBGC")
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  7 files changed, 524 insertions(+), 497 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2e2090f52e26..3f5c4bcf32cc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  	 * Needed for preemption
>  	 */
>  	OUT_PKT7(ring, CP_MEM_WRITE, 5);
> -	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> -	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> +	OUT_RING(ring, lower_32_bits(memptr));
> +	OUT_RING(ring, upper_32_bits(memptr));

Could you please comment, why are we droping all these accessors?

>  	OUT_RING(ring, lower_32_bits(ttbr));
>  	OUT_RING(ring, upper_32_bits(ttbr));
>  	OUT_RING(ring, ctx->seqno);
> @@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		 */
>  		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> -				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
> +		OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +		OUT_RING(ring, 0);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> @@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Set weights for bicubic filtering */
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
>  			0x3fe05ff4);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  			0x3fa0ebee);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  			0x3f5193ed);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
>  			0x3f0243f0);
>  	}
>  

-- 
With best wishes
Dmitry

