Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA1E4F2370
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 08:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiDEGjr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 02:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiDEGji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 02:39:38 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F67A1DA61
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 23:37:29 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id k2so6471373edj.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkNq85qPOI7aSExG2f6bqi9CbTw2Z98UufMNFS7y9hQ=;
        b=DSWdCY9WQrJFA8E1FXKajVjnMTNqcnYl+Lm1lhCIRO14Mzfny7zw8kkter4IyxwbBl
         m1DyDlEjPxcS9Yk8Zg633uV0t2BczWdgEdMo04414GmZoYjkdzjq8FJriMqkwbWnT9Dn
         4xiai8JDrieEzl06R/RpxDPHDdBJYbqVSmKLNab0+3nKzuV++kr898f5Qy27NUDjdfZJ
         7qm01gjW0cMM4nNdprpTTJwlJnyIP3NqJv9GAhD16x21Hl9F5feTTFsYClRpPwTzcmmr
         iv4tCea8pbQ4MwyNdFBWToLkE0xWFPFnBYoyGD6ph/W15qFoKwplG49lnQ1SV98YlvJ5
         ydFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkNq85qPOI7aSExG2f6bqi9CbTw2Z98UufMNFS7y9hQ=;
        b=GBWrJIC9Bpv8ZMgwjbP78Q4IX8Oq2JIjyf5vzDFAxKFwwgF+shvv8YRtgZ5JZmBPRg
         sOKPJP2n0QDcKC9rKg0QC3B6t8vDDOo2TFsFw+gDnRaSqE9JcOx+VIhFu+bf9QKvIfsL
         ST6TQ7sgHoJT3tFyFbbwnJHOjSoa97/a5PQVm+PWsYGv43HsH3t9jBNGmCwOa/RlUuou
         mQzocFmm4BAHd6EkYrxp+mJ0+1F58LAJorDGRS1838FRqLleit7MCLcxPhd0/MZqXNbA
         MRZYR+ZOco8rWkh3fiig0CCXJZfN5dZdFejFbz1ln7Sw3RV2YwigUMpggJbuJDhBXHqz
         Mszg==
X-Gm-Message-State: AOAM5334k5mv+R5rLr5cLJ/Nu1sxTy/QS2eprAsdE1ce8PTjGISCrs9C
        2ACmyP3reA1M/3RlfkUh1WIzAief5jsmnF73
X-Google-Smtp-Source: ABdhPJzg9caIzkwfLCmOHZ8f+qoNrlOeLzfVzAAQWR6C3qQe07kHQ6+GOH+nK92JINWvSt21UAXc/A==
X-Received: by 2002:a05:6402:1c87:b0:41c:dd9c:2e94 with SMTP id cy7-20020a0564021c8700b0041cdd9c2e94mr2023264edb.2.1649140647593;
        Mon, 04 Apr 2022 23:37:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm5225366ejt.50.2022.04.04.23.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:37:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: qcom: update maintainers (drop Akash and Mukesh)
Date:   Tue,  5 Apr 2022 08:37:24 +0200
Message-Id: <20220405063724.12850-1-krzysztof.kozlowski@linaro.org>
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

Emails to Akash Asthana and Mukesh Savaliya bounce (550: Recipient
address rejected: User unknown in virtual alias table), so switch
maintainer to Bjorn (as active Qualcomm platform maintainer).

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Add only Bjorn.
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml  | 3 +--
 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 1ca081b1664e..e64038e75fbc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -7,8 +7,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: GENI Serial Engine QUP Wrapper Controller
 
 maintainers:
-  - Mukesh Savaliya <msavaliy@codeaurora.org>
-  - Akash Asthana <akashast@codeaurora.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
  Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 5a60fba14bba..b175099c3360 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -8,8 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: Qualcomm Quad Serial Peripheral Interface (QSPI)
 
 maintainers:
-  - Mukesh Savaliya <msavaliy@codeaurora.org>
-  - Akash Asthana <akashast@codeaurora.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: The QSPI controller allows SPI protocol communication in single,
   dual, or quad wire transmission modes for read/write access to slaves such
-- 
2.32.0

