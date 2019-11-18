Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51186100A87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 18:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKRRkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 12:40:17 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:45946
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726461AbfKRRkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 12:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574098803;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=D+qzsjQFvwEHeF6Jdqmzkusi1quRYgFgN764fiHoWOM=;
        b=h35xw2itNPH+FrbO5+8Fp2h6bgHrJGrwot9CJ0OMqRVAXQp+EDuNCFewIrqS534a
        mWo13w1cNVIVGQ6xP/8nnbK11Gm25CRyfHhp6Mb979kubXUzZraMHEakKgb+GuPTuYd
        OcWpj5oI0Ji4YkCrq1vyW4PpaSmA6+0kCnHB154E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574098803;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=D+qzsjQFvwEHeF6Jdqmzkusi1quRYgFgN764fiHoWOM=;
        b=P8LnezQZ6BzOTEO33ejxNTqnPK3UXTpKDvLJkIvd8tJsnDRntucDmk/20FCWWiQ6
        h56w4Hkk4oSS7SyPGDUd/4U70/s1qTwSGmGzyor9G+dcAbf5bfU1IuPJtuyfhRmUDKW
        vYTVMlv815ovjUp2GdBY2AVrJwFx5XTsNKDQ5bpI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3662C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rnayak@codeaurora.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: [PATCH 1/6] soc: qcom: rpmhpd: Set 'active_only' for active only power domains
Date:   Mon, 18 Nov 2019 17:40:02 +0000
Message-ID: <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118173944.27043-1-sibis@codeaurora.org>
References: <20191118173944.27043-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

The 'active_only' attribute was accidentally never set to true for any
power domains meaning that all the code handling this attribute was
dead.

NOTE that the RPM power domain code (as opposed to the RPMh one) gets
this right.

Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/soc/qcom/rpmhpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 5741ec3fa814c..51850cc68b701 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -93,6 +93,7 @@ static struct rpmhpd sdm845_mx = {
 
 static struct rpmhpd sdm845_mx_ao = {
 	.pd = { .name = "mx_ao", },
+	.active_only = true,
 	.peer = &sdm845_mx,
 	.res_name = "mx.lvl",
 };
@@ -107,6 +108,7 @@ static struct rpmhpd sdm845_cx = {
 
 static struct rpmhpd sdm845_cx_ao = {
 	.pd = { .name = "cx_ao", },
+	.active_only = true,
 	.peer = &sdm845_cx,
 	.parent = &sdm845_mx_ao.pd,
 	.res_name = "cx.lvl",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

