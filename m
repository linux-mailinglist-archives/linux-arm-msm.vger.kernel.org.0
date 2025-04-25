Return-Path: <linux-arm-msm+bounces-55598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF38A9C468
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52C63A690E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCE12459F1;
	Fri, 25 Apr 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCi70c+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B032459E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574734; cv=none; b=JSHutG4EQ6FC25iAZjqxvdDIYhND54X9RUYVjFxrjk0Wc/UPrWMWdFHcYyE23pjOTHAoR5KeGtoY//HL1FnhVj7iU0yjuo3ooVe4Rsd3oHxvknZSr04CAJFQttIioEg7VOTUOlH+PyIqt+3Dher0LpKuadmuYEdaXWx1K6lVLD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574734; c=relaxed/simple;
	bh=PWEZOIO1XHYulDrCgDar8ajEFuZixmhS0FoHE4ciXMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGrmMLycRDdXZ4uy3dqk+kaj1EZsDDoiV8RQbRAburhj57bUci8dAsRTXwLuUFTQyHGODpxAqAa03kQUn+h7zb1BJ/V8R73xwExNqec8bkE6pABhDXVeKQkOEPy0tvnuBXNmn2qx7bc79QXhXzvZX8YtJb3eMi7q9noBRZdMebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCi70c+n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T64l030813
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wO/TmcnQd+YBb2X8W0YMXAIl84/SqXkMF39BD3auU0Y=; b=VCi70c+nd9Dqa+RB
	IUwZGnxNppTOD0MeF/eKA79FkKmn3xWhjVj6wwVm3THaoAeXMtbxkytgM7ABpssb
	cply1gxpp71+rKviWOxgNB1PuaQ7zndxQVIvSLTm6N5QRVBEsoPLHS8eDjQc7R+D
	RFWMI+0kB7O9q1KayA1LJ0jhLjNayef3XtdRLLK+N+5/ibny3pWGL8qrUSLCDVw2
	MTsETADP30EuVrT61mRzqYYwyI2sDJ6xIin18LBZV5JZRixVyHRIDv4XOpQ5ipnh
	oaMr8BZc5FxZ3oDsd8wH4b2gI5CdFf16ETqvmH4YKDZhbBUOtHvEiSUN6zngzlpc
	7uClXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gjqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso32851986d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574727; x=1746179527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wO/TmcnQd+YBb2X8W0YMXAIl84/SqXkMF39BD3auU0Y=;
        b=b/ZIhFbEELj2hucbJ8mCa8OvDD1BCMJYrvppQUy6vdU5GC7KC6xZZfQ7XebhURKEZy
         HjaeYLg8S5eG3pA9l8PtUCQ5i24g5CHYhMp7GeweiphQUFSBdLe6B6sjSyx5ES0GUSgB
         5cfIksrhmbhFxJ7SJ1GpWG9ZlRk1EjE8eGJeTmPrmSAoAbGLU4VfWpbJzpadqKuqku8I
         kXhHPeXuyvNNN6tjDEAXDz8olgxG3ZSTfHNSGDSzwVYc4D5Uf2SZBiGGWdY/op4sqnLL
         yRldTGl/Tnn+4f1ELbyykohtOGvBD2k5VlLKS6Soyg/DwNSDlPqlsQkpBrw7hNwhEskM
         oBBg==
X-Gm-Message-State: AOJu0Yx1a8olgrnZs7y6c65+nxi74xUrWH0NuQ3mX90kAE2DgROjrM62
	IEH7M0f5v3IKq3RZsTk08mjQJSd6QcOFhzblJjkuzGj6SWI8+R+hdwQF7aLkzFf3rahRh8W2925
	f6sr47c/HRINg+0SAyyPM5nnGulI2YLbZRUDjNYvzGvJVrEciuxm5D/0qM3i0RmED
X-Gm-Gg: ASbGncvgeS3Adsej94Tz6/CyO0M/UyaxD8f4X4K6Dgemqg0qcozzRfCDO0hPGVAVt0T
	y4PPFyIklDRP7v70UiTpnJecXqe/2HyjjWx/FwY6m6Vxc5xFemAvBhQgXvWL1LJH32X0daBCVHb
	Q+oy8+3w78w9S678UXDfmxR83ygm/MQl0NKu4tTl22boslRgj8BQJ4vYGY2vlQsZ5GgY8NGHHya
	sZZLHsIBfrEQvLPLo1avNtPR5o0ToUwbCW2gCRNv70jbGrFCCTFniiXsmv1Pb/5SjEdNXvLBqng
	U4MJhLRFSwFUQzfNuKzrRQhEopV0plyZ1JeniHv89OeBMBXJpYt8D3KUBN2CrVv7HZlbXwFOt/S
	UfivBBb4heMjygVUCZykcag8a
