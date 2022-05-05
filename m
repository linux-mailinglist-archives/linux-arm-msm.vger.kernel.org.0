Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0F751B841
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 08:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238732AbiEEG42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 02:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236758AbiEEG4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 02:56:22 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB03A47397
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 23:52:43 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id ba17so4106095edb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XYgl2GPJF28aJs5B+RpFseO5tV+QNon9XhfPoGG3PI8=;
        b=cENiLRYfcN75f6CnglIbvxA2bI2N1rua85uURj/hI1INjQwXtlAcx91G+CvRdBGO/A
         FMJbv61o2S/beNF39E3yoykvDZzzZ650S2mGeqnWK2Hc9fk/ooFW1710RMlrYLNurQW+
         W/3jR1D89YO53hYiXV7rIw1Y63kyLyRmY3imrR/DboP46AIsa4jNHu9kv/qR+tB7ndAV
         1FExkHutNpFe87thqr44bjrBSZ8jfqqgTLwr4r5VixcQshRwKf3lMp+3Twc3UF6QXjbq
         3Bj/RLE4Vt/64ci39WSKw7Kkvqp8c4+Z/jQlMadJlXol3rMw9o8TYdIFtc/cxZrCXV4q
         UTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XYgl2GPJF28aJs5B+RpFseO5tV+QNon9XhfPoGG3PI8=;
        b=7TjEU5NGT6L5qhlJSvVqRqcxi8Fwt4jvXdX4brhWORdCUWi0tJq2dliH4J8OVQZFhG
         H76O1JfEf7s2NKyJXeVh34NseEKOrUdbenxeKioXwOCkFgUzoYIwCBQPK2O//PbEi1hG
         z6sqkO7VhoeoiCU7Qd24Lh/N7358iejoWKE7D0l90Jf5yp0bNVfWo3wmcDFs6wQH6Rzy
         7QQVQUyBSym+Kq5Witj+wosE26+BYb+sppla1ASVXe/4ZkpE+Krm14YEZKtT/d7wPvgz
         2ZcWHLWozUNEp4e2GoR98uQB53IDRAgkw4uUr3Quxs6FhPCzWLnLgyFNno0HASIktXA5
         PQmA==
X-Gm-Message-State: AOAM530p3g6qVB0MKu49snbCXwV+ZXER8cbKqCWLcIWNqFocPqwfsY10
        LgbYmXgIQqa1IH0yrnZ/JkbAFw==
X-Google-Smtp-Source: ABdhPJxUhJeE8shIpgV2fivsl6yjzln9grab1GOW4jd9EQ1iOClkHnL1HvGOjZyNRUEum2qQfmoDvA==
X-Received: by 2002:a05:6402:1148:b0:416:a4fb:3c2e with SMTP id g8-20020a056402114800b00416a4fb3c2emr28107283edw.182.1651733556865;
        Wed, 04 May 2022 23:52:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906070f00b006f3ef214e3asm378632ejb.160.2022.05.04.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 23:52:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH qcom v2] spi: dt-bindings: qcom,spi-geni-qcom: allow three interconnects
Date:   Thu,  5 May 2022 08:52:33 +0200
Message-Id: <20220505065233.28476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Recent Qualcomm Geni SPI nodes, e.g. on SM8450, come also with three
interconnects.  This fixes dtbs_check warnings like:

  sm8450-qrd.dtb: spi@a98000: interconnects: [[46, 1, 0, 46, 4, 0], [47, 2, 0, 48, 12, 0], [49, 1, 0, 50, 1, 0]] is too long
  sm8450-qrd.dtb: spi@a98000: interconnect-names: ['qup-core', 'qup-config', 'qup-memory'] is too long

Fixes: 5bdcae1fe1c5 ("spi: dt-bindings: qcom,spi-geni-qcom: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for a commit in MSM/Bjorn's tree.

Changes since v1:
1. Correct error msg (Rob).
---
 .../devicetree/bindings/spi/qcom,spi-geni-qcom.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index e2c7b934c50d..47e1b3ee8b1b 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -45,12 +45,15 @@ properties:
       - const: rx
 
   interconnects:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   interconnect-names:
+    minItems: 2
     items:
       - const: qup-core
       - const: qup-config
+      - const: qup-memory
 
   interrupts:
     maxItems: 1
-- 
2.32.0

