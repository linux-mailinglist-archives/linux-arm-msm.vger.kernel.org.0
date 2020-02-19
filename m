Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16980164C4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 18:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgBSRnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 12:43:10 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36864 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgBSRnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 12:43:10 -0500
Received: by mail-il1-f194.google.com with SMTP id v13so21296350iln.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 09:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VamPOzOFp0h6bF9coMhzVUXDhZEhY+KJ39znRhBSOQ=;
        b=S0BybC/LcwM+sMXNhjhATGff7wWVLyrPSQrUSaCM5vM2OcxdjgEZnxw+EsfMo7Tlbx
         4629wCbGvAbknrmn7sFJSA8n3p/qLh69icwvTKlbfJk3ku4Uws/koWFDUyJkeuCuh88r
         HZXS5ScmU41sVch/O2LCdfnkeqI81iLkm1LNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VamPOzOFp0h6bF9coMhzVUXDhZEhY+KJ39znRhBSOQ=;
        b=T+l+rR1XVwTi4UpirqPwUxBOzAqY3ZxLxDh0BlfjzpWVwhBva0ACRymXtmtTShxbCx
         8k6Yvg4ybT+V03+z4BrbzFegkeyvKXerKB89bsl4BXKFweQ8a7sKfj3WLJts8eOhg0OR
         lEahoNtRe18lNpAqhXNdfHxxc58OBJ4ue8EHVYxa2w/Ek2iy0rlBA1E/DQcJtWfkXhDY
         +60Y1pjVfP2yIkbbyUO7kCzMtFR1mRg8O7N4/wk2k3WIcWfQvVKA9hHd/BF9bnaOi4k4
         3xNIxlby7en40UikT1P5xTpD1yae4fsu2nxbrhsyFb15enZy+68A78oSHmDMUt3Y3dcl
         AgEg==
X-Gm-Message-State: APjAAAXENMj/lwdyH2OAKFpe0X65j6vN+JBKJt1yrmluAYx2pD1Zy/UT
        LQRSk7DaLrTpSPEH82Bx7f0low==
X-Google-Smtp-Source: APXvYqwevqK6J8wLASlbM0W/NAsY85ngNqbvK6WaR5nDhBNGalMr/6g1gnP6s1SYxdqDux5vi2L1OA==
X-Received: by 2002:a92:3989:: with SMTP id h9mr23430181ilf.156.1582134189162;
        Wed, 19 Feb 2020 09:43:09 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id a21sm60355ioh.29.2020.02.19.09.43.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 19 Feb 2020 09:43:08 -0800 (PST)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/msm/dpu: Remove unused function arguments
Date:   Wed, 19 Feb 2020 10:42:24 -0700
Message-Id: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several functions arguments in the resource manager are unused, so
remove them.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 37 ++++++++++----------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 23f5b1433b357..dea1dba441fe7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -144,8 +144,7 @@ static int _dpu_rm_hw_blk_create(
 		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio,
 		enum dpu_hw_blk_type type,
-		uint32_t id,
-		const void *hw_catalog_info)
+		uint32_t id)
 {
 	struct dpu_rm_hw_blk *blk;
 	void *hw;
@@ -223,7 +222,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_LM,
-				cat->mixer[i].id, &cat->mixer[i]);
+				cat->mixer[i].id);
 		if (rc) {
 			DPU_ERROR("failed: lm hw not available\n");
 			goto fail;
@@ -244,7 +243,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 
 	for (i = 0; i < cat->pingpong_count; i++) {
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_PINGPONG,
-				cat->pingpong[i].id, &cat->pingpong[i]);
+				cat->pingpong[i].id);
 		if (rc) {
 			DPU_ERROR("failed: pp hw not available\n");
 			goto fail;
@@ -258,7 +257,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_INTF,
-				cat->intf[i].id, &cat->intf[i]);
+				cat->intf[i].id);
 		if (rc) {
 			DPU_ERROR("failed: intf hw not available\n");
 			goto fail;
@@ -267,7 +266,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 
 	for (i = 0; i < cat->ctl_count; i++) {
 		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_CTL,
-				cat->ctl[i].id, &cat->ctl[i]);
+				cat->ctl[i].id);
 		if (rc) {
 			DPU_ERROR("failed: ctl hw not available\n");
 			goto fail;
@@ -293,7 +292,6 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
  *	pingpong
  * @rm: dpu resource manager handle
  * @enc_id: encoder id requesting for allocation
- * @reqs: proposed use case requirements
  * @lm: proposed layer mixer, function checks if lm, and all other hardwired
  *      blocks connected to the lm (pp) is available and appropriate
  * @pp: output parameter, pingpong block attached to the layer mixer.
@@ -305,7 +303,6 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 static bool _dpu_rm_check_lm_and_get_connected_blks(
 		struct dpu_rm *rm,
 		uint32_t enc_id,
-		struct dpu_rm_requirements *reqs,
 		struct dpu_rm_hw_blk *lm,
 		struct dpu_rm_hw_blk **pp,
 		struct dpu_rm_hw_blk *primary_lm)
@@ -384,7 +381,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 		lm[lm_count] = iter_i.blk;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(
-				rm, enc_id, reqs, lm[lm_count],
+				rm, enc_id, lm[lm_count],
 				&pp[lm_count], NULL))
 			continue;
 
