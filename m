Return-Path: <linux-arm-msm+bounces-2959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C180151E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C779281C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E6C5915F;
	Fri,  1 Dec 2023 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikI3MZJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4AA10D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:56 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be4f03b06so163976e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465534; x=1702070334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18nW8EOlTozXqgD4J6tKIi68biT8lmrhGeNRhB0Nu5c=;
        b=ikI3MZJQZrI0W0PQ1poEp8HirqhZg2jRp1fJqu8Ca3GdGbVlYDbfRjMTfspvt/bsfg
         CzX4nr+z6DFC24Glt7t6Rt/6UvFaa5AQ6aMjvsPigSlCH6UOiIKUIK5ZuPMC6tLzZc6y
         2F2tlpnTW2S7p9EHGrxjRvF6mkpEsR1tSauXs553FFK8rNSxrbHxIdUClXvnukEr8QMM
         2gya65V1SKSsJJvFd2GBh4494mlsi3deU1mmayiy+e5LDsNCwI0lVpLfwa305JSGeToU
         XqMqrVzzo8Gc5ICuNYDeRsOYGzC1g35REAjxL1C9yJuTE23R7rhLi7xbUjgD7yt3Cvh7
         nw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465534; x=1702070334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18nW8EOlTozXqgD4J6tKIi68biT8lmrhGeNRhB0Nu5c=;
        b=nnLC8jzHc/02uRt1rAIVHn6d/inXAxkqonnfJuxCnzS4EPgHaH83ZVIMm/bKjb/a2h
         Lv4ztXViQxxLxhvKeifypSeHEFiFkPRS7EVjQrbTExarKh5WxG50YEOJ4FGZOOFXhqIH
         bGPDYJ7r3M2hKWBnqvsulBNNGEjBIbyHFF4wb2pU0QDiBNqYE7JKqyKuSFYjKqlCQ+rp
         WayCjBeVP1ykZCyRJxo2oQdI3Z5skPhbePtJyTbwI/kJMSRmbZFihM7u8/vj0CnXYgra
         H0u2P5GlnWgejvYCWnGlQr7ndqBpX13mMMb4hFiSX11+gFoD04xFEBv+6hBMmHG4R9Uh
         GJeA==
X-Gm-Message-State: AOJu0YzyUq9H7eoSCTrK1ehYe58UiAHoA21Hj1F4VeIRy5xf62ZwEeI3
	o5ezPfLnaAcpAbNpeLYv5e5R86Icgfp1fQ+Xqhc=
X-Google-Smtp-Source: AGHT+IFxNizQNcsH9R2BgxONRmGexWYkv3NgcMPqpW5upo0zo+OKzUHwHnBhTgkh14w3ybPMhpMMNA==
X-Received: by 2002:a2e:918e:0:b0:2c9:c009:13d5 with SMTP id f14-20020a2e918e000000b002c9c00913d5mr1110647ljg.40.1701465534354;
        Fri, 01 Dec 2023 13:18:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 06/13] drm/msm/dpu: use devres-managed allocation for HW blocks
Date: Sat,  2 Dec 2023 00:18:38 +0300
Message-Id: <20231201211845.1026967-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_kzalloc to create HW block structure. This allows us to remove
corresponding kfree and drop all dpu_hw_*_destroy() functions as well as
dpu_rm_destroy(), which becomes empty afterwards.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 15 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 23 files changed, 127 insertions(+), 247 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 86182c734606..e7b680a151d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/delay.h>
+
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_kms.h"
@@ -680,14 +683,15 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
 
-struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
-		void __iomem *addr,
-		u32 mixer_count,
-		const struct dpu_lm_cfg *mixer)
+struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
+				   const struct dpu_ctl_cfg *cfg,
+				   void __iomem *addr,
+				   u32 mixer_count,
+				   const struct dpu_lm_cfg *mixer)
 {
 	struct dpu_hw_ctl *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -702,8 +706,3 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx)
-{
-	kfree(ctx);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 1c242298ff2e..279ebd8dfbff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -274,20 +274,16 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
+ * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
-struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
-		void __iomem *addr,
-		u32 mixer_count,
-		const struct dpu_lm_cfg *mixer);
-
-/**
- * dpu_hw_ctl_destroy(): Destroys ctl driver context
- * should be called to free the context
- */
-void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx);
+struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
+				   const struct dpu_ctl_cfg *cfg,
+				   void __iomem *addr,
+				   u32 mixer_count,
+				   const struct dpu_lm_cfg *mixer);
 
 #endif /*_DPU_HW_CTL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 509dbaa51d87..5e9aad1b2aa2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2020-2022, Linaro Limited
  */
 
+#include <drm/drm_managed.h>
+
 #include <drm/display/drm_dsc_helper.h>
 
 #include "dpu_kms.h"
