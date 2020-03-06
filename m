Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26717B750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 08:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgCFHYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 02:24:00 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:34024 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725905AbgCFHX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 02:23:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583479439; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=UBOFURm4ibb/cnoI9dEpQch9qApxzL8zn4xOLlpoH+U=; b=Fzs7v+4L5A/L6T9bFD+47a+CJOHGM2pX4h8veSc0LnJNDDgcDBELloburdRhmyNuqOY85g7B
 Ix+sTaCp5g7TiVCsHpaiG8wxYaiLR+BextuyZX02OK9FA6ZTGFV/vdYL2MnXFOV4FOyV7ZeX
 +XxSl58LxJCMgOKEACcpDsKg5Ao=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e61fa83.7f6e3358cab0-smtp-out-n01;
 Fri, 06 Mar 2020 07:23:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 774A6C432C2; Fri,  6 Mar 2020 07:23:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DC8EC433BA;
        Fri,  6 Mar 2020 07:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7DC8EC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v3 1/4] dt-bindings: Introduce SoC sleep stats bindings
Date:   Fri,  6 Mar 2020 12:53:29 +0530
Message-Id: <1583479412-18320-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
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
---
 .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
new file mode 100644
index 00000000..7c29c61
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
+    rpmh_sleep_stats@c3f0000 {
+      compatible = "qcom,rpmh-sleep-stats";
+      reg = <0 0xc3f0000 0 0x400>;
+    };
+  # Example of rpm sleep stats
+  - |
+    rpm_sleep_stats@4690000 {
+      compatible = "qcom,rpm-sleep-stats";
+      reg = <0 0x04690000 0 0x400>;
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
