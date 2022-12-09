Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083386486E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiLIQtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiLIQtJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:09 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9D6941BA
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:06 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id h10so5489630ljk.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGzQyhdenSwcHEboe3rA+QyA3pqYTdrZAd8HXwWyub4=;
        b=UoM1UToSFJMA+ZDdRdYOhDOD85OkGYdqztPDUqLUMWUCa7v/m8U2+F6pTEIransehh
         BkON+5VISfrcvQPTfJXLakBN1PVqjrN0KN3XgcO376S0lGX0tk/BS45T17E/WwbHwAPM
         hekAWOeovRsfPMfMfCTtCXUDi9uoPTZATr9qpspF/7hXjoqprjTk2lvPyDKtxK2yF9C9
         jcGjMwPdFSCDlTX41LRMXojfePFxaqEBRoPTTRA9jQViUTw7A+tyaGq8oa1+jAXEnGr9
         mE6f+gE4DF+vON51L+0JyE5h0On70gGDrKn7WIHCjql0k8RB7F5VDQz69s7z4dHqG4tH
         adCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGzQyhdenSwcHEboe3rA+QyA3pqYTdrZAd8HXwWyub4=;
        b=lNwgJsbl5nnQ8QvJWyICtHgi25u37Hj7UuYT2RjTuJJuAaG4ybVikJ0awFqjPqzh/h
         et6KHN7IF5jB4RfSzyghtV79RcBeNqjyve1NQfHu/aB3EXjljVB6hnb7/tGBYHiH0XAj
         n/Evn88uHWG5FglSRaIO4jBo2xhKky4VlkNYOaBGqVMriIqUuzgV/JcMjKOSqmkESgVw
         EFu23VPBIKwhUyO+5/DxwrqgusnGrREExThzN30hTOzd0PK+9/fqkEAI7mw6WbZnGtnb
         rKM1mwFNuCzRD0VPihHcdZ3Zbsq27fgclbIKrgWIJugTMEPvdHbCNZ6OwJj7nLFipM4+
         LLaA==
X-Gm-Message-State: ANoB5pmP+IcvqBOTqMncV0tl+0rHW75u193V3qth4eK2qur3IL0vKrWR
        wIKi81W3BbvwZzOdhExfOtApMw==
X-Google-Smtp-Source: AA0mqf49hni1yhXIyMYPs3Sps4SNcLz2CISIxui4r8iGEHpdPKd5c+ZVEt3yMz7P/Q+qwNwVgf857w==
X-Received: by 2002:a2e:9b86:0:b0:279:dbc6:1b64 with SMTP id z6-20020a2e9b86000000b00279dbc61b64mr2740537lji.52.1670604546339;
        Fri, 09 Dec 2022 08:49:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 12/19] clk: qcom: smd-rpm: move clock definitions together
Date:   Fri,  9 Dec 2022 18:48:48 +0200
Message-Id: <20221209164855.128798-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease review and reuse group all clock definitions together.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 128 +++++++++++++++------------------
 1 file changed, 59 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 7e43ecdda763..98d82d1f3a75 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -411,15 +411,73 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 };
 
 DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
+
+DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
+
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
+DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2);
+
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk, QCOM_SMD_RPM_BUS_CLK, 5);
+
 DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+
+DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
+
+DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+
+DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
+
+DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+
+DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
+
 DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
-DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+
+DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
@@ -487,8 +545,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.num_clks = ARRAY_SIZE(msm8916_clks),
 };
 
-DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
@@ -523,19 +579,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
 		.num_clks = ARRAY_SIZE(msm8936_clks),
 };
 
-DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
-
 static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
@@ -586,8 +629,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.num_clks = ARRAY_SIZE(msm8974_clks),
 };
 
-DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-
 static struct clk_smd_rpm *msm8976_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -622,14 +663,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 	.num_clks = ARRAY_SIZE(msm8976_clks),
 };
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
-
-DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
-
-DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk,
-			  QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
 static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -688,8 +721,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 	.num_clks = ARRAY_SIZE(msm8992_clks),
 };
 
-DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
-
 static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -750,13 +781,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 	.num_clks = ARRAY_SIZE(msm8994_clks),
 };
 
-DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
-		   QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk,
-			  QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk,
-			  QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
-
 static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
@@ -809,8 +833,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 	.num_clks = ARRAY_SIZE(msm8996_clks),
 };
 
-DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-
 static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
@@ -839,15 +861,6 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
-DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
-		   QCOM_SMD_RPM_AGGR_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
-		   QCOM_SMD_RPM_AGGR_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
-
 static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -1012,19 +1025,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 	.num_clks = ARRAY_SIZE(msm8953_clks),
 };
 
-/* SM6125 */
-DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
-					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
-DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
-						QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
-						QCOM_SMD_RPM_BUS_CLK, 5);
-
 static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -1108,10 +1108,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 	.num_clks = ARRAY_SIZE(sm6115_clks),
 };
 
-/* SM6375 */
-DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
-DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
-DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
 static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
@@ -1149,12 +1145,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 	.num_clks = ARRAY_SIZE(sm6375_clks),
 };
 
-/* QCM2290 */
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
-
-DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
-		   QCOM_SMD_RPM_MEM_CLK, 1);
-
 static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
-- 
2.35.1

