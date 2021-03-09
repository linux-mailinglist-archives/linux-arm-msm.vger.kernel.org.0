Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A0C331EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 06:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhCIFwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 00:52:43 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:21633 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhCIFwg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 00:52:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615269156; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lBMpdPrzY1SXZUfdz4/cg5gJ5lzuQOT5jpdlDssw6oQ=; b=VdXBkk0OphgLEv4TSpTZemmRE98qoHE4S1SZTlKACpjTZBHhUX3T6JixtvQxpTM8LBhZaqKN
 t/nONuClLaDFAWjjocMEw0S2bWvWo3IlguZOuq5AqtgyrSme0JpmZ+6GJAqOFfYAIkr+uX7D
 nLPZoPKUu575nfOQrE3YoonVrEc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60470d167b648e2436bdf83b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 05:52:22
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 731B2C43461; Tue,  9 Mar 2021 05:52:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A51EC43462;
        Tue,  9 Mar 2021 05:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A51EC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/6] dt-bindings: reset: pdc: Add PDC Global bindings
Date:   Tue,  9 Mar 2021 11:21:49 +0530
Message-Id: <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PDC Global reset controller bindings for SC7280 SoCs.

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

