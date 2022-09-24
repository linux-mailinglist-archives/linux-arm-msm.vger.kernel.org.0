Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20D75E89DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbiIXIIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbiIXIHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:07:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4CA154458
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 10so3535667lfy.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QNGxAbSYa/JdItjMwr8YuODhIc0b5cGCbpa0Z5P/1s4=;
        b=Y79NBdTflppNkFvLkmNJh+nQ2L1eIz9ZVD+Zzx12skyr5WK/wJAk+a9eChTWLHmUwV
         UQyDy2EcUDgojpppUPoDWdhocRv9Ki83j73EFjaLHx2NIblMp4kHUDM9nOneCtNxASh3
         RADiGO3GJ0a6ySYI7ii8hzxJSrQQQoXEb1OGHrE6XZb238sbNAFBzTkdDGMRG1hiarsf
         H4mC+QuiyzVhCk7VmyPCRtTxxmfOtYqj+LT9aY/h57Ymwi+CQdrAn/57aMUefYmZIaQ+
         c3KZvJGy8ZbThRpN2h2KKowv+i884+p3afnPVLXMz9hO4fP8lDX8gmFxM7cvRLsFYI87
         vTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QNGxAbSYa/JdItjMwr8YuODhIc0b5cGCbpa0Z5P/1s4=;
        b=YizUpUqNypMgbMGTur+UqGJO/dPdEICRryI7QbBDLSc8abznblDbXJLgeDGRciEIoF
         GEycH1iLwItV2esCQzoWxPO/xNX8e13r04CXmVW4vmMbmR0wImstPd5955iIOP+47hME
         dCJySOZS2nYOsHp2F9ytl0WVBIbuCMeYTxY1zTPw3uUtTdUTneOPwlo83PvxyINOtyHC
         bU5BEaalGSFs6sUSc4iSFxo3dEwYL5//wCMkil1PLhoAxERp2+1rG85Nd+m0DuPC/vsx
         HsXksHka9hlVQLiL4NBidSfG8jpxwrvHIJJsALMyBbXwglhlVJEoGiTl5ItIhW5Qmyhf
         ODNw==
X-Gm-Message-State: ACrzQf36ONo3ME7gKxC2J+tM1s6WrCCFpt9lfLqOwp/UtqDjnkV2Dvff
        EDTzc4sii3QBRfVXiePrQ+PH7g==
X-Google-Smtp-Source: AMsMyM58Fq3RHeaIMMCZOsBAT+NzJs6X5/m0DTr/n9K/5AU+Lm8RHlxEivXAiW24lBprsRiZAQKJIA==
X-Received: by 2002:a05:6512:12c8:b0:49b:8005:1d9d with SMTP id p8-20020a05651212c800b0049b80051d9dmr5043257lfg.489.1664006743222;
        Sat, 24 Sep 2022 01:05:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 27/32] dt-bindings: pinctrl: qcom,sdx55: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:54 +0200
Message-Id: <20220924080459.13084-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml         | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index fff57abf4fbc..006aeec7794f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -60,7 +60,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
 
     properties:
       pins:
@@ -122,7 +121,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

