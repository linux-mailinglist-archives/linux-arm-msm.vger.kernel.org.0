Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47111637ABC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 14:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiKXN6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 08:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiKXN5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 08:57:51 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFD512BFD3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:56:54 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id g12so2561573wrs.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5zOiHrYkBMW3rwOZKoxLE7hRWxL8uTujQnvARIzYyM=;
        b=sTv5vC7iFwaQXVfxqYnsvb358PFCDGS+VENrhxobNpUHB/fm0UNmpzGpJDwIEVI2Nk
         OBOki/p+P/oVS/wOVQZg+mu0AoAUsJrSovlmDTqqaYh65XQJVP+RtjZlhBzvNatY7xB4
         Pc48cXN2E/IiKfvtvSLLPKw1jQJpzGKyHe/Inq1RO2CC+MJQwzIswTArdaAis++cwQq7
         PO7z+a3tZWMozQ1WY7McPnXjt3dZj9AwOGj6xHV+oB9JDOcgn2yBp/WHJYfeofakig4c
         0Mq/v67SdDif3feK53qk366WNIkvvIkkGB99RhZQTm5vApVXgEfnteuZEmuD40bKAzpd
         xlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5zOiHrYkBMW3rwOZKoxLE7hRWxL8uTujQnvARIzYyM=;
        b=j3Jkxb2lJmyflD9P4ph8TYVHSO+IapkmxqjRjhqpn8yYoMAoDFeDVLpF3qQ1bn/zCx
         pV3G3F+UNutVkcR9/nRHQodL6h5ScMzPbNsBPxFCD/6CJ996goFaxA6nes55ec3bQRme
         n/mpAn4G3+jaRBRK/VGVRtK1lc4ohnZ3gyWJNWrt2zaDU7oP+AauGz6UczyRCVV9qFKP
         0bhEGgY8FDF3HhkkA+3/mNUWrzF6F8XBApd3IvsIIj71X90fcOevaFRpDtK+YgmWroUv
         aiGC1OmkmZQL9y01hiSNkW5qsVPT0PXqhvBLhJpj9qgIZpg3/4V0N1pbftj0LY24e3tu
         NdHQ==
X-Gm-Message-State: ANoB5pmuA7t4Y7ORy5LNEi7ihJ53pcKqoJjq7Wcmzv+mQffb8XJhUSOB
        a3g5zOCRyafiB5QlRU/UVlbqdQ==
X-Google-Smtp-Source: AA0mqf6CQiRmxjEuJUqBdHowtUQkcB5xTheHpZ9uR2GZ/Bi71aLpv2Vgjzj1wPUUSR3zchbR9s1oPg==
X-Received: by 2002:a5d:5290:0:b0:241:cdd4:6925 with SMTP id c16-20020a5d5290000000b00241cdd46925mr14259441wrv.525.1669298212811;
        Thu, 24 Nov 2022 05:56:52 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020adfebce000000b00241d21d4652sm1414322wrn.21.2022.11.24.05.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:56:52 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/10] dt-bindings: arm: qcom: Document SM8550 SoC and boards
Date:   Thu, 24 Nov 2022 15:56:37 +0200
Message-Id: <20221124135646.1952727-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124135646.1952727-1-abel.vesa@linaro.org>
References: <20221124135646.1952727-1-abel.vesa@linaro.org>
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

Document the SM8550 SoC binding and the MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v1:
 * added Krzysztof's R-b tag

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7637cf27d799..a586a38c3461 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ description: |
         sm8250
         sm8350
         sm8450
+        sm8550
 
   The 'board' element must be one of the following strings:
 
@@ -818,6 +819,11 @@ properties:
               - sony,pdx223
           - const: qcom,sm8450
 
+      - items:
+          - enum:
+              - qcom,sm8550-mtp
+          - const: qcom,sm8550
+
   # Board compatibles go above
 
   qcom,msm-id:
-- 
2.34.1

