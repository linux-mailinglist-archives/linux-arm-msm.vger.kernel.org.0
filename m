Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DDD6DA1E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 21:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbjDFTrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 15:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237677AbjDFTrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 15:47:19 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453EB44B6
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 12:47:17 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d17so40593905wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680810436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5sfPGzO1STsPzlQrWslwAin54ULr2+T5tjHgZP/ZV4=;
        b=B1Uvu4kNEzTZzr8QGACBcWsbST+cABawIcqZ8MAHy54OGWGLeRj39VR24chDaT53+n
         7CYyaYyxx1PkNXSHFx7HA1rBERqsiZ8cb0zrTOoPXaW0pX6+rMWx+U3AzRQri9otK2ws
         JAJqi1zRRmOn3upvufbPBGf/I9w17o7BxOC7Xe/JRqMcfAfiF60jNh25+UQ3kZD89qzy
         A42Zz4Ktyrj8m9/h66fZJOsmdAUs0p+K6ID/F/iDVT7A9P9UmhO1IEUHZUVi7hPNmanN
         2LwqQRL8qm22+1ypHLZaJ8SXfaWOt8yjjUGdI9vDZ7oc+kJheBXwBwQb6tCsEJUb9+Ba
         WOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680810436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5sfPGzO1STsPzlQrWslwAin54ULr2+T5tjHgZP/ZV4=;
        b=Vjtg/56ZeK+35ub5cNNCtlJYMzmYo4e/92FPtNr4MiUAJYvwTlEXAbkqpQQK76Qv8P
         vcMvA/wK/nGxlimWGMVYuYkf2llokePaG1P6tPp3JocOFHtNoDc0rUdUkOowXnYH4WZp
         NAnUAhjNwpGZtr4vboC/yav2X6y57KzrOAAPBNgT6w9WTvsBYtitbtrQ6ci/n4WF3S0E
         2hhi/frmSEVnlrprjSL07Ox4HgQJfop7RE7Bw/l5gBpIgdpp4VSDMuc9ile+0WV/t+OQ
         NWMT2oNQRiRFdOTWHyHZ95WMlqBMT4cRP48R2bNr1QlJ3tEuVvP8VZIC+iLWypXCmZls
         FlQw==
X-Gm-Message-State: AAQBX9c1vVId0AwXTkJPl4+MFDqZU+fBe7+hmyOyzTi9lv6u3eXGUN/A
        44JeMotl/P4o5aVwebZ6MfjN7A==
X-Google-Smtp-Source: AKy350a7PMoisImA1feIeh8bMsC902JwVI3F6n4X2Vs+gqUuOBsqMi7TxwU2WibveU+6QsFju8IgWw==
X-Received: by 2002:a05:6000:118c:b0:2e2:730a:c7de with SMTP id g12-20020a056000118c00b002e2730ac7demr7846317wrx.24.1680810435705;
        Thu, 06 Apr 2023 12:47:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4793:cb9a:340b:2f72])
        by smtp.gmail.com with ESMTPSA id k15-20020a056000004f00b002c71dd1109fsm2593323wrx.47.2023.04.06.12.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 12:47:15 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/5] dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p
Date:   Thu,  6 Apr 2023 21:47:00 +0200
Message-Id: <20230406194703.495836-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406194703.495836-1-brgl@bgdev.pl>
References: <20230406194703.495836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new compatible for the QMP UFS PHY found on sa8775p platforms and
update the clocks property to accommodate three clocks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index cd0fbbd3593d..5bc93acccbad 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sa8775p-qmp-ufs-phy
       - qcom,sc8280xp-qmp-ufs-phy
       - qcom,sm6125-qmp-ufs-phy
       - qcom,sm7150-qmp-ufs-phy
@@ -25,12 +26,15 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: ref
       - const: ref_aux
+      - const: qref
 
   power-domains:
     maxItems: 1
@@ -52,6 +56,26 @@ properties:
   "#phy-cells":
     const: 0
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-qmp-ufs-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 required:
   - compatible
   - reg
-- 
2.37.2

