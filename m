Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B8265C260
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238023AbjACOzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237976AbjACOz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:29 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC231181E
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:25 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id e13so29502056ljn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j7UMI6yB0gx8+biatJTOKWimiC5K0FnczhmeL2LSV4=;
        b=W51cgDv2r/VwSOc9e6SXXQch1oU0pXFSCbM2du4VfMAoHkUW1Z51DBbSxF7+zdnDMe
         hXtCMeRwhFJYvx+/mZyH9bewfjEn5vJj5xOeCSPQtY4HOjxQOEiZtRpNYrz2Ps+3HSwh
         MitdL60cgDfhXnzI97o3pbCvKyvQnnvA3cHl1nc32f8Fhlnj23MFhAfQuu8oxLDhe/MT
         woUh8I0QsV7n9OWQR4K7aDvJ9uQpfl2scnKDOzmMuGHCiN3JrOwmUq1htExytuE3Z+h3
         zHnja6zqNDHm8eJHcCSxjMEwNp4oQ0IWDI4/pX0Z9nCOuBdjMNy4c2BX8e/0QFyV7gTn
         Jn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j7UMI6yB0gx8+biatJTOKWimiC5K0FnczhmeL2LSV4=;
        b=RA9e+tTRbrreOm0pyajNnpf6nBsP0VksEUXLZapd2k9Er1JgjAwDPfcBUsafJATAqM
         uQu9MpYxT7sPGTTa2RNemmpbVf4OWbhL7dgN0G8ajhqjNxvM53jVbhHRydgbBoTK0eEm
         hUFMqzJXyZ2EBazdn3lTO4jmxrIq7mEW1aSi8IEx2mm2XHM5/fWH4Hird+mcuvv/iqwR
         bbx3sCJXltz2cDMxrNn4rSjlPVZhX+s8Df5IW695cNMjVvl3n0+kKzu88HkZOYxRs6Ci
         k4lJ5Ca4J/vOg76YReJSKmt7wUkX0krdQ5qm2mSclNZcZduO9326BO7AQ0m7/kJ7XYtG
         NqPA==
X-Gm-Message-State: AFqh2kpznf1szyy9/abGeNLTAtawCftAVXYRzBef/8US2qgt0lT1IEbC
        tsMdq0TkeuyXsyC593A/omMB38+anOxYav1H
X-Google-Smtp-Source: AMrXdXvj21Gu6HGg4CqvGJm5qnEGrHFsILs9GhLdwQgt5EZbNgJZy1zKXd2qNC+3/BoZFSZGZKkdSw==
X-Received: by 2002:a2e:9207:0:b0:27f:ba2d:6d64 with SMTP id k7-20020a2e9207000000b0027fba2d6d64mr8742537ljg.43.1672757723578;
        Tue, 03 Jan 2023 06:55:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 07/21] clk: qcom: gcc-msm8976: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:01 +0200
Message-Id: <20230103145515.1164020-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8976.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm8976.c
index 6b112984694c..8beb923c0e19 100644
--- a/drivers/clk/qcom/gcc-msm8976.c
+++ b/drivers/clk/qcom/gcc-msm8976.c
@@ -334,9 +334,9 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL6_OUT, 3 },
 };
 
-static const struct clk_parent_data gcc_parent_data_7[] = {
-	{ .hw = &gpll0_vote.hw },
-	{ .hw = &gpll6_vote.hw },
+static const struct clk_hw * gcc_parent_hws_7[] = {
+	&gpll0_vote.hw,
+	&gpll6_vote.hw,
 };
 
 static const struct parent_map gcc_parent_map_8[] = {
@@ -363,8 +363,8 @@ static const struct parent_map gcc_parent_map_8_gp[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 };
 
-static const struct clk_parent_data gcc_parent_data_8_gp[] = {
-	{ .hw = &gpll0_vote.hw },
+static const struct clk_hw *gcc_parent_hws_8_gp[] = {
+	&gpll0_vote.hw,
 };
 
 static const struct parent_map gcc_parent_map_9[] = {
@@ -952,8 +952,8 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.freq_tbl = ftbl_camss_gp0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
-		.parent_data = gcc_parent_data_8_gp,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_8_gp),
+		.parent_hws = gcc_parent_hws_8_gp,
+		.num_parents = ARRAY_SIZE(gcc_parent_hws_8_gp),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -973,8 +973,8 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.freq_tbl = ftbl_camss_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
-		.parent_data = gcc_parent_data_8_gp,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_8_gp),
+		.parent_hws = gcc_parent_hws_8_gp,
+		.num_parents = ARRAY_SIZE(gcc_parent_hws_8_gp),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1015,8 +1015,8 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.freq_tbl = ftbl_mclk_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_data = gcc_parent_data_7,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.parent_hws = gcc_parent_hws_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_hws_7),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1029,8 +1029,8 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.freq_tbl = ftbl_mclk_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_data = gcc_parent_data_7,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.parent_hws = gcc_parent_hws_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_hws_7),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1043,8 +1043,8 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.freq_tbl = ftbl_mclk_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
-		.parent_data = gcc_parent_data_7,
-		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.parent_hws = gcc_parent_hws_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_hws_7),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.39.0

