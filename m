Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A7641DBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351623AbhI3OCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351626AbhI3OCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24EFC06176C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b15so25604586lfe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tX2Y3oxJ0uBfusHpDm+yJkPzEqEPEDfIr4Jpe3x0Dr8=;
        b=JkfvFrcJctRthH43Pygw6txN3cCymLAf+rEhcHSN5PK1R7yh/VGQe8cIrHvLjEl4Pv
         vTAzKf1z7mZa1g9ihIWXdeYVZuXz2a5bViC/nnMuaX30evFKqu3o2trTe6e7qwMi40dm
         WA4Ga2sJLdbZPclbY/0JLcyCTNSGutZa9EB47xbZmVg9cRcxGYTe6KsaR3CYNxfL1zOr
         p6fG1KwYCq7AO9LHAZ29NaviEc0xKvYVbotq+y/Qca9pPHfgMTQVGceLBpevugm4wGI5
         D+L95W8UQcQXe0Na8LHAOWLYRBqjuckICaUOh7zK5QQ2e1EaaEco+mEwt/WKc++KSXg7
         +wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tX2Y3oxJ0uBfusHpDm+yJkPzEqEPEDfIr4Jpe3x0Dr8=;
        b=RZG/dsfrSFFNesRg2406tkutAoAa6gqYrRMg5keFeQoNrFIt8YzcV4PvNMKg56YNwH
         cp5PdUvYk01c+zSr0gzq4VcGnB2tAbARllFa1kAvC4cxNou6cPhT0oLqToOsvVDGUyQE
         fd3YhtFUx8IrhryfYyV8Dr/bg788q4HmJwR4gAI3SXf+v39DssKlL/LRl8z48UBMlAay
         48TBNaCNGUFt1lAVBGz8SNn+gOsiLtO1Tmlh6RG8Q4qf36H5t9xgFhmd0ydkW9c0ThPB
         CZfuEl4Z+zQVI2axHEw/wUryaVTdVRh61EOGEcoGjymoD4Y0BOMIlZhbgYbIZfZ0aQ1J
         chXw==
X-Gm-Message-State: AOAM531vwFMn4QjeYTVax0WgRwaZMGqV3uJsIPtWriL5bjPQC+kvCx6I
        HXLzWt1wCpS2TdnomKpp6gFb2A==
X-Google-Smtp-Source: ABdhPJw83ua3zouvHGpcGfsa38AA3Q52JHg9xL+BN3kaAIJj6r6UF36d4GE5FarhuHlS+dtJXCswCg==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr6134827ljj.392.1633010426146;
        Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/11] drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
Date:   Thu, 30 Sep 2021 16:59:58 +0300
Message-Id: <20210930140002.308628-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify code surrounding CSC table setup by removing struct dpu_csc_cfg
pointer from dpu_plane and getting it directly at the CSC setup time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 96 +++++++++++----------
 5 files changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cbafb61404d0..103d4bd7585b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -537,7 +537,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
-		struct dpu_csc_cfg *data)
+		const struct dpu_csc_cfg *data)
 {
 	u32 idx;
 	bool csc10 = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 27263bc1a1ef..e8939d7387cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -262,7 +262,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
-	void (*setup_csc)(struct dpu_hw_pipe *ctx, struct dpu_csc_cfg *data);
+	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index f94584c982cd..aad85116b0a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -374,7 +374,7 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10)
+		const struct dpu_csc_cfg *data, bool csc10)
 {
 	static const u32 matrix_shift = 7;
 	u32 clamp_shift = csc10 ? 16 : 8;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index ff3cffde84cd..bc2fdb2b8f5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -321,6 +321,6 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10);
+		const struct dpu_csc_cfg *data, bool csc10);
 
 #endif /* _DPU_HW_UTIL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4259c4ecde9b..b8836c089863 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -90,7 +90,6 @@ enum dpu_plane_qos {
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
- * @csc_ptr: Points to dpu_csc_cfg structure to use for current
  * @mplane_list: List of multirect planes of the same pipe
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
@@ -111,8 +110,6 @@ struct dpu_plane {
 	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
 
-	struct dpu_csc_cfg *csc_ptr;
-
 	const struct dpu_sspp_sub_blks *pipe_sblk;
 
 	/* debugfs related stuff */
@@ -605,51 +602,59 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 	scale_cfg->enable = 1;
 }
 
-static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
-{
-	static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
+static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+
+static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
 		},
-		/* signed bias */
-		{ 0xfff0, 0xff80, 0xff80,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-		{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-	};
-	static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
-			},
-		/* signed bias */
-		{ 0xffc0, 0xfe00, 0xfe00,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-		{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-	};
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+{
+	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
 		DPU_ERROR("invalid plane\n");
-		return;
+		return NULL;
 	}
 
+	if (!DPU_FORMAT_IS_YUV(fmt))
+		return NULL;
+
 	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
+		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
+		csc_ptr = &dpu_csc_YUV2RGB_601L;
 
 	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
-			pdpu->csc_ptr->csc_mv[0],
-			pdpu->csc_ptr->csc_mv[1],
-			pdpu->csc_ptr->csc_mv[2]);
+			csc_ptr->csc_mv[0],
+			csc_ptr->csc_mv[1],
+			csc_ptr->csc_mv[2]);
+
+	return csc_ptr;
 }
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
@@ -1070,8 +1075,13 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->csc_ptr && pdpu->pipe_hw->ops.setup_csc)
-		pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, pdpu->csc_ptr);
+	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
+		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
+		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
+
+		if (csc_ptr)
+			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
+	}
 
 	/* flag h/w flush complete */
 	if (plane->state)
@@ -1187,12 +1197,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
 		}
-
-		/* update csc */
-		if (DPU_FORMAT_IS_YUV(fmt))
-			_dpu_plane_setup_csc(pdpu);
-		else
-			pdpu->csc_ptr = 0;
 	}
 
 	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
-- 
2.33.0

