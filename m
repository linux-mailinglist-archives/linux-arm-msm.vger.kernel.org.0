Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2959272CF78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 21:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbjFLT3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 15:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238061AbjFLT3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 15:29:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E28171B
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:28:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f7f4819256so35993765e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686598133; x=1689190133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8yUvBlGyCLucS3I9Zrv/eriy5Ei0ftv+0c9yM7AseQ=;
        b=nJqQ8kLwh+OQz2apJcoy3/uMsE/5K+JgYOFPKtVPs5f/OsYNqv660eQbAxyuls+8tO
         LaKzX4oUWkKxUnVMJGW8PC69/abRiE6aIXdk3v17R2U64VuqlGNxG9E2MY642gWR7pij
         uwpWnPUttv5d1fSYg+19LT8HZZU8D8rYmRD+b4xKPLJjnVYo12JLRc1ieObMALPUTki8
         fYVO/EYee4PUwxkYeOK6JFyHsKH7zoFN5kbmmKNwmU26t9M9ngFGYD88+in1jGet+UY6
         ZwOXamNkVCOFYq3SHpovNBlq3zefNeOJ33zdBgSS7L2/+4nWaU8bVobuu2qtLvw4SQTb
         QPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686598133; x=1689190133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8yUvBlGyCLucS3I9Zrv/eriy5Ei0ftv+0c9yM7AseQ=;
        b=kAqkoSUqGTI/kuHb+D4tLCyKECO5o6ye8SXCZi+hoUX83d55WzaaIm6sYSpi1ooqiH
         qBxIToSu+sQ32i2sso0ThcEdMdqSsa0UfLPbxtpKkPhqhXdYCq0unfA8lWMIKzKkkBGY
         ZfPyPrCHuiOPnkW8tHYmNn3rGolVgrEtpY8QXqoGrx8bDQalGIpZpX8llMzS/faClyyU
         E9NmNciYyL4PyZ+6uLyerSsWcxUADGqBrbBdbUsxA4j+i1QZIaYnaxuFWGhOoUp0G4Vc
         nuUSLrgOmuJ8qR4pW9GnF8wSjhAisb04NxnYoT3tq5N55gXOgXFLlyMVVXokT6n7eO1t
         H+cQ==
X-Gm-Message-State: AC+VfDwgoRHxUZwUIjQq0rimxYAnJzQZq/q1MwoVqYsR3FfCzpFRVXkV
        ejseYCR8J70Vfbknft0BYGERVg==
X-Google-Smtp-Source: ACHHUZ5s+7dkIPLYqHMszCtd9mpn604Cqkd4+MbZxXdv9vGAb9Ey2cG6XFpWszwcOqJS//8Br5IDAw==
X-Received: by 2002:a1c:7715:0:b0:3f8:153b:a51e with SMTP id t21-20020a1c7715000000b003f8153ba51emr3923980wmi.36.1686598133423;
        Mon, 12 Jun 2023 12:28:53 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c224700b003f60a9ccd34sm12286861wmm.37.2023.06.12.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 12:28:52 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND v7 1/3] dt-bindings: ufs: qcom: Add ICE phandle
Date:   Mon, 12 Jun 2023 22:28:45 +0300
Message-Id: <20230612192847.1599416-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612192847.1599416-1-abel.vesa@linaro.org>
References: <20230612192847.1599416-1-abel.vesa@linaro.org>
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

Starting with SM8550, the ICE will have its own devicetree node
so add the qcom,ice property to reference it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index b1c00424c2b0..943dafb69529 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -71,6 +71,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,ice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Inline Crypto Engine node
+
   reg:
     minItems: 1
     maxItems: 2
@@ -189,6 +193,26 @@ allOf:
 
     # TODO: define clock bindings for qcom,msm8994-ufshc
 
+  - if:
+      properties:
+        qcom,ice:
+          maxItems: 1
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        clocks:
+          minItems: 8
+          maxItems: 8
+    else:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 9
+          maxItems: 11
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

