Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEC914E491
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgA3VNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:13:18 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44321 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgA3VNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:13:04 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so2274871pgl.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oJDKOmB7ZFL6XZ61wjwygv6X2jByNoioH7bgGcPY36A=;
        b=YIqpV+FzNGMsFaC1+rnxfdxHhv6OUiI0aoNfYn+O3ug3BwCbm+0mEJ55S3s5jZxQSG
         LeR4USvSFVcUSzZwJClMGn6TgSWEZDmmLjtbG2OLiwpkxREIF7FPVyyEnr1a8yk+mxAp
         8j3aj4RBtb+b/hdc19rzKKWlw1AbibAd2rCgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJDKOmB7ZFL6XZ61wjwygv6X2jByNoioH7bgGcPY36A=;
        b=LDUsIeIuSzv1OG2AHe1cuEK+UdJFRRwEd6HFa2tBKRPBhWwfDrb7w2ivZPOLB77Prg
         4cfjgPN20yj9p0LLVbmhCvxIpadWYgmjC02nxhe1XyfEUsJGlR2RmQ17cR1J9SKyUTt4
         PE3M7TQad0fC1w6x806WnQu9fB50xkTLjtHGLrx7yhwTA5EBWqpSQvoeXvW0t19rIupj
         7YKepGO6Oyw2FjJefxm77WLYveLlrV6TGCA5Agjnv48leQWD3Sfo2CO8sqBqeMkTtemI
         qxcaYPh5nfXMNhQlhNXwrN1sBUykNiB5sb8aqcTuJqFvpUjSd77boycyaNNYrSKak310
         Z/qQ==
X-Gm-Message-State: APjAAAVyjbMEl1Z/GluqibzKd8tzNzsuM1I8e5pb43vpkNUPzP27dUrs
        4VSa6PuT2ofiDRcMm7Z+gGJh0Q==
X-Google-Smtp-Source: APXvYqz7AldunlhVmPPd9oO5+HsNHM8r55oT4X3X2YZ/8kxsmZsDSvIeJwiLAumLcuW3X/3gWvFGrA==
X-Received: by 2002:a63:1f0c:: with SMTP id f12mr6850351pgf.247.1580418782948;
        Thu, 30 Jan 2020 13:13:02 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:13:02 -0800 (PST)
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
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/15] clk: qcom: Get rid of the test clock for videocc-sc7180
Date:   Thu, 30 Jan 2020 13:12:28 -0800
Message-Id: <20200130131220.v3.12.Ifd19a2701a102ec9f04e61a09345198383a9e937@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Get rid of the test...videocc-sc7180") new for v3.

Changes in v2: None

 drivers/clk/qcom/videocc-sc7180.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 76add30024aa..653fc4e6bb6f 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -50,13 +50,11 @@ static struct clk_alpha_pll video_pll0 = {
 static const struct parent_map video_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &video_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
@@ -78,7 +76,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

