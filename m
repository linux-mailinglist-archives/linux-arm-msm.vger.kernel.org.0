Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6A81A7477
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 09:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406471AbgDNHPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 03:15:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22060 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406469AbgDNHPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 03:15:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586848534; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lNzEm0vDbUbHkscSHKSsdOfb/g0Okq8OtL2lIoecLlY=; b=vdDX8+yjVW6uWtrdhc9aCaCcTD7kRibrh08U0zeQ5/lIhgv4uW2uj5R0YetmJbI3UTkhrKqq
 TQpT9qXU7vz5srXQktl8jKabd5/wjHdwEbOneTdUIwB9L3o9XAL7NZw7bBq+PpVG8ok+CesB
 bkt1jRt0+/WUfwKUiy5aiR4nblE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e956312.7f85678ad688-smtp-out-n03;
 Tue, 14 Apr 2020 07:15:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 850FCC433BA; Tue, 14 Apr 2020 07:15:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 592C3C433F2;
        Tue, 14 Apr 2020 07:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 592C3C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [RFC] opp: Fixup release of clock when using set/put clkname
Date:   Tue, 14 Apr 2020 12:45:08 +0530
Message-Id: <1586848508-1320-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixup dev_pm_opp_put_clkname() to check for a valid clock pointer
before it does a clk_put, since its likely that
_opp_table_kref_release() has already done a clk_put. Also fixup
_opp_table_kref_release() to set the clock pointer to ERR_PTR(-EINVAL)
after its done doing a clk_put so dev_pm_opp_put_clkname() can then
catch it.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/opp/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index e4f01e7..6d064a8 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1061,8 +1061,10 @@ static void _opp_table_kref_release(struct kref *kref)
 	_of_clear_opp_table(opp_table);
 
 	/* Release clk */
-	if (!IS_ERR(opp_table->clk))
+	if (!IS_ERR(opp_table->clk)) {
 		clk_put(opp_table->clk);
+		opp_table->clk = ERR_PTR(-EINVAL);
+	}
 
 	WARN_ON(!list_empty(&opp_table->opp_list));
 
@@ -1744,8 +1746,10 @@ void dev_pm_opp_put_clkname(struct opp_table *opp_table)
 	/* Make sure there are no concurrent readers while updating opp_table */
 	WARN_ON(!list_empty(&opp_table->opp_list));
 
-	clk_put(opp_table->clk);
-	opp_table->clk = ERR_PTR(-EINVAL);
+	if (!IS_ERR(opp_table->clk)) {
+		clk_put(opp_table->clk);
+		opp_table->clk = ERR_PTR(-EINVAL);
+	}
 
 	dev_pm_opp_put_opp_table(opp_table);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
