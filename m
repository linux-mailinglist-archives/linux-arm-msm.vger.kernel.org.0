Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EB653908A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 14:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344173AbiEaMSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 08:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245457AbiEaMSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 08:18:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1EC419A3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 05:18:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v9so14427360lja.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
        b=k1lxgjYuUHs2jvEXJ2gHGHbuWOZeTeFJbBxc1GD4/ekw2+5fCyevW6SfEKV36ceyWU
         dpz/NHmnkaOFO+9FOrPJNEcaCOBgx1hOPTdOAi154fuPMWmJPTfqXwTtUM5lMPk8BsYT
         WbPTRLAKqGkCTkN/N9JaJvxzYP3QDARmOq6g6f2JqOwOGQLyExNc3K8X5IA3pF+1gKhY
         OhQHPBVj4yALlugq722WQk0FHY/rnviRqyKvhfDEzHWPu7+7Hdcfd/RXzKg2yTB/4lYz
         IVAR2e4QG91vGUmfZFxW74sMj9Urc32dMpDbcIGtZi6KgKD2rA61/DWh9LK/VRcpc0uV
         HpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
        b=DRdH3H82s8vnsHdfvs5nH/LE0K9mOSQZJKzLbW2lKlhCiAM1TrLtU7XrksiXGo65E+
         seRP15Goz8GIf8WWTyvI4Watdf6bA7yxbQx8r9AVFRVZmzP1xBrBEVglRi2yDgsMrEJo
         iDn4dNiIXqvzTpVajGtiKjTbFCGCZMOy9S1LhRt/xXId8VC7N2nRNlKeYQTi0KeLXMp5
         MZQKDdqJr/McBtj6QU1+v7+7reD+8ipAzK5n/N50PX4yKp2bNXAhb0EdEN7S4Ica81Pr
         iLDNcmcosH1+nn4U/TJkqCb9I06ZmjJIJmVci2mwV/jBZmVrm9HbRESPzy/ArOGcuHQh
         ZZXQ==
X-Gm-Message-State: AOAM530yVi1xMvgP7liz1e8ZpO9tR1sN6lFVo7FgHnWC5lz5caedGHQK
        RdoCVH0cyPVvtAczV/FMNQ6ROg==
X-Google-Smtp-Source: ABdhPJyupkC4slDXUK9Tw7uNHV4EJd1TiIX+PRxr4gqAnhEVxx5ILLtn79JaVw866aURIj0smdfN8g==
X-Received: by 2002:a2e:a7ca:0:b0:253:f7ab:a008 with SMTP id x10-20020a2ea7ca000000b00253f7aba008mr21502340ljp.10.1653999506642;
        Tue, 31 May 2022 05:18:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e26-20020a2e501a000000b002554f47e37asm1145056ljb.119.2022.05.31.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:18:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: less magic numbers in msm_mdss_enable
Date:   Tue, 31 May 2022 15:18:25 +0300
Message-Id: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0454a571adf7..2a48263cd1b5 100644
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
@@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5)
 		return 0;
 
+	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
+	dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
+	dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
+		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
+	 *
+	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
+	 * UBWC_n comes from hw_catalog.
+	 * Unforunately this driver can not access hw catalog.
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

