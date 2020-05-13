Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B331D06DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 08:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729286AbgEMGEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 02:04:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27256 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729179AbgEMGEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 02:04:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589349891; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UkD6t098TzP+r9v6wY7c61VUY/PDazOwDvlcOxcji3Y=; b=LWbUcTi3aIJBFU4UA4LP5Q8CwkjlA0bCvJ9fO7uj2dKoBZhyv9o2iw/tJKD0jrwkc2NAwlC0
 7W3AaPoX8m/2sB7kEYrWoNXd8cEqD2q4Zig4b54jAEaGjIQAmeELWm0mxt3Yk/6fLTZFMkhI
 7oeIGQ0YGq3c0wUgBeKPU7ndHvY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb8dfc.7f7a119bd340-smtp-out-n03;
 Wed, 13 May 2020 06:04:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 83E25C63C41; Wed, 13 May 2020 06:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=2.0 tests=ALL_TRUSTED,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3EABC433CB;
        Wed, 13 May 2020 06:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3EABC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2] dt-bindings: media: venus: Add an optional power domain for perf voting
Date:   Wed, 13 May 2020 11:33:27 +0530
Message-Id: <1589349807-10163-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an optional power domain which when specified can be used for
setting the performance state of Venus.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 764affa..ac1ed64 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -25,12 +25,16 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   power-domain-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: venus
       - const: vcodec0
+      - const: opp-pd
 
   clocks:
     maxItems: 5
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 8552f4a..9af78cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -25,13 +25,17 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   power-domain-names:
+    minItems: 3
+    maxItems: 4
     items:
       - const: venus
       - const: vcodec0
       - const: vcodec1
+      - const: opp-pd
 
   clocks:
     maxItems: 7
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
