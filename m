Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF900221C1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 07:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgGPFqA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 01:46:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57786 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727883AbgGPFp7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 01:45:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594878359; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=s7uMtS1uaiDy5X8fitfn522jwx8vKZbCcEOftzPd54c=; b=tp6ocaOH55SoiENjH15n+DFNfJEgP9GIPLttj2pvE0bytRGtxLNAFUXhDUQ+Rs9mRziza5FO
 Ut6Uw7GJP4ww/hmpaRcPcmAsImOpv5epWF5NO9LmYEJecMWytLRCLvJuTb87tiODFzvhOBT1
 UB+2ie2z5PZaI7rF/sMa21QZmqo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f0fe9847c8ca473a8a2d922 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 05:45:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5FD3EC433C6; Thu, 16 Jul 2020 05:45:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC43DC43391;
        Thu, 16 Jul 2020 05:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC43DC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power domain for perf voting
Date:   Thu, 16 Jul 2020 11:12:16 +0530
Message-Id: <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an optional power domain which when specified can be used for
setting the performance state of Venus.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
This is a resend of https://lore.kernel.org/patchwork/patch/1241077/

 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 55f2d67..1e8675b 100644
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
index 157dff8..437286d 100644
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

