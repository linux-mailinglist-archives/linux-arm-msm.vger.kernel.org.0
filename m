Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0351623FDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 11:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiKJKdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 05:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKJKdw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 05:33:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269C760EA3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:51 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j4so2441495lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PFI1x2UOLGGPuxSItT6ABHhObDwvJZE6i1uYRDHp2s=;
        b=h8++fBS2pxyr2GPNu9isLl7hgE9Na2lY4jetdSHW+pKSIXm+a1kglqa3gw+h33EKGt
         au2rIIxDDyt+xkupplIubUl4frIpGQplYJ+1wT/vQB4Kdl7bTHp7mlqyJqVUbpp18qN/
         fFzTqqaJQjF2gjlsa1rcY/MOg6uOTweTd+dd50SQm4M2fccdadBQpOH2r0zlNJTBuaeE
         2oAeURx0AmvANX3Ct4ckzqr9RYRK8IjfcZM8Rcs9WOVpkXPBdhE3mC0TlymH1EugvM6C
         +MajchPoT5Fv1rmFxmV74G0LVC6CW/OFZgIt48NM1kwphHISNqXgYmx8ihmH5O7Q3qUa
         7RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PFI1x2UOLGGPuxSItT6ABHhObDwvJZE6i1uYRDHp2s=;
        b=PnQeYnT0sSTZh900nayXWN4oCXMr8GYYGer93R7zz5Nd18k/1vR4Rpi4OUnra7xbia
         Xknxb2jXaqzCBDq3kN4cO7ORxn7+ZQSQuiMquuFMXgWkX8LIHC8PURbrxP6NOSiXuFre
         7bzQqC7zX32nr6OlV3GsJE9bN3SMQj0St49zrjAz79deE78s9iSEy2lnRJgoBeuqAv6E
         2K6lvAWv44KF9b2Oi9wzkaC19QkHBS53cJcFBMO0HgVy2PH/lV+QmbvlI5VGv/OmQOyK
         /8moBTzz58I1I4MjmZEPe54UnjTFpo1jUV/Jn3DEvnTjwXc7HPPsvFkK4vLYx1pJ14JM
         ZFBQ==
X-Gm-Message-State: ACrzQf3EZB8XtrfWSlaFibE28pQgbWPG2z49L8oFIfq9MuTZnSF+wwrW
        XPVh5mPDWGIaCMAktDG0souBNw==
X-Google-Smtp-Source: AMsMyM57elyIdkGQijOwn5U1eMJ89rJ+7sY61z6GclrjtREbrOefVaYeTXbvJKOSzauRWRB8glvW/Q==
X-Received: by 2002:a05:6512:475:b0:4b1:215b:167d with SMTP id x21-20020a056512047500b004b1215b167dmr1339183lfd.558.1668076429515;
        Thu, 10 Nov 2022 02:33:49 -0800 (PST)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p22-20020ac246d6000000b00498f32ae907sm2687837lfo.95.2022.11.10.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/8] dt-bindings: phy: qcom,qmp-pcie: add sm8350 bindings
Date:   Thu, 10 Nov 2022 13:33:39 +0300
Message-Id: <20221110103345.729018-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
References: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the PCIe QMP PHYs found on SM8350.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 80aa8d2507fb..8a85318d9c92 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -19,15 +19,18 @@ properties:
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+      - qcom,sm8350-qmp-gen3x1-pcie-phy
 
   reg:
     minItems: 1
     maxItems: 2
 
   clocks:
+    minItems: 5
     maxItems: 6
 
   clock-names:
+    minItems: 5
     items:
       - const: aux
       - const: cfg_ahb
@@ -104,6 +107,25 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-qmp-gen3x1-pcie-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-- 
2.35.1

