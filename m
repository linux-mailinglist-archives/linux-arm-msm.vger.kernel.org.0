Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A22705165
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbjEPPCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbjEPPCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:02:15 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2A55B91
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:02:12 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9659443fb56so2235110066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684249330; x=1686841330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd9g1khbA63JeBUJTf00ISRAL2mdUk5sQJrk9uiVOOE=;
        b=RwN511gcQohD0AcIPWdg+7E1l1UXqnK/XEApmf284hgfHK+JGK7DbZSLINcA82520Z
         ka3+p7mxnAv3m5APW/Fnyf+/UHlMY8aLLg3dnIOsIU+H6Cgcg81pLceAhozlvfuroveX
         c6HuHlz/hXb3pEIjIDVONVApAasihfoagtEE8uVxxzTcieBROtWDO3PI0BqPDT8bRKs3
         aDvbjUTR6wC5Ks92CI6FqYDZJ8yKynhjgCGzecrSer0LzjLrrA6oG3FGwhfLoQzlz3qA
         C44agNaITbZshFc9Aej9zdP9UZdlBCWy4PfcieyF5ROpyT4Ita47vaxwvFJKunskPAKY
         YNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249330; x=1686841330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd9g1khbA63JeBUJTf00ISRAL2mdUk5sQJrk9uiVOOE=;
        b=i5mE5VNSN2CJmep19R4cjCNNr214KYkMBiwoqarnTe2TBm9QWPUqqlRqFbVkvaie4y
         EjOaHdgYT++cu+GnylyqaL66//TVsgntWwmCJT8Hzoa0905TlI/s+DVKE345y8kYgzio
         ibp7lxN4Ee4kO5vbGc7BRQG0vmmlDg1twRc3CzDhhhh1ndmV4KG455IMPInB135qwlwA
         UZLQ+aYXEC5TWP7MQA7MoCQkc/WbgCyHQAI27hqJGMR1dqm9hLTrXRG7z/iBX30CitAw
         exagNn9xUVUPze6rEuc67OlLGb/iU7J8IGXhx3WbK2hZneYzZz2d4E6H+fTgOXPBFFmW
         t9sQ==
X-Gm-Message-State: AC+VfDwS27/4MDWkzvvx6vBUu7JTgghP/lP49f0Dt1d3vaVRDCtKRc3d
        JGmdo61tABxV3SzjG73/fUyemA==
X-Google-Smtp-Source: ACHHUZ7ocapk0GLD9GklJXYUgtY5UVSIIIiUJMjeWYHUxD8QRZg1rciUFAf7o+F9mRFbrQ5FsnmdcA==
X-Received: by 2002:a17:907:72d0:b0:96a:f688:db6e with SMTP id du16-20020a17090772d000b0096af688db6emr9492497ejc.74.1684249330615;
        Tue, 16 May 2023 08:02:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906541800b0096aa7d25a65sm6361810ejo.23.2023.05.16.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:02:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: add PM8550
Date:   Tue, 16 May 2023 17:02:00 +0200
Message-Id: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document compatible for PM8550 Torch and Flash LED controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index ffacf703d9f9..074ef7e63c49 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
+          - qcom,pm8550-flash-led
       - const: qcom,spmi-flash-led
 
   reg:
-- 
2.34.1