X-Received: by 2002:a05:6214:268d:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f4cb9ed9a0mr30004686d6.19.1745574727440;
        Fri, 25 Apr 2025 02:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6aGbfdyHq+EQQf+N4Ajh6G1MWGQeKTj0SfwTH/XJktJCOH77u6efYIs0QzEDB8BOkstnzYA==
X-Received: by 2002:a05:6214:268d:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f4cb9ed9a0mr30004396d6.19.1745574726997;
        Fri, 25 Apr 2025 02:52:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:56 +0300
Subject: [PATCH v4 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-6-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E1BBsIIQymozlYNkeECHB8spXLY+ZOYj5r2uebvZgDA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s6kX/49af49ontjbSa5smcZpA36az8IOH2h
 fK/wi2dRU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOgAKCRCLPIo+Aiko
 1SIoB/0SGBIeejLoEcS5t/PUXRa08DYlZod20hKMAL1sJUtFmFJYwMXmKW3oZnlPeSOnQFGfjvy
 SrbQXURsKMq+OJz33Zz2+EkavazsBFaTePlO8Q9RfKcruGuoMYSTsnoAgC32gbAOvBKl2VOcLvq
 nwZaSmaUDd8iIsjTOAkiuQ44Zm/W0MLn7mkX+aTK55TFu/wuPkE5WH77ggnG3ahDm5C9SJR03aV
 DpVxApE3fsK/Q8YkUsa3jvsF/exBD2MMJr1/M7up2sOBVrb9l/VbsCFv7H8to8s2tKZ9f0rjSkd
 3YMXuCThVA0u9B1Y+Ra0jlncLwxfdLx8ojSMsm73xCAABI5x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX0NCyEybi5dHo quPCyjEhISCTglYFtLkN3hYqyhzXztBavmZVKL39ZYTyInQn7gIqfRFBYmdjmY8XAu4+NgSq9sw 24JjcUBc2t2Ih0eqCuXfQ0EhgzV3mN9zFxOkbf9qLU06B5jwoRubbCOqSFDTL/g+QRrfba7hA3n
 wnXLCv6oeqw1/y6M9c1wmhmvJ0uyAjFnns44uRhhU8zpwllSIW8BYA7JZ4IhPxobIF2xZPo6FRO SC1CUEP+WS8fg2MBV0Xp+yg7se8wSpcKWtpg7GSsbfxRwtIQ4KNeOoPNQorqbVKYjQz0RCq3/5y AS1etbpUI6Ivvz/OC8qz71X30gavoL9XImA+Vj/lzc+fnq3hdQsNKmgZph4jLCAoZARy84OC/Ka
 KqtRSOQoSZkOaikVz56rniV1je/vtK/BeB4obbzAMMiEsGWS+AqDK5gVNaVNj6N7wpvhAxN0
X-Proofpoint-GUID: FkUhF4EFpqb8hGKOEDxIS_zatIxdyMjh
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5b4b cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=7oS1v-cyAAAA:8 a=P9PoVruIDXn46qgs0YwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=PcM2qe9_4d1tJnOwuzRa:22
X-Proofpoint-ORIG-GUID: FkUhF4EFpqb8hGKOEDxIS_zatIxdyMjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

LVDS support in MDP4 driver makes use of drm_connector directly. However
LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
them to use drm_panel_bridge/drm_bridge_connector. This allows using
standard interface for the drm_panel and also inserting additional
bridges between encoder and panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
 5 files changed, 28 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..7a2ada6e2d74a902879e4f12a78ed475e5209ec2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -48,7 +48,6 @@ msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
-	disp/mdp4/mdp4_lvds_connector.o \
 	disp/mdp4/mdp4_lvds_pll.o \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 689e210660a5218ed1e2d116073723215af5a187..93c9411eb422bc67b7fedb5ffce4c330310b520f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -6,6 +6,8 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
@@ -189,7 +191,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	struct device_node *panel_node;
+	struct drm_bridge *next_bridge;
 	int dsi_id;
 	int ret;
 
@@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		 * bail out early if there is no panel node (no need to
 		 * initialize LCDC encoder and LVDS connector)
 		 */
-		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
-		if (!panel_node)
-			return 0;
+		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
+		if (IS_ERR(next_bridge)) {
+			ret = PTR_ERR(next_bridge);
+			if (ret == -ENODEV)
+				return 0;
+			return ret;
+		}
 
-		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
+		encoder = mdp4_lcdc_encoder_init(dev);
 		if (IS_ERR(encoder)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
-			of_node_put(panel_node);
 			return PTR_ERR(encoder);
 		}
 
 		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
+		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
+
+			return ret;
+		}
+
+		connector = drm_bridge_connector_init(dev, encoder);
 		if (IS_ERR(connector)) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
