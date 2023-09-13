Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C096479E43D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 11:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239364AbjIMJyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 05:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239505AbjIMJyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 05:54:06 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5328B1BF1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 02:54:01 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so113643891fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694598839; x=1695203639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGEWNaFOSGbgLmGphSZoYFcO8R5kpnOWxma4oPpmrkM=;
        b=Y0rqKamB+0p5b5AijOQbmrkJsDGgm731hDVScfGpt/C0RvnbsfPYKUTYqRpRiHxy5b
         G7fK5YG608PoM/o0q0J+nxOLYwN3Xo9d7na95hEw2y/G+p+aSFtQgyvn+PsCn98zrSaz
         OIuqX6+AQ44EZKsMggMDl5ZqgYILp8lj5ZX/biucnyK1h/LyU/p8HN9nnHqPWBz9ZWve
         A59yd6Q2K2W37/4ZRjKLD/dM2UZIcHiHYBOmNRGnntn6pnc79c/wLIYbNoKHCzVRZqMO
         XjtuB5yqyDTCLNs6fsA8CJfS8MS8Qi7acyVv/4hIEbeQ5oa7H+CZZt8El+HpdtpTzvmp
         ZcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598839; x=1695203639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGEWNaFOSGbgLmGphSZoYFcO8R5kpnOWxma4oPpmrkM=;
        b=i3qTCgx3MQHRFwAWKlA84elT4Tix+9TX6wt8IX7teYCTfBrAyBQ/T0P9HMe8S5G5RZ
         F+rya8TSadytPHGAxpBybljeO3BWoIKRGJoW9kVoxDlqQKlpWrVwrGL63/TmtAoSjn0r
         LnXMeJAuVwTCehvMfdpkuG8vcLRfzNaHUq2odywO8LgNGeqR/iAM8Z36Q21Hei377h96
         ZkigV1w9lXi5LSjbAtoUd9bYtuHj7fxzYUGSiwygDzH2rDUf+hAtOedwi6U0u9OSnGe9
         Ftf6J/NLkNu/M6bqMNexSQkaHuDxy0yHLU0Ee815WNQioZIWNJbxq6RX1QUH9jFWtwWc
         YYBA==
X-Gm-Message-State: AOJu0YzwUuBwuHvIKzpj4i3K7aIZ5iSJULKkuPIU3r8aYJNljSYk1ise
        j2xCaoiiku4j0rDrp7iQnu6hEw==
X-Google-Smtp-Source: AGHT+IGRBzDoV6q1Yg7xSUFIzw7/wQfW9voe7rkKcePRlezQHiH+2VWYtd85objRfoUB5jzbALjOiQ==
X-Received: by 2002:a2e:9806:0:b0:2b9:e6a0:5c3a with SMTP id a6-20020a2e9806000000b002b9e6a05c3amr1705981ljj.48.1694598839540;
        Wed, 13 Sep 2023 02:53:59 -0700 (PDT)
Received: from [10.167.154.1] (178235177106.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.106])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906939500b00985ed2f1584sm8092669ejx.187.2023.09.13.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:53:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 13 Sep 2023 11:53:23 +0200
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 magic tuning overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-topic-eusb2_override-v2-1-7d8c893d93f6@linaro.org>
References: <20230830-topic-eusb2_override-v2-0-7d8c893d93f6@linaro.org>
In-Reply-To: <20230830-topic-eusb2_override-v2-0-7d8c893d93f6@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694598835; l=1475;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+WkmKOaL4o5Pf6bG2lB645yeG0HwBKcy91tPmktunQA=;
 b=Ma2LEKDh/8hk+rsvOx7vD/eD/ZV5DGMbX+SL8VQxrsc3O3sKPGbAoG7NjjqSM31BPA4Bth27J
 GG9ZG6Qx8DuD2gA7zYTmHwQrUqRI6EMbl/lzO269iELzs75JLwQRn/9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The EUSB2 repeater requires some alterations to its init sequence,
depending on board design.

Add support for making the necessary changes to that sequence to make USB
functional on SM8550-based Xperia 1 V.

They all have lackluster description due to lack of information.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/phy/qcom,snps-eusb2-repeater.yaml      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 029569d5fcf3..24c733c10e0e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -32,6 +32,27 @@ properties:
 
   vdd3-supply: true
 
+  qcom,tune-usb2-disc-thres:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed disconnect threshold
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  qcom,tune-usb2-amplitude:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed trasmit amplitude
+    minimum: 0
+    maximum: 15
+    default: 8
+
+  qcom,tune-usb2-preem:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed TX pre-emphasis tuning
+    minimum: 0
+    maximum: 7
+    default: 5
+
 required:
   - compatible
   - reg

-- 
2.42.0

