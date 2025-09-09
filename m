Return-Path: <linux-arm-msm+bounces-72816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0BB50042
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C06C4E2C6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CF33570CC;
	Tue,  9 Sep 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOVxT9wR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9012F356915
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429559; cv=none; b=bvX0LkHocfJdD+B10djec495b8MxOnWx8g2cXg0o95GEo4lzFMO/EQeWZCD/hJ8gxrTYvnaeGuw8AIF3ijLwLpqE9F7gxhwT82yx0PKWEGv8GTc9DJ2Vjzuys+3JImrFjHMwToyRhLOi8lBoNtSAZavxYHi2nwFGpMhV2YIPYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429559; c=relaxed/simple;
	bh=GCdbmTwssKDcXNKgdZbInJ/IsWBy3ZWBjV1zBKp4r0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLu0PoymDeGucRlamN9MFQhyroq00xX4YLA7uH0voncanPGaxiflvpaDcxDj22lEhq0Yx3qvPGVqeXAOQ7Kq453Ls2ufruDET9Z5SgNkJK5c6J0FFoHqwa3Bo867OTflBx6U4XE9YGVwGX36sBeDcyI6kohLzqzW195cQnkD18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOVxT9wR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQle009065
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=; b=LOVxT9wRqIMsdtxq
	cndOMoifYWVHpZc62EvmN7rj0LDQWAcqL3g7/Sl4DM4EXUog/Mxwe/VyUg0QzT2B
	z3MXkIFFVU1vvUsjuf2Q8uF46tuSQ2B8hUQoQZTMElD1fpy5TVBv6EfWoGO/86o4
	0adpamYkKQP5nECPo7ebms3B9bJmH3QuhNBuSAmhzI6LviBqhrZEuxVnF3eTVh87
	DvvYXvQ/4JxGujIctjPv2XB+Yo/1U1cQGa8IO9F894uEnE378XvCuYToH0angsNJ
	qOnafF9a54OBsWShEhA+PnaZ3Cs8DU0kqPeHqfR+38PTVJvvh+jNfOHZqhyzY7sU
	ii+zMw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7273bea8979so112093576d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429556; x=1758034356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ppe/L523pX1O8Slf7FEFSs+VXXiz+Rko9uu4CzdmWc=;
        b=J1rc3F83W84v02Y10WFWGmEZA2XvPe/BMUjt/DKNF3Nv/ceRS86r1+djqAI+GlM/up
         LlE6DbdWPLqpVO1+ibHZOdwPQVwJcyMOas8ZIcYZJjkb22FrEtXkDxRI6EUimq+5HABq
         fYqxSS4YH0J8sXFAGuO3Dg/1GAMQVk7gnNLx5y//6jbZfAhIG+Lb3JtreBWeC7E/7lPu
         wQ+/kAIDft7qvWElLxTlpYq0uxQsfPzUkrvxHq0GmXRfFxFteO140c2B2xXpmIR1jGOp
         +RpP+q3e6ngatCjvp2zrDSYHc3UMEl3Ve9GHmy9QmYAqmMrUa4kwOQchUlLoDIcOw6d/
         Q+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUfClpAH3+6hyoodtiDZ6YS/4AzmOXKeAV8OEUmmsqiabouhC6MeDHrunLN4xSqD6j3RSSfgFCk8BWNF6lm@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJoZgyZ2Jtck1uoJQfHsJn20J32Gp2phSuqQzhlR1qg+M8Wig
	GADRSLFHdVglYpZb7M30UaI1WSzJ/swvdoZjtzv3aOfjacJS2opRR2A0c6gDhyv8s17SQ5JK+vq
	xu4ZoNftPDhu+bwPvsEKoqA1LajFQLOw+1peGG4sGU8onyireCx9zvoRBtZ9aieqgqWwm
