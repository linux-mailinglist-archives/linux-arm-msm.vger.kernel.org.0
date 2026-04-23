Return-Path: <linux-arm-msm+bounces-104328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCRNJ0UU6mmytQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:44:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAC452302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4481303C2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9C93EDAB7;
	Thu, 23 Apr 2026 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kz7jLeBz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBzNxx68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB23EDAA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948203; cv=none; b=tOPcADqJoLaRUQSd7Z+jPXAXDFm7WxwgscFdUnRyy04dX1V5P8FG8dNrpFfruZ2xgUf+3S+aw+D9gSyMNkceSa/J+k3ll4hngzrAtvUGhQ0eLWAvXD7rClcXOw1e7RKjrqp8uoCIMu/sdbUKahDJz9S77dlZ5By7iMTrX8MZ8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948203; c=relaxed/simple;
	bh=invPGYQ7NdzxSWBArDuv9hg22Fo9hiwrNySrMfHzM1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVE72nOmMyi91n5T1GovphEAOkhp9gPXvFTalGLefw7BqvB5LdJwwem/INoKdCIrdEzreWaHF9fUWg8zwALDLvD+6EFVFqFHqIG/0OoPGPL20H0VBwuadEv4i0qtgvrN5x3FcYges8wTjdNmu+TN8FDw7da4ZkQR6SrzOdYywAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kz7jLeBz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBzNxx68; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tr91179321
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWsj0dSc6URl6GzhKqtvvsA5
	lvMVdCA8oRPUY5tXRI4=; b=kz7jLeBzJhutORDVFx2iCKLx6BbKBMv6ZD/OAzXy
	A0y9fL8VJ5azBC4WAyY4ur8i751/Cb6BI3cUXuKQsmwXwY34+fQJImLA7H/88D4v
	1BG5/aKfbFE/R3yiLswxqHx22LbWVldKcz8Z7n+9vvLF6H0umWX04940IYnC18qK
	tqpEoazA4Gx/aTQtT+TClBki1rUGdP2FhQ9RJS7+TJ/lTUY5IZeO+dCzFtwCvg78
	NWGFar9sZDj1b7ftpz2facMTIbdcJTW1sSKycWLMr7MmGIEbOm3qQC3OGbd5TyaF
	4WBlrARrtwmAMfi0rdEMVIqZqVfGqYskKA29CbPTq0GlIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hg2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:43:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso65832061cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948200; x=1777553000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=XBzNxx68BMtEqy5eaEmme7eGtn+S/wAJiiOv1lbEEZK0ga+USBKWku6fuFlzN7YGUu
         OSJ8VB8I56ceD87LJmDjncGto5TaxoRr3hHSuUxohS5ZJzSO4jq/A/NH6gIDd4hy/5UP
         AQHNUGnl8QuNFeqPyCDeWEsbO8XrVjvylbo40tmXfLHxLdX0xCmhUDIKxbT3/SF3O+NC
         PFXFskwGcBKRMmIp1KI2GdTcIvj/U/NbJIDvVIy6OgtQHFYutHwfsVQREKZfxWghJVtk
         WBkNLCyy48/mHS3XrD7pey+H9i3enf/+73+k7BpLRn6sv+iQIg4z6To0sFLp9lsXNWBv
         1fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948200; x=1777553000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=ltWIzNFul3/+NP2CjPqlRfqLdqPN7QcumNcCaLxTbe/HnMX3/i2VGQytTHCZzUJYaY
         99p7hTAVjfPC1GVPiLsdtVY6qTcXifREhoycCou78UasSPverEL3DlfDZziqQcW94gQy
         4zER9b88wzeWVGxO32fsD+4ntUfIjYLD2WUFMT4i6NLcE79YvT9pw62EWq9aGzqACVLs
         VABGlK710TSWa/uaKvicuhrG8i7ed1eiilw/HOeJIF7rCHBkXgKaJqA04M51q4YFOHa8
         VVopuyJDQFiPUNODRDH5eXqI9rI56k9hUwqrep5G5PzoyGGB0+LCBU03JlvYbP5tSfCi
         eowQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Uci3syY2fJzQ3AkwadhNnTPZajsFS5p1+r6cJZYXxZG31qyzuQTdKOB8xlopkkggr38BiiEznIIel3pym@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvRZgY+SAVlziay9iVt0W2tBgFhRnd1aMVpCzswvIotesA4eV
	Hy3KdHFNyYav4e4rpB0BS9zPN+EJOx+GtsmNtM3YK2GVUNkYhyySU7+tqRn44oFGXTtis3o3doF
	oCrHd6iIY7LzNiUUl6bPjyUKWO3KBmcR6dswXHUGG0wkGSbrLCzvePb2HIE5LocrOFWfu
