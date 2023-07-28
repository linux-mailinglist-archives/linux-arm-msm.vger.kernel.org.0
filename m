Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4687677B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 23:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbjG1Vdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 17:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbjG1Vdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 17:33:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5E04686
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so4462927e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690580010; x=1691184810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI2gFf5IMmE9gmBXwnnKFQD0+it6twgnBHzxT0t82Zg=;
        b=CT9lFYG6HNn3CLKjlCepcsn8r8pyGc2LfFydpzn73pRPhsvCOoo+yp1TSWR23Bd/+C
         clOYO1q8D2BNFo5Jt/fMFP7SZTfeC1jtHEJRrbVG/ZfaDGBE2RK6sNWrFEbrJcbmDXGr
         UmZLipNmszolXWwEGGEpBxQuPipBVafczc1vqu9AUZK1tj1Lpd5T0oD+WJ5RY9qiJOuh
         BK+PBNsoFPcSkZbk48sHkKZumN2yUF9Ndm17YvWCXA0lt5GAbP/2mOtckwT83dxU53jj
         I/mR2Nigc88g+yrp1hiIMMexaw4vB67pFnrH7OjmiUNG8/Ww1qmAMI4aYjbwBOAc2Zmc
         +CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690580010; x=1691184810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI2gFf5IMmE9gmBXwnnKFQD0+it6twgnBHzxT0t82Zg=;
        b=XlukFXhNHg3Cv6DyvOKtkxVOZGrdtN9k76f6JkJw0jiGNsW6DaccVV6R3O/w3EU238
         sVrMizubZ5rKFNzHXSME2u+K9eQMffAah8WT0bzsR1C63xoa1bDi6B/JETsJlnosgarK
         z9CPTgFgyzAxyhzBauH4dkj61zIS8+V0gsNfJVVTh6G2ra2VmXwodMpmy85hJiInnd4y
         8bcK1/7UFR++9SPvHTFcSiAVmjoqp7e49AK8HE6M2o332LHky4NmbwvxomCKdYMd7ld3
         OzV3Pgl2Ow7KQfd9c08o+WpKCycBRD7I15anRQiU1/Ypjwd3uJPnqPrg7SqNL1cP78TZ
         4DQg==
X-Gm-Message-State: ABy/qLbSze8QEx2rZaQXVptKRDIPoIM2KhMBVADznite09RU3ekU8oWR
        HpzbWI6EYVIqudZp+9GqD8cA9g==
X-Google-Smtp-Source: APBJJlGg3+Y4Cg7SPqgz64yYfXcyw3W8+8CYxrq0ZjW67IwpAxcQ/l3rPu8d7MfJzZNyo5McDBgZ5g==
X-Received: by 2002:a05:6512:3a8f:b0:4fe:ae7:d906 with SMTP id q15-20020a0565123a8f00b004fe0ae7d906mr3029305lfu.65.1690580010546;
        Fri, 28 Jul 2023 14:33:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:33:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/dpu: use MDSS data for programming SSPP
Date:   Sat, 29 Jul 2023 00:33:18 +0300
Message-Id: <20230728213320.97309-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using data from MDSS driver to program the SSPP fetch and UBWC
configuration. As a side-effect, this also swithes the DPU driver from
DPU_HW_UBWC_VER_xx values to the UBWC_x_y enum, which reflects
the hardware register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
 6 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b364cf75bb3f..f2192de93713 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -8,6 +8,8 @@
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
 
+#include "msm_mdss.h"
+
 #include <drm/drm_file.h>
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
@@ -270,26 +272,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
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
@@ -670,11 +672,11 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 #endif
 
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc)
+		void __iomem *addr, const struct msm_mdss_data *mdss_data)
 {
 	struct dpu_hw_sspp *hw_pipe;
 
-	if (!addr || !ubwc)
+	if (!addr)
 		return ERR_PTR(-EINVAL);
 
 	hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
@@ -685,7 +687,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 	hw_pipe->hw.log_mask = DPU_DBG_MASK_SSPP;
 
 	/* Assign ops */
-	hw_pipe->ubwc = ubwc;
+	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 085f34bc6b88..cbf4f95ff0fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,7 +317,7 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_ubwc_cfg *ubwc;
+	const struct msm_mdss_data *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
@@ -333,10 +333,10 @@ struct dpu_kms;
  * Should be called once before accessing every pipe.
  * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @ubwc: UBWC configuration data
+ * @mdss_data: UBWC / MDSS configuration data
  */
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc);
+		void __iomem *addr, const struct msm_mdss_data *mdss_data);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c1d06e19b237..2da9eef687af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -22,6 +22,7 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
+#include "msm_mdss.h"
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
@@ -1124,7 +1125,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
index f3bdd4f11108..b6f53ca6e962 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -67,6 +67,7 @@ struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
 	const struct dpu_mdss_cfg *catalog;
+	const struct msm_mdss_data *mdss;
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4a53e2c931d6..f9215643c71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -101,6 +101,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 
 int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
+		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio)
 {
 	int rc, i;
@@ -230,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
+		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
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

