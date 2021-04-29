Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0EF36E929
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 12:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240612AbhD2Kwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 06:52:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17001 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240603AbhD2Kwa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 06:52:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619693504; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=o/Abxub6UqM6D/kK+RuKyeMHwFVtfO76z0CYc2ws78c=; b=MKXZk6ZCF2ezsBes+UmAPfznM4wTAlWP9qnIMh9dnFj1cFyPZjonHSWf/hXdh2sfaO5B0l9s
 NtTJKdkTeDo+F1Ysjik7rKaauggmDsC4Kdbo868U7naVkK0YS8YKGyKHonKGT14H86KmIHwX
 j76JN2Iqqf0FMxT31M69Y/RgzV4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 608a8fbf2cc44d3aea826849 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 10:51:43
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79C46C4360C; Thu, 29 Apr 2021 10:51:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16025C4360C;
        Thu, 29 Apr 2021 10:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16025C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 3/5] dt-bindings: reset: pdc: Add PDC Global bindings
Date:   Thu, 29 Apr 2021 16:21:03 +0530
Message-Id: <1619693465-5724-4-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
References: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PDC Global reset controller bindings for SC7280 SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml | 4 ++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h                  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
index d7d8cec9419f..831ea8d5d83f 100644
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
@@ -21,6 +21,10 @@ properties:
           - const: "qcom,sc7180-pdc-global"
           - const: "qcom,sdm845-pdc-global"
 
+      - description: on SC7280 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sc7280-pdc-global"
+
       - description: on SDM845 SoCs the following compatibles must be specified
         items:
           - const: "qcom,sdm845-pdc-global"
diff --git a/include/dt-bindings/reset/qcom,sdm845-pdc.h b/include/dt-bindings/reset/qcom,sdm845-pdc.h
index 53c37f9c319a..03a0c0eb8147 100644
--- a/include/dt-bindings/reset/qcom,sdm845-pdc.h
+++ b/include/dt-bindings/reset/qcom,sdm845-pdc.h
@@ -16,5 +16,7 @@
 #define PDC_DISPLAY_SYNC_RESET	7
 #define PDC_COMPUTE_SYNC_RESET	8
 #define PDC_MODEM_SYNC_RESET	9
+#define PDC_WLAN_RF_SYNC_RESET	10
+#define PDC_WPSS_SYNC_RESET	11
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

