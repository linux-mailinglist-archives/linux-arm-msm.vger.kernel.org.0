Return-Path: <linux-arm-msm+bounces-69441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8649B28DDB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 14:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E105819EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA62E5436;
	Sat, 16 Aug 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzF61BOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563B2E424B
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348080; cv=none; b=djRFBm04cDr7+HtAVVquw5PTwzAKwtGGhGdRbCmR9QCNGAllf/gpjwfGRPjocXS5PUgy458ksQtH5fQpL9E+YANeFTvCjjm4bL45Go8IBRqXqLE3oHAVPHIaOSSxTmjcGxIxBChe71rs5vV4JYIgOyvx6rKO7mvPmMBO/PoGFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348080; c=relaxed/simple;
	bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcdlcQwnBwrkY5RK4mNjHpBYlqDfwqc8mA3/1NnDONvYpMvbgPLF9WaIZK96rjqtvLj3alhFhSDZkgElidqVx26S9s4gNAMoH5E/yujkb5TXvcnQG14fDMVHB0dpx1lhURDrUGUWNMryUxL4Uj+qCwHAO7OnEExxDJZIM/NnRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzF61BOf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3FDFX016427
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=; b=BzF61BOfHC/Wx1vM
	JMbO+2U9ceQC6hSZZqpe2WMC+JYUUEUgHqmV2su1bxNxoKe47vYUAbfiWfx2acoN
	pZAWVO9TtuTS5hcedjk4ESPa3OPqJqQsWJLC9CKb64lNo8sW2j3qSTCpYDoAInI5
	RTkRAaciWPSackxvFAjSLUACz2fLhcGxoiAcZeGcZuWAxtMtFWl1sTkFIKsdOYEl
	RK2k5a5C4CtUoWYrVc7IoM3RjdE1l9eYP/qtg74Gm6wSsOQ2KV4Qd0nRVL3iUlA+
	iF60U68OWNMLyzMDGvzaU9hJdL7OlT8WU5Tx4BrDyVrdzitRaI6hYqEOs+dAlcu3
	/2476g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf0ud1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109acac47so76959021cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348069; x=1755952869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBBRBvbZmhS5MEDtIi65bqiX0+TlTd1eeG9t75hRPEA=;
        b=JLF3PWD9BqNPEaNh9r50LjKcEnqU/0V6TuunsXOS68tdIABCzKS5vmOoKciU/L6zP2
         YqLvzaqesuna3NgJOkF4yrCt5pC4DeCkitEZ2e2Hh7xxXeKzg+wPCcDHrrXFpovLM5M3
         7kLbv8FclKcgBhzn2DT+hbCiRbabiaDFrewF1ENmNC2FZw9MjzgAgykGCd3bO+0sNQWf
         EgZxyHNDd0YyvSdb2zdOi8xV9yxSL/2SW9C9dCw/thpXKHgaEhUnSgKoU3BVZ2ImzpCR
         vJUrH6tGf72nZStHR3sEMt3ScaYbl41J/SVy7LJ/Ghj5eTr+t/SqNNRrpn5ksUZM8gLZ
         sU2g==
X-Forwarded-Encrypted: i=1; AJvYcCXa1b6VB6VSZ2XNF/lcM/upUh18lHYIoZv9l4FZADxL5LLHKufcYlxAiqEwXEBj/R+XaMBqlPCQ4ifld7Ld@vger.kernel.org
X-Gm-Message-State: AOJu0YxPqsNCSC5nihu9vznKavi0RzD8x310D00+b4C123IZ+SKh3ONr
	LQJuDycUVxk8BwZ6IW004mUzrMMR8KqBbnYUym8Ny5Uy6VvcJ5vRLaapNz64SQPh6gRFnCce37f
	+TkEYV9EneBNts9kZYSdJRxdQdXHykAlqVNZTK7ZI85pis7jotYy+TVQ5FjoSmYD6L7IP
