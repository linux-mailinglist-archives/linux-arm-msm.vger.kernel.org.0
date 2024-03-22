Return-Path: <linux-arm-msm+bounces-14909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43740887508
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7F15284C8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F5D82C96;
	Fri, 22 Mar 2024 22:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHMcF3fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048682886
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148232; cv=none; b=r8l/KZyVQAISNyLnB1SuMqzBNBftUsOW12gc+94IlDBHyLH5WiH4OAWTNLpO9MvP8fbNE8FLgtGAKZ1wlOx0Ibb3sdUdgAFqbXPW+G9vc8wkByDZO8DEc7xPLqFpjxo8iheVo89KHwOGboeq1bEyob3pHaATkut6EKkLUJZDdjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148232; c=relaxed/simple;
	bh=BSKLpdBLQvAArEEb7OAeB1JH9o8CJk1u7FWySDMUz7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3UXUh6qITXNxqxCnIn5ST++i43X+KI+NpLkmU6S4dlyy4f1SBzbqf7Nd1kMKGjK9TeYjgAJBqn7EhDDcxB/8i8HP4kPm53HIOSIMqOAjHm2gLyVdyj+aZYjs41DSbObo9VSqlFTFZjgWF6glNr9ATK+tlf9lico45hAjUnhv78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHMcF3fz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d68651e253so44536821fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148227; x=1711753027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cb7/om6AlfRdO+j4YRTK+w848aaaoMcNJflrHfAwxos=;
        b=SHMcF3fzo1WfSm7VS2wKxPvXL4nhkWklfxbw8wL4wiKt5dO0IhFUY0b6hUw1+76yM7
         sIHfw9uYvw5Aq46+nS6La+8lKMPSM81RkBpSCypiw5gTnsNl3WrCTBU1w4lX8v1UrMTs
         cAg3XXb0B0K+Cj0qqgkZunTKfuhEB0Al689dBZOaTDA9gmH3mq94x2/xPgCGAl2aAJvq
         eSS8s/xGxbC7kgAhMvqO8jOfkWjAxt9xt7GwApApKqofTFs8ATds1+pbrG6dx4Pw0F7M
         PmSZ/wAElW3O/xQrjLjwNpNhx9iDF/vd1UUsS10sYVniYE/EAXZG5KKgmDP+drjlnhzF
         hymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148227; x=1711753027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb7/om6AlfRdO+j4YRTK+w848aaaoMcNJflrHfAwxos=;
        b=FLfXJQSP1119SUymo8LgTbT0ZP3oq/359cnyfLe7kFsdnxpAcknyVeRq1sNb2b/p2H
         TrnCIxITsA56Gv+WU2rO5id++MSjexZ2Tt2W0SN/qeEPqIuF3a+pZPf8vO18P87LJkWP
         BptYw31EbjegK5rXSpP7r4MnmPbAvPFX7J8lNZ2zVdTL0FOIoc4j7F/9HHqYI+VSaH0Z
         bCxHikZqUr1bjK4bby1kEJfkHgzPxezorSnOBe+/ts8fSShQKPCt8ZzoDII07z+Fe0GT
         qIdfK3UL5l9SdjcTlo+vLZAvF4EcXbqJpfPLXd+TESdxkxqqe+aPIKAsFuoO49M41dui
         FdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIZ8+9R+h0Krv7Jh8DLVpinbZOp5ABlHC8v1lNk1i17RTw8qMcRWQ7HvKaPF+sj83tdZbXj2PN0lOYMtd9+8FxLSyrDq5he1I/bdmmpA==
X-Gm-Message-State: AOJu0YyF/gIPH71Pyhi2c5c0+wiO3eLfXZy+e/uRindGlrDdjB/BMXxg
	fkmTzXYKpsn+/kcZSoWhyoqBZPcl5gW7p2woiWK/c3Il2hXxSJiZrI8g5Vc8dFg=
X-Google-Smtp-Source: AGHT+IGhHdPrmKYkN0NQIfp1fESrCRBUPGcJY09OsThuDhvFxdqCYyUOEV+kSN7eUZPHjBPOyXwmTQ==
X-Received: by 2002:a19:6413:0:b0:512:9e78:998c with SMTP id y19-20020a196413000000b005129e78998cmr496719lfb.9.1711148227518;
        Fri, 22 Mar 2024 15:57:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:57:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:57:02 +0200
