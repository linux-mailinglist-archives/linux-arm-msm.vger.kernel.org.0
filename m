Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0650C5002B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbiDMXeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiDMXeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:34:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1939A2496B
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t25so6218306lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98VvuWwg/UxrQVt2tP9Y2pnp9hUtu4rLQ2/MrJ26H6s=;
        b=a9Csa+uiJH7g6XhfikjUZLbLAiYAdMugI7/QjeTiTHdZzvKhaKTRhj9ctfIx9lcrDA
         iFiaqqOotdTCMdN9lxlSTBYwmq0uq8UtUnJbk3U5K8+vz1LiN9HDo68F5ajrjkLLVgLE
         xHvjJOeDuBM0s1ljyEmr76NYIdwBEe2Gwvx8POF6TJ7egE99SglSPQsOZ0yxNtXq1nSy
         qXMhovihdbuOBnbPc79x+N7EBNTrONrBCkyXUZGOWV+G3ANHXfwSe7jevVT7OhnOkxVA
         M6oTmFcv2LK8nQKua91plm6LU3OtsuqL3N4+HGCbWH9ofJZaXq8F8hopeOEi68TzIOis
         IbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98VvuWwg/UxrQVt2tP9Y2pnp9hUtu4rLQ2/MrJ26H6s=;
        b=k5qLwFuA4r+PGHAdjsjuMe5h9UZtSYxOMUWACUDJbmBw7ec4EoBGDTffMG3US5hyD1
         xrmzz3igPLH0x/BTFRTZ1BCN4aOIefVeJTWzzf7rrK996owGGHGTZZ3+CSLVkYriWppE
         Uq+m/9QXKHFEz9AYHOaCCSs0Di8l8e4Fsw8HZZlJQWxCq0yDmfxcwAQEDVSLHdseJKtH
         h6GblP+Ov+orjsbe/+diDcS6GkYuGXC+Canipi4M5I+e+WnzAzw2F2V0C/J/H78E290A
         ZMqyXgUJ6X5jP7MLGBDtCjoj1U0EaCSRtiwwUcFKnykryD0IyhVCM52yQPPx2hSyPC5f
         w3Bg==
X-Gm-Message-State: AOAM531qqfVK0hTQACm2IdZmHyswGTwXp61AM7WTPSXkS3TCx84JXYQX
        Gs30IpOeN/iF9yKwjBqQIdcPQg==
X-Google-Smtp-Source: ABdhPJzK+ClCmIba9/KKzaGL15QOOUTHVQVCLprtWIMXBtoRNU07s6Zz3Iqcg7cj9ahL8sM+oxDzJQ==
X-Received: by 2002:a05:6512:3d0a:b0:46b:b42a:63eb with SMTP id d10-20020a0565123d0a00b0046bb42a63ebmr52293lfv.688.1649892713350;
        Wed, 13 Apr 2022 16:31:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m5-20020a0565120a8500b0044a2963700fsm40982lfu.70.2022.04.13.16.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:31:52 -0700 (PDT)
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
Subject: [PATCH v3 6/6] PCI: qcom: Drop manual pipe_clk_src handling
Date:   Thu, 14 Apr 2022 02:31:44 +0300
Message-Id: <20220413233144.275926-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413233144.275926-1-dmitry.baryshkov@linaro.org>
References: <20220413233144.275926-1-dmitry.baryshkov@linaro.org>
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

