Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B4D3E4CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 21:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbhHITQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 15:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbhHITQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 15:16:38 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719E2C061381
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 12:16:14 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id y9so3122177qtv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0GY9KQcjEymb02nsjXZD/KTbbQ/O1w3OkJI+xrCTdDs=;
        b=Li2v0KU+Gu03jnQGQqlZeFPG7cOqI/ohK8tZGLnWnG46FYirUfxz7sTqSHS4EkfW49
         L0bodG6eiqT5+GuJTn6H93rOeCw9Iw57rFfSVycCAatbtg6u70+zaaf+rdqanCxhiv+V
         H55WRZm2LDitH+/pwqQfjybHXtjNZ4joFIj3kZWdLt5fN+3l2WjntZ212VPJfxeh6ZGh
         H39O1zfVwfG7LEuv3bH7pKSd4wSashsnLyyuyOwbdZ7zJODduH7K8aqnF3uV1NJ8kYeu
         tnEQy81v8UIMlk6Hrs9XOACZlCneyl5pGGivlF/EV331r22OwuwxU0QOwt34ylfKmfsO
         flbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0GY9KQcjEymb02nsjXZD/KTbbQ/O1w3OkJI+xrCTdDs=;
        b=iZD/3etVOK757B2DjxNfbPK7PsmLdieT1iKYmPfl8LS47BwFzs7XhxwAf7zzm2j48/
         DRc9foW7bAIN9K5ZBCOtzcU9y8QARfN+HR9M13C5+QBp73DLo+BdC6hKlYygjSVo1rKg
         W8Bqyg2daB/ejKeeUuduel6e3Z6tf9DVCLXcUDXrUXsJajDKVDd6E8mlrql5prwizg4+
         TL8VL7/wKxvh7AxkGuG7dDz1Xbadgv4XVsgnraftffayKI9dOHr2AUfjf9DtRw2ZNr0D
         kCua3BhYTPnAigwFNqeA6S8ZnMGBaXWg31EXeIOd8p7QyVir9EBRABEbqDmB1woYsA0G
         kgeg==
X-Gm-Message-State: AOAM5311VYpxElQ3NxnkInBnGdvDuMPPeFPl4kuczAgXb1rLXwpOqxjT
        kiJTYfOE4bwJkVCVnu1rThf3Uw==
X-Google-Smtp-Source: ABdhPJy+iUYyDlhSijDmVTrFTRJ3Wyb4OKW2GfCzrzpu/kd8CZPTVxbVWk2sMm4eGYuVqizaFhwGjg==
X-Received: by 2002:ac8:43cb:: with SMTP id w11mr17984815qtn.224.1628536573626;
        Mon, 09 Aug 2021 12:16:13 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id n14sm7303398qti.47.2021.08.09.12.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 12:16:13 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     steev@kali.org, tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [Patch v5 6/6] dt-bindings: thermal: Add dt binding for QCOM LMh
Date:   Mon,  9 Aug 2021 15:16:05 -0400
Message-Id: <20210809191605.3742979-8-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809191605.3742979-1-thara.gopinath@linaro.org>
References: <20210809191605.3742979-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt binding documentation to describe Qualcomm
Limits Management Hardware node.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v4->v5:
	- Renam
v3->v4:
	- Changed dt property qcom,lmh-cpu-id to qcom,lmh-cpu and made it
	  a phandle pointing to the cpu node instead of a number as per
	  Rob Herring's review comments.
	- Added suffix -millicelsius to all temperature properties as per
	  Rob Herring's review comments.
	- Dropped unnecessary #includes in the example as pointed out by Bjorn.
	- Other minor fixes.

 .../devicetree/bindings/thermal/qcom-lmh.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
new file mode 100644
index 000000000000..289e9a845600
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2021 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom-lmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Limits Management Hardware(LMh)
+
+maintainers:
+  - Thara Gopinath <thara.gopinath@linaro.org>
+
+description:
+  Limits Management Hardware(LMh) is a hardware infrastructure on some
+  Qualcomm SoCs that can enforce temperature and current limits as
+  programmed by software for certain IPs like CPU.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm845-lmh
+
+  reg:
+    items:
+      - description: core registers
+
+  interrupts:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  cpus:
+    description:
+      phandle of the first cpu in the LMh cluster
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  qcom,lmh-temp-arm-millicelsius:
+    description:
+      An integer expressing temperature threshold at which the LMh thermal
+      FSM is engaged.
+
+  qcom,lmh-temp-low-millicelsius:
+    description:
+      An integer expressing temperature threshold at which the state machine
+      will attempt to remove frequency throttling.
+
+  qcom,lmh-temp-high-millicelsius:
+    description:
+      An integer expressing temperature threshold at which the state machine
+      will attempt to throttle the frequency.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+  - cpus
+  - qcom,lmh-temp-arm-millicelsius
+  - qcom,lmh-temp-low-millicelsius
+  - qcom,lmh-temp-high-millicelsius
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    lmh@17d70800 {
+      compatible = "qcom,sdm845-lmh";
+      reg = <0x17d70800 0x400>;
+      interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+      cpus = <&CPU4>;
+      qcom,lmh-temp-arm-millicelsius = <65000>;
+      qcom,lmh-temp-low-millicelsius = <94500>;
+      qcom,lmh-temp-high-millicelsius = <95000>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+    };
-- 
2.25.1

