Return-Path: <linux-arm-msm+bounces-69453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C765CB28F03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 17:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECBBA7BEC23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5282FB980;
	Sat, 16 Aug 2025 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3Qlr/sA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A332F9C53
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357588; cv=none; b=micKBm5zAZv9jf7VhKGGPNldQe75aAWRQ7ezlhZjogRkHndN0NJkTceZZjMwrJIZ9WnXLIepCx9DYseWJj6Dq0O/ffD/BbrZhXJYk0oy/2j2/LRFtcX07vUg14pyOW44h3LB5v1EMg+4qia2bSIK1HaUgasC2ZlgqtC5+N1DRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357588; c=relaxed/simple;
	bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d87kBa27O69Yu6Dv8+3Jgfc1mo3Z2O28brHocW7IZTaPnXiWTHtqoKPcmNdF+b4frBH2Scm6vY33WR9hEuaRjRmTrpZlDtTL3PWS5IEJ5O28WODgPnilDHH950ZmWGxmYJk6A/Nz3O+rYSJDjNyDAidLMYjpH2u39BDkXuBagZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3Qlr/sA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G90OHj023740
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=; b=P3Qlr/sAPTtXhNia
	iUQgs6sum8tN8E2pMz7a8TWihY4KgSewQaxH/ZJfgrXZ/PY5pEOd6sL0FyqPO2ao
	EzUb0Qr0R7ABXtB4JPF6KXf+02/u1iWYhU1ZiW0IzksMzTKQEWmWU6u7bYQiY1FP
	TUgzSv4L4ouPTCNd2LzYsZ3B2DLER/+5SadEdM/kMAOlYLhN/irGfubf19o4irlz
	m5NxVwNbLFM7Hg46WPSVzwhrfhZsZk+fNN8A2tUNdN/QhtJ26TI5JVza39u4mAbG
	+cHMw1zhe0173LPmx0Ejm9D9WORqMv8135jgO6eE4GFLFLrgYQYKZLCxSuyjsIIW
	mW1kMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8v2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88ddec70so27590646d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357583; x=1755962383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=;
        b=aL0ItdVU6yYW7IugS5r6v+B9IazYA8uwCwxGIqabhX+fHpjS92pAW3H14S6VCddg/6
         wrktkq2oBy6Ur0U5CjrDdrDZQuk2yVie6MazgcXTNpnDci9niCaGDfiKmAGxNob2tHLD
         v50UrPTYo8YfutOHKIbWQhwYmEUHxKL/+p1+AD7gpdZz9l4ORzMzppf55ICxWfUZgZI7
         tCF6r2eNevfeUTlgq8X9WY1ltNdEbN++3EEnuFNinKyEL9UzWasJWobIIFafMysrndF8
         tBHX/FJUBEfqPppaHmkA+RoZIA1QsQjyPqKv4Wdvm51JMDnlgEzLNpmGUthQqQL/Mzbh
         4JJA==
X-Forwarded-Encrypted: i=1; AJvYcCXHlt8BFykOwrlcPsriezFUPitKPP97oNkRXDjnmQPuJIhsU5jkALO7lN76SWbUNoFI9HvsHjJPX/7Dq3/w@vger.kernel.org
X-Gm-Message-State: AOJu0YzAlNSPitgPwc1+y1VR5cyV3Ut/gao2cKj7dflf1hIr5q0mRjsI
	eopJkAAcd0RkieLth4TDMQHTx1DwMLwe1YTBeF1beFKw0+fxCWF03ka3CRBUWaL6n893qPa9079
	Ihuan/JvZJnFdPyOwLjrk4bFTLLIixz8kPSXG3Y212eWBN1I5/3OBnsiWwxxYNLvf3KOw
X-Gm-Gg: ASbGncuFZPRWKurBPzxHkEWf1ktEGVTJDHSU3E2arGSGMfbKcFUBHnKHpwSHwvulEHl
	BvE2RYwhutaz/df0yRLrN1gDYAE5PvEVr5wdLHuANeFUwn6f30dtAGaWQsBQQzkvY7gOloyzIjb
	D1pkwWFb/pY/m+D493yrDVj+4URedS8jQlrqyfReFkrlMvE5A6WUUfLooE8dE1k9jRmcPe5opts
	cZ0z8RJfhhqXCtQQq7dYhve/ZmD57qu05TEkWZGuSKDIFWQazj/KUp47pwEIyRev88BdO+gO9uy
	v33x+ZLcWQrEovXDn6MsjeaFrMxFj5bh1EEyMX59uz4pVjng9NW1gjWgCkGrJ19IqG2bTDhVHH+
	moEKg6Y1DlEwnS1uHPXYi3xmaaL1sIrMzd1fQLdPiz7bTjj15GPuS
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id 6a1803df08f44-70ba788e6a4mr73534806d6.0.1755357583339;
        Sat, 16 Aug 2025 08:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX7AXYCBCRqrmrQsT1LQyM0jWdKsXIc3YtI6BivWlsRGdFHgTuLmmSZBXhNj3Yos1Vch68qQ==
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id 6a1803df08f44-70ba788e6a4mr73534476d6.0.1755357582786;
        Sat, 16 Aug 2025 08:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:36 +0300
Subject: [PATCH v2 2/8] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-2-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIUlMQQLFiAtbFNdCE7iTeLG5NXVUIOYxXM
 6vF5Guen5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1fS5B/9UEdB+BuXCj2ytlEfQ6Knryb/dViwFtPKUeb5r+e7VL1yRxxxT2kglrR7LNYMiS8Ecly9
 LHIp7j3MT33mN8RC2G81OBI4OYtosKhm7rokBbqmIN41yeqq2u1bJMK8qMo2JqOiK9qcSM9vZ8r
 SPIxl7ppjQ6vU1W5glfl4pxwjQeQvE8Be1Bo6s94TZCPzc7eqIe0BBd6re6aID8AvZkrbDyYVWv
 weP+MlXsuCXqWcP/RTxNkuwcueGDhFU/SuaVfTwJr1pI3asqMrn0GD83quiimxOrlD7Y/6SLA8b
 unH5GSZVhqtU7/2VAXZm3fwx4gf23rPpFp6ql62lXHM9YY54
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GnjfaQ-cYD4EPq3_gTvcyBMgGqsN_I4Y
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a0a190 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: GnjfaQ-cYD4EPq3_gTvcyBMgGqsN_I4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX/fz2wTq6enHn
 +RWIPqtnkg0/LBEhCnc0Jn+s7pGDnkptNrPrZu6FahOXAzdquQa+5gsuYmu54L1Z8N2NHhIWroP
 JDXA1LiYuMglHPipKwrOkcPU2qkiEKUCWNuJ7F0SSB7fh2+wpvFe1FE6+jMqz1CXDhd9jbiA5Jw
 +wKd7Kou9ltsCyEJjNxMc+VoKZDeIxGgdUB6MCRubq4xTt2epbErgdhGmwPCYB62sjKzixAKUjg
 Xfm8y8ouiUTt0ohHNQgRG4ogJ09ujJwh/K8OTBHKqRw3Budip2Ekc6QpRoeSrUIZelfhatcERbl
 74DT7QMkdJGG+Dy4tq8cZjC4WSbQlr2zvWUH4BlbePMBCjUCVQ1lnBfoGT1hcN4Y+f0blRyuDVr
 dH5WbeIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..bcc53d4015f1f27181e977272cdcfa35e970fa62 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.2


