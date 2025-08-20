Return-Path: <linux-arm-msm+bounces-69965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FFB2DBAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63636720D49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A111713D512;
	Wed, 20 Aug 2025 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRFmaEMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C572E2EED
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690580; cv=none; b=miyu93WrYgbjTrvFpB1f2GkD4Xybiy0NSQsI7Kd337V+mdPYNllBXG/YUV4bKpx5/FAEf9c60k9ctLTxpZ3wTbDC0be6G+iCSbm/0Uw82eRLDbmdJDcGKVFnpSUacxF+/jbaKwLzDwJDAHZx5bHn+Jj5jAfXxwV4gnLpZxEWAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690580; c=relaxed/simple;
	bh=/W3GAMjxb6JXpBcaXEk9zeYaG0UOfu4lsuIRPhBJ840=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vE47/bdUvWm2m7YteWLpOxIZlNEpWQmIG/gK8cYJbR5RWoidGXpvcPtCTRWaJ1GTO9fYr9fdrM9CkhxkOf/fsP4JKg06NSIDZo8hBLcFbUEJ4KqH2v1MdQ40njUegTnq1X+SbpwLUqlkwYFNYQyVcayl6E8dhiKz1vKn0FPUfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRFmaEMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KADVhT027085
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eQi7QofWcWU158eHa77hdKaL
	MtA3y2gGZ0Eyw0PH0w4=; b=XRFmaEMslRE5X4uO/ji+OsjfJYFnH5j7tKnrndUM
	jgnyDrwLaMjFnRz/WJDihtq5/NFBqMRvz8soLQa6BPccpTKet3utuvHsCK7FFeTS
	ihb7boZRAiH/eP4PIfDN9naahMao0qhYEch625dtktKtYZQ8OAT5PMV+NtFNM8jI
	flLUW7OapLaVLcyKx+x+paCwMpfDfJxOZpycrTJrRQ2CGrCAwD0GbFwQs3jBGNQj
	WnlJiGrLgfcTEmfBRYP79gjZeIAWkGBD7IzmZm5L4jJy22E8Zl29IBWUy3OHsitq
	aqF4QhbAQJYqoXURUqSltZcDkjaiR6ediEVV8foif/wYKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9ktr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:49:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e870315c98so2881562785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690577; x=1756295377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQi7QofWcWU158eHa77hdKaLMtA3y2gGZ0Eyw0PH0w4=;
        b=qULZ8ujKVatU52O9WzaAAuFGCaJ4eiKwyFjGKRm5nB0VSpsm3xgslxgc8oM6qtV51M
         s7baCSoyvX3Sirtibb0Ab4RMud9Qu1CEpMmcfxedriANp1qJJ9KOsOg63BSdDeK5YhIg
         KNvMxydg3HVY6ZChZvVRs2tcDd37XjAaUyl4BMznlkPlYFTex0dJ3Vejxif6JOPgOH4x
         FegmV2C/sr9DdYjXQfEH9cQVNYLfmU7a8DMvU/SsQWh0swgX+1mmeRhqznA4VrbrwQMp
         uvLKb6bLvULEw6g4Uch7dqzNWJyjLxIP7H1wHD8OTgS0FLMmcgeo9F/aEKel+OeBUzxd
         uoPw==
X-Forwarded-Encrypted: i=1; AJvYcCVoBm3XAQ9wjgDjL4b3n9OrLgXnbceols0epu5zPAJJox12KIVrcaWfRG/luSn3HAa+arhGNB+thYZvTtMN@vger.kernel.org
X-Gm-Message-State: AOJu0YxeW0RjJj+8clSUPwylYeMZQwwL5PLg2PjryUGuFwAzRYmYDg82
	MNv4L8sATN2Wm+E1EoYk0ttFHKOafU0WYiejgSygAp0jvrktuUmJMmf6x7KIkjzUSvr3qYBl86Y
	z+Sp743fwnX6QNLa/MgPkaaDj+AI6Tln0z6Ds8tW/q4zdX2oZqaOBQDJhfxtzhF5rUJ7l
