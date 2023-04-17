Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1693F6E5503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 01:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjDQXOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 19:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjDQXOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 19:14:21 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889AF3C1F;
        Mon, 17 Apr 2023 16:14:19 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7F33A3F8C6;
        Tue, 18 Apr 2023 01:14:17 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Tue, 18 Apr 2023 01:14:16 +0200
Subject: [PATCH 1/3] drm/msm/dpu: Drop unused members from HW structs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of these members were initialized while never read, while others
were not even assigned any value at all.  Drop them to save some space,
and above all confusion when looking at these members.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   | 5 -----
 6 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 84ee2efa9c66..a9c90249a6ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -374,7 +374,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	 */
 	c->idx = idx;
 	c->cap = cfg;
-	c->mdss = m;
 	_setup_intf_ops(&c->ops, c->cap->features);
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 643dd10bc030..e07b2e33af3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -90,7 +90,6 @@ struct dpu_hw_intf {
 	/* intf */
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
-	const struct dpu_mdss_cfg *mdss;
 
 	/* ops */
 	struct dpu_hw_intf_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cf70a9bd1034..bb3ddec5c7d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -812,7 +812,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 	}
 
 	/* Assign ops */
-	hw_pipe->catalog = catalog;
 	hw_pipe->ubwc = catalog->ubwc;
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 74b98b6b3bc3..5004a02fd61e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -341,7 +341,6 @@ struct dpu_hw_sspp_ops {
  * struct dpu_hw_sspp - pipe description
  * @base: hardware block base structure
  * @hw: block hardware details
- * @catalog: back pointer to catalog
  * @ubwc: ubwc configuration data
  * @idx: pipe index
  * @cap: pointer to layer_cfg
@@ -350,7 +349,6 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_ubwc_cfg *ubwc;
 
 	/* Pipe */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 2d28afdf860e..db5e6040017f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -262,7 +262,6 @@ struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
 	}
 
 	/* Assign ops */
-	c->mdp = &m->mdp[0];
 	c->idx = idx;
 	c->caps = cfg;
 	_setup_wb_ops(&c->ops, c->caps->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 3ff5a48541e2..b91923f879f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -76,15 +76,12 @@ struct dpu_hw_wb_ops {
 /**
  * struct dpu_hw_wb : WB driver object
  * @hw: block hardware details
- * @mdp: pointer to associated mdp portion of the catalog
  * @idx: hardware index number within type
  * @wb_hw_caps: hardware capabilities
  * @ops: function pointers
- * @hw_mdp: MDP top level hardware block
  */
 struct dpu_hw_wb {
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_mdp_cfg *mdp;
 
 	/* wb path */
 	int idx;
@@ -92,8 +89,6 @@ struct dpu_hw_wb {
 
 	/* ops */
 	struct dpu_hw_wb_ops ops;
-
-	struct dpu_hw_mdp *hw_mdp;
 };
 
 /**

-- 
2.40.0

