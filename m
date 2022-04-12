Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FB04FE8CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240745AbiDLTlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358896AbiDLTlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:41:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB804BFF0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:38:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u7so16899272lfs.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98VvuWwg/UxrQVt2tP9Y2pnp9hUtu4rLQ2/MrJ26H6s=;
        b=bAZpnMqQC/H/mLCOO6YdHNNQtPHW3kl2UG1t4DD6dZCSDEPXd2WN211Xdl8LMKbDMz
         R/VmllMOBhA6EuEweCOS3qbS3TNGFZ1Rv3oXWfevCyIHH6Oj6GptP47ZK+AELTHYkgcR
         1Rba5jav3qb91e5IrVLmvsB8QowGLs/scQp4V0HidBHmtChaN+md0mHVznK3il32jFt7
         cPNngODStSgcTXC/L4avS2TwN0/YvmcQLXL6kHfWhD9zQIt4pgHy4wMK3QNYCMv3uwht
         cLzEvyVWL9YuZecRH1HvR5pMXHuN3TTwEJ6kzdF4yqaee4pW4m5amiPOEdZ0jvP360Zf
         0hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98VvuWwg/UxrQVt2tP9Y2pnp9hUtu4rLQ2/MrJ26H6s=;
        b=KqrvTmYPG/3wiKTOEwE5lifZcAUtcRVRpm7bDqwEhY2ngCLlcMCSVxDFpVxw6e2PLn
         Sj6iRiGEPQ0tJUYtOZBm1x7Ojyi1LvCQo2Kp1UtNJMhKSSeZNN+E5y8MTjM+qIfybb8+
         wH0idXGuRojE67SYGflQifuO9HLkxhBeRZhciPS6DnbB8s3kgzj63QEVGfIqGM+ZUHmj
         eav+PTw1YduAA/GGv+punMvLc/MVbyVoyHw7EUO0zctVC4Yt3k3U5fyXn0Cb2ycS8QL3
         yFKExK5Aj4OWWIQlwKxVCJ85fIkblETxg1VLDjAJi98uPcZS+j23sKdyxRPBmDXsy4ST
         jACQ==
X-Gm-Message-State: AOAM533sGaei81uul/fNw3BgiXgRwk312lKpmO6Y41vL8UbHhzlOLgHi
        jJbXhfyuZDEdu4cnH1CAymeFNw==
X-Google-Smtp-Source: ABdhPJz7ImDN4uETndAgevqr07rRTdiKJlGgK3p4tpVjqDjHKAsuIvmy4oomzr2PkGC6wclnqmIlKQ==
X-Received: by 2002:a05:6512:10c8:b0:44a:d432:9e28 with SMTP id k8-20020a05651210c800b0044ad4329e28mr26403395lfg.496.1649792326973;
        Tue, 12 Apr 2022 12:38:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a0565120a8400b00450abeb42b3sm2731641lfu.235.2022.04.12.12.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:38:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 5/5] PCI: qcom: Drop manual pipe_clk_src handling
Date:   Tue, 12 Apr 2022 22:38:39 +0300
Message-Id: <20220412193839.2545814-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manual reparenting of pipe_clk_src is being replaced with the parking of
the clock with clk_disable()/clk_enable(). Drop redundant code letting
the pipe clock driver park the clock to the safe bi_tcxo parent
automatically.

Cc: Prasad Malisetty <quic_pmaliset@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 39 +-------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a6becafb6a77..b48c899bcc97 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -164,9 +164,6 @@ struct qcom_pcie_resources_2_7_0 {
 	int num_clks;
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
-	struct clk *pipe_clk_src;
-	struct clk *phy_pipe_clk;
-	struct clk *ref_clk_src;
 };
 
 union qcom_pcie_resources {
@@ -192,7 +189,6 @@ struct qcom_pcie_ops {
 
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
-	unsigned int pipe_clk_need_muxing:1;
 	unsigned int has_tbu_clk:1;
 	unsigned int has_ddrss_sf_tbu_clk:1;
 	unsigned int has_aggre0_clk:1;
@@ -1158,20 +1154,6 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		return ret;
 
-	if (pcie->cfg->pipe_clk_need_muxing) {
-		res->pipe_clk_src = devm_clk_get(dev, "pipe_mux");
-		if (IS_ERR(res->pipe_clk_src))
-			return PTR_ERR(res->pipe_clk_src);
-
-		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
-		if (IS_ERR(res->phy_pipe_clk))
-			return PTR_ERR(res->phy_pipe_clk);
-
-		res->ref_clk_src = devm_clk_get(dev, "ref");
-		if (IS_ERR(res->ref_clk_src))
-			return PTR_ERR(res->ref_clk_src);
-	}
-
 	return 0;
 }
 
@@ -1189,10 +1171,6 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 		return ret;
 	}
 
-	/* Set TCXO as clock source for pcie_pipe_clk_src */
-	if (pcie->cfg->pipe_clk_need_muxing)
-		clk_set_parent(res->pipe_clk_src, res->ref_clk_src);
-
 	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
 	if (ret < 0)
 		goto err_disable_regulators;
@@ -1254,18 +1232,8 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
-	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
-}
 
-static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
-{
-	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
-
-	/* Set pipe clock as clock source for pcie_pipe_clk_src */
-	if (pcie->cfg->pipe_clk_need_muxing)
-		clk_set_parent(res->pipe_clk_src, res->phy_pipe_clk);
-
-	return 0;
+	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
 }
 
 static int qcom_pcie_link_up(struct dw_pcie *pci)
@@ -1441,7 +1409,6 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-	.post_init = qcom_pcie_post_init_2_7_0,
 };
 
 /* Qcom IP rev.: 1.9.0 */
@@ -1450,7 +1417,6 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-	.post_init = qcom_pcie_post_init_2_7_0,
 	.config_sid = qcom_pcie_config_sid_sm8250,
 };
 
@@ -1488,7 +1454,6 @@ static const struct qcom_pcie_cfg sm8250_cfg = {
 static const struct qcom_pcie_cfg sm8450_pcie0_cfg = {
 	.ops = &ops_1_9_0,
 	.has_ddrss_sf_tbu_clk = true,
-	.pipe_clk_need_muxing = true,
 	.has_aggre0_clk = true,
 	.has_aggre1_clk = true,
 };
@@ -1496,14 +1461,12 @@ static const struct qcom_pcie_cfg sm8450_pcie0_cfg = {
 static const struct qcom_pcie_cfg sm8450_pcie1_cfg = {
 	.ops = &ops_1_9_0,
 	.has_ddrss_sf_tbu_clk = true,
-	.pipe_clk_need_muxing = true,
 	.has_aggre1_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
 	.ops = &ops_1_9_0,
 	.has_tbu_clk = true,
-	.pipe_clk_need_muxing = true,
 };
 
 static const struct dw_pcie_ops dw_pcie_ops = {
-- 
2.35.1

