Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34AD347B79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbhCXPA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbhCXPAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D34C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y1so30574221ljm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6GpnB7N3hp2ek1Osl2ptvU8QETFvLNCzIT8krBoeA0s=;
        b=ta18ZFOpxgXUAXS/Kv9cJGl2Eq9Vp4nQRmYPr1xf8l/0Pn2JiqWkI8KAgBsn6nRWMn
         unwXB3oM1CVlg95ETeIs0LZ0f315OrnONc/GhVK16jq45sn84IbmARFRdhxkzhfowY2J
         VPX8CIehNNC/GSrDGWxB0KgZpVKD+ihTu2HRCwLt9QsF6rtJcfm5BMRKLGz/iSp3/ZLA
         0kGuE04sgafUNrumguVqCZCnpAA+uOtjoNUuEQ145NEAvEcIONZak53iztlEKAkiE32f
         Sq1MVBSe43pEqZySwrlU0lZT/NhhB1/xAd8P7awvRH1UVB7SeMxefdt4Rijjb1FfAmzO
         Nm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GpnB7N3hp2ek1Osl2ptvU8QETFvLNCzIT8krBoeA0s=;
        b=dWicCz0wczXaVcNd2mSovkz4mP65G1vxyubr48+HTETgXJSg+DqXvHPOzn41gfi/Oo
         HujELRfDXjTiqSsQq/l+E0jJakH6Cdw5xmRVUCzFJM7gkv+QOwCG9ZL0i2Bou6e7VjlI
         oMmHwLgasQWWqfKLbK67TyN9pqaQ0BsnyU8VJZXZXdu8PgMDS5Oiquwdt3+6fZT7HRId
         HR8PQHCoGMAjsd6s36/iP7D242gG/3qacDLBt8O7R3dDN8v90C4FKexmxJ8G0MeDA7pM
         IXUAW1JDZ4tJahYy7zq+q1ZaEb+n5T3kM7m+Lo35ikPvXhMI+a8l/qezcPpbP0XQJCiD
         uytg==
X-Gm-Message-State: AOAM531TNfzD+rn+lqGf0mhuNMgenyAgt4rswnZNK2m+4LB6RmUtkUrG
        jScF2WqKJgkUE6g4amlDt0EgCg==
X-Google-Smtp-Source: ABdhPJzTfMFYhKJuixG0ASWK+JUF6PRjW5vWWCo8QVp8DT8e7OJW02OJQnt6oguRkdB8y9b7NXUXDA==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2297933ljj.335.1616598040763;
        Wed, 24 Mar 2021 08:00:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 08/21] drm/msm/dpu: simplify peer LM handling
Date:   Wed, 24 Mar 2021 18:00:11 +0300
Message-Id: <20210324150024.2768215-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
index e4444452759c..f21f630af476 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -497,7 +497,7 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.features = _fmask, \
 	.sblk = _sblk, \
 	.pingpong = _pp, \
-	.lm_pair_mask = (1 << _lmpair), \
+	.lm_pair = _lmpair, \
 	.dspp = _dspp \
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ea4647d21a20..08864f0addc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -494,14 +494,14 @@ struct dpu_sspp_cfg {
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
index dbcf4929810b..969286c6f104 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -150,28 +150,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
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
@@ -205,17 +196,12 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
+		j = _dpu_rm_get_lm_peer(rm, i);
+		/* ignore the peer if there is an error or if the peer was already processed */
+		if (j > i) {
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

