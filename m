Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4670735EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjFSVZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjFSVZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0758BE64
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f762b3227dso4735352e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209923; x=1689801923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZQCZKCJwgSJDNx3vlr5xX6AVwLhQhbriBwtbUznuaY=;
        b=rDRdEljQt3o6bvC24ftBSpZ686wSJeseRnWNZusC89miYSY3RV5ZG96kzMnsAlGOS7
         P+kxsGNd6CRlOYSAws3+JdebHcT33ZqBXVWXLc4EZL6dOHhhgfFKYLn9SEdeGGdHcLPe
         K8QBJLRd8DXXqP9LtnEFA2EYLPS2PvMAOnvFDtbABKH0+h2PSTy8cKOlTfzHErgNH67z
         m1ytMvRBdAhyZ/WYU02mRoNqLfFkg+43sS7Mf8Ry33rszijexgxBjtvMWBtT2QtyVdAL
         HoSa5D6utItKnggpieR5+nbeP4V1DGvK1Rg67f9pFVVTZ8PsYJuODKM4r/BQ1nZzl3LV
         ZD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209923; x=1689801923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZQCZKCJwgSJDNx3vlr5xX6AVwLhQhbriBwtbUznuaY=;
        b=kgfXpvnXlSpjsmZ+4rFKj98if5RBf2jm+j0FcVzWFbeKHHjv3BzV0g4KmcZEgMcYqh
         kBcrad52MU9EI6o9oR9SqPJdZkGXaNqsXgdSED50v+0uxFxa0FEKQLrgm7684ToGJ5qn
         c49tM+AaIFkcoHeJXbVtlwvFVERDAz9D6hvaFrJ1YYXNIZ4m8oYF34g5Nvi/bfgVXxzF
         GK1riyZhgLbVg7QxktkMC23seyNzg68zjrQh8NZjVHNDbScu/I87gQ9ae3Ua1cFi+V9f
         DyhOfJKDvzu+ucjrP9enS01+EJ6WYAUm9F8rcAD2x9IAJTImNEAXicp1yHuiS2wPkgkR
         x7+w==
X-Gm-Message-State: AC+VfDxtdnHA3RwTGQzcgajD+8d+rkdmSIa/DJ3K5oavQAGw67rv/pyx
        JhNaThuRwP3hU3JShccoXLpVFw==
X-Google-Smtp-Source: ACHHUZ67fRWE9UNxJlUrpD4P+sI844RD1YA0PgrZ9Xl8tYytVs+eMxF4132KVXODkxSj5FJGsfj3GA==
X-Received: by 2002:a05:6512:604:b0:4f8:6722:2724 with SMTP id b4-20020a056512060400b004f867222724mr2144796lfe.0.1687209923325;
        Mon, 19 Jun 2023 14:25:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 03/19] drm/msm/dpu: simplify peer LM handling
Date:   Tue, 20 Jun 2023 00:25:03 +0300
Message-Id: <20230619212519.875673-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
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

For each LM there is at max 1 peer LM which can be driven by the same
CTL, so there no need to have a mask instead of just an ID of the peer
LM.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..30fb5b1f3966 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 	.features = _fmask, \
 	.sblk = _sblk, \
 	.pingpong = _pp, \
-	.lm_pair_mask = (1 << _lmpair), \
+	.lm_pair = _lmpair, \
 	.dspp = _dspp \
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b860784ade72..b07caa4b867e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -554,14 +554,14 @@ struct dpu_sspp_cfg {
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
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
index 471842bbb950..e333f4eeafc1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -253,28 +253,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
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
 
 /**
@@ -351,7 +342,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int lm_idx[MAX_BLOCKS];
 	int pp_idx[MAX_BLOCKS];
 	int dspp_idx[MAX_BLOCKS] = {0};
-	int i, j, lm_count = 0;
+	int i, lm_count = 0;
 
 	if (!reqs->topology.num_lm) {
 		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
@@ -376,16 +367,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
-			if (!rm->mixer_blks[j])
+		if (lm_count < reqs->topology.num_lm) {
+			int j = _dpu_rm_get_lm_peer(rm, i);
+
+			/* ignore the peer if there is an error or if the peer was already processed */
+			if (j < 0 || j < i)
 				continue;
 
-			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
-				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
-						LM_0 + i);
+			if (!rm->mixer_blks[j])
 				continue;
-			}
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
-- 
2.39.2

