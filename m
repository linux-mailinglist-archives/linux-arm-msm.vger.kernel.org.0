Return-Path: <linux-arm-msm+bounces-57967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F43AB7582
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BE617EB8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2A170A0B;
	Wed, 14 May 2025 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5FV9cIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69E28CF7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250049; cv=none; b=cXo6J4mnGzKdxCIcnDURZrUeZNtGPZ6tQ3aS00ZugjccQtub9scrAUmdWgw6AoHa1l4htYB95imdCXqAP+fT0wSkO5DLECX4DZ+3DaM5SznUc8+mKCPeFFQtzv51iNqDcaTQW6Tg0WyG80bFrzizt2P+PWPNtbz54y/reGaDKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250049; c=relaxed/simple;
	bh=cM24UCMjnPNXlC3iuWfinz3WNJ8qtlAK1LZqb6IXESI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THtcWLz/axEPR6W4MmVxLVseqLqx0SastMaBcP8rNa+HnrcJKwHuzBiMAbm18ScX1qwqwVZiSvUZdktyj6rnMc+FFpml3fDRjTodz0+dgSDoo56/CTqHaJKESpTEGA4+tkrphVNbQU6zXZ7XZPdkbIL/kNp8NvFMJhRcsho5OIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5FV9cIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuwD7003079
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cEyZrO40PEn2gGFuwvOPBFUx
	osfxunWMlYajZudAZqs=; b=a5FV9cIqdn6EfDQqc2bxiPbCMCE8E5uUlrK5r3rK
	AdJCSbaI8TDtZ52l0ts6e8fe0qLmcSnTybOxe70G2+9UaiabkP0bTyElBYqnYWbH
	/euQ3Aqm6/P14HJsIOXZ5lb8BdPbSnZyqzyDCUOho/qdvumO4mzmq3E4AayE21BX
	Yul6sIvMUfT/x2Sl0Xebh/Le5JMQ8S5ixh5cC6d+q4yGxfYBapbw5E4BRSJfGW/Q
	htNPQ7hNnRcis/o0LdJ2+A8ZMfzUpyvpdcWkRvBu4Jxc6MhqPg8Yo2QsrmK4UF/B
	sa0oFl4ft4fx/sDbvge+gp+htE8pBlENIusOR/OGI09Khg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbscq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:14:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95e424b62so229835985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250046; x=1747854846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEyZrO40PEn2gGFuwvOPBFUxosfxunWMlYajZudAZqs=;
        b=AU42rUcrKELeh/eKCcE60Uf7rqR4q7rOX6L+orM5/RBAOd+KAUc28FlaYj7O9jywgK
         yuEeBz0uMA6MJlVbWnkLZz3mMxsU1bDoJB0CST3mVgRUHAXvCH6HNMgX2L9ngDtiCV0i
         C8gbNs+1kPNT0PtI7C4l1XXyPM4Uf5m3i9K1ziR0mwB1L4LHU78abT6hc7rPRA20Iz3Z
         Fq/6PKelKn4ylncJhDWqvWe0dx+M0HRmVV4ZJ5CBDvPoZJL4kptR+2xt/ZltRLLAq1nW
         TUS0E6did9UzMX1c1UDz7VTY0Mhr+5l0foaEUjhESjj2KCpp1cdoLNGQYoECOA33FSBR
         vGrw==
X-Forwarded-Encrypted: i=1; AJvYcCWOCjIr2yt+C3HhtRtAcnRDcOvVd5G5TyCTiS5FmYD3vhUAChSGlAZ6STOh41RvOPj3DNxo+FEO5LcxIz3J@vger.kernel.org
X-Gm-Message-State: AOJu0YxakRgpUO6QSwV2jOcK+kl3LWmA6l0Z2aC+u14X58uUmC5pEgt0
	GkmosiUwvw4/fe/QYgMYtv/DCOf3HRVsYA47UTey9CG0fkrcC5iokLNm1vdNLi6byQJ7ou6LXKL
	tzWLFTIgxP4+OzWtr0tu+61nqcs9/zhBPq9Y2XrvyYRUnQ+1Y5AveFQWUzbOFCfd7VCMu
X-Gm-Gg: ASbGnct6ItOSx5MEbQDRfc38dOdhM1yHsmyrBO52QYWwaSf2chh2q4fSXs2O1PeCdNe
	C9jZ+0Hd2ERz2IK6M89NxofQs3ZHsXW8FF6aq8iY9n3dv2hco9DsitHySZwyAdmGJQoh4n6nAvx
	SAFcVMvebCTQR/3P9x2mPn7s3RC93VzsgvqWNY7uzrPVDmLzxXgNrFcDcXAhPeHdAJP7BoPbBsM
	I9M22psrUQdSgYv5k5LNfECz2WO7tzmUWZVAl0xJHuNPBo9muC0eic7qMg67MnIhap0HMqUK0jP
	P8DTyHKVrNO6VuGgCq/TWeQU0Cw/gGgiqa8FlJs74RyPSrO3EKmb2Z7qwkzY82PwLs0JNCiviw8
	=
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7cd39e1a9b4mr108999185a.23.1747250045992;
        Wed, 14 May 2025 12:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENQD6g+af8BVweLVGomGSmit4xW6yU7n1cZOKrGyOrGWd0BKRa1jc8t5a8tIHnfZ3HWev7hA==
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7cd39e1a9b4mr108995085a.23.1747250045622;
        Wed, 14 May 2025 12:14:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645dd25sm2380206e87.104.2025.05.14.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:14:04 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 06/15] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <wdbyamwsp6bozskerzcrsj5wt57ntuc6nwsb5rlw6e7xdk4rlr@3fcr23w3qum2>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2B0M9Ae__nh85J6Twy4QYhlQH1JCjuPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX0/upj0FmCi20
 wGrTFSyCZ4BY5VVje5IU5rCG1gJsougGhluGmE+77nIRHfSlV13aLXbEIOF/cM4Oy/xUf+EQW+C
 q/noQ2zkcWOlwOTpLnlzCEsfx9Rncuu4oVQlX9Djb0Ousf839eL551HIkxjmvGmcskgpvVFQIMS
 SnXXrwewdQxSUmdxOdoPaIAhspbLrZHdCcdC5ltNDqRK+6xyN3VX1xznnldtw3idNx9O9R2iRSK
 AiBb7B1dQ+dOi9rssuoocK7mjr+cAv2gWIxn3apVg2QNrYj3W9mqU0L1LHAj1nsH3E7FmZ51UFR
 /P78C5eH0V3zTbJpfk/GtJt0qhFrqkZTW59NA0ppsy+WkjCysbl/vMr0EXzC/qhOVmvJTbLCvE8
 hkZNadHsrzQd0FXAVhqz080QKU0ZsxrLhNDyb1XlsMDbIrn6npN8luTJzlu9SpuRwA7tnH5I
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824eb7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-dXeqa5UtyYKIXAyS0MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2B0M9Ae__nh85J6Twy4QYhlQH1JCjuPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

On Wed, May 14, 2025 at 05:10:26PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> @@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;

Nit: could you please move the assignment after the variable section? It
will be more readable this way. Or set it to 0 here and override later.

>  	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
>  	/*
>  	 * We subtract 13 from the highest bank bit (13 is the minimum value
> @@ -695,7 +689,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>  		  level2_swizzling_dis << 12 | hbb_hi << 10 |
> -		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> +		  uavflagprd_inv << 4 |
>  		  adreno_gpu->ubwc_config.min_acc_len << 3 |
>  		  hbb_lo << 1 | ubwc_mode);
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

