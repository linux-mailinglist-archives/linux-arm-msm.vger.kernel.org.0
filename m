Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6910AD416
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 09:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfIIHov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 03:44:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34116 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfIIHov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 03:44:51 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5F2E86119D; Mon,  9 Sep 2019 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568015089;
        bh=DT6Puv+VaCuHYQ8jgGXzuP0lzjcwptMaBuGRqDBanlI=;
        h=From:To:Cc:Subject:Date:From;
        b=CjcCoHAsTOYltQu35Wu16H6kSJTltEG7Y6W89VDceG1k43niJL7FGz8wtKA2Xjwbi
         YLUGo0dVaCoqWQ/MuR0cMjmGwH1eEGOFg3ZHd708JvNmZNvoSChNcYa6rw4Gfkc2hd
         q70qdUKRLL78ZU8P7GUZASi9MyRyeGRir/U+g4fM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1D9C6115A;
        Mon,  9 Sep 2019 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568015088;
        bh=DT6Puv+VaCuHYQ8jgGXzuP0lzjcwptMaBuGRqDBanlI=;
        h=From:To:Cc:Subject:Date:From;
        b=lJbIYUVwHyj4uh+5N4zw4Y51vFTNK1QK8jzJaOoHDru8k4RsHetuBM74ZsZvpJllI
         YWWaU8ftl8o9dkuMTHSzRAfGjh2GhL3Ob2Mv3C69y4FLXXqVKY7v6WG+1BNYxgTwqY
         HGKzk+AoLLBJiFR86dOO91Ww4aC8lgQ8Nzqbm6B4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1D9C6115A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH] clk: qcom: gcc: Use floor ops for SDCC clocks
Date:   Mon,  9 Sep 2019 13:14:10 +0530
Message-Id: <20190909074410.18977-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update global clock controller SDCC2/4 clocks to use the floor rcg ops,
so as to use the rounded down clock rates for these clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 2 +-
 drivers/clk/qcom/gcc-msm8998.c | 4 ++--
 drivers/clk/qcom/gcc-qcs404.c  | 2 +-
 drivers/clk/qcom/gcc-sdm660.c  | 2 +-
 drivers/clk/qcom/gcc-sdm845.c  | 2 +-
 drivers/clk/qcom/gcc-sm8150.c  | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 39ade58b4ada..e01f5f591d1e 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1108,7 +1108,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 033688264c7b..091acd59c1d6 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1042,7 +1042,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_4,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

@@ -1066,7 +1066,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 		.name = "sdcc4_apps_clk_src",
 		.parent_names = gcc_parent_names_1,
 		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index e12c04c09a6a..582c1e2cd420 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -1103,7 +1103,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_14,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 8827db23066f..bf5730832ef3 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -787,7 +787,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div_gpll4,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 7131dcf9b060..131160ace79c 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -709,7 +709,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 12ca2d14797f..20877214acff 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -803,7 +803,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parents_6,
 		.num_parents = 5,
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

@@ -828,7 +828,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parents_3,
 		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

