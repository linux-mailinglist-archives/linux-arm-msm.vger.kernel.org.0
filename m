Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718CB4A76CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 18:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbiBBR0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 12:26:01 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:49116 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241909AbiBBR0B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 12:26:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1643822761; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=h8AzjRwOnPFVO4sqiLJhetNSwtXuy8aMD5ZT2EWKw40=; b=QZ5uC1ot2kFcjlgdvKrh7adjyWbypc6RJPOK3ajhPHFnNGPk06Y93e3M389g9phDE1WDbhn+
 cbHi0owja2dLDKgQQ0GxyWPrXAh0EkKl4PC3f+6c7SjjJQPEJ/8eUJtTCBr/QQxMWWXHsjL1
 kVOE7m41G4nBBve7Kwc4wrQxdx4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61fabea8d9f69c72766c1ae5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Feb 2022 17:26:00
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7048DC43617; Wed,  2 Feb 2022 17:26:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AB63C4338F;
        Wed,  2 Feb 2022 17:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3AB63C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 2/2] clk: qcom: clk-rcg2: Update the frac table for pixel clock
Date:   Wed,  2 Feb 2022 22:55:40 +0530
Message-Id: <20220202172540.2458-2-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202172540.2458-1-tdas@codeaurora.org>
References: <20220202172540.2458-1-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support the new numerator and denominator for pixel clock.

Fixes: 99cbd064b059f ("clk: qcom: Support display RCG clocks")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 34251ec98def..036c8071c07a 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -730,6 +730,7 @@ static const struct frac_entry frac_table_pixel[] = {
 	{ 2, 9 },
 	{ 4, 9 },
 	{ 1, 1 },
+	{ 2, 3 },
 	{ }
 };

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

