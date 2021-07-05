Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DD93BB4AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhGEB1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51059C061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:14 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q18so29471968lfc.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R+K+UbuG5v4VrTgyGCC6/21CgPA+gPC+suGnCF7lATs=;
        b=qc/rsxkRlBj6s28k5DhOn8Sn8ahxTxlxxkhTQ0MJ5+KZVWCH1Z7qseO5FwyfsbBs24
         urKnvLKOZtR49aBz0LcEK8PKTaq2YWHWs5b7UfMAkp2jRJBJuZ2mt9QQAmFiDPF0bpKJ
         Py9+bjKV1qv5TxUG5SE9RhPqxsQwZ8R19LqorpYuDd+p+Im9VPZcM9q467ZMwp3PofP7
         PhHQRBFko2T202VXQbs/CYXd6EZpium8ur/tLjejKK0F+ONBYi0MTQrNmS956CnW9h9I
         79mCJhuiasts0txh8iX0oPCqtDmttiXmOgAkIPhqOlLaE09arpkHHvfjdymP1dMKZPoc
         mrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R+K+UbuG5v4VrTgyGCC6/21CgPA+gPC+suGnCF7lATs=;
        b=syhMLTCLJEzR0eo+LHsG+qM9vz/pC0dHdxutzpVbY9KQbkCQdZs2wR7zD0CDyPmH8l
         B/lxkBN/HFKCrD9F1TlPrd0dt97t062Xzp8y8iZ/8BGevEDsLa32v7QavLRhYS6N9x0J
         HZH/r+iFL1cQCQcQPJYNST9dt6B6u/8TUkTilA65LKs/U9RJE4FYByH/ptTeZ2xiJRiM
         pvyR3/lUY3M8SHWz/sDQQXM0NCrnGjudlvF6/iFOWRu2Y4I6ScP9qoE8A4mkEvEvgIl6
         nhikKtBa4a9wKWXVjeZJ6fu9dLQMwWNAVL/zvbrxdMjJhjfCcsD04mVwA0MhM56khCmz
         6FsA==
X-Gm-Message-State: AOAM532sC+ZaUgwPgVe48M4l85L5Lmr9THVXBIecfigWbD3E4ZBHxfHw
        FyxGCuvZL08wFwfSW6Cy+qYcqQ==
X-Google-Smtp-Source: ABdhPJwSf9rF4R+uAsPto/DyyFyR+x5mKdzNHAIgT6hoKhjWmdMSat3+f3gpP3PQIMWm7XTIaLgLvg==
X-Received: by 2002:a19:7503:: with SMTP id y3mr8594591lfe.132.1625448312702;
        Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 08/22] drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
Date:   Mon,  5 Jul 2021 04:21:01 +0300
Message-Id: <20210705012115.4179824-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
index c16832898c51..2be43d5a235a 100644
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
index 35a848b1fcf8..264a9d0d5fca 100644
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
index 46446610e07e..6f856aeaf6bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -90,7 +90,6 @@ enum dpu_plane_qos {
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
- * @csc_ptr: Points to dpu_csc_cfg structure to use for current
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
  */
@@ -108,8 +107,6 @@ struct dpu_plane {
 	bool is_rt_pipe;
 	struct dpu_mdss_cfg *catalog;
 
-	struct dpu_csc_cfg *csc_ptr;
-
 	const struct dpu_sspp_sub_blks *pipe_sblk;
 
 	/* debugfs related stuff */
@@ -590,51 +587,59 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
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
@@ -1050,8 +1055,13 @@ void dpu_plane_flush(struct drm_plane *plane)
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
@@ -1167,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
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
2.30.2

