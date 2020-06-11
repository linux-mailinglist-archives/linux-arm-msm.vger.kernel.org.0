Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDAC1F648B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgFKJTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbgFKJT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:19:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6490AC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 64so2411652pfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTsMeg4vyd9NRR5Rj/DoPOZmYiOOPa9H+MmhUUb38k4=;
        b=GYPtcV9+l05piTDpgqOED+PWYv3+df97KXsvDlCaYY4CxijoAnPeb5tiU9eAB+nN+L
         Z7OSrTmFeZLiPCbn+EXJFUA+Isg5f38LKvU1o2xCuMhuENjBORT5Jx7fSo0o1kGMPAi1
         vNv4Hch+sXO/QW4mFcD2TTWsoUbTu8sOBgLGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTsMeg4vyd9NRR5Rj/DoPOZmYiOOPa9H+MmhUUb38k4=;
        b=UpKAn3ekoQ6mC4Bj4l5XsBPvoEgInQXwiHZOl0FRlY6H6b9qVgcFI682flAuLeaCcZ
         TATF0ubvbVLqm9lTP4TV3F5IUZkkCfARpoCSXZrn4ojBwr2A5RsfXHISs8HwB6z2Xhy3
         bilkKrTU7USoanS5R8DtkBN5N9s9ElRnJIAarw2p5mMTLGpzdt5FRYbNeOuo9Nh4xFR1
         FDwzJb9fOPXpPPgNDtaZbp4yTUg9lvpoUNsP+vL1UnwN0M2F6zC7GzIpMgv8X/5vbeGR
         1/scu78Jz4b9EIs36a1LHWhCcJzrmSl6eAzd91L0m6s0ysUF9E4SqWWqwoAqH92/yky+
         Qi+w==
X-Gm-Message-State: AOAM5301K3vm1/2ymrRZGXDvIfTtA4+S9KExc8gryROQZVunDR7Monzg
        w/G+kU1cJpWpUmoohVgQYJ8JiQ==
X-Google-Smtp-Source: ABdhPJxyyP8c8/ur/yOtbyoJb7vcLI2mgwS4h7Kvldt0IWVC5/shygbsLSvpCn+82RfazItS7w8Z7w==
X-Received: by 2002:a63:497:: with SMTP id 145mr5961513pge.356.1591867167968;
        Thu, 11 Jun 2020 02:19:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 02:19:27 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH/RFC 7/8] clk: qcom: dispcc: Update DP clk ops for phy design
Date:   Thu, 11 Jun 2020 02:19:18 -0700
Message-Id: <20200611091919.108018-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clk_rcg2_dp_determine_rate() function is used for the DP pixel clk.
This function should return the rate that can be achieved by the pixel
clk in 'struct clk_rate_request::rate' and match the logic similar to
what is seen in clk_rcg2_dp_set_rate(). But that isn't the case. Instead
the code merely bubbles the rate request up to the parent of the pixel
clk and doesn't try to do a rational approximation of the rate that
would be achieved by picking some m/n value for the RCG.

Let's change this logic so that we can assume the parent clk frequency
is fixed (it is because it's the VCO of the DP PLL that is configured
based on the link rate) and so that we can calculate what the m/n value
will be and adjust the req->rate appropriately.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-rcg2.c      | 19 +++++++++++++------
 drivers/clk/qcom/dispcc-sc7180.c |  3 ---
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 357159fe85b5..59a5a0f261f3 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1182,14 +1182,21 @@ static int clk_rcg2_dp_set_rate_and_parent(struct clk_hw *hw,
 static int clk_rcg2_dp_determine_rate(struct clk_hw *hw,
 				struct clk_rate_request *req)
 {
-	struct clk_rate_request parent_req = *req;
-	int ret;
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	unsigned long num, den;
+	u64 tmp;
 
-	ret = __clk_determine_rate(clk_hw_get_parent(hw), &parent_req);
-	if (ret)
-		return ret;
+	/* Parent rate is a fixed phy link rate */
+	rational_best_approximation(req->best_parent_rate, req->rate,
+			GENMASK(rcg->mnd_width - 1, 0),
+			GENMASK(rcg->mnd_width - 1, 0), &den, &num);
+
+	if (!num || !den)
+		return -EINVAL;
 
-	req->best_parent_rate = parent_req.rate;
+	tmp = req->best_parent_rate * num;
+	do_div(tmp, den);
+	req->rate = tmp;
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 0a5d395bce93..f487515701e3 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -202,7 +202,6 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -216,7 +215,6 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -230,7 +228,6 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
 };
-- 
Sent by a computer, using git, on the internet

