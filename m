Return-Path: <linux-arm-msm+bounces-86037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783FCD33B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D64513000E9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A418330C62B;
	Sat, 20 Dec 2025 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrpgZ8FN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3YDOt9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E932F2605
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248895; cv=none; b=ERm1k5WXJkpBJtEgSWg8XazC3wbKp3UAuM/yLtUEvTAfYJ8bUAVjxYi9PEhq58krqSdafS3tkKRiHJ+RWwvVufS5MJG9ft4G0A8J0D/7PJeEMmUqlJ0qoCTtZ6RHBNTcZZuiRNU5iDZ09qiS5KkPy9+5j/DD36PDnpSqoQKYjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248895; c=relaxed/simple;
	bh=o1VmUO2jt9mLx3hvWKLW7iikmR1JG7z+CtQQBWuVvII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpGnRHSgGw1R0LwCUcnsOLaUXn72SLIGOMnu8u5Dm+jQS2oOBzTe8USxzR0e+F7mxKOuVqIQQIYpOpOlwcFLQcEawYPguAb0AoupnjNr6iP1Id3fcgrzFWko42T2a38nqSA5FeRLKU1RtISYhCWM1P3q+pClXCLCqRAmMNVKODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrpgZ8FN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3YDOt9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPftO4096186
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9n4MYAE58jkDIiJiN49z6oJ0
	IHzYogV+Pz5cPxaJhpQ=; b=OrpgZ8FNSTQKfVhsbwrDr9g8J4MU7ld6Suv+Kaj4
	DmN8TWD9oHerAIpIn/Eta3HEA/b4UHFuO4ZChwQ3bY8GYE4jBAwxr5oq/63jcHWM
	FEbWCZSvmJrlTKymzesKUrqfGGehFU5drNzTENHPQe/LHk18x7VBZnfCu4ZRBzzr
	H+Ae1VM5EaMxy5ckkftjeYUKf1SBASBW6IH6q96w4clDft3QpsHzCjCrQoFyqlZ7
	/Sy/dTOV7OuPBi18wq5dvFDM7ckAr5AxaZ0gBvSy4b6bZZGdjLrpOxAx3hMYuZgk
	Iutbvq3P39RduCnVk9Nb1Tae3RhZBotEiVG9+qpIP1VqBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux0xhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cc5b548so87423156d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766248892; x=1766853692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
        b=P3YDOt9P51aYcPXb3Vfryjqjl9aBBtM6ug6Ew5HR8BI0kduv+qGvhzP6Qys5PyxPZY
         ho1xDTv7XQUqXtBKrjxSC4Zqrpo29Azzi3bG4n0ENk73RsOtuXz0MinMV4SbRH1xwgfb
         r7+BkVncW95FK+ZdZwZcFg42to1LObWF9OHRrsK7WLS5OGxxB/Q5Utses4HQlmOFZO5o
         DP1aFVrcpBRF/1zukbz1pnLv5yVyhIvsUVVKpy388FzKIvQ0l7llA6OFDi/rVOux1Uk6
         aDAbDBPvLvjtUg7jOjc5qsFfbgEPev5laHnyuvkF73GZbC/frLL0oOGKUJ6OlONLmSud
         KUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766248892; x=1766853692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
        b=tTWI7wz7KZ/ZUrwMnNsOcvmtt0LVwuDVVNSdJLwVAYrBFeiUp3ABJfMYeaErPcDnf9
         mKvilIFVFtayzwyZseI36GLzLJIwclD2m5xmdNnYAw5rtt7r1dUz4enmu5Y+zjRhuuxl
         XKHN9x4xIDruYFfgr8uqelHJ6Q25hvHdvb0286ybFZlcz8IB3ywXr+IfvSQyiZs/3ESL
         l+Pe9TG1Azmfns5qdl4m4aCcBU9fFqqsbeEk79tAisoMoQrkAmSe0qiDOp0dP7taZDSl
         yUCp1rCot5JXBgtbKwuofcVS28k6eYEApeugSiAhConyglmF1w4ZAIyxs1V1eFqulWEi
         wjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVsu+KZUW9L4PSQ7wOH4uzAeYZqH4uUoWva0Z0pKNSxZ49ecJO+lfvUbY6K7LmIpyh0KLpsD7VIWycuTnH@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfUSRaA8GfyKHLQUpzCqrpMYHcc/Inql1v/0YasrEmeuu/81q
	Ps71gpfaMbwh/TK/HBP1+Pz7mYPk0xszoWd2DsQ2sXPJTLIJBJZb4Bj6CVJyRbQg5ZUUNKId1PH
	l/lw2GcoryfyeUYDudJOaDzUo6y4wcwo5IN4vTkb5HaBHn9Ud4FW7VybXSJPZXnDnb1S4
