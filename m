Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E9730F4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 15:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhBDOXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 09:23:48 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:17084 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236495AbhBDOXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 09:23:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612448582; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wwYV6Ck3GBuzl06xq1r3JumrcWoG+sVnkDj7ll/vZfQ=; b=CT4aXLSE8QDrCrFsCks8MRcZy95yI1h983wZkwuk2hR4JWFzPJCHiiAwqMkaD6Lxt8q4apBa
 eaM4WUFEA7bRxrt63eoggjJtnmaK/h24lCl3CBgFo9Al9v7+UPnuTu/qZhD4CB9FbLSv/u8W
 eszcKpSoYpUiGl47f1POiWqfrKM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 601c031b0bb8f50fb9a97932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 14:22:19
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37264C433C6; Thu,  4 Feb 2021 14:22:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52A22C433CA;
        Thu,  4 Feb 2021 14:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52A22C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v6 1/4] dt-bindings: Introduce SoC sleep stats bindings
Date:   Thu,  4 Feb 2021 19:51:45 +0530
Message-Id: <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
SoC sleep stats driver. The driver is used for displaying SoC sleep
statistic maintained by Always On Processor or Resource Power Manager.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
new file mode 100644
index 0000000..1e012ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
+
+maintainers:
+  - Maulik Shah <mkshah@codeaurora.org>
+  - Lina Iyer <ilina@codeaurora.org>
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
+examples:
+  # Example of rpmh sleep stats
+  - |
+    rpmh-sleep-stats@c3f0000 {
+      compatible = "qcom,rpmh-sleep-stats";
+      reg = <0 0x0c3f0000 0 0x400>;
+    };
+  # Example of rpm sleep stats
+  - |
+    rpm-sleep-stats@4690000 {
+      compatible = "qcom,rpm-sleep-stats";
+      reg = <0 0x04690000 0 0x400>;
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

