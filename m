Return-Path: <linux-arm-msm+bounces-66094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D2B0DB2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2362E176774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BFE2E9EDA;
	Tue, 22 Jul 2025 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of93aJyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915028CF4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191864; cv=none; b=ejmxHxqIZI9pRyCD/Wwf2MaK7hAg8R/6XY+HX8AlKUWCTU3iBsEpMVMpGVB+s+Ic8CWyCo8HOLrr2VW0K+U9067ibHRCcQomb0uZp+vwOqlLHDnuJBi9DQ/MCy9Izb4dvzhyMPF+wp6bmLxb/OX3HUINm5JvyDJRksg9fxGP1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191864; c=relaxed/simple;
	bh=dTywX+BFLFdP4+hIWj9tRp0IJ9gnnMfS5H4sld7dZvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrF7FJchxUp3VdOfDxfM3907+xRBQ+7ISO4x4te6fJR1YYhDWtz6brYB9NqD9dkDdiWNiMjVqGHNr3gZ5H4Y+XEbygTEukbXNAqabAXbGdEHkoJSe466vhd47FYga3uk48+IDT4mvbajRdMduj767V1gDBebxvje0xqbsd0kq5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of93aJyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LTf0013263
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/PlvjBmBNhRqz0BnasHFhjw6
	BKLI8rWtueB1348TmAU=; b=Of93aJyQ8B2IXq//kHIuNs5oNAeHAckqmlzzEHin
	JB0jbnxK3HwqmVrHsXdArPWFtS5InJJECABp1JqgOORgL/j51qy9VArRt/ZqegY7
	SRXubWmx6w4Ca6cx60eifdX/A6beIlp2D9WPZSHC3R9A0aI0KRADO8OF3K/uGbg6
	xnelwe9XrpQ1rA1wqz8L2sclzfUaBBp1hNSBcvmZdzz8PcxkT+6dD9iJfze8djQt
	chkRh1WJpqmcvOdijECtCl+fHhCvFt7+BgcAVx6TcFLsC2z40n14TNybb1T7L7y4
	0Eu76qghAovYfV294L5ZFHuqm1ERp1Dc82PxjHmIcW20Dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emdew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:44:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e33d32c501so1266506785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753191861; x=1753796661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PlvjBmBNhRqz0BnasHFhjw6BKLI8rWtueB1348TmAU=;
        b=aOO5YN1wewNLtvD1UfEOvw7Nd4uWnR9FKEV8s8Mxnf61XLyF8NS9Cw5ieb5+PoOukE
         jIl1WOFy9Rr7A1EyuoCAO8SIoBKVK5GyIdTAIuw83KzGDpGGXzD7mmTY8sGFQ+JZyphK
         wRmoxaclT+FGRbUy14gQUU1WC7BODj5J37Di/YcQ4U5ANYANvO8glznBfnNqcZpc2R5o
         KY4oo0IqDTEwJ6iQVqKhRRV/VjkhOMJfyMXKPJHGa4Tm6h1fltzeUaBOP5QiwjQIExzy
         4rs4C6FbhfXe5+biA8HDcI7iM7Y9eNbn4PPv3NRjGULOmazwyOKvqXGfTDQmhuvduWWk
         QRMg==
X-Forwarded-Encrypted: i=1; AJvYcCXVTDlLPcMhaPQbhbCuTy0Krlz2ZDkN2EEWVaSv6MWRLMLCYVGL69HnEhFHtTdB81CtuVszRsvAEg3Rm5s5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYTH8aTUR5b13myyoRIigFXe9MphIpWIPP5hDAUBRi2UQsbF7
	VPovo5L3arBFIxi4hQIwGEGCJzrh80UcXHBftm1/UykHoYu5D2Wg7Zi5ajcBSBdBpR75Z4nQo7N
	IfvbJIxssDEdngSCEpAl/0xYpqCjISoC4J/YzlKAabKpVmQkrpzQ2wzPlBuSug/h+JTWS
X-Gm-Gg: ASbGnctZ2Cxi+bs7Zap+hWrVaHmdH14UIEJtrdbVX3VHdh1sTWXzOirLgAoOWDZDuiY
	dNJWPAS0o3m8UejSsjBPBI2qKY2ezxHhO+BKwnwArc3apJ/TZeKenFrkeeR+4qJJPVNCTFIbOk+
	CRIGUXDQSJEsIANHFCq8O9Bzb4cZZpkhPTr3FIxl1YTm7deRQVvXU3/OE9OCazSYipGHSZDFUTU
	Nce8MmtgqcCus4n5BVvfW/xCp+DX/uHR75HrSXALeH/zGuz2EpYBM5zRC0JcDDpRHxwmkC3hriM
	trNXnf85ndq3jc4Zxc63pT+GUhncya8GxiW+0TzoU+LZ/4PofkK/zvDoCYaMhyEzlUK4TPcji9U
	Z4vMuQPN38dESx1FeX80t5XS/EvOSuR1Kfzl2e+fY92K8B+j3WD63
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id af79cd13be357-7e6216707e1mr450345385a.57.1753191860627;
        Tue, 22 Jul 2025 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYjfAd2lPvfeopVnQTvfIiKF4FZMT25Jj8QNn5OT3bmUYHUVmlPAwFf/7JubdQINFF9syIw==
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id af79cd13be357-7e6216707e1mr450339985a.57.1753191859973;
        Tue, 22 Jul 2025 06:44:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a9109c31sm16373981fa.43.2025.07.22.06.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:44:17 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:44:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: usotjw4iWPUp_W985wf8IgeYiBEEI6ZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfXx265HGxHOhtd
 Te7ptLyD88QQNv6Hpvho2hx5loXknLoYRIjlnEAx8GkeZYiHVXyvm9C6Kfst4R0a1+rdc6tyGOO
 HavvGWAETzakUU8W+x8IozTbN3H5TzeQgC44J8tWPnNJQMd25gmHLfQkKtzMMl5Z1mydSgkUs7V
 35tggLGTBZO57261kNhxZd7DUSQAtQ6kMxJlopGfjD1sXvb6/X6S6+ntOyBKcv0VUNKhaX2RMVX
 YLuFSDPR//WX44UYSoNn0n1987khDNK6XqLOnEWxHspsOL8pKGx0OgDi4BI/O8kOVaZmLn+BzGm
 h02LMWJNNodgG5o+5uueWUYYXu+J3c2EmZ7lgLDBvt9bPEwKpilSu1JP223LlPsekrqZ18YRFXb
 Ym6O7M3fnfVV02yjN0zpAdWsStMz8tRvJleymGhGgPUAoqjUFlSWUajT4cgZFWyAQN4TbAQu
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f95b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kzfAnjQGA3Um0d4qlLMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: usotjw4iWPUp_W985wf8IgeYiBEEI6ZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220112

On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> Set Keepalive votes at appropriate places to block IFPC power collapse
> until we access all the required registers. This is required during gpu
> IRQ handling and also during preemption.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  
>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  {
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>  
>  	/*
> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>  		return;
>  
> -	/*
> -	 * Force the GPU to stay on until after we finish
> -	 * collecting information
> -	 */
> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> -
>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>  	}
>  }
>  
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_keepalive_vote()

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> +
> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
> +	set_keepalive_vote(gpu, true);
> +
>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>  		a6xx_preempt_irq(gpu);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>  	a6xx_gpu->postamble_enabled = false;
>  }
>  
> +/*
> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
> + * a6xx_irq()
> + */
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_preempt_keepalive_vote();

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
> +}
> +
>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>  {
>  	uint32_t status;
> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>  
>  	/*
> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
> +	set_keepalive_vote(gpu, true);
> +
>  	a6xx_fenced_write(a6xx_gpu,
>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>  		BIT(1), true);
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

