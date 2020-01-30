Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB3714E48D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgA3VNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:13:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45487 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgA3VNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:13:04 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so2273438pgk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ff1yK3ORakl74BFXMoZy6txxvHuVUK88xYRXUF98dsA=;
        b=MYxAB1edcjlV6r/3BRKpapRWzUXehQ29kOd29k5MBGHzND9GlxROrJQyIw5k5YFgF6
         B7IaftbP1+NpMz7JGzE9cl/pb+g7t3+X+0TQQLBVsjavJtf3nn+Zo7kxntoKd54vMw20
         S8UFTnVFKywHQ4kUI+2pKV242C4MwnqMEu2PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ff1yK3ORakl74BFXMoZy6txxvHuVUK88xYRXUF98dsA=;
        b=hbVh2TZ/3QzkTwwaynhR0Ef0oMC2Kv7GJRDY0OqY7Na4SbIn7r/9pdEp0y9HMj3iWe
         Q10ugbij3nIjrMNMsp0bPKJ13zf7FZHVW2m4Xoez0ChYxJ3jO0f0/7w4+5EXifGW2nM5
         jlXMb4aSbbMsbjfhj7wlHXXV64ym+MtLpJ4jvGQfvGEjlTYnORTSF9e/JUMMC4URKw/R
         TAfc7L5Lwk0EvzbV0uOXW1u4yJJln/t4CnzTHWGTcJXY6gDZD0NJoF57r4xT3mJNf66f
         kZWAt9rX36n8ysKA2SYoAaFhM1eXQkQoUh/g1AjlCJmDujJFPxTkXoVj3o1s00j52IFX
         qOlA==
X-Gm-Message-State: APjAAAX9QCmgFcXQDLMWvrBz3kR+7TvGJGCU/XTYjxYmi7XwDZfp2BxA
        HALHq7Wfrrv7pzwcs3XYH3tMlg==
X-Google-Smtp-Source: APXvYqyPIzl14PPWapV9S3IqahdjaaFm9DzOevoItp7H+rnGagyA7gSPikF2rQBRt3T+MZi3CIWMTw==
X-Received: by 2002:a63:5fce:: with SMTP id t197mr6742454pgb.173.1580418784027;
        Thu, 30 Jan 2020 13:13:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:13:03 -0800 (PST)
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
Subject: [PATCH v3 13/15] clk: qcom: Use ARRAY_SIZE in videocc-sc7180 for parent clocks
Date:   Thu, 30 Jan 2020 13:12:29 -0800
Message-Id: <20200130131220.v3.13.If37e4b1b5553ac9db5ea51e84a6eec286cdf209e@changeid>
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
- Patch ("clk: qcom: Use ARRAY_SIZE in videocc-sc7180...") new for v3.

Changes in v2: None

 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 653fc4e6bb6f..c363c3cc544e 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -76,7 +76,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

