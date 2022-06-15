Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711F754CAA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355407AbiFOOAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353854AbiFON7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 09:59:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51763BBC1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c2so19137131lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+OAoX9xa8zARnq1PmieTQqq78QxHaSY9nnSC1exfJcQ=;
        b=r1Kp1EfT/IMcglR2oedl5BVnI/ZlqGaUUQgE58Fl9iORFiZTb/zZZsAcen7I1kHOTl
         QYw3sEKJS+v/n1VlBfmWZQM06pm2vuMLqv5FLkUTgBQJMRbArgpev+sCdWp4ybE7rtHG
         klrJyAnqg3NzLZjgSpldafWfOHsvlOcBEow6UEHeiohk/tPLbOEUfo6bDXIfTFHrKjRm
         2u+oskr6HdpYrNgOsxzWuWydZDQE8uzOJmaAROURAMRAeec7FOGkoVu9JKmYJh3Da2hv
         1ZnZXRyw6e07jJ7MzLKxyL9Zw+LrzWGU/esGaH3E5V8lJR57dZ0K6TYgm23Np1SNM5Af
         cnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+OAoX9xa8zARnq1PmieTQqq78QxHaSY9nnSC1exfJcQ=;
        b=74bRdTp+vGpDH0YphNPTUUn5OGDuJA9kSs4EfgGaNIiqu/HJMbMYgepF+vWLhbLMRn
         FRSioOU0ECmE7zNdUsknc2VRKOtauhAVLY8aBvkTwIzXS1vMnVFcXtxCvI2UU42tsfoX
         RwhiSuls6ti9YmDI9dxM0J6yBsbHRF0wQNvgPAjcTAo6VRt/NagifUjJblq2lFetE5Dq
         Uwax8XbfrZLyj/m+SP9+5EQbnmRcL/KdRIf3lT6zKFxrMt+iTSDFgpisg0iU97EO1FPm
         390DQ5fF9NNbSQgz1jvPdKXxpmustpyAK6JdlfwbYlxox6u7O7c51OviTxmSdsQArmf4
         SEUg==
X-Gm-Message-State: AJIora88skeAhAuE78EPBbu8tWIO2KAFRehj7tT7nt881lhsd8dfIWE9
        dtY12qKy1PtwofewvG53Cr4Mcg==
X-Google-Smtp-Source: AGRyM1tv84JWj8qt4J4oF52FvEm2avqnxiVT6u4wP7riAO1GYvMdFBJsLHOyiycdrlq5lWgBSQ0Cng==
X-Received: by 2002:a05:6512:2522:b0:479:a9c:42a9 with SMTP id be34-20020a056512252200b004790a9c42a9mr6107700lfb.210.1655301577020;
        Wed, 15 Jun 2022 06:59:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:59:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm: less magic numbers in msm_mdss_enable
Date:   Wed, 15 Jun 2022 16:59:31 +0300
Message-Id: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Replace magic register writes in msm_mdss_enable() with version that
contains less magic and more variable names that can be traced back to
the dpu_hw_catalog or the downstream dtsi files.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 80 ++++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0454a571adf7..b41848bfff91 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -21,6 +21,7 @@
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
+#define UBWC_DEC_HW_VERSION		0x58
 #define UBWC_STATIC			0x144
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
@@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
+				       u32 ubwc_static)
+{
+	writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x1) |
+		    (highest_bank_bit & 0x3) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	if (ubwc_version == UBWC_3_0)
+		value |= BIT(10);
+
+	if (ubwc_version == UBWC_1_0)
+		value |= BIT(8);
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 ubwc_static,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x7) |
+		    (ubwc_static & 0x1) << 3 |
+		    (highest_bank_bit & 0x7) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+
+	if (ubwc_version == UBWC_3_0) {
+		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	} else {
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	}
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
+	u32 hw_rev;
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -149,26 +204,35 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5)
 		return 0;
 
+	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
+	dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
+	dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
+		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
+	 *
+	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
+	 * UBWC_n and the rest of params comes from hw_catalog.
+	 * Unforunately this driver can not access hw catalog, so we have to
+	 * hardcode them here.
 	 */
-	switch (readl_relaxed(msm_mdss->mmio + HW_REV)) {
+	switch (hw_rev) {
 	case DPU_HW_VER_500:
 	case DPU_HW_VER_501:
-		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
 		break;
 	case DPU_HW_VER_600:
-		/* TODO: 0x102e for LP_DDR4 */
-		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
-		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
 	case DPU_HW_VER_620:
-		writel_relaxed(0x1e, msm_mdss->mmio + UBWC_STATIC);
+		/* UBWC_2_0 */
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
 	case DPU_HW_VER_720:
-		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
 	}
 
-- 
2.35.1

