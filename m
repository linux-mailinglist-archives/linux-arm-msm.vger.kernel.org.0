Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41457519C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 09:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbjGMHXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 03:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjGMHW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7E72119
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:57 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbf1b82dc7so2851505e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232976; x=1691824976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFUQi6OnF9bs8nJtTX/TRFzCi1Y/q9xnjKXZLWVR1u8=;
        b=M5zXkBkaxgT+Hex0mKeW8oex+TyLNEeNFdX5fTrR6UyMnTEJZxJqFFvQqQFH9Ct0Z4
         tiQFbeeMEPR9Yr11FFGwP4iZTQCVsMn21YbtXYSlrGlqdLQhBsKNDALTP3p8dLrbCi+v
         ZHxPxfF1em4N6bsUpkAhH3kA6xydKv6Q9TIoITSSwzUtF+sjiOe+Z5DpdbAj7EcdSrEA
         PXNsL84UXIgjumjZXLazeFYanKJkfrnsSDaLbutHv4xi4Cl6pHyk0tLuGegEz2fc9fVn
         FIDsFqeF4L7FU4roCQ4a2QJXGkhxZci//P8GL9t8ihrtUF69MCxHIGTfM5CfW4IhzmdC
         p1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232976; x=1691824976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFUQi6OnF9bs8nJtTX/TRFzCi1Y/q9xnjKXZLWVR1u8=;
        b=A/s9W0a4LCQ1yhB8V6Cb9R4A3DomZYLEdouqj3EdTEJuGxAeRbDJrcNwqh/3A4Afui
         XOYEC9Hkp6g/aPBOMemXpvhMeeYR1RdSsX/Gm11OJFMWfTtw27lH69c+QieoqqItp0nS
         iW04B4u+xJH/+Jlwjc9cRGhgzTWIM6oeCrF6x2F+e6kaze0v2D3HEYxDuhMV2Elkgrlu
         wYnedMzCpO+EKSjs/wO9cZdhH+nm22uyjABLn+CebGZQK0rFOdk+uSQ4wquAgLzNWDXR
         NsbBDC8Kx8Riv/iq5RelQxvSTctdzqesBEPIyJrvI3tCBepSEb8GN0Scq8lmOQn3OLCz
         pOEg==
X-Gm-Message-State: ABy/qLbZukDjl5IMUyrjOIm6J3B3C9EB9QBvAb3z6F3WjJLtIySN4aiG
        Xk7muCoUA/D4g2sEgG6ussAM2w==
X-Google-Smtp-Source: APBJJlFnSB8t5HOJ82BbWQ3NZaaQFwrdEwGuewAhihdDKEuV+JMDlgd5cfplq6KiK0mtmi1RpYa0sQ==
X-Received: by 2002:a5d:684a:0:b0:2ce:d84d:388f with SMTP id o10-20020a5d684a000000b002ced84d388fmr726600wrw.40.1689232975910;
        Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 4/4] dt-bindings: remoteproc: qcom,adsp: bring back firmware-name
Date:   Thu, 13 Jul 2023 09:22:42 +0200
Message-Id: <20230713072242.11268-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
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

The firmware-name property was moved from common qcom,pas-common.yaml
binding to each device-specific schema, but the qcom,adsp.yaml was not
updated.

Fixes: cee616c68846 ("dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Use maxItems:1 (Rob)
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index b571efe6d550..2edadba91dfc 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - memory-region
-- 
2.34.1