@@ -188,12 +190,13 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 };
 
-struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
+				   const struct dpu_dsc_cfg *cfg,
 				   void __iomem *addr)
 {
 	struct dpu_hw_dsc *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -206,8 +209,3 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc)
-{
-	kfree(dsc);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index d5b597ab8c5c..989c88d2449b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,20 +64,24 @@ struct dpu_hw_dsc {
 
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_dsc context
  */
-struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
-		void __iomem *addr);
+struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
+				   const struct dpu_dsc_cfg *cfg,
+				   void __iomem *addr);
 
 /**
  * dpu_hw_dsc_init_1_2() - initializes the v1.2 DSC hw driver object
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Returns: Error code or allocated dpu_hw_dsc context
  */
-struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
+				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index 24fe1d98eb86..ba193b0376fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
  */
 
+#include <drm/drm_managed.h>
+
 #include <drm/display/drm_dsc_helper.h>
 
 #include "dpu_kms.h"
@@ -367,12 +369,13 @@ static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
 	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
 }
 
-struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
+				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr)
 {
 	struct dpu_hw_dsc *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 9419b2209af8..b1da88e2935f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_lm.h"
@@ -68,15 +70,16 @@ static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
-struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
-			void __iomem *addr)
+struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
+				     const struct dpu_dspp_cfg *cfg,
+				     void __iomem *addr)
 {
 	struct dpu_hw_dspp *c;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -90,10 +93,3 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
-{
-	kfree(dspp);
-}
-
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index bea965681330..3b435690b6cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -81,18 +81,14 @@ static inline struct dpu_hw_dspp *to_dpu_hw_dspp(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSPP catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: pointer to structure or ERR_PTR
  */
-struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
-	void __iomem *addr);
-
-/**
- * dpu_hw_dspp_destroy(): Destroys DSPP driver context
- * @dspp: Pointer to DSPP driver context
- */
-void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp);
+struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
+				     const struct dpu_dspp_cfg *cfg,
+				     void __iomem *addr);
 
 #endif /*_DPU_HW_DSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index e8b8908d3e12..0b6a0a7dcc39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -12,6 +12,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #define INTF_TIMING_ENGINE_EN           0x000
 #define INTF_CONFIG                     0x004
 #define INTF_HSYNC_CTL                  0x008
@@ -527,8 +529,10 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
 }
 
-struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
+struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
+				     const struct dpu_intf_cfg *cfg,
+				     void __iomem *addr,
+				     const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_intf *c;
 
@@ -537,7 +541,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 		return NULL;
 	}
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -581,9 +585,3 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_intf_destroy(struct dpu_hw_intf *intf)
-{
-	kfree(intf);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index c539025c418b..215401bb042e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -131,17 +131,14 @@ struct dpu_hw_intf {
 /**
  * dpu_hw_intf_init() - Initializes the INTF driver for the passed
  * interface catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  interface catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  * @mdss_rev: dpu core's major and minor versions
  */
-struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
-
-/**
- * dpu_hw_intf_destroy(): Destroys INTF driver context
- * @intf:   Pointer to INTF driver context
- */
-void dpu_hw_intf_destroy(struct dpu_hw_intf *intf);
+struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
+				     const struct dpu_intf_cfg *cfg,
+				     void __iomem *addr,
+				     const struct dpu_mdss_version *mdss_rev);
 
 #endif /*_DPU_HW_INTF_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index d1c3bd8379ea..25af52ab602f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
@@ -156,8 +158,9 @@ static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
 	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
-struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
+				    const struct dpu_lm_cfg *cfg,
+				    void __iomem *addr)
 {
 	struct dpu_hw_mixer *c;
 
@@ -166,7 +169,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 		return NULL;
 	}
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -180,8 +183,3 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
-{
-	kfree(lm);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 36992d046a53..8835fd106413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,16 +95,12 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
+ * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  */
-struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_lm_destroy(): Destroys layer mixer driver context
- * @lm:   Pointer to LM driver context
- */
-void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm);
+struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
+				    const struct dpu_lm_cfg *cfg,
+				    void __iomem *addr);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 90e0e05eff8d..ddfa40a959cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -4,6 +4,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -37,12 +39,13 @@ static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
+					     const struct dpu_merge_3d_cfg *cfg,
+					     void __iomem *addr)
 {
 	struct dpu_hw_merge_3d *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -55,8 +58,3 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
-{
-	kfree(hw);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 19cec5e88722..c192f02ec1ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -48,18 +48,13 @@ static inline struct dpu_hw_merge_3d *to_dpu_hw_merge_3d(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_merge_3d_init() - Initializes the merge_3d driver for the passed
  * merge3d catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_merge_3d context
  */
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_merge_3d_destroy - destroys merge_3d driver context
- *	should be called to free the context
- * @pp:   Pointer to PP driver context returned by dpu_hw_merge_3d_init
- */
-void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *pp);
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
+					     const struct dpu_merge_3d_cfg *cfg,
+					     void __iomem *addr);
 
 #endif /*_DPU_HW_MERGE3D_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 057cac7f5d93..2db4c6fba37a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -4,6 +4,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -281,12 +283,14 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 	return 0;
 }
 
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
+					     const struct dpu_pingpong_cfg *cfg,
+					     void __iomem *addr,
+					     const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_pingpong *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -317,8 +321,3 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp)
-{
-	kfree(pp);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 0d541ca5b056..a48b69fd79a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -121,19 +121,15 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_pingpong_init() - initializes the pingpong driver for the passed
  * pingpong catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * @mdss_rev: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_pingpong context
  */
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
-
-/**
- * dpu_hw_pingpong_destroy - destroys pingpong driver context
- *	should be called to free the context
- * @pp:   Pointer to PP driver context returned by dpu_hw_pingpong_init
- */
-void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp);
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
+					     const struct dpu_pingpong_cfg *cfg,
+					     void __iomem *addr,
+					     const struct dpu_mdss_version *mdss_rev);
 
 #endif /*_DPU_HW_PINGPONG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 8e3c65989c49..069bf429e520 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -11,6 +11,7 @@
 #include "msm_mdss.h"
 
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
@@ -685,16 +686,18 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 }
 #endif
 
-struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct msm_mdss_data *mdss_data,
-		const struct dpu_mdss_version *mdss_rev)
+struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
+				     const struct dpu_sspp_cfg *cfg,
+				     void __iomem *addr,
+				     const struct msm_mdss_data *mdss_data,
+				     const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_sspp *hw_pipe;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
+	hw_pipe = drmm_kzalloc(dev, sizeof(*hw_pipe), GFP_KERNEL);
 	if (!hw_pipe)
 		return ERR_PTR(-ENOMEM);
 
@@ -709,9 +712,3 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 
 	return hw_pipe;
 }
-
-void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
-{
-	kfree(ctx);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index f93969fddb22..3641ef6bef53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -339,21 +339,17 @@ struct dpu_kms;
 /**
  * dpu_hw_sspp_init() - Initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * @mdss_data: UBWC / MDSS configuration data
  * @mdss_rev: dpu core's major and minor versions
  */
-struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct msm_mdss_data *mdss_data,
-		const struct dpu_mdss_version *mdss_rev);
-
-/**
- * dpu_hw_sspp_destroy(): Destroys SSPP driver context
- * should be called during Hw pipe cleanup.
- * @ctx:  Pointer to SSPP driver context returned by dpu_hw_sspp_init
- */
-void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
+struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
+				     const struct dpu_sspp_cfg *cfg,
+				     void __iomem *addr,
+				     const struct msm_mdss_data *mdss_data,
+				     const struct dpu_mdss_version *mdss_rev);
 
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 9668fb97c047..ed0e80616129 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -3,6 +3,8 @@
   * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved
   */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -208,15 +210,17 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 		ops->setup_clk_force_ctrl = dpu_hw_wb_setup_clk_force_ctrl;
 }
 
-struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
+struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
+				 const struct dpu_wb_cfg *cfg,
+				 void __iomem *addr,
+				 const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_wb *c;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -230,8 +234,3 @@ struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb)
-{
-	kfree(hw_wb);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 88792f450a92..e671796ea379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -76,18 +76,15 @@ struct dpu_hw_wb {
 
 /**
  * dpu_hw_wb_init() - Initializes the writeback hw driver object.
+ * @dev:  Corresponding device for devres management
  * @cfg:  wb_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  * @mdss_rev: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_wb context
  */
-struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
-
-/**
- * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
- * @hw_wb:  Pointer to writeback hw driver object
- */
-void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb);
+struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
+				 const struct dpu_wb_cfg *cfg,
+				 void __iomem *addr,
+				 const struct dpu_mdss_version *mdss_rev);
 
 #endif /*_DPU_HW_WB_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c675c9a76c74..b911bbe7b094 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -815,10 +815,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_kms->hw_vbif[i] = NULL;
 	}
 
-	if (dpu_kms->rm_init)
-		dpu_rm_destroy(&dpu_kms->rm);
-	dpu_kms->rm_init = false;
-
 	dpu_kms->catalog = NULL;
 
 	dpu_kms->hw_mdp = NULL;
@@ -1095,14 +1091,12 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
+	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto err_pm_put;
 	}
 
