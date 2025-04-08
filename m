Return-Path: <linux-arm-msm+bounces-53523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8561A80512
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02A51B6653D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4295A269B02;
	Tue,  8 Apr 2025 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqaKm3Ua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68E268C72
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114043; cv=none; b=niPdTzkUfIwy8Sdc9CVmXYAeS41za+hyj04NblzZi4c8Oz7J8r8c3SX8m/MM37kJIDwTsGNRn8+zklJv3LRTr9bwg8hJtRP7v4cy6FjSsXa2oWoIr5ZNIuxawzcIrKIrpEcZQwblIHIXICgZmrsYNsjat+482doxbzgA2/vr30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114043; c=relaxed/simple;
	bh=RsBPK7j4kbPYorSMzSRdpXlw2ABxVst+sciibcAWJ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKVk28+Kx+F+LhA2gO3beYzuW4WoAQRCIh0Yv9Kzn/sdWH02iXnIvf++2TrVz/hvnHSW9yL7JCfLJW/mcJrfoNdN9DOjCWDkuICaDEm+SunfB5m4x9gUEwLLVQUTCp5UHpB2TUJM9utqH/yLM1x8IWe0ikTIjtaBLcrOObR0pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqaKm3Ua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BVZW3014245
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 12:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NAOBRVsjJlHCM4CdITK2XpsG
	lU7ZTqgOAiQblGZfMuM=; b=lqaKm3UaJkGn/9imxJ44ZTO0g34+ZC0rt9Box9zs
	kbLzG8ygIFFJqC1cGFGMuA7PSRNKTWRi44hoN/Le03qLh8KdaQx2u3ZLbNsnC5Xm
	Ut8RmiyYtVAJUSR790WSHIc8lf6BfdVyI/z7By0j64549PQfHFDGE3Tj3TEY0nvH
	5g47J7MlDY2RNbLUbhvBtkUznFGNTK6uceO/r523upDptkuadMDfBs3NY/zrLj5L
	yXYNAUoztzv9ZcEyNbZqrGdrKpUJEjf7aCbNBvUYFEQY1eFFKfQl2kCfKNxKistO
	hJ4+lMQaygnkkMeMRS7tHBekwbEOF/NJ+DCG+wWY5h6Fpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7mqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 12:07:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c549ea7166so894868685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 05:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114039; x=1744718839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=;
        b=T7ZWwF4LR0otjYxWF9skn5TVNxQW+dv9EdoDwHi+hI03R14J85rEVLFmI6DPoiCTHw
         m/DEJXwzGmJHNlJKweH773UC6PJFU9att/ScmM4PnreSULJ5ydsDaXJ8bjL9fPBCBYjv
         D3bxbSyJ/T5e2l0BY3kbBS0VVykKX3vifLmpwchk/fjGLjHRtMetbDuSDeO7d6Qbg1r8
         0X3Wx00ActtwrKZxgVrxCp3yXxPW+QKhklYj7CdXeC6xMUJGvnpC/weh9cFxRgUbH7Nd
         fxkzZdM1vnym+NFmiQ6aNCAgQr2SmJiLgpaC4R5occBTq3eZSUHM05e/Nf1kn7RMMlBX
         IX2g==
X-Forwarded-Encrypted: i=1; AJvYcCW/4aCuz750eCk7R15zkKUkje5xgqKphdEeAPrXIn2+g/u+WxB7mlRS/WaismqKsh7DpvIlQ2WBYdyE3daV@vger.kernel.org
X-Gm-Message-State: AOJu0YzAk50CVUygZcHQWavmLvdSZQ5Q2RQnQ2FeCe8fhj7drN2AzcEf
	2Iw1s8SMshXxx42tWNAX9jYz+Azo08Vn4ub0xqx4StHT03HCPcKikKaYL4d37eh7fv1a0VCHa53
	mUC4sB2fUMUvMQdIpe/Ka/2k01U9nEbCFrtEtY8c8uC4QK+wxLRKnJ+Vo7cX3u//M
X-Gm-Gg: ASbGnct5FCBz/SpWp0YNMOZLx+gRzCbQSuenwH2HsvHr7I5Dm9ds+TTzPSwWgXHq221
	zVciCANnwTtrkWWXe9tLVx/DC7tM8IGOS4ELsa4ChsvdOY0C19MuOHdheI1dL1r6JB78g5dactY
	xf0AtYJDmKjy/cmKynN7LR7Js92bBUX33txbawMpUNg79oeGD/39AhQoas9gTMzyVyU87YHpKi6
	dviEYIMWcvkgRT//oqQ00+K/YAJtKpd3nxY28HTVeoz1xnTD3Qdzbk0spSMEBpoElYmDzfsFmMy
	hOlse7FCQu/Z9UOXEuyD4ws3Hn4kUSsN10s3N+HO6FDdmV/syBq/LsXWMGg6ZxfSvfRBmeB4pa2
	PCeQ=
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062272585a.23.1744114039131;
        Tue, 08 Apr 2025 05:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOm+0STm+ulEUG2g1OSycLPEpwZd6FwOx4lE88yO8te3gseQuW/5R7Tv5qddqxIae781y5XQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062266785a.23.1744114038665;
        Tue, 08 Apr 2025 05:07:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm19167511fa.14.2025.04.08.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:16 +0300
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <63airbm25ly5svkym5fuahnlli76kshtq566zjjdswdhoatk2o@wi4uyz5xrnt4>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: mrdITI--piYmhQ9aTnvE29adm0JUs4oc
X-Proofpoint-ORIG-GUID: mrdITI--piYmhQ9aTnvE29adm0JUs4oc
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f51178 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=v-JOCnpjkiGUajTo4vQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=783 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 04:23:22PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

