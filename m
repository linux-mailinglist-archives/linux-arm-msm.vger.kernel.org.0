Return-Path: <linux-arm-msm+bounces-71049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A7B38E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 00:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F323647AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 22:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EFE2E9EDF;
	Wed, 27 Aug 2025 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksBOx0Fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98FD2F83B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333717; cv=none; b=qA5vFJqVWZkNSsRNZ03kwj+H1Z69Klys3juRpgQY3YoqkoJJFYNV+IdvSKkrO2HJEiSSpGiqzR7BfgV1VmE9PVzuPWWAmUELexKwSokxySM0BoEqF6Iyz2se0ytiJgxP8P/7aLz+46Jnnjff4laWTjmiDYYSVe2kMfyq47Zxv3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333717; c=relaxed/simple;
	bh=Enfpdt0lrNqevhutRfiz1sNVpTDatf+D/XBiia59tWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLZTVxwxuB3XB0aQmGr2Hp9P5IudCtJP95fT0fEwjwoHhqjmJ2eqNGnL54DG0GHRmfGtrYJ6FMpe4kkrsCpgf9xmQj1EfvKLnaX+jinfs71/yBTdvftLB8ZYF+FHFvJEJJrW6K0ibQJe7x2kvqyLLD+pP/nUcfXJ58jfxjD0pug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksBOx0Fa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGfTLM029081
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 22:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcrLZoaMuieBwoDNhdy1YKKE
	PmtaqIZQcasiCx3hw8M=; b=ksBOx0FaLwkdk0t38aj7T0xGmpchr04zFiJSkZgZ
	Ba64KDw1scqklvR5h9sPhUMIU5Lm2ULbS+dB0sk27byD5zxz1LdT8vRZaUw1mIEL
	xh0i2qoc9SiowpsxDWLGj59eU9BUKYNTd+Lt+SZ/9us8XpkdePkPbROX9L0c1Nis
	xuzdRsy97JbgBGv09uGR8V2gtRSajQOd+AstxEjUOr+Q/Lp78EBk7+sbA+6J7rxg
	ssnXa5MEdmfrn2nI2mdVDxwzLzHHqhlfufrgyew42L4gAJrqTf9p2WsvRy8xNAKa
	HZ7JFU2mS/Vczvql0G9Re9yqBmoUE7SgnNjvTTRqpyeYxg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5ume8ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 22:28:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109be41a1so13386731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333713; x=1756938513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=;
        b=DbRaAi4xjji5J5fw9yMCgG7GtCI+XaFyCZbj1dpHv/1OmrDltJ3K5aFNF9LR0WKxyo
         auktrtb84/GK6JafuPaHkcNoUMBg6/SIyxDuNzqaNynv2gEEXhdZakjhdBaUf5L44dux
         QYWUnuZiIXXdQLKSOL4KnHbjbhu3wGsJinA3sCTq/M179iU48lve0rEKXXJjT2FavnfE
         5V6NZCTakcPLfeqxNfXRHru/OReoOc1nrlqb0UZlMIF2yqzv6K33uaLngh6m1Vc2pTqG
         qfnOtUxS2OGcHH2MjiEcrcQ5AhzQo+fTsGRzCbR2quazVsajoxhHkWJivF/pD9WbU/hf
         M3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWhB0kZgxI9Ch7LkztuJ60w5PAdx+7FwJqSOR/eajL2Z/pNA0QIvJni5revpyGIHx8yiPJBBIdnnIvPkfc+@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyKENLv5iTpKrSyyf77mogjkhuEUVyx5k7wM4WsNiTzgghCrt
	AeKhr3CynZLC/KLr182si8IxQSC4yOB8dwFhISbozZTi7HDdf15B5/ByP9HgPK6ieW5ugtt5Lwv
	LlhheTIRI26obLOEe0zxFyX4Fqnt0NwMyhM7SVLSoezG5vYru2WvgFKs9IInm35ldw15T
X-Gm-Gg: ASbGncvhg/alUJ/FrTNNhLI2vsd81pWUMd1mcnVLYYZdZ8ns/rp14ephw1Pap0Eq1cC
	bF7BGuLkcCSllISmG+Zn+en/bLH/wfmjFrpzTMdDL2IpJLk4c8/d0I7Xb9bKziV3p33JRp6+QVU
	vqx7Kw9qFyRpaTYZjbi4pq4E6FpBLGZq8LUrOzKguivLpPnr/bORW2cUAg08C+xN07w97MsEjkO
	hxAMXr8Yd1YZEBIoALt4Oq4FnyW/adFWTARKyo0pXnZTNsy4Xcz9ji9poL9OLT+wOaDEmZc2rfo
	wGo/BNWjBf21qOUvVDUjiaUPvc5M6WFwv0ZRFvdT30qqmG0bwCqHV8XWmmEZX6dwRmglU6iwo67
	MMzFifClQFtHENUjQR+p9l303mHn+HS7cAVMboBAgNFrYNueQr2vu
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541881cf.32.1756333712541;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5nmdIbVBTqmW1BSWH9OY/lezBX2PorYOAsLp+HwXKOdiRgVyGEp2e8fxZ/9eVS1zmC9A+GQ==
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541351cf.32.1756333712052;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c13debsm2882288e87.57.2025.08.27.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:28:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
Message-ID: <a3hwkno4nemddbmaz6dayd24rmqcr3zxujrvsspnulrivntxjz@o3tm6o4mc6nt>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68af8692 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ROUmOPvenB7E6LXmrzQA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXyxXVtmAN1bNM
 2TBSOXJ56oVuf5LSzk40pL9J6bzToh0KTQS2clY9W1mUGglSy+RZWopN6+nt0ahDYgFA2ooV5dN
 TosDlGMMU0Ic9ON+gDL4X45HzvBPm7I9XqTz5PgUCExO+GgGJMsFAB0RgKMCfXz4goXMaef6maB
 I4s0/iCJYcO8jg9UW4y8VdJmq4O11/b9TAKqT71Q8BkgFyDcD4fn8A3+4oqyDaAi9BlPweDsmV6
 GnVH9qBkNpE+yQMAt8HaSXoWTq6Yhr5X+8+wag0SXbm6JJHz77Lw/vpjots2ogq/V8BXj7oeS6z
 N6w4iZxBF92LcwDBUEtnN9R42vLR+Wu5vPGJt6DR6dt8KQrgvQGxbHFcf4/phISEkejN3iqW3dD
 q3UEZuL2
X-Proofpoint-GUID: MvfFwp2u4aHo_fxnawn3uAY8MMQRHRBX
X-Proofpoint-ORIG-GUID: MvfFwp2u4aHo_fxnawn3uAY8MMQRHRBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 03:43:09PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_existing_connector_state() function is deprecated and
> isn't used anymore, so let's remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

