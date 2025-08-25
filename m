Return-Path: <linux-arm-msm+bounces-70737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF72B348FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27BCB4E28B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940A730748C;
	Mon, 25 Aug 2025 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="figFNp7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229D303CA3
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756143284; cv=none; b=T0HljnKdNe4q9lsm3j5jX35FVeel9au1an8UtxjVCytlzMqHHY/Vks5w4vF/307uswkOAuLSld4bpuVKUUQ6tDjIN3r5V3Fkx+vptiSTVFPV0hj0K6v9GdNhuFsS0cZx0jPLsvEuofP+YyWp4M1GzBQs6kRYJzKtD4PvSzv7n18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756143284; c=relaxed/simple;
	bh=OFdR0RBMiGakp3f+hBLV7rkCrWnpRSrcV+oyx2l6vFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df1OcO3hZgZzgxtzejmH20CiL2E21poIcc/HEXsurKHpxcTgvfEaK7lFggrt7FeLgknsQs9BSvAPi2PI1YcJodWB9Jek/5q782/YW2sRvoOlILatjcKRfovMnBMMPBcz6iX/g23/ZPxzdw10hUoASeOhrESOHI5AbHMeB93vRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=figFNp7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGX9sp014221
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=921Bzr011b9Fk2gqlTe/2ABf
	oYFpWqrFuSDN0tU0Jcg=; b=figFNp7yWDmkIdmseVps3EgfXJ5gryeuXcWD5lyA
	dH6bFvW3l5NbJR7L5OgFMRuNQo3oGOcKskZlSty0IY1fKF9ykdU9jEj6S3fUCi7Q
	RNObZIodLFJffFaph0aMvFbXWMDylU7ucoGsmJiWL/rRLKyf0nL/oUvXNqg+OeLs
	TcuxO4AURjP/0wxo357YcbWhk0doJ2GXWmgG7shNBND79+8EbCODQ2iBGDz/X7Z8
	6EdPd6etAuIhn3Bf+Mw3nTXSLwq21OvOZHZvqjYsU9/WNZSgfUTnMCl9VE/f3coU
	4D7gy5gEiLbq3e3vTUDoU+ZT5/ptJbzeaRec6izeZqlfRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5du5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:34:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bc103bso106668011cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143281; x=1756748081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=921Bzr011b9Fk2gqlTe/2ABfoYFpWqrFuSDN0tU0Jcg=;
        b=lfwFUbJmqZ8vpm9NYpHqQj4MGeVnaZ7Kh0cUXYWPT2dI6U019wn/kw+wqKpnkhjz7u
         w5iYsAoOz7K/N0zPHbk1FnrrZD+1Jf30pG+NGn7MSs+oZo7PATuiQy/kTOjDSbjp4xDe
         kugxjDQPFQbtnWsPtXVGXK3RLvlqbdFlukXVBNJfpjW+NtTji3MsyeHEm3d4bVPYl8OR
         tkogmRf/VLpkitPMnK5ve0eqVuXVZKOsBc+aJyuPtHK7pZpJCqQ7ky8AbL15TU3FmcwB
         38I+7ruCcFq5kqcgtfsVwwEVvRikwf+pnWamtcgmbto2c2zhHC1SHByw7vA1n9dRxCG5
         adKA==
X-Forwarded-Encrypted: i=1; AJvYcCUlMFqRF2DBWTUaOYoszwvIxNWhqnhtVKxsyFIsbjtYIbDFmy3jUOqyi5x0tLxA4t9CFjV+ebPmIxbqmMAh@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWTYzJP2X/9wTva3/ocKa2lCr44SIRc7/YUlegUWubOuMs3KU
	+fUYNDZsluqsMBjk/VGH9q8L/p1kSzWHZMTPe2mWUG3lUrmNKAm98aqlxX6RQuBoMd4Sf0RNTr+
	sM1mKGbw1IqxJ6isyaS7Neo8wih2ln5jLbxL7NtjqIFstZPiA7ZbcZZENdOZ1eoXy1XP0
X-Gm-Gg: ASbGnctnhZYYI19VKI25lKy2UqqiaW9fvMwODjWVG1/UDY1ewxHGyJJ7dzCBkc4RYu3
	L12EVVs/Ol1jRSNFIxs0oDlqFUxOIf/sUkXGSES/BfAQ58OvKbfs9wNRYTr2XS7CQxW8YWTYUeg
	V335yGKRwuR6dFHNyHLG6tz8RWcCf+zbj2x7v/MLJS1IJHt9kxPgpzgx/1rnDTtn+3Xwr8djcnZ
	c1IRJ4MfCSGsN70hyf40TKclEeXxfY5+pFv/Ysa/gH+puQbHvoHfZW33/EzuvLipGwSta+3BKhi
	kHNi0MNbIRVcrjgBd4QTv63M2UJI0YU/QnFwbDMM4EctFHEU6mP7Jr1Un7u97jzZVE8e+kiHRL1
	Be+ungVjGWmcTr7MA1e8EP+lpRS2jIiPMLydDoGPRt/Irknlmelad
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id d75a77b69052e-4b2de83cb2emr22826471cf.83.1756143281059;
        Mon, 25 Aug 2025 10:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz6WH+r8iVC5X6v7K3eW/AwuiBzcHaMNlP04RqOd75xHftv58SkM/HMIMyfwMINBYuS6fANA==
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id d75a77b69052e-4b2de83cb2emr22825741cf.83.1756143280341;
        Mon, 25 Aug 2025 10:34:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f46dc5a16sm544219e87.125.2025.08.25.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:34:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:34:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 08/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <tmbatmfixhm4axvor3xliq75774vuz5w4ard42serfuwejs624@wh3sk5ug2u4a>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX33RrCEEjF81h
 B9XEvSar0ZI7Xq3btLpFZXiL0JUz/3RLte1TzJxoxvUK2Nn64BasVH9RKtzDEYZJn+XGzMlkW51
 y4RLZb1e/kMPYvujIApokttE04lKMJSmhkvDgLR7530ykWn49DINQcpgIlEvO7C8yQqe5Sb16y4
 wNnHSlKZn0DVGLm6DJydi0a2D97iGr6uVeNOzYyrFj4h2+YUKw243d2pfbVs1tn2+7j52/itRSB
 rR5fYet40wC9XdTyDoCzAi+rargyivvc5bqGXg+3vhXryQnGVYiFiVaeAUEofvS5appqvZwCP3c
 kqsd3yL6BlvsoUSvivcqfipqD3DGGvprN8IPNHhR141r3HXgJSfUTrstimBwdHFMBSi3RrIOGvH
 9K22l5SE
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac9eb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YadZbbKFZxuD_lQ-BoMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: x7Mxr-2_NTg9pjMbxq_4z-td1nycdJJc
X-Proofpoint-ORIG-GUID: x7Mxr-2_NTg9pjMbxq_4z-td1nycdJJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:15:54PM +0800, Yongxing Mou wrote:
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 77 +++++++++++++++++++++-------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 
> @@ -2518,21 +2539,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {

Nit: unused curly brackets.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  

-- 
With best wishes
Dmitry