X-Gm-Gg: AY/fxX6OmnHGboJol0gbyBHRojlDzXb5/+F3A0Dd7XEpb1wBMD41YRQf1YUUBOaildF
	dvtIrI/J8P1KonzBXUHgF+Myu1XgUTdSd3aQRzA2IGltIjl/nXeLxcWyKYDVGx2I3fjFMLG7SUI
	toyts7pBAYZ0RgwlYAoETKSLAdAlHBDOPh9fxWiVnHXRPG2JwHG1ADyUZanHn+74VC6FmzjXILZ
	eHipmuPeB2yu/7O9m9WsSomKagrro98XKy0mbucD7BjpAJ2tCBomp3REoUVgu+ZtnvRaK2pvex0
	/5FP4utz8VgdF3ZAOHIfh9lEeBm9T4eWldyjT0ZWXNoMtPF6+8YSp9m70GMSqiILNY4Bs/nNdxp
	J/Wwtm22uHdhaHe2Y2IcaOh1CFXn1siSYjVR33OQVCKWtLd8lJPw1XQuOEl06i6FuSeXsWyvPhz
	6h00gZgA8ubyIBDWRfnj6C0yU=
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id 6a1803df08f44-88d833b774cmr98960516d6.20.1766248892259;
        Sat, 20 Dec 2025 08:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8fHZBsjJX9dWWuG2BVH9tdn1x3HOl6k2NkGdzZQzHpPUWR4K5EYQP8CT6D7PsfaPoZq05Q==
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id 6a1803df08f44-88d833b774cmr98960176d6.20.1766248891777;
        Sat, 20 Dec 2025 08:41:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b391sm12373081fa.29.2025.12.20.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:41:29 -0800 (PST)
Date: Sat, 20 Dec 2025 18:41:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
Message-ID: <6w2a6bgcsrmy3nvawuvy2qgnhrnhcvi5zdnbsxrkmmmf57wbhq@nft4wqtqwgyf>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2ocbBS3CCLNFykqh-wMYEh7zFC-55WMx
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6946d1bc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=RvzFWoYtHU1D__pwiD8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: 2ocbBS3CCLNFykqh-wMYEh7zFC-55WMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX/fa2fPsHTQcQ
 /O5savH72MxynOOv36/fYGoMuUV40Oj6ve8pcWzvqaotwiBUkJ2Gi9Jnz1yLI77RKfYOmk4Mmx7
 58lZZh9uTcnu/PPPrdVUxmg79TXrl5Q4EnMVguWRn/81zpxaC9LqAI+zg/Vn1k75bFxF87X/FDF
 cI4Fn//W2jLFN6+MgNPjF8NjQdmM6oBgPfx3CwsxcWtEUC/jj/7x6bGd5z5H/PJVH74/OrLJONO
 kXhiMPlXM2q2eDDjZWWeBAEPQ78yCD3GPi0hkl/enNNibaJMQxe+nr+9ZUMWfjMKledsBBbXryk
 8MH/6H9fKxSw8QLHjbWkKyiXM2+KdcZAVeUq7999CbGfI1dekB9SIP/s3xoX7RmmTEfeYUE26f6
 hPJb1xN7tCxS3Cjzk8NYYM6f3S+mYBq74YyDzOsU9571kVd0wE/89dfQ3rqYzxWrT+OMdoWK6zX
 rbpwtcUz9UjCx6c2F1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200145

On Fri, Dec 19, 2025 at 12:39:02PM +0200, Abel Vesa wrote:
> This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.
> 
> The dual-DSI dual-DSC scenario seems to be broken by this commit.
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 33 insertions(+), 35 deletions(-)

Fixes: d7ec9366b15c ("drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

