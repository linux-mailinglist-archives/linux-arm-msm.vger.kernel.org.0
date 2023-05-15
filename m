Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19251702E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242166AbjEONgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242299AbjEONgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:36:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A02C199F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so30447775e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157810; x=1686749810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=py55TopUyLtYTx+EEri7Dsphl80919jDRcDJTgQqEC0flMDpk2nUbqv/KnhceMHuVR
         bRgXhdTQFw+4GwaDcFWmbN4vpEaeaZdvh5FDoJ17sPGCzYsBAiDZ7aE7NBKQBJATqG2q
         KhUhpSdUbp336UIKe+LYifKt3AW1DuQd9mp0BydCsWi2DxromacuqFqDeO1eVkXpgTCc
         Vbh6KVFWv92pSsLzozWZJ471gPwMEr+VpE0LvGurDcnwRzgWb/pPmglZhT1fPrHjdYsZ
         vZb3csvy1JcyLpslbA/HkQZatywi6z8AWMLfa+Yl9OnFh2WC/x9qabcYGW0X9gSywzYx
         2aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157810; x=1686749810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=FwUQEEIm4eNiMLeFXwkgps/xEyQdQAXgAyxQH/rnNWYXCqzppAaqeYVics0ogERcXY
         EEZaY0t+OdHojgURTo9CdHgN+C3nC3xZT6P+e5QbSRXd2WoMKVZq8jvLWMSYOmk8TVwS
         l6NCdw0sMwoPdSviI+4Trl14En9RMDw2hsWdoLSaZyIqmqRkyl8uPkrPDsE6gVyLQpV4
         RqxCv8mDYJueaII8avauyOS3jbbkrt2dXQ4d2jfGPLDnkBDkNEGoa69Bmi+3aSvafUyh
         70qjUl91KBpP87MXIJTz4Cje77ZyPFqxuUAv50hG6dQ+OPuqQW8KjompYJTmvN8eLkN4
         QFFg==
X-Gm-Message-State: AC+VfDwB8CbCB/UEsL931Uva3gCDBuA6YhNqa9Qezb1/43v0O2J8mhZC
        93KA8aut2DDJIEvT8pxVM/a3RQ==
X-Google-Smtp-Source: ACHHUZ6vrPJoAUg5h7iqgaW53cl7iK/XaSCSzWR9L1m7n4dINzPzjkrNaQwvbdA7N4WxPDtUGN1ekQ==
X-Received: by 2002:a5d:5387:0:b0:307:91a4:263b with SMTP id d7-20020a5d5387000000b0030791a4263bmr18151703wrv.13.1684157809805;
        Mon, 15 May 2023 06:36:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 03/11] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch as optional
Date:   Mon, 15 May 2023 14:36:35 +0100
Message-Id: <20230515133643.3621656-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

orientation-switch it the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation change
messages.

Add as an optional since not all versions of the dp-phy currently support
the orientation-switch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d4669..d307343388888 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -61,6 +61,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
   resets:
     items:
       - description: reset of phy block.
@@ -251,6 +255,8 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
+        orientation-switch;
+
         usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
-- 
2.39.2

