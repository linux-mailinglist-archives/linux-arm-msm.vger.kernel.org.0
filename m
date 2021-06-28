Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A683B68FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 21:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbhF1TW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 15:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236356AbhF1TW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 15:22:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2B6C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 12:20:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q16so20404447lfr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z4PQd+vXqHbOkJOfTvhkdMDFsyjL9DZBFjLZj+37g1g=;
        b=G3gXlhGHpTfgbNbj474Gyg+uCm39rJXHb/qC+hYXB/57E0w+gi5VVp2+jUoVsr3m6h
         AQVRpgZIsEgAx5ODYge8e61QyKRtpiR8oq+0CR+ul+dQVjaBaHRS9/0x3uqm1yMv9oEq
         lPG58DNDN7A3/B+b28yYvZNiquRPSlZSN2ijIERhMZSkvVXgt+Z+XxKlT2h+/fVeAwQ4
         E2YgLiuf+adZwAJUeHuPPnh4YILkrbc5ZYYOn10P31r8ayDGZdU/BBhSiQ/PFn0aHqKE
         MCBFMA1061DGqRp1qzPE1gq01xxHtvbVxTpenn8th/+gP77vlPY4HcWFSRPXmY1mQSv7
         5TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z4PQd+vXqHbOkJOfTvhkdMDFsyjL9DZBFjLZj+37g1g=;
        b=Cy9P0VuyJNkjo1vq7wH1PKtYjVlX6syCfVXLiRnDQjSCTwpaqyDQpMAL5Cc4g7emjl
         jfAmggAyaZG/fTyCBKxs9Gl7kKAqUqgYuG2IQmfX8Z6s0mXP96ON1/Dok0QTIRseedmA
         lDSi5Jow4lekF3hc1tc8ah4ZiOI04sk6NTi3toVCVnxOsjRHyBMQD0PTLNBLPC/Idapv
         JCP0W+3c9MvOnCtlkyx4I0yYKvgOxFoIrxx2Qt0Ge8BGsnhzCprba1Q9Xqtqs6Ir0558
         JeO2oEqIIJ2wPqQc9PuTDNBk7SeNi3cJ/1e2Eh0hl/+8vPt4f3PProYnkdH/ErZYtOdn
         Lemw==
X-Gm-Message-State: AOAM533UEvAdAnc8aYJAwCojuNOB/LJsiJFpQvdulTgjrf1enCj5OfJJ
        w4ngsvP6dr4iVlYQamVk9zt8Gg==
X-Google-Smtp-Source: ABdhPJxzv5a7i6tA7s53JhRK5iuieau3p2c4ao2+64vENRc5CWdfvEL/e1MMPpnWSbUxb39WKbStWA==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr19528579lfr.604.1624908000785;
        Mon, 28 Jun 2021 12:20:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.209])
        by smtp.gmail.com with ESMTPSA id x3sm1099728ljm.43.2021.06.28.12.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 12:20:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: add support for alpha blending properties
Date:   Mon, 28 Jun 2021 22:19:58 +0300
Message-Id: <20210628191958.2754731-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for alpha blending properties. Setup the plane blend state
according to those properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 43 ++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++--
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc8..768012243b44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -30,12 +30,6 @@
 #include "dpu_core_perf.h"
 #include "dpu_trace.h"
 
-#define DPU_DRM_BLEND_OP_NOT_DEFINED    0
-#define DPU_DRM_BLEND_OP_OPAQUE         1
-#define DPU_DRM_BLEND_OP_PREMULTIPLIED  2
-#define DPU_DRM_BLEND_OP_COVERAGE       3
-#define DPU_DRM_BLEND_OP_MAX            4
-
 /* layer mixer index on dpu_crtc */
 #define LEFT_MIXER 0
 #define RIGHT_MIXER 1
@@ -146,20 +140,43 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
+	uint32_t fg_alpha, bg_alpha;
 
-	/* default to opaque blending */
-	blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
-		DPU_BLEND_BG_ALPHA_BG_CONST;
+	fg_alpha = pstate->base.alpha >> 8;
+	bg_alpha = 0xff - fg_alpha;
 
-	if (format->alpha_enable) {
+	/* default to opaque blending */
+	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    !format->alpha_enable) {
+		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
+			DPU_BLEND_BG_ALPHA_BG_CONST;
+	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
+		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
+			DPU_BLEND_BG_ALPHA_FG_PIXEL;
+		if (fg_alpha != 0xff) {
+			bg_alpha = fg_alpha;
+			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
+				    DPU_BLEND_BG_INV_MOD_ALPHA;
+		} else {
+			blend_op |= DPU_BLEND_BG_INV_ALPHA;
+		}
+	} else {
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
-			DPU_BLEND_BG_ALPHA_FG_PIXEL |
-			DPU_BLEND_BG_INV_ALPHA;
+			DPU_BLEND_BG_ALPHA_FG_PIXEL;
+		if (fg_alpha != 0xff) {
+			bg_alpha = fg_alpha;
+			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
+				    DPU_BLEND_FG_INV_MOD_ALPHA |
+				    DPU_BLEND_BG_MOD_ALPHA |
+				    DPU_BLEND_BG_INV_MOD_ALPHA;
+		} else {
+			blend_op |= DPU_BLEND_BG_INV_ALPHA;
+		}
 	}
 
 	lm->ops.setup_blend_config(lm, pstate->stage,
-				0xFF, 0, blend_op);
+				fg_alpha, bg_alpha, blend_op);
 
 	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
 		  &format->base.pixel_format, format->alpha_enable, blend_op);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ec4a6f04394a..c989621209aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1339,9 +1339,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	pstate->base.plane = plane;
-
-	plane->state = &pstate->base;
+	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -1647,6 +1645,12 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
+	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			BIT(DRM_MODE_BLEND_PREMULTI) |
+			BIT(DRM_MODE_BLEND_COVERAGE));
+
 	drm_plane_create_rotation_property(plane,
 			DRM_MODE_ROTATE_0,
 			DRM_MODE_ROTATE_0 |
-- 
2.30.2

