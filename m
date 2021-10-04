Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1114F421A8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbhJDXYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235525AbhJDXYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:24:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB378C061760
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:22:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j5so73286610lfg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OgY8zNvw2WhMfHQqAA5LXc3bz/16L7HU5fNuNpfUeyk=;
        b=XuVi8Su7MQoJ+Y+W90CU6hVLG0hwPd0+zrzJ9mxHKE/Y2Sk+jol/0gOx7LS92isKZ4
         wljmd04K4UL40qx84YPNl4iNMEsqU7IVwB38/0VGjsZPGPtsmoHl1vSZWM5Bv+Xf6SRY
         zADECDymnlMsmrySjfvosIm2mT+V7zGDoa4j9QSX2RhuoDCcBdg/BrR0boBsEgU1luNd
         uRYSP+32ce3RXLpY++7W7Ro8A1lUu6WDG/mC5wfrNaEV4SkVq1BnsoogrrdNEU7FwOCN
         ReIvfMoZMYF1dr6xu54fqrZ/szt1kiwSByGa6m0LfwpeRyOmVmnxgSDf4sWK4Mi/6xry
         fxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OgY8zNvw2WhMfHQqAA5LXc3bz/16L7HU5fNuNpfUeyk=;
        b=clKAfqFjZnO2t35k9yUUS89lU/WiS6OoIQJDb1V0sFZoJ+VAp/aFbkAixHsmzTaL/J
         OogVOgyC+Ye57LvTRwrhOEI7iL0vs7Z6JIaH4hXNYpWyY2U0MrD20HztfRzzlNL0lJvn
         6R/ljXk0s5Mdcw7eRpXVXo2sJtPI4ymlgbRlx+kaFEyuJpe8m/VZbTqzRuhurjFpsKzK
         BFhZ5ms0gnteRiE+2gNrwWsh7qAeiYXMn/9m1Ppae0hl5KQuSxfywutBIeG30AR/JOJM
         HkUkUAptnBNYXTiqdNHx1mWbVHNYIpbdwb5FaqgYOHamyMYnjDcl8+3wiGypbwru5zsI
         lzvA==
X-Gm-Message-State: AOAM5328jwM1oMQr0r2Kn5i9QtBdLz7KHF4JPlI1/SWZ7Sl+f/KTyHfC
        ESMnNvJWRlmS7Vw5BoVcMktlUw==
X-Google-Smtp-Source: ABdhPJyTLoUr4gB4Jjvve4UPBSWqOz/r438VrTpXqZ40M1X7W61TzhmqKKKVN5rySwUQZa0HyT3U4A==
X-Received: by 2002:a2e:80c6:: with SMTP id r6mr18627598ljg.58.1633389749040;
        Mon, 04 Oct 2021 16:22:29 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h23sm1786219lja.131.2021.10.04.16.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 16:22:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
Date:   Tue,  5 Oct 2021 02:22:21 +0300
Message-Id: <20211004232225.2260665-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
References: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop specifying individual interrupts properties. Use #interrupt-cells
instead as we are switching qcom,spmi-mpp and qcom,ssbi-mpp to
hierarchical IRQ setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml  | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
index 96cb78ab6437..ba16d8553c0b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -40,12 +40,10 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    minItems: 1
-    maxItems: 12
-    description:
-      Must contain an array of encoded interrupt specifiers for
-      each available MPP
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
 
   gpio-controller: true
 
@@ -161,7 +159,8 @@ examples:
       gpio-controller;
       #gpio-cells = <2>;
       gpio-ranges = <&pm8841_mpp 0 0 4>;
-      interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
 
       pinctrl-names = "default";
       pinctrl-0 = <&pm8841_default>;
-- 
2.30.2