-	dpu_kms->rm_init = true;
-
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
 					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..df6271017b80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -88,7 +88,6 @@ struct dpu_kms {
 	struct drm_private_obj global_state;
 
 	struct dpu_rm rm;
-	bool rm_init;
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
 	struct dpu_hw_mdp *hw_mdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 8759466e2f37..0bb28cf4a6cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -34,72 +34,8 @@ struct dpu_rm_requirements {
 	struct msm_display_topology topology;
 };
 
-int dpu_rm_destroy(struct dpu_rm *rm)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
-		struct dpu_hw_dspp *hw;
-
-		if (rm->dspp_blks[i]) {
-			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
-			dpu_hw_dspp_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
-		struct dpu_hw_pingpong *hw;
-
-		if (rm->pingpong_blks[i]) {
-			hw = to_dpu_hw_pingpong(rm->pingpong_blks[i]);
-			dpu_hw_pingpong_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->merge_3d_blks); i++) {
-		struct dpu_hw_merge_3d *hw;
-
-		if (rm->merge_3d_blks[i]) {
-			hw = to_dpu_hw_merge_3d(rm->merge_3d_blks[i]);
-			dpu_hw_merge_3d_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
-		struct dpu_hw_mixer *hw;
-
-		if (rm->mixer_blks[i]) {
-			hw = to_dpu_hw_mixer(rm->mixer_blks[i]);
-			dpu_hw_lm_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
-		struct dpu_hw_ctl *hw;
-
-		if (rm->ctl_blks[i]) {
-			hw = to_dpu_hw_ctl(rm->ctl_blks[i]);
-			dpu_hw_ctl_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
-		dpu_hw_intf_destroy(rm->hw_intf[i]);
-
-	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
-		struct dpu_hw_dsc *hw;
-
-		if (rm->dsc_blks[i]) {
-			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
-			dpu_hw_dsc_destroy(hw);
-		}
-	}
-
-	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
-		dpu_hw_wb_destroy(rm->hw_wb[i]);
-
-	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++)
-		dpu_hw_sspp_destroy(rm->hw_sspp[i]);
-
-	return 0;
-}
-
-int dpu_rm_init(struct dpu_rm *rm,
+int dpu_rm_init(struct drm_device *dev,
+		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
 		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio)
@@ -119,7 +55,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
@@ -132,7 +68,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_merge_3d *hw;
 		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
 
-		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
+		hw = dpu_hw_merge_3d_init(dev, merge_3d, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed merge_3d object creation: err %d\n",
@@ -146,7 +82,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		hw = dpu_hw_pingpong_init(pp, mmio, cat->mdss_ver);
+		hw = dpu_hw_pingpong_init(dev, pp, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
@@ -162,7 +98,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
 
-		hw = dpu_hw_intf_init(intf, mmio, cat->mdss_ver);
+		hw = dpu_hw_intf_init(dev, intf, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
@@ -175,7 +111,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		hw = dpu_hw_wb_init(wb, mmio, cat->mdss_ver);
+		hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed wb object creation: err %d\n", rc);
@@ -188,7 +124,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);
@@ -201,7 +137,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dspp *hw;
 		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
 
-		hw = dpu_hw_dspp_init(dspp, mmio);
+		hw = dpu_hw_dspp_init(dev, dspp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dspp object creation: err %d\n", rc);
@@ -215,9 +151,9 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
-			hw = dpu_hw_dsc_init_1_2(dsc, mmio);
+			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -231,7 +167,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data, cat->mdss_ver);
+		hw = dpu_hw_sspp_init(dev, sspp, mmio, mdss_data, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);
@@ -243,8 +179,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	return 0;
 
 fail:
-	dpu_rm_destroy(rm);
-
 	return rc ? rc : -EFAULT;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 2b551566cbf4..36752d837be4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -38,24 +38,19 @@ struct dpu_rm {
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
+ * @dev:  Corresponding device for devres management
  * @rm: DPU Resource Manager handle
  * @cat: Pointer to hardware catalog
  * @mdss_data: Pointer to MDSS / UBWC configuration
  * @mmio: mapped register io address of MDP
  * @Return: 0 on Success otherwise -ERROR
  */
-int dpu_rm_init(struct dpu_rm *rm,
+int dpu_rm_init(struct drm_device *dev,
+		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
 		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio);
 
-/**
- * dpu_rm_destroy - Free all memory allocated by dpu_rm_init
- * @rm: DPU Resource Manager handle
- * @Return: 0 on Success otherwise -ERROR
- */
-int dpu_rm_destroy(struct dpu_rm *rm);
-
 /**
  * dpu_rm_reserve - Given a CRTC->Encoder->Connector display chain, analyze
  *	the use connections and user requirements, specified through related
-- 
2.39.2