X-Gm-Gg: ASbGncusiNMz10szkEy2HP25fODVJScuolHpxCQRlztzF6fQg9fj4Nt1SpxddClg5oz
	7Ft35zOCj8SDsurIp6vTY37reONiji94co/9iZRMrJSFTYpkzRBC6+zh/brh7EDzCoZqH3mGBqE
	9DruwUp38m49Vg/U8duGVHUUvK5FBp7CYybIbrfPLAhHuY8HnkiC3obmmA6atILMA8fAFmUxKvi
	hCdeRvc3GADJZgiOaHbJdpRDkjdb26LSnRtuvQLEZ2rQ7ngf06J7EGTO8tTj/XA0SEx45tgRPo0
	U0+WAzK2co24L7sFu9PVIuw89tjBsf3zKQUGA3kDTC9GR5Czaw2XZUXbD+GFnxqGY8RZXbWXhd/
	10pw8Gm4EQH1JQTEqblmNhCAN+Q4PIp7x3TBLbphOKmyOs256Av6h
X-Received: by 2002:a05:6214:20e3:b0:70d:6df4:1b03 with SMTP id 6a1803df08f44-70d77170c76mr19313336d6.65.1755690576854;
        Wed, 20 Aug 2025 04:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmrvdHhyhkjHia2f4r6fnsTTnjiCF/kpkKVlmq6+LLt1eyY0mOs8rxItEF+MdJz7nJEs0lug==
X-Received: by 2002:a05:6214:20e3:b0:70d:6df4:1b03 with SMTP id 6a1803df08f44-70d77170c76mr19312816d6.65.1755690576172;
        Wed, 20 Aug 2025 04:49:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a625af7sm27271481fa.60.2025.08.20.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:49:35 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M_nDtFcYjR6BRsdbAVb847124UGk31ku
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a5b652 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mR71zFEkwuVZQDQknwQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: M_nDtFcYjR6BRsdbAVb847124UGk31ku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0jvw8cTupSR+
 sxgEbpOC+Ze5DIC1Rk3ddrlM9aOT4AP1iXdZMMzZAWCqt+Z3nIthnzQjhyjroikYsI7K5XrUxSz
 +Cndz59oJ3faIYuHKHvRqPa5lW9rE7PLVJ3zmV9fGys8hcKtm/BsP4f5KP0/wdx03gupr1vjeEA
 0Wwu3i6cY9CjrYFJU5m0a+Ik6LbJ0yOEEjipQI+bEct7Ubw2O5PkyF2bc6wdgs379tfP647DM5m
 v204RvB+f+K/8EjVhk2blsIRL4pT3KMkQoRE5w1UbEEZGD98dYZvGLdjbGZCoLZxghFXeVY8HKl
 O9mcxys1RYuwmmB/3WNsh1qdD3Rlzzn0zcSYaAR5CozAjFribw5cwoM9dKuwniqLnQ8hDjtcC3e
 9+HMB25md/wpHjdCYfrf21wIsNbNmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:56PM +0800, Xiangxu Yin wrote:
> Since max_dp_lanes and max_dp_link_rate are link-specific parameters,
> move their parsing from dp_panel to dp_link for better separation
> of concerns.
>
> Add lane mapping configuration for the DisplayPort (DP) controller on
> the QCS615 platform.

Separate patch

> 
> QCS615 platform requires non-default logical-to-physical lane mapping
> due to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This
> ensures correct signal routing between the DP controller and PHY.
> 
> The DP PHY supports polarity inversion (PN swap) but does not support
> lane swapping. Therefore, lane mapping should be handled in the DP
> controller domain using REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 10 ++---
>  drivers/gpu/drm/msm/dp/dp_link.c  | 71 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h  |  5 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>  5 files changed, 90 insertions(+), 77 deletions(-)
> 

-- 
With best wishes
Dmitry

