Return-Path: <linux-arm-msm+bounces-6103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD7820271
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E601F22FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62E615484;
	Fri, 29 Dec 2023 22:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1Q1nBrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3715491
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccd4b743e2so33974451fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890618; x=1704495418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reQRupggj2d3Jev7OG0lcQ0fnV2dwbRzQzzmuBUmHYY=;
        b=Y1Q1nBrJq2DgbLm6Jv27v75lBYJKaKvpFJG1Ny7BsG8PloSXXOP3Clu/lGXyYz2JYD
         v0v0VERdv/9NoZUgJC5MLCABJ9tjT/mmqHHaKY4gPYBufPJdsqammMEclDo+nSLOUOdi
         I34eD6i68uwEoHJO48VTrg7UnYxJB/eQqkGxfn8jCa++WxWcX9eSOGOZdxf791MGtOBZ
         oIBk9PiYFDlb0LmPVHjjQCWCFIQP+GhH0ctntvkkaYEHFNjVmia2VFqyj73QmianhORP
         4sxn0b/NFUeVvtTCeQTknusA+IBqsW3jops6UAewzOx8ujnEbMM68EFCnkqRWOajLmwg
         jOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890618; x=1704495418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reQRupggj2d3Jev7OG0lcQ0fnV2dwbRzQzzmuBUmHYY=;
        b=oh8i4ETwho85w5Q5Q0IK0qIDLBI8cyjoIdIrE1XtLHM54tK35ZHCbhrhVQLLimTNFT
         7NiIaiMAsfxDPjiUp6H1QQLvSR+jhDUjuD6MYKwUPFDgwhetS695lRvbVKS8Tyx3iBJN
         kKrpAoznZUwVu1c8NsFWXeOUnUFc6v6FqCHKih2Zot6Xb0DfGArp8dEMcGK2AFHg/aq0
         KJTmres8O86BNn6+QRqQSP78ba2Ra2IIut/aYyf4W1RRY92Yge9YIUvb2o+PeyAOGFSO
         gqK2s4O4MJxYce2gWejBb5g6zCzhK2+QXEN4FL4EgqKZvi5t2ch0JhOZ9Uzw65EEOVa7
         CqMg==
X-Gm-Message-State: AOJu0Yxd+n4qWI8lulWHD00/sVKjVVW1m9EWMlCLfNTKpr+vlJwVHurj
	k2VVJD9PA1aLnc7mt/JIXiFW3jnOHvh7lg==
X-Google-Smtp-Source: AGHT+IEwO0skmbf9Y1qjYrNCD49xw9hVHN9ZP6SrzL6Sug45xqlhCaOgY66ryhAgbDXIq4/RpxrGUA==
X-Received: by 2002:a05:6512:131c:b0:50e:80d3:55f4 with SMTP id x28-20020a056512131c00b0050e80d355f4mr2965301lfu.131.1703890618392;
        Fri, 29 Dec 2023 14:56:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 09/14] drm/msm/dp: remove PHY handling from dp_catalog.c
Date: Sat, 30 Dec 2023 00:56:45 +0200
Message-Id: <20231229225650.912751-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 +++++++--
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..adbd5a367395 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
@@ -23,6 +24,8 @@ struct dp_aux_private {
 	struct device *dev;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	struct mutex mutex;
 	struct completion comp;
 
@@ -336,7 +339,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
-				dp_catalog_aux_update_cfg(aux->catalog);
+				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
 		if (dp_catalog_link_is_connected(aux->catalog))
@@ -439,7 +442,7 @@ void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_update_cfg(aux->catalog);
+	phy_calibrate(aux->phy);
 	dp_catalog_aux_reset(aux->catalog);
 }
 
@@ -517,6 +520,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 }
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp)
 {
 	struct dp_aux_private *aux;
@@ -537,6 +541,7 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 
 	aux->dev = dev;
 	aux->catalog = catalog;
+	aux->phy = phy;
 	aux->retry_cnt = 0;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 511305da4f66..16d9b1758748 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -17,6 +17,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp);
 void dp_aux_put(struct drm_dp_aux *aux);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e07651768805..4c6207797c99 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -7,8 +7,6 @@
 
 #include <linux/delay.h>
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-dp.h>
 #include <linux/rational.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -243,16 +241,6 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
 	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	struct dp_io *dp_io = catalog->io;
-	struct phy *phy = dp_io->phy;
-
-	phy_calibrate(phy);
-}
-
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 {
 	u32 state;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index ba7c62ba7ca3..1f3f58d4b8de 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -84,7 +84,6 @@ int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 33e9d7deb3f8..19d9ec1ad48d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -729,7 +729,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
+	dp->aux = dp_aux_get(dev, dp->catalog,
+			     dp->parser->io.phy,
+			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
-- 
2.39.2


