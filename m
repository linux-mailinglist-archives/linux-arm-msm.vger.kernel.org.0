Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E984070B02A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjEUUX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjEUUX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:23:27 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB328E4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af28303127so27735301fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684700604; x=1687292604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIvxR8m9qdkr19fiQAdfrt39mpOyo2fFYaDTvUzVWWs=;
        b=s7U2JNquZRpIJGnWny/iJgP9Wb2J3s58LxmPY+MJdi5MFTAksdyDFdmXpy4l1rwDOL
         6QiGUytlYjcJd4ENyCJa5LtkwzvElxrnF9Tx8vAT2lVOQdayoLtyqjLEwGWOgAbOvXHv
         f6aaIFQ361qmtGQBST2wSjUGXJt4u1yYgZgiihbI6hTMLiU0hloUo+1qUcYZmxte1UyD
         G79o1T+VcGDhIDZy/U7qH3R23SaRYlpVATEzLv99C1nZd+hWWYqATURuBjfzkVioAAIk
         eKi95O0X2dJ1L6MeC0OtVLOE1Aj6Ou1A7HB4sAMmt7HBJ5q3FG9gvvwrUFZdzd5ix7ZV
         b8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684700604; x=1687292604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIvxR8m9qdkr19fiQAdfrt39mpOyo2fFYaDTvUzVWWs=;
        b=AMKmJEQOyiovWLRnHp9UaW+ovYPPIlFdXt5AbHXyEqaqTeG6+on8vEDoMLjA94dAq1
         5/NJ/ylgYHG9U5Wd2uzLxBRNz8pjFF3Skwhfo5gvtMC1Tc2u6MHE4qHY0CmfQyGBCqFQ
         17B0TaFhYeWN9bVu7ITZxzzNGg5zAaL3lsDmDHJA+IeTHMXBixvZ41CLiNel6ECFkBTF
         iRudf7pGlzlWza7fJSHAcpQvcMX4XgV87303cZGCy5QlmWt3mmeGkCX4eGmpp8kUhG6Q
         tBCMSjB231USyDFPFiA4O3xiCjQHqCZ/neH1w4oJlZUuGNpNX7fl+kmco471bpVmNkn9
         FZUg==
X-Gm-Message-State: AC+VfDybMsOvefHYKnU0hLTYoP9zxX0hX0HU3oXP/vhezrztEH4EP5ZC
        YZ9YRleaC8FvAESBveTabUsafQ==
X-Google-Smtp-Source: ACHHUZ4AmTEuzEX+KAqmXcIuKDWD/4NkYylj8V2+ls8khaNHuVJQTaz8TFROo+pgab6a/oXQmrPX3A==
X-Received: by 2002:a2e:7302:0:b0:2ad:8623:a97e with SMTP id o2-20020a2e7302000000b002ad8623a97emr2660617ljc.50.1684700603862;
        Sun, 21 May 2023 13:23:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e91d7000000b002adb566dc10sm835589ljg.129.2023.05.21.13.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:23:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 02/10] phy: qcom-qmp-combo: simplify clock handling
Date:   Sun, 21 May 2023 23:23:13 +0300
Message-Id: <20230521202321.19778-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
References: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
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

For new binding we are going to drop ref_clk_src clock and always use
ref clock. Rather than introducing additional code to handle legacy vs
current bindings (and clock names), use devm_clk_bulk_get_optional()
when new bindings are used and devm_clk_bulk_get_all() when legacy
bindings are in place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 67 ++++++++---------------
 1 file changed, 23 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2bff1bbb8610..b04392be2e3f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1271,9 +1271,6 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
-	/* clock ids to be requested */
-	const char * const *clk_list;
-	int num_clks;
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -1315,6 +1312,7 @@ struct qmp_combo {
 
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -1380,19 +1378,10 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 }
 
 /* list of clocks required by phy */
-static const char * const qmp_v3_phy_clk_l[] = {
+static const char * const qmp_combo_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
 };
 
-static const char * const qmp_v4_phy_clk_l[] = {
-	"aux", "ref", "com_aux",
-};
-
-/* the primary usb3 phy on sm8250 doesn't have a ref clock */
-static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
-	"aux", "ref_clk_src", "com_aux"
-};
-
 /* list of resets */
 static const char * const msm8996_usb3phy_reset_l[] = {
 	"phy", "common",
@@ -1466,8 +1455,6 @@ static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
 	.reset_list		= sc7180_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1511,8 +1498,6 @@ static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1558,8 +1543,6 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1606,8 +1589,6 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_phy	= qmp_v5_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1651,8 +1632,6 @@ static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1696,8 +1675,6 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1746,8 +1723,6 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1796,8 +1771,6 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v4_usb3phy_regs_layout,
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2503,7 +2476,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 		goto err_disable_regulators;
 	}
 
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
 	if (ret)
 		goto err_assert_reset;
 
@@ -2553,7 +2526,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -2832,7 +2805,6 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
@@ -2844,7 +2816,7 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 	qmp_combo_enable_autonomous_mode(qmp);
 
 	clk_disable_unprepare(qmp->pipe_clk);
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	return 0;
 }
@@ -2852,7 +2824,6 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret = 0;
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
@@ -2862,14 +2833,14 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 		return 0;
 	}
 
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
 	if (ret)
 		return ret;
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 		return ret;
 	}
 
@@ -2940,9 +2911,8 @@ static int qmp_combo_reset_init(struct qmp_combo *qmp)
 
 static int qmp_combo_clk_init(struct qmp_combo *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
-	int num = cfg->num_clks;
+	int num = ARRAY_SIZE(qmp_combo_phy_clk_l);
 	int i;
 
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
@@ -2950,9 +2920,11 @@ static int qmp_combo_clk_init(struct qmp_combo *qmp)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->clks[i].id = cfg->clk_list[i];
+		qmp->clks[i].id = qmp_combo_phy_clk_l[i];
 
-	return devm_clk_bulk_get(dev, num, qmp->clks);
+	qmp->num_clks = num;
+
+	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
 static void phy_clk_release_provider(void *res)
@@ -3158,6 +3130,12 @@ static int phy_dp_clks_register(struct qmp_combo *qmp, struct device_node *np)
 	if (ret)
 		return ret;
 
+	ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
+	if (ret < 0)
+		return ret;
+
+	qmp->num_clks = ret;
+
 	return 0;
 }
 
@@ -3427,6 +3405,7 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	const struct qmp_combo_offsets *offs = cfg->offsets;
 	struct device *dev = qmp->dev;
 	void __iomem *base;
+	int ret;
 
 	if (!offs)
 		return -EINVAL;
@@ -3456,6 +3435,10 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	ret = qmp_combo_clk_init(qmp);
+	if (ret)
+		return ret;
+
 	qmp->pipe_clk = devm_clk_get(dev, "usb3_pipe");
 	if (IS_ERR(qmp->pipe_clk)) {
 		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
@@ -3504,10 +3487,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_combo_clk_init(qmp);
-	if (ret)
-		return ret;
-
 	ret = qmp_combo_reset_init(qmp);
 	if (ret)
 		return ret;
-- 
2.39.2