X-Gm-Gg: ASbGncuw9K29k9YAQIgGcE59ycxYxJ30c5DZYBIWL+RckKYnhTAb00DB6yAnAJh6GqJ
	T5ubov48NM6LVzsPAmSrzNNajGlM5l9WT5PXLNIvPkMI5gdhND9t/TdPIDIfnz6Us5bYfIqxvaT
	J9RubMWioY0UA9AruLXemRQwjW1TauDz/whSc7c7tWnpGbpUIOvoyE0dmyeav48TvJjVV0v2wGU
	gqhZltIig2/YrS5dcCva8Q7WLZ9qLltLSkEvpY9VM0OZ07KZv7hRi8ZjDg2s9aFmOg9AEqOM2jS
	G7n/PBExFhC5xLqGMQn7hX/ZVObXmacitEnD0i0XuNZEPwHnVOf3V3kAREDBSTi9BFJSkNEWKr0
	7R/jryq822Dl6DCqZiRhc0Gvm5IHfCx3wFpX3J+NiV6tUISnwkrB7
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id 6a1803df08f44-739203491camr137707166d6.28.1757429555439;
        Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvay4HegD7TczvnDmBbJppLQ/NXiZM/9CH2gAkzzaVEPN2RKdPsH+OPvsw7n0MbNu3XwLaHw==
X-Received: by 2002:a05:6214:5192:b0:719:12cf:50ef with SMTP id 6a1803df08f44-739203491camr137706716d6.28.1757429554861;
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:07 +0300
Subject: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCdbmTwssKDcXNKgdZbInJ/IsWBy3ZWBjV1zBKp4r0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8bLgmA9Afor/SCSMBp6lvcMJNLH+y+3RLsg
 Edds4lkZH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1bQjB/wIC+5fSLnstfGoZMGUfVuruiseL2SNqJJstUfTxGaowQkInoHQfnrNqiPYpowcSvPCRNl
 UHnaRFcqNgqF2eWsCXtVaCx10y4Xj3MtGesm0e5fNl/X47wnuZX1RlKVA+7gTnlshcZ1F1PyHq7
 4O3HqSqvwF+066FKwZL94tPSzVrV5ca4n9uB3H4tEJ1CodYONpSf5XEXIbVmBHdBZz6F5Gns117
 nYTWg54k1WItlRdXqTB1OhJ/BoctGr79fhRFb8LTSDBfGG/G7xLshm7FznkSl5DmrmqCsv9fJqw
 58UPBF9WUpSazqCvVhovhZ2tXkAQKvB4Xu+5lsWd/6WbhhXH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 81F9kPQb8ja5kjP_Ffcmlpr_r-woFR0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX6Md0W5VrIm3J
 8NW6KKjrh6ZMytFnwO1Ra6tO7MfbMQuQjvbMM3Cq1Jr2/Bbs5j9WAWBDgNpLIeFou5Z0tlsGdcR
 JvPg+wHn8WB5+EnWXcnInuauCcq6GxYLla1eJ9orXJkVZXxQhzErDFj4H+b1tFHCg7AsxLXTxS9
 6+whIhQo73B04KY5VbJZNzeold27qqMCegfq9Ml0iS1M1WY+GFcxIy4Xh2tfNf0qh8fMZOJGMSV
 kgBudMwZBJP9EOgoqdVeB1jFO62fm/zcYjec2290890BXdwpGub0PVW8gW6zgDJlYHHzEYi+eqD
 7s8gpFrKs1t1y42qmhXGs/DwnarCJsd4XHpS64zGUYsr/4zyNmgr6aeIDf0Ew/b4Kg/R+Mq5jqx
 7I6vsry2
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f35 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=NnPSNIktjdB4Ge1gQTIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 81F9kPQb8ja5kjP_Ffcmlpr_r-woFR0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Check that connector initialized by drmm_connector_hdmi_init() supports
AVI InfoFrames and warn if it doesn't support Vendor-Specific
InfofRames (HDMI InfoFrames are more or less required).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb40e7f369d810350 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	/* AVI is required */
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
+		return -EINVAL;
+
+	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
+		drm_info(dev, "HDMI connector with no support for Vendor-Specific InfoFrame\n");
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.47.3


