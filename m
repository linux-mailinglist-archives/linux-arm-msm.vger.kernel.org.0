Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77EB251BE35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 13:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358339AbiEELmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 07:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358141AbiEELlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 07:41:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5565C53B63
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 04:38:11 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id be20so4834712edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOaGKTE9s2qtQqabZY1r6g+c7kkUiTLdBki08nG0QDA=;
        b=x/nOj9phxVzJV4qTxMavxPSKqw2dbkrrWpaoEW4jOffx3wEaI14roIpvXDwdjiPZQQ
         2KGNQT+TBgF3HGzg4Xu9SrG0kVBRWduRKygzvoxCDQbQtmlF32M3UVJpUoyHA9hw2L/P
         X8iD/T4GDHWfjsb2JJWYfJGYQUG3BBKd+/Qlh1+n2eglpG7Ondt6wxszzHnWqz0R1bd5
         EAefDfgms38GmfrRRQmSEFX8JOV8h0maLCTkn4UuYrfuX8p5U3FDGLuXXdjBMU+pmHDT
         eMlE6zSTyPSKn4WAsx/EidNX28+1PXcjTas9gHLw+I/6MWlG8YgmvpBpBBkGXMslM0dt
         QxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOaGKTE9s2qtQqabZY1r6g+c7kkUiTLdBki08nG0QDA=;
        b=0JviLiaK1etQPOmyJdHe36nJBsr3Vfh1059Y7cUwO8Bu2zFclKCXF87GzyemqAGZ1+
         sFkYtDjOQuirhGsqidfPL9IqXQaTl9OY1rD33kHATuI4m35pAIaIVGl+LtPPNZXFq7wN
         a0dsQV0EBJXfTByIUnnzSa4L2gme6F+dAqeOHzLmjU5TlQL8RsyHGhISb1rFhHemdXtU
         pIJqdeFwx+lpTbRyulFY2UFxOR8mS3CX2ZcI4DfdogAMDTGJ/OnIJd1Ggy4bzbBjZNFy
         bcXDFJJ752GBSSqiEuGhOarZJB0/ybaYmKewDmaBNTy4ZXw7C7Y3YRP8YbhGXj6TA4U9
         xiAQ==
X-Gm-Message-State: AOAM531Rfp3Gq+gPqDfd5lrOaz5SzeCM3catcK0N7Y9w18OTdpk7xHmG
        tCKkTR30xLfFqWxcGJY9yXPTrg==
X-Google-Smtp-Source: ABdhPJyuJS/uuvNoiBo7jKs37NE8OMyN96O6tHFG6aKHP3FjcCyj3i9OyHt96WOoRUfHew6kh0Qcdw==
X-Received: by 2002:a05:6402:50d2:b0:427:f49e:71a0 with SMTP id h18-20020a05640250d200b00427f49e71a0mr12160750edb.211.1651750689913;
        Thu, 05 May 2022 04:38:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b006f3ef214db6sm661006ejf.28.2022.05.05.04.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 04:38:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/6] dt-bindings: nvmem: qfprom: add IPQ8064 and SDM630 compatibles
Date:   Thu,  5 May 2022 13:37:57 +0200
Message-Id: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
compatible with generic QFPROM fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index dede8892ee01..b4163086a5be 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,ipq8064-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8996-qfprom
@@ -25,6 +26,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
+          - qcom,sdm630-qfprom
           - qcom,sdm845-qfprom
       - const: qcom,qfprom
 
-- 
2.32.0

