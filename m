Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9505B38CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIINUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiIINUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0247995BE
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:14 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s10so1161631ljp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=URKPpDds5enTnYg0WS+nZGk6NjU5/c00VgWLv5nmEVA=;
        b=HKkJ9rW5PnwQiM3dw7mtrpORHJYImFXaBICEiLN1LfiYVGpvQHelBgCNHQQurngZsu
         WnciOru/rhuM56JpATb0poxpENrdTEbEQA+SSpaqhXPKcfEtYzNXq9EHREOwznOySbNe
         2Apjht30smLogewy+m8BaoRirYJEdGRom/lhBuXtYcmVWGormIAYp1dcHdcCxEnBhVxS
         QeHiJM2yQr6sDVyNVKkMqsXpgfUHJ88MEOSxhxRScbWwMeyYTBoKks1J0MJ3dC0YcAy7
         TtmeDcmSWOOIJQDYV/QtFN1E7Labm6gb0jTNpUTQ8+4Af9IhAlufO7v+F8qrJZGyv2RX
         C2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=URKPpDds5enTnYg0WS+nZGk6NjU5/c00VgWLv5nmEVA=;
        b=6w+g3x/cUn2MBnToB6K6GoF5FDgtcOJrNxWAsJ6nIG8GxgDnIYIVDROFqTgvCgfnzh
         Nljjn2IunSZ5uFK68N+Q3lOVwDd89z3iluTcxCWMtvPwCPdqKXi7d1AumhYuMSDJlfN5
         6EEXvYb/5///IZGtcXFzN8ny3EjMQoT/TdVU5L7sKgnOnExwohtopmyKpNSfYePFMRxo
         yuPbF7uId7WS/yKDZ6RL9uhEmqxQnTPbnZ6PhWyrKqt+VSbAJEMHNsdfnxhZY7UtVsPo
         K4J02UWZW6qDYEyaDWdc5zWxU3PTFK73VxVlVQL1LK94LJYkEVDHWHfUzXLnBvTzmNoD
         9m1g==
X-Gm-Message-State: ACgBeo2LcoHdywB6HFqUgKSMmH62zPaEXg06WjBHKpubuLmGf9CW9oxz
        KM/iHKz4XqCMLE5j6URxzgntHg==
X-Google-Smtp-Source: AA6agR5tgqajbgGaVDceogKS9M6kNnje2qJMidQw7ZzXcD03CMIRiFC2fcF9PpWncaMH5QNL/BLwWQ==
X-Received: by 2002:a2e:b8d5:0:b0:25f:e94d:10a2 with SMTP id s21-20020a2eb8d5000000b0025fe94d10a2mr4231981ljp.274.1662729612376;
        Fri, 09 Sep 2022 06:20:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Date:   Fri,  9 Sep 2022 16:20:05 +0300
Message-Id: <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pxo clock to the 8960 bindings (used by the HDMI PLL)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index fdb277edebeb..2c21e120ff8d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -53,7 +53,6 @@ allOf:
           contains:
             enum:
               - qcom,hdmi-phy-8660
-              - qcom,hdmi-phy-8960
     then:
       properties:
         clocks:
@@ -63,6 +62,24 @@ allOf:
             - const: slave_iface
         vddio-supply: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8960
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          items:
+            - const: slave_iface
+            - const: pxo
+        vddio-supply: false
+
   - if:
       properties:
         compatible:
@@ -98,7 +115,7 @@ examples:
             <0x4a00500 0x100>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
-      clock-names = "slave_iface";
-      clocks = <&clk 21>;
+      clock-names = "slave_iface", "pxo";
+      clocks = <&clk 21>, <&pxo_board>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
     };
-- 
2.35.1