X-Gm-Gg: ASbGncvWKEm9Pj0+HfMwSN9kzGK9MPJ1FcnBMyl5Z/cJVZ2S5NVzmLJJXMIMXWY+HvQ
	h/IgxskwuFtPoY8ccLWeddpkELLxQHL8/N8Xixzlx12WGy56Ud1Si8qjm6W4IrTXzKq2xVAnOTY
	RZ9DtpUj6PN6yZ0o/K+It096d5k8VNpxxyRXgG46yioXUT5X2NnOexAXAiyASmMpOlekS8nIe9t
	3KHK4kYUP9WLwVhYu5MGRpPc1k8Twops/HMzgT3x0Tj92SNO45jLeDyEtkKIrOU5xVjmw55po3+
	pVoyWLqSJoBnORbW4g+QA//d3yMbZcqE/97l71xtM3IQKGKwP1qixZwGuK3HU0AdrxS1QqwFzp0
	ybwIvezcNyo8iR4uAWf50rHqquaVaWHRW2BSBMgrLeYzDZCQa4FPl
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id d75a77b69052e-4b11e23aceemr77143011cf.38.1755348069192;
        Sat, 16 Aug 2025 05:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEujKVPrwnqPmVwBrT/6yKZDdIPm7Rj84fddbqZ46SbGO9mqJHM95gjJV/0J1FbKa4y9npTlw==
X-Received: by 2002:a05:622a:1108:b0:4b0:ec28:6fee with SMTP id d75a77b69052e-4b11e23aceemr77142321cf.38.1755348068724;
        Sat, 16 Aug 2025 05:41:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:02 +0300
Subject: [PATCH 2/7] drm/bridge: adv7511: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-2-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ics5UJu435PTkR3N2XAnDPkmPWB0LL/sCgBg7ErLZlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfM4SU8e3MmGmakUS5mUvOK2lRk5Rg6pgaF
 Culi/ZbaOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1WmoB/0R5TBxmhvS4QiRmSEhjsQzSxvsfU1laRFx1oRGjZ1ar4jAOFsu3PQIsiMObIXEZWQYtlt
 Dj93ckAo+pDbud90Fki0EYit+uS7JUpd9EiQbxx96Jg0AkYoYu4KGHxOOUbVAXzULWQ5nEQv1A9
 tUjphXky2tRQvOSKl1/pTUPmRBKOOsESu7sQ6Ies/giG2MuIzwKB5Rx1FdxnfB0kNoxYZG7x/R2
 ETKyAzxVXIvMtGQky1Q8JGRdf90hMN4xz2OPiK4qyyJoz0++r6wWjj1TNzeHLacbKh5IIRzQkje
 GKf1BwdeSqphn8lh67+Vx9V3VP7Kb7S7DfYbHr9aVVy1SIa/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: M4w8BDDJU2MQIgPGr9wrstMaaTTAMbht
X-Proofpoint-GUID: M4w8BDDJU2MQIgPGr9wrstMaaTTAMbht
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a07c66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BPUVXzEUzielt3HhGKsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfXxAsRv75eu2Ar
 3TEUC9KhbSOfwGin/NwhikCFFO2cN3Lm2PFu9uIKJBCEFK61HzWZndmW/txtTC8bcQhRqNH2mHU
 NjWZuIqubPrxn7Z4s+igZqYMToKwyiXOIEa1vm5IHcsMlJGhVZva23mLAiTkbW8Spq3dkvilfCq
 HUHdQD5ffQStk5f3R8qs8DgRoipZJCeqPy1UDwJot/x/Y0TIh0hVzxDWIWX7TGnmLCrqgxc6R22
 lMy/kFMzeQQ4VqTKM8/2h/uBRFZV/A9xK48GJE+Zk3wxFaCZF9MSVmkYpMxqfdJGcoTaEW64+He
 JxdZcmm2q/LHSqabip7C/N1O4FgKYwrfxSOplNLwAmcBhVbJBe8hJUlTYTrmIsj7l0oAOgWz79J
 gq8yQAP+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Audio infoframe is handled separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 00d6417c177b430cb1a81118800588b90c692018..a9b2757d7a2cda1064cbc564cdded429056dde0a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1269,6 +1269,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.2