-			of_node_put(panel_node);
 			return PTR_ERR(connector);
 		}
 
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
+
+			return ret;
+		}
+
 		break;
 	case DRM_MODE_ENCODER_TMDS:
 		encoder = mdp4_dtv_encoder_init(dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 66f5009fdf8aebcc543b5539d1c2d03075171001..f9d988076337cb6fb63af8e76be59b2eb34ab327 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,11 +191,7 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node);
-
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder);
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev);
 
 #ifdef CONFIG_DRM_MSM_DSI
 struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 7f4e8005bc4ae0bc82ec5b87a1fea0530301b427..06a307c1272d10e678501062a63559c5672ce999 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -14,7 +14,6 @@
 
 struct mdp4_lcdc_encoder {
 	struct drm_encoder base;
-	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct clk *lcdc_clk;
 	unsigned long int pixclock;
@@ -262,19 +261,12 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
 			to_mdp4_lcdc_encoder(encoder);
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 
 	if (WARN_ON(!mdp4_lcdc_encoder->enabled))
 		return;
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 0);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_disable(panel);
-		drm_panel_unprepare(panel);
-	}
-
 	/*
 	 * Wait for a vsync so we know the ENABLE=0 latched before
 	 * the (connector) source of the vsync's gets disabled,
@@ -300,7 +292,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 			to_mdp4_lcdc_encoder(encoder);
 	unsigned long pc = mdp4_lcdc_encoder->pixclock;
 	struct mdp4_kms *mdp4_kms = get_kms(encoder);
-	struct drm_panel *panel;
 	uint32_t config;
 	int ret;
 
@@ -335,12 +326,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable lcdc_clk: %d\n", ret);
 
-	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
-	if (!IS_ERR(panel)) {
-		drm_panel_prepare(panel);
-		drm_panel_enable(panel);
-	}
-
 	setup_phy(encoder);
 
 	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 1);
@@ -375,8 +360,7 @@ static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 };
 
 /* initialize encoder */
-struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
-		struct device_node *panel_node)
+struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
@@ -387,8 +371,6 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	if (IS_ERR(mdp4_lcdc_encoder))
 		return ERR_CAST(mdp4_lcdc_encoder);
 
-	mdp4_lcdc_encoder->panel_node = panel_node;
-
 	encoder = &mdp4_lcdc_encoder->base;
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
deleted file mode 100644
index 4755eb13ef79f313d2be088145c8cd2e615226fe..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- * Author: Vinay Simha <vinaysimha@inforcecomputing.com>
- */
-
-#include "mdp4_kms.h"
-
-struct mdp4_lvds_connector {
-	struct drm_connector base;
-	struct drm_encoder *encoder;
-	struct device_node *panel_node;
-	struct drm_panel *panel;
-};
-#define to_mdp4_lvds_connector(x) container_of(x, struct mdp4_lvds_connector, base)
-
-static enum drm_connector_status mdp4_lvds_connector_detect(
-		struct drm_connector *connector, bool force)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	if (!mdp4_lvds_connector->panel) {
-		mdp4_lvds_connector->panel =
-			of_drm_find_panel(mdp4_lvds_connector->panel_node);
-		if (IS_ERR(mdp4_lvds_connector->panel))
-			mdp4_lvds_connector->panel = NULL;
-	}
-
-	return mdp4_lvds_connector->panel ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-static void mdp4_lvds_connector_destroy(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-
-	drm_connector_cleanup(connector);
-
-	kfree(mdp4_lvds_connector);
-}
-
-static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_panel *panel = mdp4_lvds_connector->panel;
-	int ret = 0;
-
-	if (panel)
-		ret = drm_panel_get_modes(panel, connector);
-
-	return ret;
-}
-
-static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
-	.detect = mdp4_lvds_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = mdp4_lvds_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
-	.get_modes = mdp4_lvds_connector_get_modes,
-};
-
-/* initialize connector */
-struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
-		struct device_node *panel_node, struct drm_encoder *encoder)
-{
-	struct drm_connector *connector = NULL;
-	struct mdp4_lvds_connector *mdp4_lvds_connector;
-
-	mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
-	if (!mdp4_lvds_connector)
-		return ERR_PTR(-ENOMEM);
-
-	mdp4_lvds_connector->encoder = encoder;
-	mdp4_lvds_connector->panel_node = panel_node;
-
-	connector = &mdp4_lvds_connector->base;
-
-	drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
-			DRM_MODE_CONNECTOR_LVDS);
-	drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
-
-	connector->polled = 0;
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	return connector;
-}

-- 
2.39.5


