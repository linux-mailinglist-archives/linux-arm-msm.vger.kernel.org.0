Return-Path: <linux-arm-msm+bounces-2956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFEF80151A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E732FB2121B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64C626ACF;
	Fri,  1 Dec 2023 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYL3MzFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3610DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:54 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9ef682264so75791fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465533; x=1702070333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzvBTqAbtQPAJxPKFFOGdIeQs7KrLc2Oz1IAsyeUgBY=;
        b=fYL3MzFr571yLGhM37tbqVVXcDDcVN9JGQB87ZoBHnpGjJxiwjY7rs6wKyCB0fEKzN
         pyAhygOnZIC+xxKtJ8ZuVHSYbK+qQMwHjhWkE03mn0wXJ/m6vO3LIvOyCUoRvOt2d50D
         PJr30LQwMKDgr5NUJOew0TkTXHb2ZY39Ol/mjw+HzLxB2UQQ++0K6Zg5p3PhG1WogOS7
         hvDTn2XnFOCqR2wh14n5AoFk05azJlmKvlDWnl4V5g5d0oULhh5AeJrNUoGWvU602kOM
         gKVMezH2DuNR+49H3pIDY7ODdJ7RqHfdjqSPCf/5X1uUniBqm5AsTNAv/8xbrO2dFyUH
         flIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465533; x=1702070333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzvBTqAbtQPAJxPKFFOGdIeQs7KrLc2Oz1IAsyeUgBY=;
        b=dSNrduOce1VHh2MPX1sJaAQoXQx5vaDWeFsLkftFa1dbcPE+0bd97hJpLhizHPDH4p
         e1xsuuPGzWozHT/Q/sL3yNCCythjQQAGCNEtQptN8Qwl02nAaXNFIrBXq4XCNCU9512O
         qJpq5MOjWDNI1awtnSJ+uc3j0/tBe3szoTnLzgUkVXsqsBsU89aJZHaNmmYjywH+Uqdb
         29H+MXAW1Xu9wKtha2GtylKoV23sKP3n0ruv8HuezbfV4JxMYhA1FUXvv1UC9GFJihYS
         9eHkENqNkmMwg+41y/a/CrWElQDvO11n0Vb5ZnFliK7Ds95Q+bB739faizNq48VeoGcA
         sspw==
X-Gm-Message-State: AOJu0YzMSJwWEKGCgErBEOmnhFbnM7kceiKNMm+ld+khyllzFF2HE9A/
	nSy/lqZdQB4e0QE0QjTv+GZJ4aw3MsCsUQPsXUQ=
X-Google-Smtp-Source: AGHT+IGKb2JtwQGnY4tlkQQtgjvnrBu7eI5XAQzKD/z+m0MyZKP5hcjU0N86LHj515HRPg8eglvcnQ==
X-Received: by 2002:a2e:97ca:0:b0:2c9:c50c:b116 with SMTP id m10-20020a2e97ca000000b002c9c50cb116mr1174519ljj.14.1701465532967;
        Fri, 01 Dec 2023 13:18:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:52 -0800 (PST)
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
Subject: [PATCH v4 05/13] drm/msm/dpu: use devres-managed allocation for MDP TOP
Date: Sat,  2 Dec 2023 00:18:37 +0300
Message-Id: <20231201211845.1026967-6-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create MDP TOP structure. This allows us to remove
corresponding kfree and drop dpu_hw_mdp_destroy() function.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 24e734768a72..05e48cf4ec1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_top.h"
@@ -247,16 +249,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
+	mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
 		return ERR_PTR(-ENOMEM);
 
@@ -271,9 +274,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 
 	return mdp;
 }
-
-void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
-{
-	kfree(mdp);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8b1463d2b2f0..6f3dc98087df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -145,13 +145,15 @@ struct dpu_hw_mdp {
 
 /**
  * dpu_hw_mdptop_init - initializes the top driver for the passed config
+ * @dev:  Corresponding device for devres management
  * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e1fbac351fc2..c675c9a76c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -821,8 +821,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
 	dpu_kms->catalog = NULL;
 
-	if (dpu_kms->hw_mdp)
-		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
 	dpu_kms->hw_mdp = NULL;
 }
 
@@ -1105,7 +1103,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
+					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
-- 
2.39.2


