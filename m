Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF0425B6F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 01:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgIBXC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 19:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgIBXC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 19:02:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11801C06125F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 16:02:29 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so498444pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwN4Lh5cIbYb5K/fWg1B1RhUro5At/hehYhhAFZFYDY=;
        b=HVwSupNRyAt5qg38NUR/fQsc16sOP7RT0vs04n7Ld8c0xycgsACvoptse10SGP2ptz
         BegceDPWP7y72W3BZ4Z+7C7t2lo8KaESMi/CIKGrvETNT2fzyF5QdOa//FhxwzsLI9wX
         DV+FptzZFasdr1/mr2sHHPMam49JA0dB7LynE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwN4Lh5cIbYb5K/fWg1B1RhUro5At/hehYhhAFZFYDY=;
        b=ESBoMTYiimZds02UdSf3/0Ld8R7Q/ycNjxy8BDM3dp+Naa2/npFaIM7SwYOTZR12sS
         JVhkoM94hyDm6qBGr8hotWY7+uNKDPUQMdmp7Adzvk3aaxz7DXAvkCIkVqrfalG9QUM+
         2+igMaZMb0vgoD6AVm0ZtX/l30+UFDyuDzFHslFKPmVDaON+byBdAyqD5gFjViRm5yWO
         3gAnUQPdVczzwW4L4kD0DTPQi8ex3Bpo8b7TPMTRblsVYWTfk0gLSUiLdQO+ZphOcsrG
         AxcchqbfM/aOuoW8d1rb+hplE5oHOtiw1Aoe6AIhKpfsjxVyxssZmJJKsbNUwkv3VGx0
         kQPQ==
X-Gm-Message-State: AOAM5321NRghsae1wXhp7a8rmtyFfoX3MTd7UJOwkivmSzLm5L+bL1O1
        LseQZnZlduUue6IaAXkzdSMeog==
X-Google-Smtp-Source: ABdhPJyf7Col0ONJABbEvtaMDB0Asdh5yKEaCbKFoQ5JcY/Kx/F85x+LXRanLFyxDGZudI2+5S2FyA==
X-Received: by 2002:a17:90a:d496:: with SMTP id s22mr20720pju.167.1599087748649;
        Wed, 02 Sep 2020 16:02:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x12sm410277pjq.43.2020.09.02.16.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:02:28 -0700 (PDT)
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
Subject: [PATCH v2 09/10] clk: qcom: dispcc: Update DP clk ops for phy design
Date:   Wed,  2 Sep 2020 16:02:14 -0700
Message-Id: <20200902230215.3452712-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902230215.3452712-1-swboyd@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
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