X-Gm-Gg: AeBDievSZNSWJgK2e8Af1Lok2bbQQW1vTWXZdh5Yj7KfK4v003wu6nrkGqkMc5ONWI1
	D7ivDoo9PHU8mu+VJ0LWJ8uz2JOThhlTh8Uh7Ne8uGIfQSGqmx2yCCaKghbRa6fVxzhjrFoIuWM
	t481YfYvyEUeRcHgl8hKbyxtMBzwOkMcRbAFhUQtKT5us7/ThEwAMC7tKNPjFkInzCTsjdcR2K6
	kSxZOajqdqD8L09yqhHJeBfeSCUQJIKFPkiJ8Lg2A26rNIujp8EUbGA7M5UJA51OtTT8OY5EokL
	ZKVBqWBlBD5jkjCwfKe7Okohij2rLRYw1+SAmDQi9aCI/+WvSJhYecVhzw5sfasrFSEYFOUN7dQ
	AbiM9vJkOLr4fNtDj66Z+0xDXht4SBMeLKNTCzBC+m349sJvZfa0Y0ZkLuEoxtTAw+SXiUqwKjH
	hqhSWPsUPswzoQqtBuez6mVCLdJoXk1/28EaKXttLm3MdNdg==
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157721801cf.27.1776948199504;
        Thu, 23 Apr 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157720991cf.27.1776948198942;
        Thu, 23 Apr 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12d5sm5133222e87.41.2026.04.23.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:43:17 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
Message-ID: <kxltg2wx2zwuliguszipn3hldalok36finlqwxe4qh3e2mr3hv@ymc7gwkozlzo>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
X-Proofpoint-GUID: 4Dov0_0A1S-bfyarXxX6r-Ruk3dcS89B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX7drEusHHEwG6
 rpAyJ+YCm7dV3cSgvlPCdvnMMHkZXozSfrQQEAfkR0dWep4Ujr16ggCEwrTnehHoSUXZaQyVnkT
 FREi+T2RkTzd72hWlXcmhAv1f9CP4+8ZccHJrH1zJfPwSytRPK4z6fgE8GWoCStdQ2eJkpV9ox1
 zgDDwR/1o64Y8ajW4OkHchWAQQR4BLN0z/afc+x80lgQXzjH8uuQeUyAJtIJI+sf0rC4HM7Y5wv
 rL68qRlCkLFbgZR23hVllR9N8XuLjZK0qopGO8ftkkn69FU25saWJ8s29XP/0M5jZSPzsJ/HtBa
 lp9ycU+NXr6pDECXDkuTcrHUK32JaWPyg5eqeN/tOW8mlrfikkIJAUXSsOmFpk+TSoIVkU3nVjz
 sPut625O/91CPeA+ggI7xxX1n9MfxzcwfluJ+u541NKBUwwEilu2BLRnEGlHJWNAvZtPOOJnjXW
 XkYdY5aBisTw1uqkDsQ==
X-Proofpoint-ORIG-GUID: 4Dov0_0A1S-bfyarXxX6r-Ruk3dcS89B
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea13e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=W9-MdjkIhrGOmg5mk6gA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104328-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BAAC452302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 01:55:50PM +0200, Luca Ceresoli wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
> 
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
> 
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
> 
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - rewrote completely, fixing potential ERR_PTR deref and ending up with
>   a cleaner patch
> - also wrote more extensive commit message
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

LGTM now.

-- 
With best wishes
Dmitry

