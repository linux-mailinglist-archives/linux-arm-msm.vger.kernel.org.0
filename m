Return-Path: <linux-arm-msm+bounces-70770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F9B34DE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA6684E37CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F03B2882AA;
	Mon, 25 Aug 2025 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgPxhqlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A95284B4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157073; cv=none; b=LqROI8EHjvi/PBZ5ZAQEDsm7dhCZnwX2L5q9LE0tAd76zqYoTeEFUCe83YT62VWU6HtCActZXdYRy9f10oUDA2xBCgoXbTMbDIrodc+cbRTlF5wPVf+3dR4yxgIWzKyU2MTX2sDkelIBteFoOfJRR0NWgilY8aeg3Vq7mqKt718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157073; c=relaxed/simple;
	bh=cpZTDk56y9bF51KOzYWzjHTLBt3bmAawNU2VPBMxKC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBAAmBi+ZgVHLP+h5QPxhjt4X79FTRr1KX+7pL956+JioP0WAf1icS3dISD0M7NUPbU6Y0Uo5wVle1v9sU/HtZ8zQfIQ0yE6Fsph2mwnhcYeiWfUstvm8RgyX0otU/vveY51pcQbpIn048NizMOEfzJuo3xQHJI15RQ0indvAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgPxhqlt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG4ARE025091
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EQDx8Ekd3LgKr5C8JKyRUgZa
	ehoO7DCfDNyEHU0DkbU=; b=NgPxhqlt/xhwmOcuWi+ZGzi1m6NPMJwUGvHv25+W
	BNdc24dg0JqdLPocZVH3TZBTH9K/zr2efrP0bIEW5ykRclCrAnpp39xwrDMfSdFo
	vFfa4IzPPVsa181ExoG22tM8ccTMY3BkSkZn0Lj0fOCzbLy4dr48Qjgp/xk0DgeU
	KxwJhKBHpR5pfXp7CptefBCRsreS+RQWfLMp/a32RineUIneUipBvc4gBtFBzeGA
	7ieSURl9OODatVvd1CtAwKYRc0cJHiDrmLW3zIcFTxSfJ/vx4ZSnsCxVydVpb5Jr
	4B5uvQRpJCrwWMZNd8vtn6synnn4AxP0LI0zNV97gtJHNA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6kuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:24:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9a65c239so74830426d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756157070; x=1756761870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQDx8Ekd3LgKr5C8JKyRUgZaehoO7DCfDNyEHU0DkbU=;
        b=QYXUw6kHou552yOssZPCS9VfA8eOSUEMmQuLxhhQ6clGNF0c63Ub1C7TrSknbiTTJk
         d+Ar5wsZKiAJRJXU4YqINTKQe2krKVabRLTyQiYcgt6HjFE/Ru9Oq3JqZ7AOauXZf0M6
         CJGFWhRVX0LjFwtsyXD49/VY7u2LoZnhsFzqX6MK1O1BRC+UR1E4Owy3d5on2XrahYjg
         xzvrQKJTlbfM4HZttsBo5X6UWSYL8DUCzYzmF6WZQoP+zUO7B5OzmEUAbOmm0PZIyu3G
         /glj5Z7wG3Fxt7TPIiuS+WuPtQgq3cCBOHMVkp1MgYrjuzJJTPq35AAnXbLjKXl1WEI5
         8lJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTAPod4mSZ9S1SzDqYz0xpEGgyO2JrBBrzJppGWmnBUyHiofKXsyarocXPSlWRv4CQLgamvakGMAOQsh9l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy022WyaZhW+hDFDJQcMTxa+Y1cwsx/itrJGwUez5iJdaE1v+KF
	xLVHmDvi71PsoCpT7l683LBVC18+20s7Q9RmspuHqmnaUk7MO5BuvbPsAHchMLwwGvqsRsHszQ/
	de5n40njKu/GVq/n9bj7dP5p+tHnLHAeM9sdYo9gt7V7VomdUT4MUm53W6/7Wn2JEH8bE
X-Gm-Gg: ASbGncuu8VIFTcB+UOtR/V8DHaaPVgB6CpFjld0E6QDk01fP33ZHEwnYJjky/l4Sn8a
	EjHRkH7jJAoiI9eLBWNe71vikbQ1mVyHmkP4KNobOyrHSCpa26NDH//Czk6YPCfxR5QQDx86IKo
	PxfsLNy8Y+W/6LEZw2kuZXE2Rt09R1aYBnHEapS3uBQtriheU9D5itNDB7ta1aFiPDcJr2FCLRO
	Asdnd/i1RBRAF3q1po1H6CphpKh/iMK2Plfpw/BvF0d159/oh0YIqIuZAHZghNtmzJic7msPUTN
	DWbx/1qjFO6g8j1KwIWRRO4jBEDLYYT0EgKa0naEfzc6u+AEuEiSnV9rUyQymrLWR+Xn5sew7M9
	msJychmuXV8qSpY6j3bfZothauXHazur6HZASaoSNCUv8y4TukwLR
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id 6a1803df08f44-70dc9017863mr25628636d6.41.1756157069650;
        Mon, 25 Aug 2025 14:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4JBxu6eZccnvdZJRTroWtFNllocYD/kVOyxn7pmff5QlDW6XmknGCCRLSE8cvLFZ9mCVnhQ==
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id 6a1803df08f44-70dc9017863mr25628346d6.41.1756157068897;
        Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3366fc06c65sm11094811fa.60.2025.08.25.14.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:24:24 +0300
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
Subject: Re: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in
 mainlink control
Message-ID: <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68acd48f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Dh0pfIAITmfDrERymUkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXygBh1dx8Er8x
 FfWp/1i7YEujZ/pDMhObtD78Qz2Mys9RF4hJGtK6mEFae1UL5TruqkxGtGsKZ/8vkPxMZqKPluu
 P094/2ozlCtWux8sLR01cJWw4mocT+f6H152u5rFjwMeqbPWkl/1iXF8d1H/m4CsOQQl+H6L+hc
 xupQbvc9EkDOeDGfqo2avQeBCm3tSXd1SVTrTdkb/GSSJnAs+QreV537vmKaN/UNbfGf1s8qu9x
 xUBW3Uy2XJvL+RQysBE3Zruae5Ye496RveuKT/M7dSzk0SHGx4tDiBIZFV8AawXGPVLMlVWZGRq
 PHLTT1fJJYHPHVTbZ5leoLvDtko9Htkv4rBkbM66uKzCyDWAD+/RztrdoGKzIJCvlhLWeOOBNkd
 ih0kDgvQ
X-Proofpoint-GUID: H2gZmONz204_99n0j-iOxNzSqKXEr6Wb
X-Proofpoint-ORIG-GUID: H2gZmONz204_99n0j-iOxNzSqKXEr6Wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 10:16:04PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add support to program the MST enable bit in the mainlink control
> register when an MST session is active or being disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -128,6 +128,7 @@
>  #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
>  #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
>  #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
> +#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)

Why are there two bits?

>  
>  #define REG_DP_STATE_CTRL			(0x00000004)
>  #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

