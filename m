Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16256D4132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfJKN3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:29:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39898 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728503AbfJKN3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:29:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7DA2660FE9; Fri, 11 Oct 2019 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800588;
        bh=wPt8dTRY1vwDtipaF1AobEy140jYfsyW5pbIhikPLM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BKnb1LhSPvK/Ac0DboWEOA1McNXJh4xAnbPTsR3mECobYi1XZuR3mS1Wtmjq27Sb+
         JjIEMHyia7ePRm/wXBAag8HFss0w8jq4gRgJD1VTstJ0zOxSFkSuR8/fLyuIBqK3ga
         Qxx+rvPyZrbxZxQXl0fzkuQf3ZPCvQlxPWGznAvg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E219160FEB;
        Fri, 11 Oct 2019 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800588;
        bh=wPt8dTRY1vwDtipaF1AobEy140jYfsyW5pbIhikPLM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BKnb1LhSPvK/Ac0DboWEOA1McNXJh4xAnbPTsR3mECobYi1XZuR3mS1Wtmjq27Sb+
         JjIEMHyia7ePRm/wXBAag8HFss0w8jq4gRgJD1VTstJ0zOxSFkSuR8/fLyuIBqK3ga
         Qxx+rvPyZrbxZxQXl0fzkuQf3ZPCvQlxPWGznAvg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E219160FEB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     robh@kernel.org, sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
Date:   Fri, 11 Oct 2019 18:59:27 +0530
Message-Id: <20191011132928.9388-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191011132928.9388-1-govinds@codeaurora.org>
References: <20191011132928.9388-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../bindings/clock/qcom,q6sstopcc.yaml        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
new file mode 100644
index 000000000000..bbaaf1e2a203
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,q6sstopcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Q6SSTOP clock Controller
+
+maintainers:
+  - Govind Singh <govinds@codeaurora.org>
+
+properties:
+  compatible:
+    const: "qcom,qcs404-q6sstopcc"
+
+  reg:
+    items:
+      - description: Q6SSTOP clocks register region
+      - description: Q6SSTOP_TCSR register region
+
+  clocks:
+    items:
+      - description: ahb clock for the q6sstopCC
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    q6sstopcc: clock-controller@7500000 {
+      compatible = "qcom,qcs404-q6sstopcc";
+      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
+      clocks = <&gcc 141>;
+      #clock-cells = <1>;
+    };
-- 
2.22.0

