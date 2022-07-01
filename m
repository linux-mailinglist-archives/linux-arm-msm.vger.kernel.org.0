Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5978D5630EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 12:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiGAKEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 06:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbiGAKEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 06:04:38 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A8E74359
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 03:04:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so1267549wml.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WVWYtq9qgpkICN1wpy8/eRBhp82z5RdrXpx5rdm1/pM=;
        b=bPB1oTsiALdh1aHAewG8DDcM7Y6A308OEyrAZWkwEvXTz5xweEJTwuKxEwlfjKUdKh
         0rY5dc8uQwpO6CTGdtjYbNYLlgyed69w2KRyoxIJlQPsXaWtAwbznwGLycU2Tpd38M/X
         iW8U/gj+q8msZlBrTuxOSLaAq3e6NYJAr05Rc8FXRjBEJkexj8f17PRk1WkNVrK+DmqS
         SzosC856omyRf+FiTX2o4vDKU5mxWcg1Fvwjy2IyBT27Ki6a6rgihS16bhFh8zxyxZRr
         3FJvK5OsNNB4MqaYgUFIDAXrZ6tFufcOfvuPwtzxNLqQZlHMCwXrMhxLfAGcbS7Z/fvm
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WVWYtq9qgpkICN1wpy8/eRBhp82z5RdrXpx5rdm1/pM=;
        b=3Q4is1lvmdOf5JBNe3O1giDmSTLhQVrUXa69dUX34QTa8eZBQKlAY1OiVRxGgiqLf8
         h4xNtwf54+GYCowgnq0fu/dQqYfZGo7HMKuoNYyQEaGDFXUmg2vmgGRvq7qUuxKt5vCC
         6JPkavcE/UPiU5A0ZdfW9WNJTiKxa/60YTblIo8AVjfBBUNVnS794onhGtH513ldKu5D
         VyaOMU647V0oMaeg98TKUNxMlduk7vWBWgYsAVENmCswXK4Ro68J7xXsS7sKqYaPpNOG
         efGXBdAft0RK64Oj1jKrGeod2jzYYCoPoBQ9Evi9fu5a7Uk7muxDZ+K4Cfm8Ehs04kff
         rsPg==
X-Gm-Message-State: AJIora/7ffIW5yXXFghucEQQQbx5lRLXZN1UcTVmSB96Iie8dCdMP4KZ
        AHQIVtZMawHJ4NmVeK2bVY7tIg==
X-Google-Smtp-Source: AGRyM1uPuOCbP0a6mF/0olXBoqm4K2ERnhaH8Qv2XtSK2cfhaQt8X/8B8T3N/FCTkxmypHAt2j+g7Q==
X-Received: by 2002:a7b:c1d2:0:b0:3a0:4c75:87cf with SMTP id a18-20020a7bc1d2000000b003a04c7587cfmr17126392wmj.200.1656669871886;
        Fri, 01 Jul 2022 03:04:31 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b003a03e63e428sm7834172wms.36.2022.07.01.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:04:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        stephan@gerhold.net, marijn.suijten@somainline.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
Date:   Fri,  1 Jul 2022 11:04:05 +0100
Message-Id: <20220701100405.3586820-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

dts validation is throwing an error for me on 8916 and 8939 with
extcon@1300. In that case we have usb_vbus but not usb_id.

It wasn't immediately obvious if there was a valid use-case for the
existing code for usb_id in isolation, however discussing further, we
concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
combinations as an external IC may be responsible for usb_id or usb_vbus.

Expand the definition with anyOf to capture the three different valid
modes.

Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index 6a9c96f0352ac..1bc412a4ac5e6 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -27,10 +27,14 @@ properties:
 
   interrupt-names:
     minItems: 1
-    items:
-      - const: usb_id
-      - const: usb_vbus
-
+    anyOf:
+      - items:
+          - const: usb_id
+          - const: usb_vbus
+      - items:
+          - const: usb_id
+      - items:
+          - const: usb_vbus
 required:
   - compatible
   - reg
-- 
2.36.1

