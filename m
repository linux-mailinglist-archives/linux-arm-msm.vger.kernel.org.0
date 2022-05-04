Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFBB51A0A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350476AbiEDNXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350395AbiEDNXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:23:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E823B549
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:19:32 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kq17so2851318ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wtiS0vwUpWebphFXLVeTyRDTHsS+dMpyDeFB5sbVoPk=;
        b=WMcDqMBOQTWHQiHzKnK155CAcLbJFQiywJq2+OHBtLh2wtbdrvfmT+eVf/1qGi+8Gs
         VUocQGWrCexi0Npuo1PUCo1ievCEkGHVXhL79bjHLJ4Q9hp8ygEBznhKNqJbHdBeSAJ3
         boomwuB+OytFwgC3kGjWxyI3QKAJtNGcf9hYk2JqJLRvDj6bUMBBNV0VdNmI0r4WL5yf
         dL6OmTB/xuss+0C9ohEnqyT9FwMIy1vdU0SDxKK7iCawXoOVTmrP78pzdiutyXdmJDay
         TZ36Wix0WF1YbdqnBg5mmYnCBlifObmjldYNTL1EqN7lBNlMl1JYnM74RKnwmTpLmuFC
         56+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wtiS0vwUpWebphFXLVeTyRDTHsS+dMpyDeFB5sbVoPk=;
        b=puZylBusTsPkwlzn+gg1GLcZiWG7tK1uOTTVOUdKKLpgGBFp5cVJGwFpu4IlgDfyXl
         RfZcsstNU4hMEExE0bv90s2ZYAElov19hYGNg87R77FDQbmpjgT/ZT+mYvW3wDgc2FVz
         SeKJ7bOIdqx9mf891hgB2sOZzNjso3aaxrWH8zI27v/ex97McVZNfEg+/c9QNBChepNW
         Y8Ugk0c/Y8foZPvy0ouSzqEIt507gThXCJ4ww7+JI1Ee/sVRYe1D3WEmOMp2wEB9/XOz
         /S0JkW3PFE+Bi6pe6ZF3LK96fbZj8BwdCfIlMxV+ITr6dXg0cx6A3e9B1qXy/ialsmX7
         1gsg==
X-Gm-Message-State: AOAM532uIuakJsemR4ucdsuYVldzr4CGyxdhX+lJOWDyqE49fSw+/DY+
        hmDRJTY9J/mt1KIDfbc7ya/xSw==
X-Google-Smtp-Source: ABdhPJxpiNIp7y7Iq7FQeCbjSAWRjH6/GJCoUIDnG3RWGsD6Fl//cWVMX2EAziFaYhRTq1UePB4XLg==
X-Received: by 2002:a17:906:9749:b0:6ef:bc52:1f94 with SMTP id o9-20020a170906974900b006efbc521f94mr19947138ejy.666.1651670370844;
        Wed, 04 May 2022 06:19:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/13] dt-bindings: usb: qcom,dwc3: add IPQ8074, MSM8994, QCS404 and SM6125
Date:   Wed,  4 May 2022 15:19:13 +0200
Message-Id: <20220504131923.214367-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
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

Add compatibles for dedicated USB DWC3 blocks on Qualcomm IPQ8074,
MSM8994, QCS404 and SM6125.  They differ against other variants in clock
and/or interrupts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index ce252db2aab3..03f93f25cba4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -16,9 +16,12 @@ properties:
           - qcom,ipq4019-dwc3
           - qcom,ipq6018-dwc3
           - qcom,ipq8064-dwc3
+          - qcom,ipq8074-dwc3
           - qcom,msm8953-dwc3
+          - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,qcs404-dwc3
           - qcom,sc7180-dwc3
           - qcom,sc7280-dwc3
           - qcom,sdm660-dwc3
@@ -26,6 +29,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
+          - qcom,sm6125-dwc3
           - qcom,sm6350-dwc3
           - qcom,sm8150-dwc3
           - qcom,sm8250-dwc3
-- 
2.32.0

