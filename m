Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1462917FC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 20:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbfEHSZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 14:25:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54348 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbfEHSZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 14:25:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BE40A60A0A; Wed,  8 May 2019 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339915;
        bh=d6ZspNln5w5gQUgEY1dua0RMzmMsJFKmmgLFnt2JLZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KA/v29jmT0kMOZeBuO7++A1Y8v9IQn3gLz4jB0TF/M5WRUGg7ipvWLd1Sj55wX4zt
         PBKPgGvLkkwpgGUioKJOl4O3s6tKkrZhuadMRQEaVWew3LJleDG7mlyKn1x28mly8N
         fgZAoTYuzNtCpwQkteSj4fUu3jMXh4uerQ+/eStI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 383F460769;
        Wed,  8 May 2019 18:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339915;
        bh=d6ZspNln5w5gQUgEY1dua0RMzmMsJFKmmgLFnt2JLZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KA/v29jmT0kMOZeBuO7++A1Y8v9IQn3gLz4jB0TF/M5WRUGg7ipvWLd1Sj55wX4zt
         PBKPgGvLkkwpgGUioKJOl4O3s6tKkrZhuadMRQEaVWew3LJleDG7mlyKn1x28mly8N
         fgZAoTYuzNtCpwQkteSj4fUu3jMXh4uerQ+/eStI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 383F460769
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/3] clk: qcom: rcg: Return failure for RCG update
Date:   Wed,  8 May 2019 23:54:53 +0530
Message-Id: <1557339895-21952-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of update config failure, return -EBUSY, so that consumers could
handle the failure gracefully.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 8c02bff..57dbac9 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -119,7 +119,7 @@ static int update_config(struct clk_rcg2 *rcg)
 	}

 	WARN(1, "%s: rcg didn't update its configuration.", name);
-	return 0;
+	return -EBUSY;
 }

 static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

