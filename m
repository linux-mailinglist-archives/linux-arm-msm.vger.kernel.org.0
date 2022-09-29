Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096735EF1C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbiI2JVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbiI2JVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:53 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D554A12FF0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:50 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k10so1341123lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=X8d8auaUbYkg/6BCuQEexEp/WA8mtD7KzcUJSiwcBSs=;
        b=l0pp2hyfH02PtSu/WYyH1qOFOXB5qovpcMT+klxNroKvH90NrQkCumkDXO5VrEaqrG
         MRTm6SPgNxciQsR9tiFUCyKQIUX0n8hvtl+BDukkX7jf0xksMvORNZBEV0VxMfTE7u+m
         UIMM3x17h+3DE+Mr4Hpo+3ekA+k57jYCqIBvu+dvEqFDkSXSIMqsP6yXch7346WbUqNM
         NqqpNhD2EFxO6crbiDQ0/PBYQHSPRJSjE4iJ16bXKcHfkkxLxVnFAjslMLaLnGRFDD8F
         zSvxlp8UNzDGAyRSqovLJ/sIbwg2SeYgCmDamaB8vdvvS2Yjy1HJLsl6fjZUIFFvMNqO
         /VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=X8d8auaUbYkg/6BCuQEexEp/WA8mtD7KzcUJSiwcBSs=;
        b=4DJ4uKwIbnahD8ukwbzxlKnxLPtanFUxzYojhNmaHoVb7tB18UJhNqMaTbrIeaWZNY
         9su9A1qY+uLJgl4x83MXBlpT/YADmgaCz+b/6KLXbUBtEUjOmZI4AV/R2XGTLpYLIOM4
         w5w3K+ALs0U0+2NAc2STgmadmKsv9ZSvlejHBTypay6AMckXEe3R0sxepbgUh7TZ4pPA
         RyEppC9rA4vdV2hGLb1QWgtjNwFRt4noiOgbE+JD+B8l8VZe98ZEgwBlBYBT3fdZB14V
         r76iFEdoz9trJ7vHrA9/5B/qVUHdzXTCZ1pefSjm2phrNTa1lq8LutlA+HmArzqlKa1a
         Claw==
X-Gm-Message-State: ACrzQf1IiSH2jKjkWP5V9h0XCnkdPK9kSAW/3fSurRITgiB2uHq8KcJb
        ZCruoSTDGUx9sRAYnhTjWAyGqQ==
X-Google-Smtp-Source: AMsMyM49uL6aV44QorE9emBvRjxyurUdJVM4yV97JxLheIP3GkBMZwQ6quhLzD2JbNYMWE+/WSl88w==
X-Received: by 2002:ac2:58ec:0:b0:49f:ba48:4e23 with SMTP id v12-20020ac258ec000000b0049fba484e23mr1058893lfo.218.1664443309105;
        Thu, 29 Sep 2022 02:21:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 04/11] clk: qcom: gcc-msm8974: move clock parent tables down
Date:   Thu, 29 Sep 2022 12:21:38 +0300
Message-Id: <20220929092145.473009-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

Rearrage clock parent tables and PLL declarataions (pull parents down
and gpll4 up), so that we can use pll hw clock fields in the next
commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b847ce852ef8..77f3497265a0 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -32,28 +32,6 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0_vote",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll4_vote",
-};
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
@@ -81,6 +59,55 @@ static struct clk_regmap gpll0_vote = {
 	},
 };
 
+static struct clk_pll gpll4 = {
+	.l_reg = 0x1dc4,
+	.m_reg = 0x1dc8,
+	.n_reg = 0x1dcc,
+	.config_reg = 0x1dd4,
+	.mode_reg = 0x1dc0,
+	.status_reg = 0x1ddc,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll4_vote = {
+	.enable_reg = 0x1480,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll4_vote",
+		.parent_names = (const char *[]){ "gpll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
 static struct clk_rcg2 config_noc_clk_src = {
 	.cmd_rcgr = 0x0150,
 	.hid_width = 5,
@@ -144,33 +171,6 @@ static struct clk_regmap gpll1_vote = {
 	},
 };
 
-static struct clk_pll gpll4 = {
-	.l_reg = 0x1dc4,
-	.m_reg = 0x1dc8,
-	.n_reg = 0x1dcc,
-	.config_reg = 0x1dd4,
-	.mode_reg = 0x1dc0,
-	.status_reg = 0x1ddc,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll4",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll4_vote = {
-	.enable_reg = 0x1480,
-	.enable_mask = BIT(4),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll4_vote",
-		.parent_names = (const char *[]){ "gpll4" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb30_master_clk[] = {
 	F(125000000, P_GPLL0, 1, 5, 24),
 	{ }
-- 
2.35.1

