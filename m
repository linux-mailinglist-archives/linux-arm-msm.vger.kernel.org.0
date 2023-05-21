Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73C770AF39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjEURNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbjEURKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:10:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA6FED
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:34 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so1179931e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689032; x=1687281032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK3DReDclSqYpl35cY2r+GzdZSWtM+8yITG0XWVJNeY=;
        b=siHAeWlsi/VLez/2L/jq4deWAc14AkZvPOzf1LTPKMtgv5uDD7k56Csb+iVNymeiEs
         vHR2Jv67lTGlBbzQK4v6/jCqLswL4ya3kVmwVCfle9nJPaJWcBY3oh5YTPO3C3UHp+Pr
         VCQAOtJQcTUQnplwIV2LkmZrl9jcT66K83nOMYJxqB2OLhOISzfZg4T42TexmRcicm7q
         Q+mkzFjjMI2gEDee+kJtvhacLvBH+QBnE6TYtaj3NYjM4ogkgBdnsXlus/6u2CaEOj50
         N0mYG95TSbLp/Fo6DefKApZeWcBgDDiIThWmDXo2YaMjF4PzhcEIrkN3wRH4ZHgi6ocY
         s8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689032; x=1687281032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK3DReDclSqYpl35cY2r+GzdZSWtM+8yITG0XWVJNeY=;
        b=jOyr0pBwQ34lBzSVXRVT6uHasv2tQ2FriXC5CebN+6oEwDX3E0K+75UUD1hTmXFU2p
         C8L2zT3ZmHUPSsv3wF4wNJqZ8oTw2YRVUsulP7pCIhd4npFdu9usMe3Gt21o9MLae3mq
         a6/8xgVhQ6YfypkQ1XHlAuNZ3lDQMAYkZn10PYwJNATLV1EUgrROD6hVNSIHUoUWlFFW
         Y6jEkKwK1piVjEKIn0UPGxg1Ox4lk0dwWkOYtBM8ZRZgG1y3vYix5SOwbrULgjuudCHc
         A1nxyS9YwGkZPOoi6TiZBkBfDeo58mOBNOvoZO5Qp1no0BINxFZzEpQq0PnXwYMgHMyZ
         XfIw==
X-Gm-Message-State: AC+VfDxoTtFPs786udjEqUOKR5mZg+m1agdPO8bzjm/KA/DYwE1isgSm
        LbJ8yqySGNa82sJTT6soIA7w5w==
X-Google-Smtp-Source: ACHHUZ4JUgOwLmN8ZhXW2MMX3wPIgP3R3R+OEw1XbMtvPL8vUtAvhQJKk6U10t7evgMOePzA+tM1Pg==
X-Received: by 2002:ac2:48a2:0:b0:4d7:44c9:9f4b with SMTP id u2-20020ac248a2000000b004d744c99f4bmr2747715lfg.1.1684689032530;
        Sun, 21 May 2023 10:10:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:10:32 -0700 (PDT)
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
Subject: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
Date:   Sun, 21 May 2023 20:10:25 +0300
Message-Id: <20230521171026.4159495-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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

Switch to using data from MDSS driver to program the SSPP fetch and UBWC
configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
 6 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cf70a9bd1034..bfd82c2921af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -8,6 +8,8 @@
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
 
+#include "msm_mdss.h"
+
 #include <drm/drm_file.h>
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
@@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			ctx->ubwc->highest_bank_bit << 18);
-		switch (ctx->ubwc->ubwc_version) {
-		case DPU_HW_UBWC_VER_10:
+		switch (ctx->ubwc->ubwc_enc_version) {
+		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_20:
+		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_30:
+		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_40:
+		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
@@ -793,7 +795,9 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 }
 
 struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, const struct dpu_mdss_cfg *catalog)
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *catalog,
+				     const struct msm_mdss_data *mdss_data)
 {
 	struct dpu_hw_sspp *hw_pipe;
 	const struct dpu_sspp_cfg *cfg;
@@ -813,7 +817,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 	/* Assign ops */
 	hw_pipe->catalog = catalog;
-	hw_pipe->ubwc = catalog->ubwc;
+	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 74b98b6b3bc3..8d4ae9d24674 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -351,7 +351,7 @@ struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 	const struct dpu_mdss_cfg *catalog;
-	const struct dpu_ubwc_cfg *ubwc;
+	const struct msm_mdss_data *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
@@ -368,9 +368,12 @@ struct dpu_kms;
  * @idx:  Pipe index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @catalog : Pointer to mdss catalog data
+ * @mdss_data: UBWC / MDSS configuration data
  */
 struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, const struct dpu_mdss_cfg *catalog);
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *catalog,
+				     const struct msm_mdss_data *mdss_data);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..a4293dc0b61b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -22,6 +22,7 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
+#include "msm_mdss.h"
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
@@ -1066,7 +1067,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto power_error;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
+	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
+	if (IS_ERR(dpu_kms->mdss)) {
+		rc = PTR_ERR(dpu_kms->mdss);
+		DPU_ERROR("failed to get MDSS data: %d\n", rc);
+		goto power_error;
+	}
+
+	if (!dpu_kms->mdss) {
+		rc = -EINVAL;
+		DPU_ERROR("NULL MDSS data\n");
+		goto power_error;
+	}
+
+	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto power_error;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..797b4ff3e806 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -69,6 +69,7 @@ struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
 	const struct dpu_mdss_cfg *catalog;
+	const struct msm_mdss_data *mdss;
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7..9ee493465c4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -100,6 +100,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 
 int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
+		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio)
 {
 	int rc, i;
@@ -268,7 +269,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
+		hw = dpu_hw_sspp_init(sspp->id, mmio, cat, mdss_data);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index d62c2edb2460..2b551566cbf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -40,11 +40,13 @@ struct dpu_rm {
  *	for all HW blocks.
  * @rm: DPU Resource Manager handle
  * @cat: Pointer to hardware catalog
+ * @mdss_data: Pointer to MDSS / UBWC configuration
  * @mmio: mapped register io address of MDP
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
+		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio);
 
 /**
-- 
2.39.2

