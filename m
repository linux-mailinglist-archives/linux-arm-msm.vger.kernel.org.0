Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198C7100A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 18:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfKRRkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 12:40:21 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:46920
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727427AbfKRRkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 12:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574098819;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=5MKxnhfZqQ0umCYyjmT0ODWbazmtAqacpiX0y4mJn1M=;
        b=jtmKCwlLfehemVRbgO1j7/Pp0YFAnAXQ3tgZnZeVp4fwU2ajfLQLH6hXwcqfj7FS
        KSPkbSMH6Gs7z2DQVkhLlCSHclb7O7Bpw3cMJ4GgBadY7k0eCBBDjEmqt0N/nErsO50
        J+nygUyWcOCCYAgbfWQ3Jn+22nv6p2oNwXrhlES8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574098819;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=5MKxnhfZqQ0umCYyjmT0ODWbazmtAqacpiX0y4mJn1M=;
        b=FqDb5C43QYPUgSwYBTTkGasx8153CSALjM73EPLmT2X5kJdLJ1FoPrlWj2yTNYEq
        tNTgF6IeP36vqNOwM/eiMcBsE/TSw9PGdfoy0qeZ0cyHIUgQxRMpzDh4kIpEbom1jPR
        hrF6dfsCNSR0IGhRV9UdBmu9/2uMJsOIBFMdr944=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49D71C58C1E
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rnayak@codeaurora.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/6] soc: qcom: rpmhpd: Add SC7180 RPMH power-domains
Date:   Mon, 18 Nov 2019 17:40:19 +0000
Message-ID: <0101016e7f99d9ec-1a5d07da-0a61-4627-bf95-fa9ae06265ca-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118173944.27043-1-sibis@codeaurora.org>
References: <20191118173944.27043-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for cx/mx/gfx/lcx/lmx/mss power-domains found
on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 3b109ee67a4d2..599208722650d 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -166,7 +166,26 @@ static const struct rpmhpd_desc sm8150_desc = {
 	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
 };
 
+/* SC7180 RPMH powerdomains */
+
+static struct rpmhpd *sc7180_rpmhpds[] = {
+	[SC7180_CX] = &sdm845_cx,
+	[SC7180_CX_AO] = &sdm845_cx_ao,
+	[SC7180_GFX] = &sdm845_gfx,
+	[SC7180_MX] = &sdm845_mx,
+	[SC7180_MX_AO] = &sdm845_mx_ao,
+	[SC7180_LMX] = &sdm845_lmx,
+	[SC7180_LCX] = &sdm845_lcx,
+	[SC7180_MSS] = &sdm845_mss,
+};
+
+static const struct rpmhpd_desc sc7180_desc = {
+	.rpmhpds = sc7180_rpmhpds,
+	.num_pds = ARRAY_SIZE(sc7180_rpmhpds),
+};
+
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

