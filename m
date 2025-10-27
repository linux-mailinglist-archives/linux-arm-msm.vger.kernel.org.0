Return-Path: <linux-arm-msm+bounces-78908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32907C0DF91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B9A634CD64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23945284880;
	Mon, 27 Oct 2025 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwIVjq4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC71283FF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571229; cv=none; b=JGSd0mP/3molyheSIHboMAxS1Pj/qvIt2b9yaHPsYhoYjnUVTW7LfJMSGJOhEMvkTOcH8MoBuD0/Hhq2tIOaYTXD7BxvjNop39VdgSOMfwgHv8tlx2rBeNE8NykoIzYYCt+t+EZJOleBXbtmDyyAOeJ0frIaVURKm6HOkQSW+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571229; c=relaxed/simple;
	bh=Urob1Ql2OoSZQJEmH8LGBF3EbghWZmcg1Jd3ENagKWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUv4EqcQc57kgdQu/mbPxLGaXPQi5Grlbtzho0mZivGsuL74XXiS881pW9ZjxprweW4gtfxvCKwXpwAdUeaSVafRrHU+HBVY8LiZ/EdLKLVKHMS18lh4WU4SfTSEqZB5mAdyZKxdJ1+3JCsVDhzDxxRtNeDwy03nsiPLitFYUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwIVjq4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8eANc900127
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Kj22k9fvRGgrx/wBkPeuGzy
	xbWnEzFTmd7/uwZJCyo=; b=dwIVjq4xhUDZCJzwxE3ZOMyH4nR3tEZKNUzWKmWL
	BYF30w9mq6/zytpBeT8+02bz/FS6qUpm4ueaf7G7rKzX8cU6PsdcM8fHy43ppRLJ
	AlBbhSFJVYTtNJ29IByKTesZUlRG0/qIyvj1sJdOxmNQbhyjF/SDaPp/Oqkl8TYs
	vQsup9ySY1bW1uZkN51tYm4sUEzLERKGquf9TAtH9oc9krrbewD6ICg9L5WCq3cj
	/STxRRCRouQWW5O/ZeFAq2QwbPl7iYvlctf51PLeIEqNHVl8TUqRg26zp9kfpXCd
	56FxdozwSlcDrWxog7nosV2lKd8dQZCFMvkaQIAqu+THdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkampne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:20:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eba1cea10dso131905021cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571226; x=1762176026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kj22k9fvRGgrx/wBkPeuGzyxbWnEzFTmd7/uwZJCyo=;
        b=e+hmXLrSIjLFJFmZXd7PdSQ4L70lEY0BEkAekFGKdz/oQMA5JlxZDKoYkBUHQVKYfO
         aFaAXeZ72AUEnr4BYW8TJ7iZtB7Ki22H104eRNCHVp1JKI4VnskDFH2JaHx1KEoqc4eT
         iu9DXvMQuHjhWpVms7cT/cj6DkK5H47/pGG1pSPtmVi9CRNVfzbdGSNBsmbI9fg38m7A
         GzUSkBaTe6xG4q0WbdDDgStGDvY3ukc1F1O00hoEYYIIqDKk/lmvW4re/dVDust9inJd
         tuRvNwkYDxHx915VQ1GTAh84fPzomLWOwL2OqZTPrWSeUfhpZ4mjrWTi5aue9II5kdhU
         sRXg==
X-Forwarded-Encrypted: i=1; AJvYcCVILyInK1KCkl/wzSFrNmalNc7h0orQkT3K1Zc4ULbwWsRhSWbhpUkLhzDhInXaTGhAiC0TBNrFpoVJkkmW@vger.kernel.org
X-Gm-Message-State: AOJu0YxlfK9r4Lduvr/yFjZE7aokHTIY87s3zANnfakbB90+X7lnhwSH
	O/XUpwVPhHP5qjz3iJ1oggdnpqEiUJ6+sLYd6y6gwGr2aQxdB4RHFEVe79Prj2BVOABtYPHOut3
	fRwQXSa7cYvfEda+GjXD9pC3qgf2JRiXJax4+J8H5IkuaMg/PGz7whOqMYMxEX7zx1nhD
