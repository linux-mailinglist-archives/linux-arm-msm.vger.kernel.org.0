Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D90E393883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 00:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhE0WFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 18:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhE0WFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 18:05:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34093C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 15:03:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j6so2257814lfr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2FMXmqOYVBO9+wFKj80xIXzCv9cq/mWbBoWznbYoVQ=;
        b=Se4zlNj9CjTtjHRXf23jz/kQmtFW2Sg9rXQ95SfIU/eLELFLvLu0FjEDsy8CZAUizo
         qeRxrWhVMCCjFRKGIc1oV6SoldDNhDnskD4QAOJTmQOreOSuBeu2Ml3jhrQuvAtbn5fW
         d5J8ln2kd+z7TmoGOcezG2KUidfV/z8JbC19Ngod6FQTZAb4pok+tEAtebggLOdb2P9e
         ekRv6FVuOt/enZirsxFgGi844F9ruuOTUzRhDqovxTVUVEYLh8Kb02Q5aOKILdR+rfqS
         G53qLzT2GQUtSim8o+t5hF9Klju2WvUX8DQJLsV+mQj1YrlXV45+qj4k8QYzwpIaTsBy
         DzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2FMXmqOYVBO9+wFKj80xIXzCv9cq/mWbBoWznbYoVQ=;
        b=e2KX3m/uCgck5SPVvgqJXE3ZP6ptl6BkwyBy/BRmmU+VoC4j89slXsNHNONV7gFHg4
         JWSZKHUh+kvIls1XumA5I2M9UQOXdXr1W27sK54nP6uuWMq1UwhdhnXudKg9EzAx8w2x
         B3TcJ3Y59JOqov3EPGUkH7W2S0UzcbM7reACyucgoYp+DsxhmWk0rdAMZP00C4Rzsad7
         vk8FxuFxqaWaA+LpYlR8JnRR/OyJ2URZuDBersgRTILBeimUwAwSH91rEi12ddQb7Cqm
         PIyFb6AkxNDWtT9jEpLzloVrQDmfFYkAcsbER+TCkup5jyuhtp+YqqGXTXYpH1TRljrJ
         G3HA==
X-Gm-Message-State: AOAM530X88jAbYYZI7GjyQBwacXhSxUs9TLop8UZGBJ5iz1+LUVBaKI1
        hWO1G/HvzDhom6+94y5q4ytzYg==
X-Google-Smtp-Source: ABdhPJxh5y9hRAa3nCC+HCO2Xo//EOj94ljU4Kx9n4BlCJyA1o93MMclgoLN9dTd0QgdeHkawmwDMw==
X-Received: by 2002:a05:6512:3c96:: with SMTP id h22mr3799949lfv.426.1622153011543;
        Thu, 27 May 2021 15:03:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i25sm98403lfl.212.2021.05.27.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 15:03:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm: fix display snapshotting if DP or DSI is disabled
Date:   Fri, 28 May 2021 01:03:30 +0300
Message-Id: <20210527220330.3364716-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix following warnings generated when either DP or DSI support is
disabled:

drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:141:3: error: implicit declaration of function 'msm_dp_snapshot'; did you mean 'msm_dsi_snapshot'? [-Werror=implicit-function-declaration]

drivers/gpu/drm/msm/msm_kms.h:127:26: warning: 'struct msm_disp_state' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:867:21: error: initialization of 'void (*)(struct msm_disp_state *, struct msm_kms *)' from incompatible pointer type 'void (*)(struct msm_disp_state *, struct msm_kms *)' [-Werror=incompatible-pointer-types]
drivers/gpu/drm/msm/dsi/dsi.h:94:30: warning: 'struct msm_disp_state' declared inside parameter list will not be visible outside of this definition or declaration

Reported-by: kernel test robot <lkp@intel.com>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Fixes: 1c3b7ac1a71d ("drm/msm: pass dump state as a function argument")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi.h                |  2 --
 drivers/gpu/drm/msm/msm_drv.h                | 12 +++++++++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index c6174a366095..c92a9508c8d3 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -27,7 +27,6 @@
 #include <linux/devcoredump.h>
 #include <stdarg.h>
 #include "msm_kms.h"
-#include "dsi.h"
 
 #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index cea73f9c4be9..9b8e9b07eced 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -91,8 +91,6 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
 /* dsi host */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c33fc1293789..ba60bf6f124c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -43,6 +43,7 @@ struct msm_gem_submit;
 struct msm_fence_context;
 struct msm_gem_address_space;
 struct msm_gem_vma;
+struct msm_disp_state;
 
 #define MAX_CRTCS      8
 #define MAX_PLANES     20
@@ -340,6 +341,8 @@ void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
+void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
+
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -353,6 +356,10 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 {
 	return -EINVAL;
 }
+static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
+{
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
@@ -367,7 +374,6 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
-struct msm_disp_state;
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
@@ -412,6 +418,10 @@ static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 }
 
+static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
+{
+}
+
 static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 		struct drm_minor *minor)
 {
-- 
2.30.2

