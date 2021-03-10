Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B8133467E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 19:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhCJSTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 13:19:09 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:31178 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhCJSSg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 13:18:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615400316; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Oe2A04ooxiUiKh+2PZjPlM+r01T98GTea9DKcUo6+Cs=; b=HOVDFTp6Crl4vsCsSFZWDHpEt6VE7tQCtuWi4KAJKY8e8SZ6bhaWlvPDEpTfNleWgaSuWOrL
 GLq4hLtmahlyO/mJKWKgqMX2/7uvi6YNbqwFJqGhKGMMVSGvKzUGTiAZ9LdnCpqY19dR9cX4
 pKwFdoflisSVyOaynyIGytYbYB0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60490d64155a7cd234a868db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 18:18:12
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DC086C43461; Wed, 10 Mar 2021 18:18:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB3A0C433ED;
        Wed, 10 Mar 2021 18:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB3A0C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1] clk: qcom: rpmh: Update the XO clock source for SC7280
Date:   Wed, 10 Mar 2021 23:48:03 +0530
Message-Id: <1615400283-20100-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bi_tcxo clock source for SC7280 requires a div 4 to derive 19.2MHz
from the xo_board. Thus update the same.

Fixes: fff2b9a65162 ("clk: qcom: rpmh: Add support for RPMH clocks on SC7280")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rpmh.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 91dc390..c623ce9 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -510,9 +510,12 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
 };

+/* Resource name must match resource id present in cmd-db */
+DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
+
 static struct clk_hw *sc7280_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
 	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

