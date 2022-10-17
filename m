Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01832600B41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiJQJpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbiJQJph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:45:37 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9605303FD
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:31 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id iv17so8288476wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEMkL9tW27qh7qB7z1dOyn6IVj+P4lSJ9BRc/xcD6yA=;
        b=tqpUPQzZ6y8RLfddNydP2ob3DrzdrSbmDv89JQJSkxJO/gDShXFCEasTlq3oLRFaRa
         q2C/qMD+2wxOT/m41kvg0DnUt/693bhJCt8SMyoHqnJlXdBrOjOotBFNls98RryeWyjX
         JLHlS5Tos1VeKN0MHtH9km/49RX0tporxGs77DhXBTok9DnHZ4XjdyLk6WdF6+w3xmZG
         PcG5SBUT0zrtLcj58vsc/afS0wZy73sPvaRTTrY92o+ZFOSbKJwc+1Zw+JlLwTKSCQxx
         pQcuxj6VfvPqjwUxLx+zybOLr6ndlUk1TRFicMLT6Em2P1lgIRYma3/AbxMHACFw3YUN
         amBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEMkL9tW27qh7qB7z1dOyn6IVj+P4lSJ9BRc/xcD6yA=;
        b=3kyge3GygZ4+Gv4jFoiV7+MTLzwf6d499ea11IH3bpGZRslo7K4RhdayY3+QWWxsCJ
         OVy5CHRUA2I4vQo995m2vaJkBxORkDVdfAZWLTAS+M/b7kN4BdpvXPDpUxVLXIVeJwGt
         Tznj5pvo1WVBhkepT5OdBMa5ZxIzZBhYf04Xt7+jWh4yapjq2Pl6aRT1D+0nmpVlT+AK
         zr1mVCCt7gOuuEttleM218vDEi9YGizyalHYQSEPkGbWG2wuSCsbm2Yieq6EiQ89fvFq
         3UkAdRpBrbz8LtvyX5SHpN7I0YLCGjFib1r2VLSQkJAZfnaWvcZj9HlWGyA1WKael3rX
         k9lg==
X-Gm-Message-State: ACrzQf0p77jyOMV4RAtFwgD1SEDxEMpBm80z8li8TyCrWQUSY4a8RZSv
        PbFIQmfMW/Lh45AR0EIlHuH5DQ==
X-Google-Smtp-Source: AMsMyM69qLfR2ZhwvgPH3kDdbwNowjpruwjJ6flGsEfdQYt5ewAAQepIkFD1MUI0oYxC/2T0XYMjNg==
X-Received: by 2002:a05:600c:1546:b0:3c6:be44:d3d2 with SMTP id f6-20020a05600c154600b003c6be44d3d2mr6783887wmg.63.1665999930104;
        Mon, 17 Oct 2022 02:45:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b0022ca921dc67sm7824305wra.88.2022.10.17.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:45:29 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 17 Oct 2022 11:45:26 +0200
Subject: [PATCH v3 01/11] dt-bindings: arm: qcom: move swir,mangoh-green-wp8548 board
 documentation to qcom.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v3-1-531da552c354@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-rtc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document into the main qcom.yaml as conversion from swir.txt to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml |  6 ++++++
 Documentation/devicetree/bindings/arm/swir.txt  | 12 ------------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1b5ac6b02bc5..0a9a1dc68c1b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -265,6 +265,12 @@ properties:
               - qcom,ipq8074-hk10-c2
           - const: qcom,ipq8074
 
+      - description: Sierra Wireless MangOH Green with WP8548 Module
+        items:
+          - const: swir,mangoh-green-wp8548
+          - const: swir,wp8548
+          - const: qcom,mdm9615
+
       - description: Qualcomm Technologies, Inc. SC7180 IDP
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/arm/swir.txt b/Documentation/devicetree/bindings/arm/swir.txt
deleted file mode 100644
index 042be73a95d3..000000000000
--- a/Documentation/devicetree/bindings/arm/swir.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sierra Wireless Modules device tree bindings
---------------------------------------------
-
-Supported Modules :
- - WP8548 : Includes MDM9615 and PM8018 in a module
-
-Sierra Wireless modules shall have the following properties :
-  Required root node property
-   - compatible: "swir,wp8548" for the WP8548 CF3 Module
-
-Board compatible values:
-  - "swir,mangoh-green-wp8548" for the mangOH green board with the WP8548 module

-- 
b4 0.10.1
