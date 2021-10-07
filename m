Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54306425080
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 11:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbhJGJ76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 05:59:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20920 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbhJGJ76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 05:59:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633600684; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=grLuxOrRljvsBDIcmqLgOZ78xQRQ6+KbXk7lAEeruxc=; b=a0S/ideBEPP3TGR5gilUQm8dkmlnA3JoOffIKlMlQ9bKQlZAf3Nw8IZMDNA0qpxvK0/JSMjK
 uqyZnARvIkDq87ci3ggMvo70OMxdEpoHIFyphkIf0D/rENl13oj3xbM4gz9qmpFO+RllbBuL
 MOYkqUC5fY8mjDo5r2/xhBLvpOo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615ec4a503355859c845507c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:57:57
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7CEA2C43619; Thu,  7 Oct 2021 09:57:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54C5AC43618;
        Thu,  7 Oct 2021 09:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 54C5AC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v11 1/5] dt-bindings: Introduce QCOM Sleep stats bindings
Date:   Thu,  7 Oct 2021 15:27:25 +0530
Message-Id: <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
Sleep stats driver. The driver is used for displaying Sleep statistic maintained
by Always On Processor or Resource Power Manager.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/soc/qcom/qcom-sleep-stats.yaml        | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
new file mode 100644
index 0000000..5213daf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom-sleep-stats.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) Sleep stats bindings
+
+maintainers:
+  - Maulik Shah <mkshah@codeaurora.org>
+
+description:
+  Always On Processor/Resource Power Manager maintains statistics of the SoC
+  sleep modes involving powering down of the rails and oscillator clock.
+
+  Statistics includes SoC sleep mode type, number of times low power mode were
+  entered, time of last entry, time of last exit and accumulated sleep duration.
+
+properties:
+  compatible:
+    enum:
+      - qcom,rpmh-sleep-stats
+      - qcom,rpm-sleep-stats
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Example of rpmh sleep stats
+  - |
+    sram@c3f0000 {
+      compatible = "qcom,rpmh-sleep-stats";
+      reg = <0x0c3f0000 0x400>;
+    };
+  # Example of rpm sleep stats
+  - |
+    sram@4690000 {
+      compatible = "qcom,rpm-sleep-stats";
+      reg = <0x04690000 0x400>;
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

