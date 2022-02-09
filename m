Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B7C4AF889
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbiBIRai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiBIRai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:30:38 -0500
X-Greylist: delayed 304 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 09:30:41 PST
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 4CC92C0613C9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:30:41 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1644427841; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ba1VoMMEuOPktM9Yg6uFT+fSY9haSWpuSOTs2kbr4zg=; b=gip3xJ+WxwhCxH3QP4OEsLTiNVgymzvpC6HxIz6GeazJmN3i3JqERYwqNFDcBblY/6fDgXb5
 krqr9qwSKcOo58ISQ43r3IEfPjAn7AqH64nBsYgO7e5fwE7L+WUfjEk6SFxiWWRAoHaS8uPh
 fWoqu9gm9QDrYaoqP+akHAQbSP8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6203f9104bd957b967f5ad5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Feb 2022 17:25:36
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8B65C43638; Wed,  9 Feb 2022 17:25:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B3E74C43619;
        Wed,  9 Feb 2022 17:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B3E74C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [v1 2/2] clk: qcom: dispcc: Update gdsc flag for display GDSC
Date:   Wed,  9 Feb 2022 22:55:13 +0530
Message-Id: <20220209172513.17873-2-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209172513.17873-1-tdas@codeaurora.org>
References: <20220209172513.17873-1-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the mdss gdsc flag for SC7180/SC7280/SM8150/SM8250
to not program the transition delay.

Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
Fixes: 1a00c962f9cd ("clk: qcom: Add display clock controller driver for SC7280")
Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 2 +-
 drivers/clk/qcom/dispcc-sc7280.c | 2 +-
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 538e4963c915..c203888ab2ca 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -629,7 +629,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL |  DEFAULT_TRANSITION_DELAY,
 };

 static struct gdsc *disp_cc_sc7180_gdscs[] = {
diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index 4ef4ae231794..8e1a2d4a8120 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -791,7 +791,7 @@ static struct gdsc disp_cc_mdss_core_gdsc = {
 		.name = "disp_cc_mdss_core_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE | DEFAULT_TRANSITION_DELAY,
 };

 static struct clk_regmap *disp_cc_sc7280_clocks[] = {
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 566fdfa0a15b..4d64d499a285 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1130,7 +1130,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL | DEFAULT_TRANSITION_DELAY,
 	.supply = "mmcx",
 };

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

