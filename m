Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32442263B55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 05:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgIJDXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 23:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgIJDWc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 23:22:32 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48123C061369
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mm21so2167624pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwN4Lh5cIbYb5K/fWg1B1RhUro5At/hehYhhAFZFYDY=;
        b=IYpG+o8osL3jV0fGYCHqwt9RdRbRuqmWBfR4qyAuE0L6ojF4AIt2kUBpEYzxzgJk2J
         w5ViSvufWqvaNmF17VeZMxnPIhtkxOoQKuaRHylOpBTnRM1PrsqCWy7m0qiKV698tzvM
         zCtNtkzUdcdurd+IHQADspLB0VShaLjJNk14o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwN4Lh5cIbYb5K/fWg1B1RhUro5At/hehYhhAFZFYDY=;
        b=JiDusb/R1L+NycG/vMI1ylJCqrxiyIs1pxbagjWrVwzqxe/NFhc3NT0jHXi+7GMR5f
         xykp3eTff6iIG3Yc9XyDHxr+DVi/59N7GlGQMurXf3K34yB18lcLUY/+57BSYQCaXTxd
         kKI3yl4GWWKn7XcmjVfjixwTEp6NSpjiqIHqYqSWxSxHURgSQajCaBFU07jdrv/K0USW
         aaOmU6ya9FGas0If/ewjpFgpmCDADZNLKCFRsV1GCJXw+8xw1N9QGuDgRLkOskPFetaI
         9hYvLZZhpSVLQctCwAxExJMBcQWZxVGYamvVIzxTIKdZjYtg/HoExvKh3kah8RGJiGd0
         Gz4w==
X-Gm-Message-State: AOAM533ycIw5M/Y7PKolYOVdJD2ErfYnC/m4U1J9QNbevYNIuAgtiEDP
        E3l2Qhk+Pv39LcD/BD9h+jNoTw==
X-Google-Smtp-Source: ABdhPJzGfJrijyfmzqoXN5IwnenXE95DhQ2QdA9WqdBgyxT76NbFyCxjrbB9Gnby5SlF39MaiwihCg==
X-Received: by 2002:a17:90a:e98d:: with SMTP id v13mr2893452pjy.79.1599698954869;
        Wed, 09 Sep 2020 17:49:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:14 -0700 (PDT)
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
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v3 09/10] clk: qcom: dispcc: Update DP clk ops for phy design
Date:   Wed,  9 Sep 2020 17:49:01 -0700
Message-Id: <20200910004902.2252694-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
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

