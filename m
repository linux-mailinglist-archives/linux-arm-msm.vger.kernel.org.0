Return-Path: <linux-arm-msm+bounces-19604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A08C153C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 679F8B219DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33CD7F489;
	Thu,  9 May 2024 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MCKmDq4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EE653;
	Thu,  9 May 2024 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282071; cv=none; b=Wt+3+bD0AlqFbyzdO6JLT9nOWSftf+wiVZcfOCRKZmjkESdpxpOoOu+2G3Xdg03s+NQ6oaR5WeH2TC2m6mG3Xd9KCU002aeMJe0TEFJbK7hvAytmIFbppFfKLDySZg1Kl2YPw0fSwykvo8+w/8aMVoXFRM3/r3AUVSlMwU72/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282071; c=relaxed/simple;
	bh=55uIyhvRazOrYmXsUorRKX/hLBSNZkkIXyAqYGXQeW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WnHfrMiYHxM3Y2cwLLS3eky9NqyUatd59Tu0lQtMBIOwagbm17P3fs3WPGLb55Fo7mlxV1ZhyEl3v2V633nln3AchfBfrOtweFzcuu/4OTohMGCb5ayKgVxD0OYSG4Z8e/VbIRpT2X/7b/oivBeWEbNAhtjCrFCLlLlyryGRe+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MCKmDq4J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449H7UCP022556;
	Thu, 9 May 2024 19:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Job5O8NkP0R4AlK4uRJi8s4BqP6t1RW3dw1GphMw1YI=; b=MC
	KmDq4JJ/HRd1cN9OkV5uK7mBkx78NuFYQGVRjfCh9luZOzEyxjrYOxyW12CHmnSL
	0GPBNgxwFz6XWMlhZaZi5kvETp2YAbDnIybIFiIKeArJeOOLmtiLlUZza0MlMIP1
	in4DDzUT9HOe16V7Ygr241NvYam8htI5FjgWPx3QenTo/P/L0SuSRLtfidUkZwoh
	svVCLBOs5KWrHpjz2rA9sJAs/lM5gPYp3UBXl45YCtqaIoxYQTn4AAgXPyU4PiJx
	sYXkY150RuwzXLWp4AkTTd2PjlgmnIS0hH9vYdMVbpEWtVoWJaWDjIy35vDXyF+e
	O7w8dmyvfFTzeQKDc5UQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09frbeh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 19:14:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449JELBu009782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 19:14:21 GMT
Received: from [10.110.104.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 12:14:20 -0700
Message-ID: <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
Date: Thu, 9 May 2024 12:14:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Content-Language: en-US
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lG684409fAEPbZxsC47Ga5AyAgy9Lur7
X-Proofpoint-GUID: lG684409fAEPbZxsC47Ga5AyAgy9Lur7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_10,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090135



On 5/9/2024 10:52 AM, Barnabás Czémán wrote:
> CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
> so better to skip CTL irq callback register/unregister
> make dpu_ctl_cfg be able to define without intr_start.
> 

Thanks for the patch.

Have msm8953 and msm8996 migrated to DPU or is there a series planned to 
migrate them?

The change itself is correct but without the catalogs for those chipsets 
merged, we will never hit this path.


> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 489be1c0c704..250d83af53a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -298,7 +298,7 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
>   				       phys_enc);
>   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
>   
> -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
>   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
>   					       phys_enc->irq[INTR_IDX_CTL_START],
>   					       dpu_encoder_phys_cmd_ctl_start_irq,
> @@ -311,7 +311,7 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
>   					   phys_enc->hw_pp->idx - PINGPONG_0,
>   					   phys_enc->vblank_refcount);
>   
> -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
>   						 phys_enc->irq[INTR_IDX_CTL_START]);
>   
> 
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-ctl_irq-a90b2d7a0bf5
> 
> Best regards,

