Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F14514E49E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgA3VM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:12:59 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34823 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgA3VM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:12:58 -0500
Received: by mail-pj1-f66.google.com with SMTP id q39so1887021pjc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yu0tE7jCuc6P8Gf0TRcnvY0HOtkhehB0sRgbam9S9mw=;
        b=Je+x7bEtn5i3uQsAgU/yZApWLhvhZW3/2d72VMBn2q/jp4B/Lg31E1y9p+AZJL7EfP
         vJkGT1OPjh5E2VfxFTarfRiCAoo7+TTuacupdT7JgJeW/vLG960sIadA8IWOLcGI/J3O
         Wlc7wQ/fsJ/VDPQINCi0us6BZskCD94DfNoQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yu0tE7jCuc6P8Gf0TRcnvY0HOtkhehB0sRgbam9S9mw=;
        b=JiEG878krQbHK5wH5Xt1SeVDhFB5R//+Y/wsv9GwT+mZnMFE2H7EIaEw7uWr9bZG6p
         fqZSvmJqgMZrPufJ0pZuyRZPZwEhewCZmC26CTSbU/vjffc5PFCJ3IG/f+NRXtUFWHfm
         HgReub52EK/SVMVl5SLHdtqfODPTsNm70OM9VHwIIYRujhxJfbijuVG97McVYWKEtiLd
         ceyBUP+B92FwgW3TQYJBEHCgt+YkyxL0EonMXVv+jDzznoMGnPKNdXSRCeBoaVXTZr0L
         /yteNgqqFYx/Zq9g20DnUzILmKzrOy/2WDN8/6/f/SvwmGkAUFUrIlGXMZ60VG6Cgb5Q
         kc8w==
X-Gm-Message-State: APjAAAVORFw8OG6HYW25iSM2wr25VXqFU/DvEqmskVfc6s/wgoKcw3gH
        0HOHknL8ZQsP8NfdOPCUpXP8Iw==
X-Google-Smtp-Source: APXvYqxFB9FtjEV5zQEOPdZ7X0UoEqfIuzNb4PuQXx+lCD7gy7P89y7mtGonSJ1Mrz6R4NCRPiYM8w==
X-Received: by 2002:a17:902:ab98:: with SMTP id f24mr6460428plr.338.1580418776031;
        Thu, 30 Jan 2020 13:12:56 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:12:55 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/15] clk: qcom: Use ARRAY_SIZE in dispcc-sc7180 for parent clocks
Date:   Thu, 30 Jan 2020 13:12:22 -0800
Message-Id: <20200130131220.v3.6.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
been doing this it would have prevented a previous bug.  See commit
74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Use ARRAY_SIZE in dispcc-sc7180...") split out for v3.

Changes in v2: None

 drivers/clk/qcom/dispcc-sc7180.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 397f5d9dafc8..dd7af41e47eb 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -154,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -168,7 +168,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -188,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -201,7 +201,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -215,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -229,7 +229,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -244,7 +244,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -267,7 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_5,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -309,7 +309,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog

