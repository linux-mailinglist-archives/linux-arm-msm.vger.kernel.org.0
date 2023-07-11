Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBC674EDA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjGKMJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbjGKMJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:09:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FC81717
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso9076606e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077358; x=1691669358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arzL30+hBbUOM20bk4ZB/6VxoeYctCJ9hVqas1NvDpg=;
        b=bsoY20Og15ONm81zKjVhy39Abte+H2vDLZ9X+Ek6Upe0kyI58Ag9YAikXWDeoEBNnk
         d1WSfuFHjNDG4YoKQUA1QMOLb3INNsdhwndUZHe+8biJbKrSAkNCBPyjXWCzGWGhxn8C
         4bVgT+8x+grMeUfcXQJlu8XubewJCLH1nB2DtCqjUJ7zUuh2pNLF94rEvT2aL5ctj3l7
         oOEV57dAMkxQDyZxUBybN7rP1VUaEWYQta7qAXEhurpITWbSuPECSm+PMgEGHHi96bHP
         2WoukAFEsApiHeKfe03/vM867Vs5cPYFN1BIXZ7ViTktG9yy9via/fplV9bJYNsYx/Ag
         ED9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077358; x=1691669358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arzL30+hBbUOM20bk4ZB/6VxoeYctCJ9hVqas1NvDpg=;
        b=IoL9PsOC/KBXm5S8wPp0b1MGYE/cUb7zd4bx0wXr4AtC6pvTAygSVGBaZV7nnsb84e
         yAJF7sGdZL4+1gG6+WWGOEcAxnrfB+OUs8OjwSuyly1ofZQZXdznwcjPZiLFkWq71mLn
         OQsiue74AsaIxpmXrcBPAFBvP1VVi8HWXv4jwtrckTTWqihLR1xEOjcdD0wfV9wJYfrz
         S5LkCdRU61JLIqekoQ4B9s5BTTQbgptY4Esi1euRP2ZB2oBkyMVNNFWD6M8C830KNRSQ
         XqAe8M9+DgXC7aUdPg5pINGPp9UUU+S7eu85JkfcUw+vs9caDHmQZeTPP6yI57H8RMPT
         Qy7w==
X-Gm-Message-State: ABy/qLbRbkCsR7RnCB1LiSYHw/xYyk0LUkLG72ILc7oQWuTPkFVansnm
        7Rv6AeueN3kuOuk3ZTnK+4XDdg==
X-Google-Smtp-Source: APBJJlEZuKqyBjj4DK+n5B7eU0dRxk/PG6DT2ABOE9ABXo0ksnmVMNtHBVv/+ErTJRXosetnfQC3Ow==
X-Received: by 2002:a05:6512:10d4:b0:4fb:7592:cc7a with SMTP id k20-20020a05651210d400b004fb7592cc7amr13998891lfg.20.1689077358548;
        Tue, 11 Jul 2023 05:09:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbbd818568sm291447lfp.137.2023.07.11.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:09:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 02/10] phy: qcom-qmp-combo: simplify clock handling
Date:   Tue, 11 Jul 2023 15:09:08 +0300
Message-Id: <20230711120916.4165894-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
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

For the existing PHYs for new binding we are going to drop ref_clk_src
clock and always use ref clock. Rather than introducing additional code
to handle legacy vs current bindings (and clock names), use
devm_clk_bulk_get_optional() when new bindings are used and
devm_clk_bulk_get_all() when legacy bindings are in place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 67 ++++++++---------------
 1 file changed, 23 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 36eb516f9170..3a98234eb16a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1359,9 +1359,6 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
-	/* clock ids to be requested */
-	const char * const *clk_list;
-	int num_clks;
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -1403,6 +1400,7 @@ struct qmp_combo {
 
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -1463,19 +1461,10 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
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
@@ -1549,8 +1538,6 @@ static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
 	.reset_list		= sc7180_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1594,8 +1581,6 @@ static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1641,8 +1626,6 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1689,8 +1672,6 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1734,8 +1715,6 @@ static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v3_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v3_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1779,8 +1758,6 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1829,8 +1806,6 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -1879,8 +1854,6 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
-	.clk_list		= qmp_v4_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -2433,7 +2406,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 		goto err_disable_regulators;
 	}
 
-	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
 	if (ret)
 		goto err_assert_reset;
 
@@ -2483,7 +2456,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -2762,7 +2735,6 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
@@ -2774,7 +2746,7 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 	qmp_combo_enable_autonomous_mode(qmp);
 
 	clk_disable_unprepare(qmp->pipe_clk);
-	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	return 0;
 }
@@ -2782,7 +2754,6 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret = 0;
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
@@ -2792,14 +2763,14 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
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
 
@@ -2870,9 +2841,8 @@ static int qmp_combo_reset_init(struct qmp_combo *qmp)
 
 static int qmp_combo_clk_init(struct qmp_combo *qmp)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
-	int num = cfg->num_clks;
+	int num = ARRAY_SIZE(qmp_combo_phy_clk_l);
 	int i;
 
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
@@ -2880,9 +2850,11 @@ static int qmp_combo_clk_init(struct qmp_combo *qmp)
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
@@ -3088,6 +3060,12 @@ static int phy_dp_clks_register(struct qmp_combo *qmp, struct device_node *np)
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
 
@@ -3357,6 +3335,7 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	const struct qmp_combo_offsets *offs = cfg->offsets;
 	struct device *dev = qmp->dev;
 	void __iomem *base;
+	int ret;
 
 	if (!offs)
 		return -EINVAL;
@@ -3386,6 +3365,10 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	ret = qmp_combo_clk_init(qmp);
+	if (ret)
+		return ret;
+
 	qmp->pipe_clk = devm_clk_get(dev, "usb3_pipe");
 	if (IS_ERR(qmp->pipe_clk)) {
 		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
@@ -3434,10 +3417,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
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

