Return-Path: <linux-arm-msm+bounces-56115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B12BAA0B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63AB1A80D79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FF22C1E3B;
	Tue, 29 Apr 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AF27A90A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928581; cv=none; b=CYYxu7YGZeUkEEjSDYqpsSm6f7dgKTAtaAH/2AwWJCa4rpiiS6cm4/4OeWl+F4CjxF5D9bGEeqYr0DmQJ9AB9fT6lpgpAdxPwnAQ+tYFIjt3TsLbRKgoKTYPdJ5zi8kSv9o7Gfqsure36DbaE0Gi3vY2Yo0jWQI993qEXFHG1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928581; c=relaxed/simple;
	bh=JI/M3TugvXmROCbZWvHzHoi236mkIUCGUMYXkYi7au4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxYl0BixOxcOAYzA8Q9g/yYO0bRzL0OYSPemRmFdF+/Fr0DYfdlKuggl5SBiNL4ql0VjAuENp/veU5LgmUem3kU5U8fk9iZ7eOm++2jOALzCAbTGJ9vak+m624olEJCtXeRnghzy7irPDOYmrcyBiJI1XGiRrSb86W54Tv62L1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGLmgB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l6R2024687
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmnw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso1036862885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=ah+nFdCX2g0zpDY3a8n/xWoqvzxIpgFjgv6YtbgWQCLb/o4mIkT9qnZq1fZ5uazwSk
         OJXdxlLNeCPT1HwJ55lL30cDIvK5EUFaaR6jcsgAV68q4wkcvIqMjx71vskimu5xJK4j
         6glfKSetmnQLVHObFNVtIyJHKnxae29GRZHciFcz/AnKSsD5HZMvUHn7RlecModHAWOO
         rRVQm2Qj7n7LHT1ctmZM1mbCkD9FomcCxf7DLjXNojJJkXa0KPbces0iC6WK/zGUMBua
         wAGqQc5D1234wm/AjQFnSMWYNP1ZN1cY0cZyIq38t5p5dYgGrBTvG9lmW/rD3NVEcR0l
         cKWw==
X-Forwarded-Encrypted: i=1; AJvYcCXvDb6pnWiTmbV1fiYicd1rKBVBEfaOhXjHxj8vsi8j39Odb7d/BfFHzgTn9TY2pg4oFX98amWUCm/EK0Lq@vger.kernel.org
X-Gm-Message-State: AOJu0YxYep7kaiKifdAG00HWevybgNbOSaDLHnGOjP2S0J+YhwwUg6Y0
	n23T7clrM3YCmpNpnI2FAtYAmfgKPrdsZQRpSwu0LAIwW6l1yuU3zcOkJe7ZOR6K7w0vTLr/0fj
	IO50pAPP5m0cqXKTAbpPEQikZeEs03mmwS7Q+FaMLJl16fi0TjPoEYWHubWD18TTR
X-Gm-Gg: ASbGncsRfdD6/z5Rcgi1NJ33uIwPkXc8YoIKBegdZyl5SLh2t7SoVZlJf40axr/5c+v
	rAGVEAoVgtFaPQ/Np8B3us2BY1OmkjLhgi3Y6xEgkgCLmzi+6Y5VE0KsZsfuUhGqhbf1TtzeV4e
	ApO09iLzvT3A9DwslZ4C+lojwwLKZlFDVgeQMXCPqc+lN8gZtGK+Rd20rcrwzpKwnHVKsa7X0Bf
	f+FFjENDAxv6WodakiIboCtDWgXu2nZEva8hppr/+Wt0CqSOzTb8uMb0VwuilBtVfrfg+zoT9FH
	kOQcnx6ppbkCFBzVhWAUdvnFp8URqpRlnzgf0FbH46G0zvthcheqE2jRKYKI8jtJ0JAGeS/AoBo
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556718785a.31.1745928576954;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX1IIZubvbtuZi 9L/PkqMGZO6iktGu4awEUtJZ3M0B4PMrr+McVTP/k5TfZ+o7+8ATTA7tLpmHju2HYcEeVjiP+CE oYK1vUhIvTHuUEeAc3TDogQbksUkBZGxDNfN+wlHvACaOJ+H8hK4ZxGC0XVI5RIdmgUg/ql4sip
 dg7vrb85LDpU/f0JSChvXyT5/vf0XVwdr8KxP05OnCuPf3wKjPXf7NEC/4adk0vFExC2Rrbiej1 AHgbFsTkaApRaLpZ7J0qp5LxyapQjJe1wactle+fYyvtJ2K+SA4NaZxAORsY/1YL7BXR1/5L343 cTwpmzjOJxmj8zIn+Ykd50cpsV7OFaz62Dy+KOdkrSDTbbnTpVp7Yt7wrmix/bz0R0PND3KoyEE
 28OFObTjggAGFruyANQ7WadTf+4wh7hu+ql26NtcPSnnV3cvSRJC5KHy6Zvz7nI/Ndg5W9Kl
X-Proofpoint-GUID: 4jePrPkEEyvNOYEOjAAeRD9m1WoCaqHP
X-Proofpoint-ORIG-GUID: 4jePrPkEEyvNOYEOjAAeRD9m1WoCaqHP
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=822
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

