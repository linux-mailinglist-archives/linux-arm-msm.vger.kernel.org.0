Return-Path: <linux-arm-msm+bounces-67370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B6B18332
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE22017A03B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2F2266591;
	Fri,  1 Aug 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh4XrDsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBE264628
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057174; cv=none; b=bnncH61aftDvltxu1a2NOndIRSTx/JAtNJut6ga/TPq2FyposCRQdmsXFY0tqjDDBxD+t2f9eJQfhKpyRTTWTqTZOYwwBxGUzYTi0TMvPCubCHYFec+lXE1NDzP3DxPpFUJIZEf2zsWbJ/m5AwVdIi7Ga+s82oVn+AXM9YO3gJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057174; c=relaxed/simple;
	bh=VLSSPUAEgf/21a0FI9FkMbIoNE5G6WCgHQNfx871jwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAFmbH9UEcrhYw0T4WDkhS+E1Elbec5XoYacyRV6Hp+A4JXlWHluVtdhoCPf1/UYcEvMkQEJoL4p8SC8fIRd/FJ4LxQWpUvvZdCWsPKCKBPzbEA3IPjzd/d9WDt0qUHBVuHwmF2OyZoHlLELNg5SvsTbDwaW47EO15sv84G31M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rh4XrDsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718mGWR005034
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 14:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X5mYO9TNcqG6LvwHvkvNnoW7
	mrgbAWbzpJxMDANF+yw=; b=Rh4XrDscXyf2Oo02oBHA4UuChG3U+1dh+T7OZAib
	VOuvM1m8SWmIm9s0HizjkP+In4P+XyxFB4XZx7IO7Jk/zzYjW/kIu9MAoHDfanDt
	ZK6ZqoVyXjZ4oZ9aQZ//45SiMCQnN1Md4SWDUjpVylMLrsI6fDTO6e1lMPCbcul0
	oj45dL+plcwt4ZOUYWeVSm6+aXgBwJX1E3S9fNMRuKw5jxIHAfkXX8Cu7W2h2xE2
	KUNOSM2i5MN6SzVqn+zzuAD2NNXnZ3nFwYlKDBiFE8zuStZ6F5rYuv5nXO0iq51Y
	M0bXcC1Vu0z1BSpGM0cpy9kLcSbf0lYPsu/KiiErHey7GA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86cctv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 14:06:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b350d850677so1208526a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057171; x=1754661971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5mYO9TNcqG6LvwHvkvNnoW7mrgbAWbzpJxMDANF+yw=;
        b=aTdfWfgkPlgdR66fxnbgY2z8q8iz1tO6ebg9+JAEbrUs5JJ4Bf2jdhxkrTEuBs5J/V
         rJ60uOBxn5sXcO8xVnpgjo5gxez0zk5bzCz4dn1gdNgJ116etndd3A+iwDcWgoZWSJYE
         UGwv7P7x3XI9mYgCrXt9nyj348b5MX0XotctLmZe+pBxYGDFXjCRh+vjKVXWLQ9RHXsp
         Pf7LW6m2boycjPJLg9v8SF+lE1vYIt30hwQtnF/WS0gl0MUGfSa1Rb7T200LU1FAPomT
         Gs+YD8i9m496URYFchF7tu/Fo/sqJOu6bfMdR5YbKmFhw0lNz6yCiR0yqjxID9QEP21x
         Oz1w==
X-Forwarded-Encrypted: i=1; AJvYcCUISM7r+22RJNxfQmi1z008ZZNrqzwCtqFaiIiV077+KfMTpTFx7qlAcp9NxM1Lar4sMmFavEeN64Kbla3h@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/7kTJLQmLnXrh5jBsLRNIFQF0Gars9WxuhB4xerHynStUwuA
	ovK5Bz0e72dyad1SEDUAw5+VImKUsXO5QYtkuaM4QMtUrZ0dvVfnq2lqy9XkYUMIljoO4EUdpby
	wj6vX+eYmSwLZS8VjzffU+b/YeTU5mZzXkzSiJpiJsYC5Zp3NxIWr7OQWyrRnUJ2FOU8n
X-Gm-Gg: ASbGncv8CVMDN2+7l33ZcuIO3KG2XJApKqnOGfZ8IXewyYbsLqxaKBGJsEbBkcMHCOf
	Q3gZGnPJkbNArZiDFwZ16YK/88rTBZU8L0f87RxarO0Ozo8/4ijDpDMCRGDYmACcARB1ZvXZVyk
	w8GZiq6WyJE7k/QqX4iYSkBi1oijC/RP82oCUfqf5d1U8tjLfWEBR0igp2Iu5nUwFrPaFof/rty
	zV1d2zUPFtvpO4MQ9maNve2lQiUENAcSAC88yKJ0mXKRJ+uYf/xk92ipiaVIjLTLcbd4PH2N9zi
	8udc/bkfsg//gPiSe0MLyl3q6kF8fgtMeV2hefCsFgK84UplbRcn1w3esYgqs7zgNiXBlm4ryAX
	lYnSUKxzT3UDZHXjIZGPyWlq2GPjTaJtDUhJ0T4699ZNwk+JSnibO
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id adf61e73a8af0-23dc0ec463emr20483682637.24.1754057170902;
        Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitYNtTnXOBq8raaQNZX9YeStN7g/CeoibFIFiLag1gYHl4anqkXU57qCgbVhM4DI8a/qNMg==
X-Received: by 2002:a05:6a21:33a5:b0:239:29ea:9c97 with SMTP id adf61e73a8af0-23dc0ec463emr20483562637.24.1754057170060;
        Fri, 01 Aug 2025 07:06:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fc7d0sm5621721fa.59.2025.08.01.07.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:06:09 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <z4ewbwtrqnem3af2tuket4wpgsulo6f6vy54hnhxrcx56hdx23@i5nuuiw3j36g>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX9Wm07lr7WrxR
 gN7Pwa4sGS/RknCe9p/X/drvSXsUM6WQbozNtkPZ2Cf+bKHlhx/yGNfdAugLqMvuBoOq44QuxX7
 ZvcYosY/TtXkaXgwlqSSPEfruXZcBtvtZDuEw+hqte9zu2VlSuJOpAMCpI2zM/pTxJqDthhhrDt
 xW6s1p4kYEYbrWq7fayUTtB2hAL2a7v0ULWjynPuQorDK0uzkxYtmfH7aNtfaS5HpscUzzuJyEZ
 WsKY+GWmRGqqpI8h4VIjeSI2EcJXJXrLWx/XqMFnLjuK8Lu6iv2CiFMXZSXPVGES8KbpDsbotvw
 JDbR0DpuvJK81ktyWSZ9ajDmXgr4eNN3DJBDGIhHgcTWhuDIk9/YXmGqX5xDsow31nWK+O8Qtl5
 A25xpxjCjKEJG/7fJfR/WFBzz7hLnPhTVt6SDJ3Wl0M4+iqCeZZy+zyNY9KusphHS0aYRNBG
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688cc9d4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=noEQxEA5MoPOL7h678AA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 0AubWxvivFy6TAYRX7ns1XavEFqSeTyE
X-Proofpoint-GUID: 0AubWxvivFy6TAYRX7ns1XavEFqSeTyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

On Fri, Aug 01, 2025 at 04:51:13PM +0300, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)

And I used wrong subject prefix here... I will fix it for v2 after
getting feedback on the series.


-- 
With best wishes
Dmitry

