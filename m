Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F91112494
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 09:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfLDIV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 03:21:57 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:50192
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbfLDIV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 03:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575447716;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=ZiTVE2JZ4Rjon7jeVHJPhOtX3KlOXsRS79Ibij6D/vg=;
        b=ddK9VcaN2ZWpzIKEn1Iwg0ufQqlAMOZet6ZX3pLTcYnm8MRjITvGHR0VHjOBDv1r
        JWs/iQfqcYV9My8CD2BFq8uigY/nCocc0/WsTZTikMMIqxGeRP/50DxZN640eZHt6YP
        xRpSADyFxflH8JmV1fyMj4GngpZS107XFlLR2trQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575447716;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=ZiTVE2JZ4Rjon7jeVHJPhOtX3KlOXsRS79Ibij6D/vg=;
        b=atFklPKY214xd5Dqvi9m++2xBfHGY2Btz/gSgzz9c6RRPvBML3n9vfQGDnzE7BE+
        jEFGTOjCan0TTqXwMnbl+UIL9x99WsQgiGnR/RFKrWCSEb5nok2uie6tH2MXpaqgs17
        qYpMnS9NEHiUNfl1Y3J0k3018Gl8lCARHi2yYMh8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8F16C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
Date:   Wed, 4 Dec 2019 08:21:56 +0000
Message-ID: <0101016ed0006092-b6693b0f-f8c6-428a-9b64-f6e1f4606844-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
X-SES-Outgoing: 2019.12.04-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSS clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,mss.yaml        | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
new file mode 100644
index 0000000..4494a6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Modem Clock Controller Binding
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm modem clock control module which supports the clocks.
+
+properties:
+  compatible :
+    enum:
+       - qcom,mss-sc7180
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+examples:
+  # Example of MSS with clock nodes properties for SC7180:
+  - |
+    clock-controller@41aa000 {
+      compatible = "qcom,sc7180-mss";
+      reg = <0x041aa000 0x100>;
+      reg-names = "cc";
+      #clock-cells = <1>;
+    };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

