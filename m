Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE4687ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbjBBNid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbjBBNic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:38:32 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8098B345
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:38:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k16so1416408wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yxu9ED25jI4YsnaXumV3Ax7b6QC/J0yJHopprA5xIo=;
        b=w2eUQMvLTM92x0vwuuRT1Wgf7qa6j7dzWEgymh3T0i7zYyTFaakJFn5WBeHy1M+XWB
         vYyYQh8guPId2wvoTL3lCCSgryIPjT4pqUhys/eTmXUPuOUUY+Yoz8mwDa4QuzuC+ohR
         rKIrT2hTqTubouUxdjA32JFmvFtuha5ts64evAHyS18cKRTlHiPqMMw3uFPpkXznKKjh
         j3HufhGJdiG97qbygLNWB5eX6SoGbQIZK6ZZoreu4aPDbnUrFebLvs7Cdmmb/h0PK8st
         /7qXYiYgZbc+FYw4EXAxCVsmx4iD0B6SAlRcQT1UPvM5o1MhOA4ztvoWOQoPjkxuBdhC
         SJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yxu9ED25jI4YsnaXumV3Ax7b6QC/J0yJHopprA5xIo=;
        b=dW4GVElBaWr97ED64wAhwsyN5xUbGCu/DCORhI2JjHJsvA3s1bLGLraDZym9ENQEYz
         RULlXqwG87Y1Cz+Y3b8uZimPTSoUOBe1RYEpRQt/0WZ5CAlDZhxzJx/bDVIoQU5BF0OA
         z6N+PcWag6W7Kmq1buC1/RoXzISqV3Syht9BNBx+7efyYgBJceVBh+mgOswGMQsf0Id7
         yz7VTuMiOddkSb/2GS1EaEwbPSCQM3GaP5PqD9/OcdY8XkjqOQgi0IYsEhkmgLqwbhO2
         E3ty12ynZbByTLXYkYevueUnLec6NDge8D83oQixwNdoxAz5l6ZqY3eFUy9ReELxxBg4
         Mw4Q==
X-Gm-Message-State: AO0yUKWD6wKH3L+3xSJvQikS/N7qaQDtt6sYmCVgk1TJquBIB+12KGgE
        YxVHBQD9ByoEZh5ANWoKXJ0HoA==
X-Google-Smtp-Source: AK7set/XlhVcSy1s2ql7DbgL+4Fy4kL5rb4EcdZ+qg7OpWHsPtWFgTOEgZ6BWYFLqh+UdqMYaFQsOA==
X-Received: by 2002:a05:600c:3151:b0:3dc:5342:9f53 with SMTP id h17-20020a05600c315100b003dc53429f53mr6422602wmo.38.1675345109275;
        Thu, 02 Feb 2023 05:38:29 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b003daf7721bb3sm4672657wmq.12.2023.02.02.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:38:28 -0800 (PST)
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
Subject: [RFC v3 2/7] dt-bindings: phy: Add qcom,snps-eusb2-repeater schema file
Date:   Thu,  2 Feb 2023 15:38:11 +0200
Message-Id: <20230202133816.4026990-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202133816.4026990-1-abel.vesa@linaro.org>
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
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

