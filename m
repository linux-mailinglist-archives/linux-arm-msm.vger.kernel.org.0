Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25C04AF830
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238189AbiBIRZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238162AbiBIRZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:35 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15B6C05CB92
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:37 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k10so1440377ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8HtQCczVQEB27RhUL5MHWQy1J7awJd4RX9HC6K9174=;
        b=uQ1gJwdKPQ1VDGOUEMvqGB2S4n4Y6h/8N2I4vUTyLzMdBP2EYgJ1KrKdbvQuruU4Uf
         Zm5HZ4gEEkdie+prL0j6kXc3OmKmIBil62roEpV09I/XwVf7MJ4jod2zplZmKfBJslhz
         7RO1hOeSrZlJKgvJO3vILRNLqMDZ3zulg3j9j5AXs9K0eoJy7EOEapGno1mqOOBYtQQl
         aesQjBZWQW1tjVefS2OscnqDvw+1+oVFS6zmNdvkqakGMtOoL3H9vnkT7RDzjLbx7Rcf
         VdKUC2TRmJUgmrKAIp21t2QcyE/oFA86FnNwkdLbVIgCU69n0pB3D6tAKOkqs0Iol0+0
         wxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8HtQCczVQEB27RhUL5MHWQy1J7awJd4RX9HC6K9174=;
        b=PGvCtaxK0AtLhlcLYd6U2YJippCx+kGOU7ICmcPWJPrSawqOrFRAKKLsNMVWWc3kOl
         G1FkXPUn4z0/tRsEu4X3m6sevgxlh49AZGnZ00xZPPjdzupu56EbcMNUybJnO3iIL7FO
         zE/flgLdtqnG3rXuqmmQeNv3oDaSkCfqgtoJetSwukk64VeimlMrgPUS/rHlpGFj9VCO
         NUSldOghjYW3PojrewXcIz3FMN7o33PTlLltNVMuOsOQgO+14zz2l+fdv8ciBrQ0mF/1
         /c7rcxUAGBX4VCjfPJFjb/GOBqUtOdU7d5DHH2lQbVdeD9NVN7i7oOUS+Ndr0PWUQLg0
         G8XQ==
X-Gm-Message-State: AOAM531kzpzswZcof4uBsCk5C+QMW0V6UvfI3GZvnI3HKwoDyGU+OTzG
        c7cx/qgtOa+6ZPBzq/Clzd/Fwg==
X-Google-Smtp-Source: ABdhPJxqZ6aWHevVc9rWZYb8D44I+FU2kLwtI2gTDFnYtxX5KBC9ZnRba9QhKM5TJ+Og5sI88iJRgg==
X-Received: by 2002:a05:651c:50f:: with SMTP id o15mr2107141ljp.58.1644427536178;
        Wed, 09 Feb 2022 09:25:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 15/25] drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
Date:   Wed,  9 Feb 2022 20:25:10 +0300
Message-Id: <20220209172520.3719906-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove dpu_hw_fmt_layout instance from struct dpu_hw_fmt_layout, leaving
only src_rect and dst_rect.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  7 ++---
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2186506e6315..df6698778b6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_pipe_cfg *cfg)
+		struct dpu_hw_fmt_layout *layout)
 {
 	struct dpu_hw_pipe *ctx = pipe->sspp;
 	u32 ystride0, ystride1;
@@ -497,41 +497,41 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		return;
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
+		for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
 			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
-					cfg->layout.plane_addr[i]);
+					layout->plane_addr[i]);
 	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
-				cfg->layout.plane_addr[0]);
+				layout->plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
-				cfg->layout.plane_addr[2]);
+				layout->plane_addr[2]);
 	} else {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
-				cfg->layout.plane_addr[0]);
+				layout->plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
-				cfg->layout.plane_addr[2]);
+				layout->plane_addr[2]);
 	}
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		ystride0 = (cfg->layout.plane_pitch[0]) |
-			(cfg->layout.plane_pitch[1] << 16);
-		ystride1 = (cfg->layout.plane_pitch[2]) |
-			(cfg->layout.plane_pitch[3] << 16);
+		ystride0 = (layout->plane_pitch[0]) |
+			(layout->plane_pitch[1] << 16);
+		ystride1 = (layout->plane_pitch[2]) |
+			(layout->plane_pitch[3] << 16);
 	} else {
 		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
 		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
 
 		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 			ystride0 = (ystride0 & 0xFFFF0000) |
-				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
+				(layout->plane_pitch[0] & 0x0000FFFF);
 			ystride1 = (ystride1 & 0xFFFF0000)|
-				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
+				(layout->plane_pitch[2] & 0x0000FFFF);
 		} else {
 			ystride0 = (ystride0 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[0] << 16) &
+				((layout->plane_pitch[0] << 16) &
 				 0xFFFF0000);
 			ystride1 = (ystride1 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[2] << 16) &
+				((layout->plane_pitch[2] << 16) &
 				 0xFFFF0000);
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index eee8501ea80d..93b60545ba98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -155,13 +155,11 @@ struct dpu_hw_pixel_ext {
 
 /**
  * struct dpu_hw_pipe_cfg : Pipe description
- * @layout:    format layout information for programming buffer to hardware
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  */
 struct dpu_hw_pipe_cfg {
-	struct dpu_hw_fmt_layout layout;
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 };
@@ -260,10 +258,10 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_sourceaddress - setup pipe source addresses
 	 * @pipe: Pointer to software pipe context
-	 * @cfg: Pointer to pipe config structure
+	 * @layout: format layout information for programming buffer to hardware
 	 */
 	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
-			struct dpu_hw_pipe_cfg *cfg);
+			struct dpu_hw_fmt_layout *layout);
 
 	/**
 	 * setup_csc - setup color space coversion
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e9421fa2fb2e..a521c0681af6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1052,6 +1052,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	bool update_src_addr = true;
@@ -1059,7 +1060,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret == -EAGAIN) {
 		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
 		update_src_addr = false;
@@ -1070,8 +1071,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (update_src_addr &&
 	    pipe->sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
-		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
+		trace_dpu_plane_set_scanout(pipe, &layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, &layout);
 	}
 
 	pstate->pending = true;
-- 
2.34.1

