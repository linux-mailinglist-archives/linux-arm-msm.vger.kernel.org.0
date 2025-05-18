Return-Path: <linux-arm-msm+bounces-58315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F1ABAF30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199BD3B70BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3034B20D509;
	Sun, 18 May 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GG+SyGfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA2718DB03
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562326; cv=none; b=CP6ezipLPYiiZDnM+1QNvu1BVN2lw5rB/DEagpyEIdf5j3TQQ1rL1hDhYPMziMh//x/zBVBxwTjiqHSWhtuwW3mDrAR6Qu14TKNCBW+S7rwsZSShy5c3TDVQSoDjJnta+7td0+yExWOZ0326MMQIT/RpXQslt09tgx5ooooGc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562326; c=relaxed/simple;
	bh=FQ94QICL73GCiVpJEES8GagbaIZrpDcJk0qqjLcWKsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1KdxNptBt28XJd0LagBPxu+0I7wv7leRcUY8O6GqE45MNBooYHlGyPdvGRoa3TY6se92oORI9b/+7DwAePuJS3RGb0M64wK7+bbCLyezoMMlONLFUOYjPCpoFcmXSZyEktsP+XASG39xYgfHqkwuNwl/B4EmZNmIH1TgLbzf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GG+SyGfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7HnB1001756
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozyvimowPYeoJg2Gil0i1JAK
	q8UocZ/UUw/4kBdCVY0=; b=GG+SyGfcboPhTCPi7LA88aMspIO9T5QMS5DN85Sx
	EWB6WLs3EsETIgZ0FsfarrfPc6NZ2oq0XVVWUAv0jvxS/w1WE+hdxwQGjv3RhkrX
	IFbn6TKPL9HNeZ7Rs4uGf939/lM+POXUZW2ibYTZ098yLLLRCrxVkMP9gDqtI29l
	+Wo5DYzsem91sdvUcVAKGrid4PE6DcOQV8BpkxYn5DcehRdWrvwGJXZH2Bi1XNab
	FdF8+0WjWRTfg91RHeoHAbtklQ/yg1vnLEevk5snRpRKwpXPM4WD1pDWEMQSIVBl
	giSRRIWhkkkTLtFhp0YkAWuWGz07w7yGcVA6xOVtoydbgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31tf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:58:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so681501785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562309; x=1748167109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozyvimowPYeoJg2Gil0i1JAKq8UocZ/UUw/4kBdCVY0=;
        b=Rs2Cf1aJFS8bodhGaAFFrq3au7t6T16UUN7YtYckLe8X/z9sBtGGLYPPnUoNFaWZTR
         tqkmXEmDgC5g3LM7PCO1/H+2pdVRW39y8/hxgd1TVoj0v5F7Ru/L1Pe8g7AOMw4wun8K
         l0Ty7JE1dJwT8YDDaMG+1Z0Gm543Rh4kVnO/U760NzAP1jf0FLf2T56EcHzsiLDEJJeg
         AnV3Nl9vL2z4aF9hGUdmpXBPaxs1jJZHmTPGzNh/YsTEK35hb9d6570acy4rYIV3EVF9
         W8nGjOd3uhdUs4Z3zsFVS4HEcbLB+DtqDXjAPjUwBzGgKpEnZ3pk1DukZKFZhIF0WS64
         qvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdzrIqMnAAnmTkElM0ewU79K0pO/QsUHthN5VT51ZOp/vVSv5W8QKL1JT6L9bCUUQnSSeYCvVq9i/BBes@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qAbOsXjHq4V9x5e1Lb5RAhuQPB0Jh67YFAb4rp1jw2NcgJdT
	wUYp/V7ixwZrhlwmf2QULpnQ1ullt/7+JCRx+jaNXHfqXPKNo4RxBLP0PYu2cYyxHo3AaoFb2Rw
	bxiatcAeGI8sM3jey6+dwbBYXqsh04D2ukachGo/myFMYqzdia77xG9sO5tCJ9lFsEUWn
X-Gm-Gg: ASbGncvLDDxr21b/a6Gxw6pBEEqTXtl71sC90Xj3GhdiZmChprjmQS8hyHPN0vXrl10
	lArutkbEV1QOdjib3msdMqAUgOtFTbhTeL9Hhsmceg/43OwQYWawPyaw/eYiUiFtAEaBn11i6Bg
	gO1/cNL5cVl1sM4cFdYueoqoXhwOuDZqTgcItFJlC50MMQWqkOYiZ0rRBM2B2dMF84aFky/IaHH
	X4bFfCGOpfWspn60+HC0JvFQEm4hKHfHc2eUeLnXV9UuBFJgLxEH8yXTRCiavtgQI9Ll7S7BHri
	83AVoZKQwlAjH1EaObcWJIGel85ZhYXzhV2GYNSzXuSh67F54w0jToQRybgIUbmUJ6eCnb584ak
	=
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id af79cd13be357-7cd4672da8amr1575054785a.18.1747562308991;
        Sun, 18 May 2025 02:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzojClQz/Wnouf9iM34C8OJswOvQ1S2U6sryF3oPNsosWvXicZvKebvhLPbHpURtKz6Vy4eg==
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id af79cd13be357-7cd4672da8amr1575053585a.18.1747562308697;
        Sun, 18 May 2025 02:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fc56sm1364685e87.64.2025.05.18.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:26 +0300
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
Subject: Re: [PATCH RFT v3 12/14] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <jgf7izei3ry4wutplvgxkfqphxhrzx5ed7zh4u74mnfczahaq2@gnloying4et2>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829af54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jAo0UdJAClyBKZLzlD0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wSjsRTephXBLyvkCsGkoJMGv4Vyhq2iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfX1Qu24+4JBg8O
 Syygnb6Y8Ct/Y9ESeWpKO32b+KEsmSZDUYw7Wxlox+it+Z5gCdxQDb8G8QQHpNe9Ve59RkgCoNn
 NmqagQdYyZNU+qbspRdAMMOsyYqWuZKFeMFMvckDjKCoAR3bb0dX3e/d3aFjCRsrAyEMKWDRktS
 /DAf/lWARkcaF/pTaJvbUgK8zjoH/gmP6QRrcHcIjSP/JvnXl/YC9b35ruiX/JaSSNMzlAoc3vR
 GrVUtjKQx0D83DyepJ/fvqgph6ApyhKbF6n1wNBPIlUsbgE1qoeV/Z330sh5yGMz0YfResm4qfA
 EvKb4EfAL51h7fjm47DyzHaiJGZ5FYapAZeB42MY1Tmc8aNEOI7h1cL5W2DSuAzHKbQnWrY01ID
 obfUWaCV1L4ND0twEBeN9isSnF/nTvy/An91gftUpg682fKVXOZoptYoixevwMglouywW84D
X-Proofpoint-GUID: wSjsRTephXBLyvkCsGkoJMGv4Vyhq2iI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=927 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180094

On Sat, May 17, 2025 at 07:32:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make the values a bit more meaningful.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 37 +++++++++++++++++++++++++------------
>  include/linux/soc/qcom/ubwc.h  |  8 ++++----
>  2 files changed, 29 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

