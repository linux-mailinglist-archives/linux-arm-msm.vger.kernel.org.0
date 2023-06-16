Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110E9732CD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241316AbjFPKEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241336AbjFPKE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:04:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0396B2D67
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f7deee339dso611942e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909864; x=1689501864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjOtinuEjbt24XJmOWkl6+48nccnCQLcSVT0xhiArGI=;
        b=pZxMHJmXXeIMbUAKfhn3cNfbnPH1yfYfiCpZdUS6+p828h/8TewHOoBYPvjNEY+oXs
         VLCWFBWWccGAwYMAJMC7pX8/ikgHBApbfHqZSaZXcFdEBuUoIvwJMxJGHjUjTkiiOUl7
         bf7XnZct7dg/Mlt9mPP89SGc4nhoEgiOZA/EuuJcP03Me61mBzksYfiBqXvXiaqdvR10
         XGYifrsMmc6l62+cJnkBSNI2Nl2RGWwLRoKMUbBMMR4mSsTmBuymRsBI9ZQnWw2EmmL/
         EB2+oLgz6iA0iBhCXbL6V+qiUv8+lKDTagu+hmMCRBbeIUwVcAbqJejTiYunuxI/AMuI
         QCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909864; x=1689501864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjOtinuEjbt24XJmOWkl6+48nccnCQLcSVT0xhiArGI=;
        b=AUDbayFfhM3Zn4Ge/Qrn9CN+dVTlyiTjZ3qSVQ2SkgXAkvCMg53uHV1alGKFxwNOz4
         z8uZkdHfWPxuS+681Kl+NYRk+Wmt61pgT2QYAYNRpwX7Jr5GJOGjJ+qJzWShbr8iNteP
         PvAJh0gLQwDoILC+HmR1GQiywWFRIoULSvSQFt3TYgpdoUyL4EXqRYPztSAX1fW2SBTC
         RZiFLhbK09uV8lOoMDTdm9kxNyq2QEpPbWfeCx+FPItedoB7kT2YNERIaWwrfs2bBKBg
         ZbRoji3bnU1zMb43+Nw207JyNM6Ji+b2SgEDaxWlbsjc6pXSsvKgc6zC9QAmOKSwJcvF
         VhSQ==
X-Gm-Message-State: AC+VfDzubH4Dhr0YbULk2mN0lkdmIsTarFGRtzSrAtjmEKx1Ow06bn6c
        456rpqz+YxJDgoBUx77eSwQEdg==
X-Google-Smtp-Source: ACHHUZ5QLxMZmMBkbqRpMdZOrjnNG+FlVguQpzZv55RCTtFqe5asqn00o8IGFVHrccW2i4NhQxaaJQ==
X-Received: by 2002:ac2:5b5d:0:b0:4f8:4aed:b48c with SMTP id i29-20020ac25b5d000000b004f84aedb48cmr894947lfp.46.1686909864361;
        Fri, 16 Jun 2023 03:04:24 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:04:24 -0700 (PDT)
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
Subject: [PATCH v3 16/19] drm/msm/dpu: inline WB_BLK macros
Date:   Fri, 16 Jun 2023 13:03:14 +0300
Message-Id: <20230616100317.500687-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 787af2b2f957..60e71cbc5e27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -323,8 +323,18 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d7d117e3af36..904c758a60df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,8 +148,18 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b67010f336b..7b5c9a77b102 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -176,8 +176,18 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ea63ca358a4..d2bca1ec0e63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -493,24 +493,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.intr_tear_rd_ptr = _tear_rd_ptr, \
 	}
 
-/*************************************************************
- * Writeback blocks config
- *************************************************************/
-#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
-		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
-	{ \
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x2c8, \
-	.features = _features, \
-	.format_list = wb2_formats, \
-	.num_formats = ARRAY_SIZE(wb2_formats), \
-	.clk_ctrl = _clk_ctrl, \
-	.xin_id = __xin_id, \
-	.vbif_idx = vbif_id, \
-	.maxlinewidth = _max_linewidth, \
-	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
-	}
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
-- 
2.39.2

