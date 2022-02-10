Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494E34B066D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 07:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbiBJGiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 01:38:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbiBJGiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 01:38:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C27FDF5
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 22:38:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8CD9B82199
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00875C36AE2;
        Thu, 10 Feb 2022 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644475086;
        bh=WDoD2IWuN+dSHlVHH7SgTftB5cke0BrFUNUt4U6trWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XI6cvgAGFnlA5XED47dsgFYpAwEEPAvZXSCR2Gc8c3OWDS39D5e6RdVK7vTuo4rf2
         PXR5VQX4qMzFwFKikwydv3szNJ8v68fcgEDD5Ly1IpVE1OKxnzOP9ChyBvTNq7+uPu
         Mxfmokr4ZEpmfKDkEwgxpFLLESpnNoJ7NOh0AFvlJOYDknT6C6y3ZScQoLNDQ3gVnC
         JCH3CtMSWxxA0zQQUKFR5fxirZ27EMvCjJvm4lZpXA9fgRWnGkjbj9ve2WXis2B1HX
         68O9J+GS4uMyDX1lEjFPVocyaep1SU+XPqsx1K+NA+xwPFCkWzWFoAd8RySC2dC3YF
         d/bc05vmbPqlA==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 04/13] drm/msm/disp/dpu1: Add support for DSC in pingpong block
Date:   Thu, 10 Feb 2022 12:07:30 +0530
Message-Id: <20220210063739.233634-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063739.233634-1-vkoul@kernel.org>
References: <20220210063739.233634-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In SDM845, DSC can be enabled by writing to pingpong block registers, so
add support for DSC in hw_pp

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 55766c97c4c8..47c6ab6caf95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -28,6 +28,9 @@
 #define PP_FBC_MODE                     0x034
 #define PP_FBC_BUDGET_CTL               0x038
 #define PP_FBC_LOSSY_MODE               0x03C
+#define PP_DSC_MODE                     0x0a0
+#define PP_DCE_DATA_IN_SWAP             0x0ac
+#define PP_DCE_DATA_OUT_SWAP            0x0c8
 
 #define PP_DITHER_EN			0x000
 #define PP_DITHER_BITDEPTH		0x004
@@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 	return line;
 }
 
+static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *c = &pp->hw;
+
+	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
+	return 0;
+}
+
+static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *c = &pp->hw;
+
+	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
+}
+
+static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
+	int data;
+
+	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
+	data |= BIT(18); /* endian flip */
+	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
+	return 0;
+}
+
 static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 				unsigned long features)
 {
@@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
+	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
 
 	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 89d08a715c16..12758468d9ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
 	 */
 	void (*setup_dither)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_dither_cfg *cfg);
+	/**
+	 * Enable DSC
+	 */
+	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
+
+	/**
+	 * Disable DSC
+	 */
+	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
+
+	/**
+	 * Setup DSC
+	 */
+	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
 };
 
 struct dpu_hw_merge_3d;
-- 
2.31.1

