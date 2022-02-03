Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F37F4A8066
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349504AbiBCI0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349574AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD3EC061753
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:15 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id t7so2749029ljc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfwEed+GJAr0KDwg+GYGg8QDt2lqdwbQp3DHVhIOZQQ=;
        b=XWqsNZ+t9i/U4p0KeuaSH72S02HQnwRce+TrI4VLyzbPGmSz+xtnMCgvt7GWHlx849
         jzuBkm2V9/KqHaSslcs/kXqxP6337cc6sxkNhvlG/7zfWxDCRs+P472qPS3vqwpcZjx9
         Fg1MZhCtPUEYhnMSk8ECZHfxJRce3RAGlVJsjIpsJu1ESC+Ub8h3hYjEdYpXDpDAL8Gv
         3uJOiQl5p+MQTcVOhHCQZKnGYThT1GtkDqkIA5ORNcaXcuPPlkMNX7OZdsY22Y5mLoSa
         HN6oGINDBCQVEL2S/Q0oj9l5kabL97lb0NDM+p0EgymBC2lAJBAYLZKEo4jvwe2eSEPz
         Zaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfwEed+GJAr0KDwg+GYGg8QDt2lqdwbQp3DHVhIOZQQ=;
        b=P9nssilzv0umhebHvYz+9ytUlUjGVPPjjy1YVYziFZFpW5dJZ9/ZGz9HcukdcVk/bZ
         gKJtTWEk344Te37+Ck3VKsLENwtRLhSZZ+0JhITCA7598sNxG36+/DHrnZoFdPowVPCp
         cXz9fz27IqhRzgtl2FrxGKDK0jtxuU5PDHXEnbyqGu2uGp0sYNlNrEFE0hyY5BQJ2TIK
         BExiD4ee60KmdKrdCwY6/l8Uw4zjZnZkrA5oc/pVzXL01fp2+vbD8aUm1PqT18g08tAE
         kJL0H/wAA87L/zC77XYgHPmrcnq2FXxl/ADhj4Pz32rAqrLdoP968IvQyUfbIp+av4Sp
         UeHw==
X-Gm-Message-State: AOAM531AdU370/fY1z0OhpStjVdWAycd6RErhK5TQTB3i1WOyapqC1kz
        zeLZToCjX4hQIUtB2SWfHFVrIA==
X-Google-Smtp-Source: ABdhPJxEq6wuXH5vMzJOC9olrIInIc4kHo6hkQvuv0qu+/QCoUqnbJmB98hC6S+aHtH3I/z/CUtg1A==
X-Received: by 2002:a2e:988d:: with SMTP id b13mr18964703ljj.170.1643876774158;
        Thu, 03 Feb 2022 00:26:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm: move struct msm_display_info to dpu driver
Date:   Thu,  3 Feb 2022 11:26:05 +0300
Message-Id: <20220203082611.2654810-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_display_info structure is not used by the rest of msm driver, so
move it into the dpu1 (dpu_encoder.h to be precise).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..ebe3944355bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
 void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 				  struct dpu_encoder_hw_resources *hw_res);
 
+/**
+ * struct msm_display_info - defines display properties
+ * @intf_type:          DRM_MODE_ENCODER_ type
+ * @capabilities:       Bitmask of display flags
+ * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
+ * @h_tile_instance:    Controller instance used per tile. Number of elements is
+ *                      based on num_of_h_tiles
+ * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
+ *				 used instead of panel TE in cmd mode panels
+ */
+struct msm_display_info {
+	int intf_type;
+	uint32_t capabilities;
+	uint32_t num_of_h_tiles;
+	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_te_using_watchdog_timer;
+};
+
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..16f9e25ee19e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -109,24 +109,6 @@ struct msm_display_topology {
 	u32 num_dspp;
 };
 
-/**
- * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
- * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
- * @h_tile_instance:    Controller instance used per tile. Number of elements is
- *                      based on num_of_h_tiles
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- */
-struct msm_display_info {
-	int intf_type;
-	uint32_t capabilities;
-	uint32_t num_of_h_tiles;
-	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
-	bool is_te_using_watchdog_timer;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-- 
2.34.1

