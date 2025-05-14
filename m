Return-Path: <linux-arm-msm+bounces-57975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB83AB75D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4854E0FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD78A28D8D2;
	Wed, 14 May 2025 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/CpuFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240151DB363
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250668; cv=none; b=XlClBb5h+2oqvxi6Odzq7gl8bPE6J6//wn9uPgaY7qbeiZDWsWS5ANv9UBrhTeOYpC0UO4/ALLP3tJEnH2AEw62BqCfhvlahelMesS2kSL3MxFbZyY8S+dxeWaLbB/cVH5DEDv0Y7teBiBVUvFQ57VlDPMhiM829ZAgJtWFjiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250668; c=relaxed/simple;
	bh=+yk8mXmg5czyzrqzBy1BDeb43UuVv3RGA4jKu89sAfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/2N0dqiCe/KWc+G436saRJ9JozfdIwZkwETlgpIy7XfK8AGJxoJ/upw3Ksc6ShOkE/Z+YGde0xrVR7sHL4pDVMAaDEFnQa57tCoYrHmq3NFcKSgpR1h1uRkpk1rVRkHTXifj2Qw36QkryPjpUxVpfLYcK5JojftNu8giWlSctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9/CpuFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuoas012655
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eQR1rmDpKGw6ihZhkLYKtVUs
	1c4G12XUKIRhR29qxqc=; b=W9/CpuFqoxFk4oct/DL5v0YiVYX4xl0t48emWGK6
	nHUDG+2YZD2RF9UsYCRLzxUxEd2i1PARLuBxNiq/1otJ0aS9ECQWm3AGrYMhRBaT
	ua5cKMV6co9F+z5sYjjkV4TT+TYK7NTXCceeYKpF8wvVa0Kr+8xEOn7Nj5A/0V1q
	xsd6puGFb6fLTQtGEVu5Alt+CJfh0zlqRaLU8bk/hXMqAnZ6Cq67ZmFAfgV30Joa
	AnGPB0LCabrkA37m61riZ9hXyzcCgm4e4ui5IxovbeQqxs7Fj976W0E8xrfIjBf2
	loW/a8s7dAbyxDjdnrMIWI+VR77KmizxfyqO7QF/PqUGdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcykw8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:24:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990722so19076785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250665; x=1747855465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQR1rmDpKGw6ihZhkLYKtVUs1c4G12XUKIRhR29qxqc=;
        b=ScyVZuTw/LtPHN4sZ2i/6j9mTPvbEUwJw2KDFtXGCWuFKnGfYGid717beAgAurPMDo
         unZB96DLLDhQRNrmdS9xm+WbY7bzqgq2duiOyIwRBaywyWtRurxKyo1p3s8uZdiTvUMf
         I5/d/DWH1HAfNJTxKZO+VK59WkGjIT/Ruv9zoYKbHC1Q1aVS+ED83bKFh+4iGIo5b24T
         8FPHheTvoKkccpJarqDdNysRwAlQSyC4W1PgI2K6kzA2B3IdVdQdgwNLIFiwoHJXVoQt
         0wVEzjr+Re9fYKD01jZ51Z+zRrgyapKQGnUg69RHe8xDLdGG1+KubXYP38pc+B7BUmct
         tuqg==
X-Forwarded-Encrypted: i=1; AJvYcCXk28Xy7hZYPO14scgtL7aZI5kzWw9yn+aZbs+zPWHwiVRf7kAs0XHkjnioHQqo2Xj6ZrXR+XihNZDYWjwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCbNBoiLLnxWzfudTnMGnmLyPqoVSYthJBX9XLiJojZlYr70d
	a8jezre6TDLU8LiK8EEn5gSto0DIGzH/MLBLt2gcTp3Jz89p//bbPeWhvV3ZWwakx8Qs7sz8fHn
	mVUQyxUrJYNz1sGEzCRQBbQRaMDJmqnuK+sYoRC3oqRtgAkK7u73pGWiqoGeViMhs
X-Gm-Gg: ASbGncuyjyRC7RgOBhZedDkcv5CqkUkp7+nFtSu2cXhawAO8Joekq1B9p2bZAd5L/Ka
	/+xrfKmDJ+4hIIkjEutLo1c6GUZGYkAc4w0h7cMv9MHGRu/myak1vo5BRHl5js+t70KkVi5IbtG
	eoHegNOSd1m9cQ64Cj2FAQ99wdKUTBX2o3zbeTTSNhaxE2HU3v0qqqcs2X0hXFg3M3VE2K+9Seg
	45cHuXbH9QDKF5KhfsL/wLjOLdvVwBs35pOZaecQAeMc7Go2E9dkt0c7s4trnh2lGwB0n4vQBdt
	mP2R5NDj72oKRqFfyAe1pGlo607nKKet84ac7JlmnTukj0XGdBYox3RarXNdcu5T0Xyvf82uABc
	=
