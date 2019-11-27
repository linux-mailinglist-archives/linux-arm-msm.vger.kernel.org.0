Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4610AEF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 12:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfK0LuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 06:50:00 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:39426
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726320AbfK0LuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 06:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574855399;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=BnWwMJfUSqCLiU7rXf0pst3qGFvqPL0IaIQDsuZ/v+g=;
        b=Ve+nGtR1r6bHYZ3enPWZrD262SYqjTbEc+KczufEOIkOBlplKSYN4AaCgaHxrz0q
        RQgQUKkDK/cjRGPKDar3SuHQdqNooRC9isF57H2+XT+EGDOPd4dG3rVsYeVH0/t2b/9
        cp/+wh9SRMZUeM81kEPYFUQTrQ2vqcCxhyO0bqiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574855399;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=BnWwMJfUSqCLiU7rXf0pst3qGFvqPL0IaIQDsuZ/v+g=;
        b=AJfly1Ebv3IxkntSIqnAn8ylUcNRC5abgwm4de5RBIDfHOYPcpLucsaGxv5hDWPK
        hYeMahPrKUvvYOgw7ky/yJEQwJuPgYVHMuFhEoeSs/p7xk/9BSfvZkfcfv7Pr3HMQ5H
        hOqfKWud5IOPrNyeGCfEfpEwRl5EOrQF+39x417M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4415BC447AA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH V1 1/2] dt-bindings: mmc: sdhci-msm: Add compatible string for sc7180
Date:   Wed, 27 Nov 2019 11:49:59 +0000
Message-ID: <0101016eacb255af-3985262d-9b7e-4813-88c2-61838406e12c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.11.27-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sc7180 SoC specific compatible strings for qcom-sdhci controller.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index da4edb1..7ee639b 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -19,6 +19,7 @@ Required properties:
 		"qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
 		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
 		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
+		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
 	NOTE that some old device tree files may be floating around that only
 	have the string "qcom,sdhci-msm-v4" without the SoC compatible string
 	but doing that should be considered a deprecated practice.
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

