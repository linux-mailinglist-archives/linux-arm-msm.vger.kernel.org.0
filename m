Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D337F13105C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 11:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgAFKTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 05:19:42 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54262 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726814AbgAFKTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 05:19:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578305976; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Hf9KtdRcYnbOVJ65KATJLI4ri5K0IJG8ZlZYK9OAtt0=; b=fALGzBugMUEQT8Mq7tPBxCDwtzRYcZAAKqVQPB7TvEBZqCIjz7GNK5y/BQIv+VYKqdn8kmln
 no0i09Fb4Qp+cEJd3Xg+E2N9jJMBQ8oXVL8bxOczT1qRL+3R0eLUdhlitrjs/hCvNgwFAB6z
 RM0yWtHRd5mJTkgTO4b/XxgC8eY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1309b7.7ff8dd0ae650-smtp-out-n03;
 Mon, 06 Jan 2020 10:19:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4A049C447AE; Mon,  6 Jan 2020 10:19:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0D73C447A4;
        Mon,  6 Jan 2020 10:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0D73C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/2] clk: qcom: rpmh: skip undefined clocks when registering
Date:   Mon,  6 Jan 2020 15:48:42 +0530
Message-Id: <1578305923-29125-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578305923-29125-1-git-send-email-tdas@codeaurora.org>
References: <1578305923-29125-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When iterating over a platform's available clocks in clk_rpmh_probe(),
check for undefined (null) entries in the clocks array.  Not all
clock indexes necessarily have clocks defined.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rpmh.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 7ed313a..075cc43 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -431,11 +431,15 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 	hw_clks = desc->clks;

 	for (i = 0; i < desc->num_clks; i++) {
-		const char *name = hw_clks[i]->init->name;
 		u32 res_addr;
 		size_t aux_data_len;
 		const struct bcm_db *data;

+		if (!hw_clks[i])
+			continue;
+
+		const char *name = hw_clks[i]->init->name;
+
 		rpmh_clk = to_clk_rpmh(hw_clks[i]);
 		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
 		if (!res_addr) {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
