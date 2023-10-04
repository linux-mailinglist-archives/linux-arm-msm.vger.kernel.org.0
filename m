Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEEE7B7642
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 03:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239772AbjJDBXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 21:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239730AbjJDBXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 21:23:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4530DAB
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 18:23:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5044dd5b561so1781682e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 18:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696382592; x=1696987392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3yJCB/evHgpBk1/GnjoencE6NFEjBAI7Qfq764GKC4=;
        b=L6w1DvOI4DaxdeMsY4hgo7amf2YE73eo1Wr+2Kfs8Bxz36xeC4VBIPiTDNNuzBTgyS
         ubLB1mnPEFAoG4/Clf7lvHrS7H4admtswaOLRhNnD/zh8aRzSwBNqj+/+4RtrCDkQ+KA
         G3s8ANP070kREHghysr6krJrskNhWzraZYQguEp/7voHFhaq0dsYm9dKmT8kDbaAFtuj
         5fw9Ci+fLF+aD21WvsNABSMFVbOSBHKfSjrgOM5BDqMDFRT83PHQcUcYnoUnmsRvDXj7
         rKldIg4Pej9KDUzVle9UUTJJSbuDVQOCrR09hEHVPU1zNuS27qo5+ZGwxLg6iK7Qg91Q
         00mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696382592; x=1696987392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3yJCB/evHgpBk1/GnjoencE6NFEjBAI7Qfq764GKC4=;
        b=V80WoJpLrvETRbJmtrN25oNJ9w6IN9LjvfmxiceAoRad0PNQQahCgv8hRlxIxE/L2K
         MP9dCzL9fo/yXbaxlAAoDvLViTM25qfuaGJDBDRgiRepK5di6fH20lWUdRFFv7nxTc1F
         pIS06WY3su4hnvXaKijQ03wYD6Pm6j5X3+SU+VUQSRwtZQBMMYeK97qCHLjgqlJc3CAN
         rvRKuyyypAiyDK1Wmg0gVEGffussGx2QT7hQvail16/ucwTIrmf1qQy60N3n0u7vQwMb
         UnV/vVwCt1mWOrSrfoPI19f1o5o3/X5iLbi6fETPWTGeXLQSyiE0NS1lNQfBdXygKbQA
         OdkQ==
X-Gm-Message-State: AOJu0YyB4zIVoIj8qnXBToo9W18gEJOIKj6vmJ6CFV1XTpig2+8epeHs
        yUVRulS+py+QrMnAqm1MVOvk4Q==
X-Google-Smtp-Source: AGHT+IE+6F5tywq+UhxdC+/gyRjLKKJwbtKcNQW+FLXAvKoGyCRIbU3YbA7vOdXkHylL73+L5u8WhA==
X-Received: by 2002:a19:9148:0:b0:504:2d54:b4d0 with SMTP id y8-20020a199148000000b005042d54b4d0mr705374lfj.19.1696382592634;
        Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH v2 3/3] clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops
Date:   Wed,  4 Oct 2023 04:23:08 +0300
Message-Id: <20231004012308.2305273-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch MDP, AHB and ROT clocks to the clk_rcg2_parked_ops so that the
CCF can properly determine if the clock is enabled or disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e17bb8b543b5..2ce7ec864a5b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -144,12 +144,10 @@ static const struct clk_parent_data disp_cc_parent_data_2[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
 
@@ -166,13 +164,11 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
@@ -202,7 +198,6 @@ static const struct clk_parent_data disp_cc_parent_data_7[] = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
 	F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
 	{ }
@@ -219,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -543,7 +538,6 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(85714286, P_DISP_CC_PLL1_OUT_MAIN, 7, 0, 0),
 	F(100000000, P_DISP_CC_PLL1_OUT_MAIN, 6, 0, 0),
 	F(150000000, P_DISP_CC_PLL1_OUT_MAIN, 4, 0, 0),
@@ -565,7 +559,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -598,7 +592,6 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_rot_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(200000000, P_DISP_CC_PLL1_OUT_MAIN, 3, 0, 0),
 	F(300000000, P_DISP_CC_PLL1_OUT_MAIN, 2, 0, 0),
 	F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
@@ -617,7 +610,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
-- 
2.39.2