X-Gm-Gg: ASbGnct4CV69uiR7+un7wdfC+iSporxgaFoyfEBPfebgOt1C+nbglnMmJX7ZWtwSsnx
	FtJzIZplJpUS0YwFnS62KbvysEpAyW7gkT/gSsDKJJrVG08I6Ny3x8ornkDaPDphwiiG8NgfjPx
	94i6enCTeGsMbv0bFzHAQSbamr1RT8I7nRgZNazNvbB5wqCo+h35/LDR7lmo6PxwRF1DYmrFWZt
	YfVwkNcoBvmZlrJhEFBapAENcRARom7B/+rVSgyfQUTagzgsDzoAl0xUzcsPxFCg87GDMYlSKzy
	N0jWsV8iI3PuaZj076mpdODqIIRkDS+v8WzwLyisyvxF5dtEXTjl9g4naVNFYLHSa7Qu8//L+AQ
	DxQF2EtqBvATlHHuEoCYVjrYQgW9hq7zvu2uO8pZUaLt0hJzVUQru2zk45yn/wLGL2+AEfLzySj
	qwzyLbQpx/n5ga
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id d75a77b69052e-4eb9c80fb64mr120719721cf.35.1761571225592;
        Mon, 27 Oct 2025 06:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHBc2C7TR7QhTEGEcw9us4tkFC7f4Ut/FGoqtIIC79l1JnmcHizx0ypgFkWMXTqqEaPMgwhw==
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id d75a77b69052e-4eb9c80fb64mr120717821cf.35.1761571223545;
        Mon, 27 Oct 2025 06:20:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09213fsm19983561fa.1.2025.10.27.06.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:20:22 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Message-ID: <wg6ncd4zyoh3lrrxtpjm6bup7ymyy3v3notzvvdssoptveblxq@4g4shyi2xqar>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68ff719a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=kAMrfz4tof1vowKnfp0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Kd23GgXpKsvGnMFuHiRTNaCJqz-WLML-
X-Proofpoint-GUID: Kd23GgXpKsvGnMFuHiRTNaCJqz-WLML-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfX4gz/lWQRdD3s
 iqhVs6KiEQ4u6+2eBDaJmG435K2krrGmckGZLFO648v+4l4ErMoMdIGXGN2TWh0AGNHhtERwf90
 OHw4jVUvnD95GOiR6QdMlzYYqSOI3BHgTU5OYEzVGE16LYVtyt5TSiMF4c8Cn7+U/Dm/XaSmnBf
 fIZT9X7hlCBDikOfMs8k6v0DoIl5XwVLbPCbP6eaDCkB7MDrDyvozzpzc/RFj0g/D6FzbJVZL2K
 gQLv6LafMQ8o7MknBMcgl+H65xfODoBcWduYsBOfKRNCQOzPwg7CvgVD+ocr50Hn8KNVPZiQzM6
 bYozJdddyORc+0W5enD5Jz1jldW1KHgsMwg+vPvGs1USeesjAYhgjcEIP3w+U7IbDxj7939SYdt
 o4EQ9FKp74L8jpAkfB+l/hVH9O4qYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270124

On Mon, Oct 27, 2025 at 02:09:48PM +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> By introducing a protected variable pll_enable_cnt in the commit
> cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared"),
> this variable is only initially set to 1 when the DSI PHY is initialized
> making it impossible to set the PLL before, breaking the bonded DSI
> use case by returning 0 when setting the PLL from the secondary DSI
> PHY driver and skipping the correct clocks initialization.
> 
> But since it was already possible to set the PLL without enabling
> the DSI PHY, just drop the pll_enable_cnt setting from the PHY
> enable/disable and simply increment/decrement the pll_enable_cnt
> variable from the dsi_pll_enable/disable_pll_bias to make sure any
> PLL operation is done with the PLL BIAS enabled.
> 
> Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
> Closes: https://lore.kernel.org/all/50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org/
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 ++----------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