X-Received: by 2002:a05:620a:44d3:b0:7ca:f3d0:e7c8 with SMTP id af79cd13be357-7cd2886351bmr772938485a.52.1747250664767;
        Wed, 14 May 2025 12:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHes7rh6PmmaQxowWjXZMS7oaqmm/UsyM7XnI3cwPhtlFFbqaLiln/a23/dcBouCmzLjoUuRA==
X-Received: by 2002:a05:620a:44d3:b0:7ca:f3d0:e7c8 with SMTP id af79cd13be357-7cd2886351bmr772934685a.52.1747250664349;
        Wed, 14 May 2025 12:24:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccef0sm2342528e87.237.2025.05.14.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:24:23 -0700 (PDT)
Date: Wed, 14 May 2025 22:24:21 +0300
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
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: adxKBdREsLUcmZ2UEPTj63o4v37t1qzb
X-Proofpoint-ORIG-GUID: adxKBdREsLUcmZ2UEPTj63o4v37t1qzb
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824edea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BqShQr9RomFUbj8HExkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX3/ZkYpKM8zoK
 V4eEC/YPdQvZrj2uRTKRsYeWc4mLWjbVG6io2AmBjeuoRYU/hJu6vnPxyZbppme7n3lpDsc27gY
 RkT4Y8F1qsK+TvRl2gr9wI2CFpbmQ7iLD4STbr8J7xS8NO+jDf1ex7mORYqXQICUsGVVjgWA7EI
 IgyPj69zlfutii5Kb/0Vhljd6eEuP/dUwNqnmTWcz1BXejtu4jHBcsPI+RGmg1R0+1bLl0iWDnt
 28xnN6GbvHiaR1tfuUVSOIrCHYxFKm2X+2FN47O1AVvK5RMixOMkQJ+IH1ErKrsLs87BMBNZ7B0
 Qy3mgLUrBH9rEhw4iilrYwig/V4nIuNQH7/SyxdeLpHmQpFs2JoJQKeiyW7CRZomoRHqsDJcqiF
 80C6TtaoH9HUcAMKjN346Y1nP5vIfx0yAN152CTBYOfIVGsBrEOsK5ednG+EzK6qhlx9MOoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make the values a bit more meaningful.

Not sure if it's more meaningful or not. In the end, we all can read hex
masks.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 33 +++++++++++++++++++++------------
>  include/linux/soc/qcom/ubwc.h  |  2 ++
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 96b94cf01218cce2dacdba22c7573ba6148fcdd1..06ddf78eb08d31bcdd11f23dcf9ff32e390d2eff 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -32,7 +32,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>  static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 4,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 13,
>  	.macrotile_mode = true,
> @@ -41,7 +41,8 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  static const struct qcom_ubwc_cfg_data sar2130p_data = {
>  	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 13,
>  	.macrotile_mode = true,
> @@ -50,7 +51,8 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
>  static const struct qcom_ubwc_cfg_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -58,7 +60,8 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
>  static const struct qcom_ubwc_cfg_data sc7280_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  	.macrotile_mode = true,
> @@ -74,7 +77,8 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
> @@ -95,7 +99,7 @@ static const struct qcom_ubwc_cfg_data sdm845_data = {
>  static const struct qcom_ubwc_cfg_data sm6115_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 7,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -103,7 +107,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 7,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_ALL,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -116,7 +120,8 @@ static const struct qcom_ubwc_cfg_data sm6150_data = {
>  static const struct qcom_ubwc_cfg_data sm6350_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	.highest_bank_bit = 14,
>  };
> @@ -136,7 +141,8 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
>  static const struct qcom_ubwc_cfg_data sm8250_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -146,7 +152,8 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
>  static const struct qcom_ubwc_cfg_data sm8350_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -156,7 +163,8 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
>  static const struct qcom_ubwc_cfg_data sm8550_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> @@ -166,7 +174,8 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
>  static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> -	.ubwc_swizzle = 6,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL(2) |
> +			UBWC_SWIZZLE_ENABLE_LVL(3),
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 30d9744c5d2e06d4aa93b64f7d2bc0e855c7a10b..2a12e054ec62ae7e76c3f3291d6963da726eee4f 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -26,6 +26,8 @@ struct qcom_ubwc_cfg_data {
>  	 * controls level 2, and BIT(2) enables level 3.
>  	 */
>  	u32 ubwc_swizzle;
> +#define UBWC_SWIZZLE_ENABLE_ALL		GENMASK(2, 0)
> +#define UBWC_SWIZZLE_ENABLE_LVL(n)	BIT(((n) - 1))
>  
>  	/**
>  	 * @highest_bank_bit: Highest Bank Bit
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