Subject: [PATCH v4 10/16] drm/msm: generate headers on the fly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7259;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BSKLpdBLQvAArEEb7OAeB1JH9o8CJk1u7FWySDMUz7U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy3bFm3zwkxZxetQRgrc5mar8NlFxaH4l4nY
 Wh99CTq5gKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtwAKCRCLPIo+Aiko
 1fSYCACykxcDNoiIyJtc6W9p3UFFoaJMsAUbNrzCJGjnq9Y5M4MYZ67dF495XPk4IOqh7chxwQR
 eIPmXCqy1/+rt46VQTMYSMxN+kWWSwOALh0o05GnM6kLqKnqC8O7qjG99/sqXngwftLqCCqW8I5
 NxK1eBdGyN+QEjzOghLMMJ7wD++toV9L3LqNtcn8jK4cs5dJ7vV95ReBo+X0JOsggznDMA34nMO
 PA+ATlQlnN+4CbxqBEtqWEV2pES60dVOiVpb0kUTa0Yx97v+i9rJ1zOKcc8uj1SHlwWSVCMJIaU
 uUe31Uw5mkqlIhRuOPNxPB03PlHY/NeLSOK7SKFdvUuVxwV9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generate DRM/MSM headers on the fly during kernel build. This removes a
need to push register changes to Mesa with the following manual
synchronization step. Existing headers will be removed in the following
commits (split away to ease reviews).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/.gitignore |  1 +
 drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c  |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
 4 files changed, 80 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
new file mode 100644
index 000000000000..9ab870da897d
--- /dev/null
+++ b/drivers/gpu/drm/msm/.gitignore
@@ -0,0 +1 @@
+generated/
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 26ed4f443149..c861de58286c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y := -I $(srctree)/$(src)
+ccflags-y += -I $(obj)/generated
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
 
-msm-y := \
+adreno-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
@@ -18,7 +19,11 @@ msm-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 
-msm-$(CONFIG_DRM_MSM_HDMI) += \
+adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
+
+adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+
+msm-display-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
 
-msm-$(CONFIG_DRM_MSM_MDP4) += \
+msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
@@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
 
-msm-$(CONFIG_DRM_MSM_MDP5) += \
+msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_cfg.o \
 	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
@@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
 
-msm-$(CONFIG_DRM_MSM_DPU) += \
+msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
@@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_vbif.o \
 	disp/dpu1/dpu_writeback.o
 
-msm-$(CONFIG_DRM_MSM_MDSS) += \
+msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-y += \
+msm-display-y += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
+
+msm-y += \
 	msm_atomic.o \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
@@ -115,12 +122,12 @@ msm-y += \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
-msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+msm-display-$(CONFIG_DEBUG_FS) += \
+	dp/dp_debug.o
 
-msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
+msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
@@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_audio.o \
 	dp/dp_utils.o
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
-
-msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
+msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
+msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
 			dsi/phy/dsi_phy.o
 
-msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
-msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
-msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
-msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
-msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
-msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
+msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+
+msm-y += $(adreno-y) $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
+
+quiet_cmd_headergen = GENHDR  $@
+      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
+
+$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
+		$(src)/registers/adreno/adreno_common.xml \
+		$(src)/registers/adreno/adreno_pm4.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+ADRENO_HEADERS = \
+	generated/a2xx.xml.h \
+	generated/a3xx.xml.h \
+	generated/a4xx.xml.h \
+	generated/a5xx.xml.h \
+	generated/a6xx.xml.h \
+	generated/a6xx_gmu.xml.h \
+	generated/adreno_common.xml.h \
+	generated/adreno_pm4.xml.h \
+
+DISPLAY_HEADERS = \
+	generated/dsi_phy_7nm.xml.h \
+	generated/dsi_phy_10nm.xml.h \
+	generated/dsi_phy_14nm.xml.h \
+	generated/dsi_phy_20nm.xml.h \
+	generated/dsi_phy_28nm_8960.xml.h \
+	generated/dsi_phy_28nm.xml.h \
+	generated/dsi.xml.h \
+	generated/hdmi.xml.h \
+	generated/mdp4.xml.h \
+	generated/mdp5.xml.h \
+	generated/mdp_common.xml.h \
+	generated/sfpb.xml.h
+
+$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
+$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
+
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 97790faffd23..9c33f4e3f822 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -17,8 +17,9 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
+#include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_kms.h"
-#include "adreno/adreno_gpu.h"
 
 /*
  * MSM driver version:
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d..cd185b9636d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -11,7 +11,7 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
+//#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>

-- 
2.39.2


