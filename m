Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E25F3EA1D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhHLJTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:19:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35897 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbhHLJTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:19:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628759919; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=H9BL987TXxQr8icEZmvAmp/XVAdMz0I11U/9lBuccFU=; b=toKqegKWs5aQ5qcg6Cu6C8ZBDN1gvxbo1Rsq2yayUaM6TWvaiyJ3jMj1DkaBkvP/3HlfoXFK
 M7LD6iJQavVW8UbEoBh78u7WYU5XWJ2zdFNDO+fCW62Usr8cSrSWkJ4pYnp02dPMexQ5FZTd
 AJXpJOVmHhcp5sK3uY6fnbEOuhM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6114e75b66ff107904654f73 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 09:18:19
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC8B7C43149; Thu, 12 Aug 2021 09:18:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7A6AC4360C;
        Thu, 12 Aug 2021 09:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7A6AC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: msm: Add QTI download mode support binding
Date:   Thu, 12 Aug 2021 14:47:41 +0530
Message-Id: <217c22d40e0a9db713e2a55623408eca88166897.1628757036.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree binding for QTI download mode cookies
region found in IMEM.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../bindings/arm/msm/qcom,dload-mode.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
new file mode 100644
index 000000000000..90b9b6a9b75e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/msm/qcom,dload-mode.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Download Mode binding
+
+maintainers:
+  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
+
+description:
+  Qualcomm download mode cookies memory region in IMEM is used by SDI
+  (System Debug Image) firmware to determine whether to enter download
+  mode or not to collect ramdump for post mortem debug.
+
+properties:
+  compatible:
+    const: qcom,dload-mode
+
+  reg:
+    maxItems: 1
+
+  qcom,sdi-disable-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle reference to a syscon representing TCSR followed by the
+      offset and length for SDI disable register.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    imem@146aa000 {
+      compatible = "simple-mfd";
+      reg = <0x146aa000 0x2000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ranges = <0 0x146aa000 0x2000>;
+
+      dload-mode@1c00 {
+        compatible = "qcom,dload-mode";
+        reg = <0x1c00 0x1000>;
+        qcom,sdi-disable-regs = <&tcsr_regs 0x3a000 0x4>;
+      };
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