@@ -399,7 +396,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 				continue;
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(
-					rm, enc_id, reqs, iter_j.blk,
+					rm, enc_id, iter_j.blk,
 					&pp[lm_count], iter_i.blk))
 				continue;
 
@@ -480,20 +477,19 @@ static int _dpu_rm_reserve_ctls(
 static int _dpu_rm_reserve_intf(
 		struct dpu_rm *rm,
 		uint32_t enc_id,
-		uint32_t id,
-		enum dpu_hw_blk_type type)
+		uint32_t id)
 {
 	struct dpu_rm_hw_iter iter;
 	int ret = 0;
 
 	/* Find the block entry in the rm, and note the reservation */
-	dpu_rm_init_hw_iter(&iter, 0, type);
+	dpu_rm_init_hw_iter(&iter, 0, DPU_HW_BLK_INTF);
 	while (_dpu_rm_get_hw_locked(rm, &iter)) {
 		if (iter.blk->id != id)
 			continue;
 
 		if (RESERVED_BY_OTHER(iter.blk, enc_id)) {
-			DPU_ERROR("type %d id %d already reserved\n", type, id);
+			DPU_ERROR("intf id %d already reserved\n", id);
 			return -ENAVAIL;
 		}
 
@@ -504,7 +500,7 @@ static int _dpu_rm_reserve_intf(
 
 	/* Shouldn't happen since intfs are fixed at probe */
 	if (!iter.hw) {
-		DPU_ERROR("couldn't find type %d id %d\n", type, id);
+		DPU_ERROR("couldn't find intf id %d\n", id);
 		return -EINVAL;
 	}
 
@@ -523,8 +519,7 @@ static int _dpu_rm_reserve_intf_related_hw(
 		if (hw_res->intfs[i] == INTF_MODE_NONE)
 			continue;
 		id = i + INTF_0;
-		ret = _dpu_rm_reserve_intf(rm, enc_id, id,
-				DPU_HW_BLK_INTF);
+		ret = _dpu_rm_reserve_intf(rm, enc_id, id);
 		if (ret)
 			return ret;
 	}
@@ -535,7 +530,6 @@ static int _dpu_rm_reserve_intf_related_hw(
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
 		struct dpu_rm_requirements *reqs)
 {
 	int ret;
@@ -560,9 +554,7 @@ static int _dpu_rm_make_reservation(
 }
 
 static int _dpu_rm_populate_requirements(
-		struct dpu_rm *rm,
 		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
 		struct dpu_rm_requirements *reqs,
 		struct msm_display_topology req_topology)
 {
@@ -621,14 +613,13 @@ int dpu_rm_reserve(
 
 	mutex_lock(&rm->rm_lock);
 
-	ret = _dpu_rm_populate_requirements(rm, enc, crtc_state, &reqs,
-					    topology);
+	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
 	if (ret) {
 		DPU_ERROR("failed to populate hw requirements\n");
 		goto end;
 	}
 
-	ret = _dpu_rm_make_reservation(rm, enc, crtc_state, &reqs);
+	ret = _dpu_rm_make_reservation(rm, enc, &reqs);
 	if (ret) {
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 		_dpu_rm_release_reservation(rm, enc->base.id);
-- 
2.24.1

