Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960FF6BBE70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 22:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjCOVD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 17:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbjCOVDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 17:03:19 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C07A0286
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:02:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cn6so7668256pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678914118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8rqjPBjOCvuXU+1mFLCudR89i/pQL+YsrnWDFzg2So=;
        b=Gd+4FKYMQamsr9AeYrxn3zumzXcdq9zHX6onwL2IP9I59aS/rY4kKq+h5hS+W9sBlC
         IS+AX81iQ4Mwm6iLBHnVhCACW1oUUzeXlPRePe/+z8gXOSfIRm3oBv1D5JkMcC9xzLhe
         480Qnc4QLgf2EX2nTckxXG2H32QDoM+FZAVYo6d7Z8WkQrufuHD8rEpfE7FhgO3g8LB2
         eOgJqbyCPLZ+4/IobOyV0KJNfxBTDPSaP+R8UolJZ0a1/qyxB2BJr3FBtX9thvn6meNu
         k4BkFs0DY9VtefJUaHs1r5mgjdCU3adOK/Oo8kEOh5rCqimImGYYfZhErKhEBom9QWTf
         7tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678914118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8rqjPBjOCvuXU+1mFLCudR89i/pQL+YsrnWDFzg2So=;
        b=usz73k7//rNdX3f2KSz79uhJcIH68iDey2hpn8aXO9JJ8IwuWBkqy1Y6ljdAYVJ+mc
         lSYkx1fOD5AT6yWT2U//k8zZW2vpDqd2mHm94OF/oD4eXs8l3XOZ93ZKoUonpEaCx7iU
         62Zy5S1JXhWhUHxN4vEfUwsZ5QbjJv8lapXcdQvn47bChq9hBHBrP0BfnsZB2cXZ+ocC
         9Y9/P/6fxuLCMaVQ0C1tf+XiCiVDDeKCH1n1kAbSQFALP/gx/wT3O4QFQjPWzpX75mT6
         RTCjNBlMmdRNsbBRqrZ/G9ZOLMy/2/ZYbcnURSJUFEMdMEEacnJ3TcMKinVVSRREyhbP
         +e5A==
X-Gm-Message-State: AO0yUKXOWvWoVkSrbWPop64gLm1eRLag2a4AsCTKAt6CR/p31klmEfN6
        zhtADWx9wBSPLltBOk3mBWKF8wYGoGd3vXqGbws=
X-Google-Smtp-Source: AK7set/GrL/RW6fxKOjqOOQQgN4PPpwIgoxOXqK96L5huYYoPelfeq98z07ApqH5couQc1S71KrcFg==
X-Received: by 2002:a17:902:e38b:b0:19f:3b86:4715 with SMTP id g11-20020a170902e38b00b0019f3b864715mr718167ple.8.1678914118659;
        Wed, 15 Mar 2023 14:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id 10-20020a170902c14a00b0019a91895cdfsm4066498plj.50.2023.03.15.14.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 14:01:58 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document the Qualcomm qrb4210-rb2 board
Date:   Thu, 16 Mar 2023 02:31:44 +0530
Message-Id: <20230315210145.2221116-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315210145.2221116-1-bhupesh.sharma@linaro.org>
References: <20230315210145.2221116-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Qualcomm qrb4210-rb2 board based on Robotics version
of the Snapdragon SM4250 Soc, i.e. QRB4210.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 23c9c9ba5d52..5490593dc8f1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -46,6 +46,7 @@ description: |
         msm8998
         qcs404
         qdu1000
+        qrb4210
         qru1000
         sa8155p
         sa8540p
@@ -90,6 +91,7 @@ description: |
         liquid
         mtp
         qrd
+        rb2
         ride
         sbc
         x100
@@ -848,6 +850,12 @@ properties:
               - oneplus,billie2
           - const: qcom,sm4250
 
+      - items:
+          - enum:
+              - qcom,qrb4210-rb2
+          - const: qcom,qrb4210
+          - const: qcom,sm4250
+
       - items:
           - enum:
               - lenovo,j606f
-- 
2.38.1

