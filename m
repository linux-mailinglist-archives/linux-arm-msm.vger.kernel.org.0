Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4821A67CD17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjAZOAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjAZN7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:39 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952506FD08
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:18 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q5so1901706wrv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yxu9ED25jI4YsnaXumV3Ax7b6QC/J0yJHopprA5xIo=;
        b=tVjYD9WT4Va5NNtVX6RP6snlZAIg/T/dWyfEhIobdh59a76Za3x00mWJlt5izQ59aL
         4Us4qHv+WQfqOA/hSrtIZOtea6eBCPM+qE1xSXjwGW0dJqNZcS85er8RKJ5o9GphJATE
         Az/dfucI8PmLzih7dG41iGvFwrDDVKg/O7RY7gyStHd0VmHmE0bn9hMdhTot4PpvFBP+
         Bkb6Cq8jwadM1USTHeI5tC8XzaZWGM+4NTwR7pXXB3+MT6CwJNK4jbjgx6exnXG/q5hR
         L6UIcsz8kchWk0InEm94v72DzMuMwSoB3vxekx1FvB1aBnd4hLryUQ1B86SRGGwabKmW
         VP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yxu9ED25jI4YsnaXumV3Ax7b6QC/J0yJHopprA5xIo=;
        b=I+uT8Ow5qGCxtpNeX29LTdDe8JxAd8Y9JbXZAJRv3xUaskakwZ5QLo1mtqYTO5IsIE
         866cVl+bf+o/s8hnE4uLinwORgxcafullfgYGlcnAk5VEvRYjJd5RjNMHzfnbuS+brZ7
         sheW2wzJEI2jxBfxvHc1hTWBrxiF9jWYjgJW+8uS7Vm9+l9gdrl7Ny2fOZdZVuQP2t39
         vObiYmcyySEEj1ishZP8H0OMDGl0AEX8gXbvCKviPCl+YGZX2Zxml+romWEyxvIye49o
         WpPP9OH1FVkH5PmRJ+21ptWCv4170fJ8PhkBdDDmUHKJGm3CSx1mDq8i7XOYMa6RriHp
         RVlg==
X-Gm-Message-State: AFqh2kqRAHlLfN7p2PITH6JK8YYngLfsfKy8PEJrSwzbGPXfTm66lU0w
        HkSwbc4AgDTn5oCCYx32YE5gEA==
X-Google-Smtp-Source: AMrXdXsDK3DWCPIRP6iehIYsLBlDFOqDTH3kObw33/RQ4aaajCqfjj+naQDb3pmd097JUAdNv7HtJQ==
X-Received: by 2002:a05:6000:3c9:b0:2bc:7f32:e6ae with SMTP id b9-20020a05600003c900b002bc7f32e6aemr30290460wrg.64.1674741555300;
        Thu, 26 Jan 2023 05:59:15 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:14 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v2 1/7] dt-bindings: phy: Add qcom,snps-eusb2-repeater schema file
Date:   Thu, 26 Jan 2023 15:59:03 +0200
Message-Id: <20230126135909.1624890-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126135909.1624890-1-abel.vesa@linaro.org>
References: <20230126135909.1624890-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8550 SoC uses Synopsis eUSB2 repeater found in PM8550b.
Add a dt-binding schema for the new driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qcom,snps-eusb2-repeater.yaml         | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
new file mode 100644
index 000000000000..3b99038be74e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-repeater.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Synopsis eUSB2 to USB 2.0 repeater
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,pm8550b-eusb2-repeater
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  vdd18-supply: true
+
+  vdd3-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+    pm8550b: pmic@7 {
+        compatible = "qcom,pm8550", "qcom,spmi-pmic";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8550b_eusb2_repeater: phy@fd00 {
+          compatible = "qcom,pm8550b-eusb2-repeater";
+          reg = <0xfd00>;
+          #phy-cells = <0>;
+        };
+    };
+...
-- 
2.34.1

