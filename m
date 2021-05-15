Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E633381BA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 00:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhEOW71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 18:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhEOW7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 18:59:20 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E0DC061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:06 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v5so2735611ljg.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJQofiqb3TH83HNq4q/uODxswUVtxbMvEOcsV4NaxVo=;
        b=tn+X0wtelq9WOWDO6OHygErFpAsAZxcqZ1VkpDXDwyTUul9nTNpWtGcRsTrC5VHcX1
         ZTbKqyuA2zGU7ni/pSrI+S6w4Ym5ikQVAXVp3DduC+7PPLWX1lBVWT4T5ThpTmcK6NWc
         jCgKRXGdxsF4e2FLUTy3NsXtciO5KazUcLBeskI9wjJ5xb2gt1GSBJKA90syLEnrVYD9
         VfWhaLkolOt7di3apXv3GXcvsosztCUl1YnJ2///FBRuj5jZsS5oyyOnUroh2Lx0rd9e
         oPnl+E4xStBqOvXOH+mU7LK3Deb9PmwftG3KEKHMa1LMy5b9CEHL4hdW5k7EPZnseqvw
         Q2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJQofiqb3TH83HNq4q/uODxswUVtxbMvEOcsV4NaxVo=;
        b=RVeQL6v+MRF4xiCBqcdxPbBbHlaAzFu53XNl1dkcxHQeuoN+2sJ+QjU8GGb3y5bXwT
         0XaSmCLys5ySYtfgS5OoN63Q3+Y7gemQdo1Zlt2bxRGcDwP5qUQkegWcT75yTJ+LtxuA
         C4eL3N6m9SXuDh46Q0888uRndOUhM3jpoG1GUHyhGCg+xeAOhgQvLuRqbqx8FD3xw2ES
         vts1kwPAvo1Il3++gwOgi84KWgX54pMjOXnLzGWuKN+EP/ThatO2IZ91W8xUzfE6vlud
         o05gKlmd1lADjwBcPHePAZJgVeJmCaH7fLYCfoL3y+n5266ywTItcfHdmID5eIYRV73A
         UTxA==
X-Gm-Message-State: AOAM530l6UhQCIICxOVKXl438q/QMOcgQmSIHdrEKMqW19MZhg99lXrk
        oIY6PEYxWxN2e/KKB/sMBTCuOg==
X-Google-Smtp-Source: ABdhPJx2CotdSMKvf8ppYfGD1jllchQG5bbbKLKabf+dzNmDgbBTC2d2qWOue5FF76fmBIHUd2/1rg==
X-Received: by 2002:a2e:780a:: with SMTP id t10mr40137463ljc.38.1621119484858;
        Sat, 15 May 2021 15:58:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 15:58:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/msm/dpu: simplify peer LM handling
Date:   Sun, 16 May 2021 01:57:57 +0300
Message-Id: <20210515225757.1989955-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For each LM there is at max 1 peer LM which can be driven by the same
CTL, so there no need to have a mask instead of just an ID of the peer
LM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 30 +++++--------------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b569030a0847..e7b132dce849 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -571,7 +571,7 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.features = _fmask, \
 	.sblk = _sblk, \
 	.pingpong = _pp, \
-	.lm_pair_mask = (1 << _lmpair), \
+	.lm_pair = _lmpair, \
 	.dspp = _dspp \
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4dfd8a20ad5c..3199bf8dc085 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -498,14 +498,14 @@ struct dpu_sspp_cfg {
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_MAX if unsupported
- * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
+ * @lm_pair:           ID of LM that can be controlled by same CTL
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_lm_sub_blks *sblk;
 	u32 pingpong;
 	u32 dspp;
-	unsigned long lm_pair_mask;
+	unsigned long lm_pair;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index ec4387ad1182..030bc30aba64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -121,28 +121,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 }
 
 /**
- * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
+ * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary
  * @rm: dpu resource manager handle
  * @primary_idx: index of primary mixer in rm->mixer_blks[]
- * @peer_idx: index of other mixer in rm->mixer_blks[]
- * Return: true if rm->mixer_blks[peer_idx] is a peer of
- *          rm->mixer_blks[primary_idx]
  */
-static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
-		int peer_idx)
+static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
 {
 	const struct dpu_lm_cfg *prim_lm_cfg;
-	const struct dpu_lm_cfg *peer_cfg;
 
 	prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
-	peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
 
-	if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
-		DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
-				peer_cfg->id);
-		return false;
-	}
-	return true;
+	if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
+		return prim_lm_cfg->lm_pair - LM_0;
+	return -EINVAL;
 }
 
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
@@ -176,17 +167,12 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
+		j = _dpu_rm_get_lm_peer(rm, i);
+		/* ignore the peer if there is an error or if the peer was already processed */
+		if (j < 0 || j < i) {
 			if (!rm->mixer_blks[j])
 				continue;
 
-			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
-				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
-						LM_0 + i);
-				continue;
-			}
-
 			if (reserved_by_other(global_state->mixer_to_enc_id, j, enc_id)) {
 				DPU_DEBUG("lm %d already reserved\n", j + LM_0);
 				continue;
-- 
2.30.2

