Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DE4371912
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 18:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbhECQUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 12:20:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58633 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231234AbhECQUm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 12:20:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620058789; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=e/OPGuRLGEwYR1pewzp6RY0/l1lQ5rFiunt+wyrOuhg=; b=J1C8cuhqSOXzkCjfl/OScea7ULXagvV5kQ6lH209yPvmRzIF628rVdK8OGh36B51CtT3x7Hx
 qsNDW8cSy9K2E33QPZIAbi9EDEKRRq/QIeRIe2E7pvIKqSHEjQDdXHMy1kdu/XBfzeKj/fPD
 soTRwkkhC03H1neBzd4gldin358=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 609022a52cbba88980121350 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 16:19:49
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DD34C43143; Mon,  3 May 2021 16:19:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3491C433F1;
        Mon,  3 May 2021 16:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3491C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V4 1/4] dt-bindings: Added the yaml bindings for DCC
Date:   Mon,  3 May 2021 21:47:27 +0530
Message-Id: <e22ffcbb2c4a4b1efae1b02d53346632b4921632.1620056206.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1620056206.git.schowdhu@codeaurora.org>
References: <cover.1620056206.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1620056206.git.schowdhu@codeaurora.org>
References: <cover.1620056206.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Documentation for Data Capture and Compare(DCC) device tree bindings
in yaml format.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
new file mode 100644
index 0000000..9714c97
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/msm/qcom,dcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Data Capture and Compare
+
+maintainers:
+  - Souradeep Chowdhury <schowdhu@codeaurora.org>
+
+description: |
+    DCC (Data Capture and Compare) is a DMA engine which is used to save
+    configuration data or system memory contents during catastrophic failure
+    or SW trigger. DCC is used to capture and store data for debugging purpose
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8150-dcc
+      - const: qcom,dcc
+
+  reg:
+    items:
+      - description: DCC base register region
+      - description: DCC RAM base register region
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dma@10a2000{
+                compatible = "qcom,sm8150-dcc","qcom,dcc";
+                reg = <0x010a2000  0x1000>,
+                      <0x010ad000  0x2000>;
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

