Return-Path: <linux-arm-msm+bounces-14235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AD87CCCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 12:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610FB1C21AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4A51BC4D;
	Fri, 15 Mar 2024 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMJsNM6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264E1C6BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503202; cv=none; b=p6U4uPealKI43/0ZDLdTMn0D1+Fkg2mLKSIrWs7GfCUPai/GLM4m8MF3U2el4na4TGuRY+ujornVbqTYXqfFJGjZcBnU+IMvo2tKy19/Sysq/aQM0AYwaIKpkKijoZ/rmUccm7WgWHspKF9YU6a6Jz2bXB9mVT2It5YKHm1AuHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503202; c=relaxed/simple;
	bh=8yzggoR/uHU+MiSU6KSQ6xmoNvLvpUwcOuhaDC7Nfmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdrHhunTxUYhMO639KsqL0yCPgVO4Bg5+pbaEhaOxpr9/jZpJYXIO+TRWmztcY2K0fCqp4D03o+LIbqYwwRqemn7TK1xphJJSk+n4VGtP78trxSXZPToVOCke/sepfDPVLw1hOv/Jr6xXv7Se/wzUdB8fxq63yo7IK/DEgImy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMJsNM6e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51320ca689aso2272481e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503198; x=1711107998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBphmLbyk/5O5sHmkFfFMw3CB0+z8ZLaEiW3UsJjdws=;
        b=pMJsNM6er7JpkJvQcaHdEZPNGSXwyiFiWT7fh1R6fpmzkqRoXm0J5YR9jphTUrH5Br
         WUsuJNzaiDZ3/I+L83Omm3HPK0Mjz8GmexhbfSEHsfZjvzaFmXZMFZt2NhYwlyWuyzBF
         PAiIC7yn5mpV/qrPsP0cFUjjxyp3hBg+meqqfysY4jp5s2v7LiH7/sVM5nNLPytxD0+z
         OMY7YlojSDao0UMK7+HyVVMsObFXfwHA7oXoZE/PScRzuvVJhSzsJq5dxWQUkKHRsH4U
         qX2e+kf+irZJ4RSsT1P1lLMG3RAoHDBFyuztGOPTs86xAJ4ImcrQK/iZbO2PJTQe7Fy+
         CClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503198; x=1711107998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBphmLbyk/5O5sHmkFfFMw3CB0+z8ZLaEiW3UsJjdws=;
        b=kdCzP9hB8rWoOhzqCZ4AvunYp2n+MqSo/JORGPxDE+ZoFs/Z9gM/o+sDOseOpJQSCo
         WYQ3b3t3JeIVeURGuoCfIdxXbR6I9Yt1pKO4oGA0F15z7+pSyPGWO7/16/pTURwB1vRu
         qSK6kHTLtbeRl1KwIC7Fi8s78XXhXD9IryCc2qAZvR72uHgvl+84LNCCmSoia6qFxt+2
         2I1QsJyZnoJDKXKlfF4OzW+zYqghy7FFL5RFtVaZ44mewKYns1jrclM9edu+AVw7ydaH
         Bxzpzk9qFIjOcSuZoYShNrFJEwusv+M4vYnJJAvXek03LNRQuh3RTsE06+yhbQqGSiOU
         9n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSKBa5RBt6x0Rua0A3/TaZNxctG25MA8VDhxWzuLtvAL3MmLcLffP9PWf1UqPku91wholJXOpMb8HdUjURER3Yi8X6nUVxbQR1MXEV7w==
X-Gm-Message-State: AOJu0YyMu9L/w/IZXPNSqBfHr/oceMUbiyxExe0wFyE+IoO5SekV7JwY
	jFzRiCtF89TgXWkpSW9qPoJ3ZbaEdZyFt2vDjsUk6PBMjoZV7P25moB4holZm6A=
X-Google-Smtp-Source: AGHT+IE4j31zy0uCiUP2ETxg6eMcJJ9A8g7YSyIf1b8Kx1VfPn3EpK4/ce0FwdlKc02FylhAdMaOiA==
X-Received: by 2002:ac2:4258:0:b0:513:fad:3a79 with SMTP id m24-20020ac24258000000b005130fad3a79mr1993636lfl.41.1710503197893;
        Fri, 15 Mar 2024 04:46:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:31 +0200
Subject: [PATCH RFC v3 09/12] drm/msm: generate headers on the fly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-9-0fc122e36c53@linaro.org>
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7312;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8yzggoR/uHU+MiSU6KSQ6xmoNvLvpUwcOuhaDC7Nfmg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUSntjcx5nQBBI3CKbxwIkYUD3kw7TAl1Kvm
 jTlXd8RwAyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EgAKCRCLPIo+Aiko
 1UafCACwy4fiOreWJq6ELBl7gkQt6I/gqjfB2MXn0yScWTbyIzDKJTJEvUDrzHjQoPkeWtejdUq
 CM+uLIsxNGl7rsYNquGmamBlearWz/+bB1wKfLM0WIgYokNgKceN0+X6v3r4Q/xf3AiEctYMB0O
 whFntQjdGfBZ3x4JNidkFtmfL/pgp/rDmho/OqfBH1/pBau2vgwaLZONe/FaCaGmffMhTU+EZmy
 ujdwzFUSPqHTCqnCTozxBuYBrzKSDeZROVwiFLLmGEYqJXnxFhHqPNPcZ/Luj+OyeJLLbkVBd1a
 iWdpRFgSKmn152YzxOXsyNc4DmnHVV/Q24SF+ov0LbRZiAFz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generate DRM/MSM headers on the fly during kernel build. This removes a
need to push register changes to Mesa with the following manual
synchronization step. Existing headers will be removed in the following
commits (split away to ease reviews).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/.gitignore |  2 +
 drivers/gpu/drm/msm/Makefile   | 95 ++++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.c  |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
 4 files changed, 79 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
index 167abc8909a2..f3435c37676c 100644
--- a/drivers/gpu/drm/msm/.gitignore
+++ b/drivers/gpu/drm/msm/.gitignore
@@ -2,3 +2,5 @@
 registers/adreno/adreno_control_regs.xml
 registers/adreno/adreno_pipe_regs.xml
 registers/adreno/ocmem.xml
+
+generated/
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 26ed4f443149..e0d8c91356fa 100644
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
@@ -130,21 +137,67 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
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
+		FORCE
+	$(call if_changed,headergen)
+
+$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
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


