Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2867573185C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344072AbjFOMOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344130AbjFOMOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:38 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBE91FE2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:36 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31114b46d62so620964f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831275; x=1689423275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
        b=BzuS9RSkb1VuhyVasOCaQQYQZKWLp7tuE6Z6JDP9ohQbiwfAbyhQUcDEHtwbuGnZCS
         /WDNWUTCVyl5kl7QqXN7gKM0tZktsCftZEs3sbvE0YuexJchGh+eCMXTDHvHgsriU+8A
         Zp45TeVO0oB+80O2Uf+5oOssdAurKBceYwmQdlJKALKsGdBj0eYEfylyR1bolyz7rfYY
         8O1yx5KGXUEOIaZp8FUS+nNPB3JF68dno6JjDqq33Qkk3ZAkgFRc2Uqd7REozWHh/2B9
         mYR+I37h1WzVPJJ83n7aVT8U3QRZOhuj8Nhe2qDQBsv6hiEmwMvl1lDvYcvYwZIcWN8d
         /d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831275; x=1689423275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
        b=VgRhELjzI4hvQn0l+GMKDt8ayHNUf5EMC7VnGBjiFrwbH8YU3TUq4QnybL2EUNaklX
         06NyeJeAhsDh8Jp64DP/I7VShG75WZv2DHtePMJqIIFyH8I4Wv3vp7g6B5S9KrA1lb4R
         SYydAq3MOzv2zYkF35ISfrUvt9x9BrId6nW80gk6FOSKXeO3rqzx7Qv9nRJK2mZ4zXAk
         o62Ysde0nhNNP7wiFCryRcSL7bvDnYTM9hqlClZDZcUlOAGJtt6yVFrl1YJ7uwU4lWQu
         69jf63aMxN0QYFqV0XDtdEU1Ul7PQk5kzk6XwEqAHXz59ABfdk3TjcEs01C08wL7hdXA
         oocg==
X-Gm-Message-State: AC+VfDz2gPUYPP5gdWR0WXIeC7fzWtr5O46dJ7lrz4haxR2IlNmq1kgC
        bno+mSxvHCZOr7R9gplI/nJ54A==
X-Google-Smtp-Source: ACHHUZ5LA1QLesLhMCoHz0lhOmmGMBGQ5xhcJQ2gSP2bMgCLnhUviUhuo8lryU0TLfacq14LtZqdFw==
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id h4-20020adfe984000000b0030abf2be020mr12408926wrm.45.1686831275297;
        Thu, 15 Jun 2023 05:14:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/23] dt-bindings: phy: describe the Qualcomm SGMII PHY
Date:   Thu, 15 Jun 2023 14:13:58 +0200
Message-Id: <20230615121419.175862-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
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

