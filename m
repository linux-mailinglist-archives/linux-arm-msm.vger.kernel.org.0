Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4928E4EAC3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 13:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbiC2L3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 07:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbiC2L3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 07:29:11 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919121E7A7A
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:27:28 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so34513715ejb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01VDwTxEMsSV0XbmHOnGJimYkyNg/JOpNOz+/ADpcB0=;
        b=BvMxNkgc1S0VcQnfUXFlBCS+4Nb98BsIZZV7peUU+wBz8eB82fVpocpRElKR4LK3eq
         8k1NXwoo3S8C9+Rwh0xA65ufrazZZNOtMPCcE9Vcus9U5Ponfo84o4jzRpfDrGhbZgaZ
         CMPPzKYx+8r1KhPys0y22BDbm0BskeberiB4TWTy5pnYkyIgzNMRcapHL9mMb/W07H7a
         m1l2URrLcujsx7jGfVMHFTUxouvPtvjZz0iff7MXMHHWUejvdu6zmksfIilAAo+20tLI
         3D/vjyrciOncRcrDebgXsjnY5C/7ovBc4dV7f1FXOSW6XV1uPVLkCb25BJBLf0n+ya4F
         QQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01VDwTxEMsSV0XbmHOnGJimYkyNg/JOpNOz+/ADpcB0=;
        b=05iFQxcSpXBtTvnK9kH/+Po1ZY0ECNR6R7qEO33GpJvEJX/as6QzQmfbN82y9mLpPm
         dQ2A6FcBOntRlfnQvB3svOKmYYXutJkJBH+kQOa3R87ZfVxwPJ/1h+W9pmqM2cyz89Lu
         XCcb9GcRkh22KFK2M3FvYsgBTIP32rCdpq0O91HhsfIRteIz/bsvGY1ZZCtpAxtw27Wi
         +z/ihXW64pwlZ5OysgGWp2jsUR/2zJYWi/1hyAOEGqzM6roRmikoqratdjyRrmHGVdp1
         fAjB8wPr4sC4up2AiliZijLDIrbPQafNeUf52hsuPUZYVZELMABEDEGgkm3HdhoGxAZf
         Y3Dw==
X-Gm-Message-State: AOAM530U8cbjBblyrwXsPo0aP5NFsS4ZuwdVaTfktIUjVU9Zd/5Ie9dE
        19cAvA111nwG2BF1P45lpDUFmg==
X-Google-Smtp-Source: ABdhPJyNZDGYnbZJS3IQCPRX65ywgdCPOxPt6na+f//rFLp8sJSuU9wfNR02wntGHAqPSk/7Tx06iQ==
X-Received: by 2002:a17:907:96a5:b0:6e0:92b:d0db with SMTP id hd37-20020a17090796a500b006e0092bd0dbmr34577054ejc.242.1648553246659;
        Tue, 29 Mar 2022 04:27:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id z13-20020a17090674cd00b006df78d85eabsm7043795ejl.111.2022.03.29.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 04:27:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: qcom: qcom,geni-se: refer to dtschema for SPI
Date:   Tue, 29 Mar 2022 13:27:17 +0200
Message-Id: <20220329112717.252647-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220329112717.252647-1-krzysztof.kozlowski@linaro.org>
References: <20220329112717.252647-1-krzysztof.kozlowski@linaro.org>
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

After adding DT schema for the SPI controller, the Qualcomm GENI Serial
Engine QUP Wrapper Controller bindings can reference it directly for
full schema validation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/qcom/qcom,geni-se.yaml       | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index a776cd37c297..1ca081b1664e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -103,27 +103,7 @@ patternProperties:
                  supports up to 50MHz, up to four chip selects, programmable
                  data path from 4 bits to 32 bits and numerous protocol
                  variants.
-    $ref: /spi/spi-controller.yaml#
-
-    properties:
-      compatible:
-        enum:
-          - qcom,geni-spi
-
-      interrupts:
-        maxItems: 1
-
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
-    required:
-      - compatible
-      - interrupts
-      - "#address-cells"
-      - "#size-cells"
+    $ref: /schemas/spi/qcom,spi-geni-qcom.yaml#
 
   "i2c@[0-9a-f]+$":
     type: object
-- 
2.32.0

