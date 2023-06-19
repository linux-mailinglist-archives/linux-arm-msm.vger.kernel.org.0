Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1BA734F5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjFSJOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjFSJON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:14:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4422C1B5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:13:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f76a4c211dso3978918e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166022; x=1689758022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
        b=smPvooVZDMG6/lDx07CAQ9B7NaGB3AL987mVEZR8fMhvsvwiUQe7FnUpQOczc4P79I
         d0LyMjJzgmJOAnqBUWgzDU/PpukuQdirk8x5OH39GJlrTiHW5ep7bXNWe8WXz0/ugg4L
         gY5+W+eixvS6mWyPZ8/o7oPIZtOsaou226x+w3Kf/teuO/bAfSFyZ3dE2r4asorxUZR0
         gs0GPTfaPlZdOf1OZA0UCS3385EIwEf9P+6R3v4yTqDJHb1qWc/8HsjPAOES3HGSrFVD
         ZsmfA8Zl71esltct8+q7H5mTk6On0dUPKq56svoaM1FapfG5hSeAKXRz5dGsJycW/aA1
         63fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166022; x=1689758022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
        b=S/c5Az3BNSrfPvU8h0IKJngFIy6mQbFjXZbY1BBWk79HGP919aFRhg5WNUzbdGs6SX
         IFSRTIKLsWWWk4hW5bSLRBEoxFKivSoe1rb+d2ryXARvtUPx8IXG79pk5uakI3TBcNnU
         vPnKh+gau/pKhvh8L2bItFvK5ELPehMcb+kAjcLW+O2aAQ+T4cxiIFId+DYwylVD9i0G
         JJxP9ko5PCJTeuo+mO4vpwPY0JLJw3gFBf2AYpNKZmwgtrefA4KlDWCSEUX+OfoAilp/
         So+ZQ5lfwstlb7E3bQ17/aQ0iMQfoCjy5M/a/LTZYs7feqbB9JvAQR92MJg0RZgjd9y6
         R8BQ==
X-Gm-Message-State: AC+VfDzxi6378mHGqNQ12EapsuZH5C9I4XgLDdPRaB+6ncuDP9VVacuf
        Ez34XWZ708zwgRCgDTiaegaIkw==
X-Google-Smtp-Source: ACHHUZ4XooL288ZUyMfrNgoXSobChLrzQ7WKm8t5OrAYR/aV6BhbpBu3jmIz3yJrLsi7NTYoVER1lQ==
X-Received: by 2002:a19:661a:0:b0:4f8:418e:1e49 with SMTP id a26-20020a19661a000000b004f8418e1e49mr4791125lfc.16.1687166022604;
        Mon, 19 Jun 2023 02:13:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c205400b003f9a6f3f240sm3072993wmg.14.2023.06.19.02.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:13:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v2 2/3] dt-bindings: phy: describe the Qualcomm SGMII PHY
Date:   Mon, 19 Jun 2023 11:13:35 +0200
Message-Id: <20230619091336.194914-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619091336.194914-1-brgl@bgdev.pl>
References: <20230619091336.194914-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the SGMII/SerDes PHY present on the sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../phy/qcom,sa8775p-dwmac-sgmii-phy.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
new file mode 100644
index 000000000000..b9107759b2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: sgmi_ref
+
+  phy-supply:
+    description:
+      Phandle to a regulator that provides power to the PHY.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    serdes_phy: phy@8901000 {
+        compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+        clock-names = "sgmi_ref";
+        #phy-cells = <0>;
+    };
-- 
2.39.2

