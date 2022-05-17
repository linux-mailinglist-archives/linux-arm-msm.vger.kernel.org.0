Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86958529A08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbiEQHBa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240307AbiEQHBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:25 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55F41EC7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l18so32777460ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moO0mfzAsMtnfgS0NS7AObTvGTtLS3H0rOk3lb8ST4E=;
        b=aPGWNN3PAd3qCX5gCedlMYKZImBmit6DpCCYVTshbdtR+j+xvc2yU+HVk1RMXd6W6v
         1YkjAwxijgbh3d5sRwRypmdK5vt0wcFNlgoe7bCfFUSMyZAbpFoZoO4TIkL6A36o3GD0
         22f2v+HNc7k3R0+ODOqzxg5F7NeSAcyO8jpyWW4qRLhOAKuJxYQ63isb9IzmmGM4SmId
         N91X7IZEuOIjlw3KXtY91cOVwDr1oVtKiIJSBCHee8cSeZgAGO4Q5bmnx3C0lgcMg/kd
         nFe6Z+GP8qyclKNsrvJ/NWditH7WdWHSOjkoRRDmtzptwViPWZ+b6KedgfbvL2NfJRYU
         KOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moO0mfzAsMtnfgS0NS7AObTvGTtLS3H0rOk3lb8ST4E=;
        b=WKq1ZWOgIsG8feo6oCe0tC7F4MmQkS2W3LoOHz05bR/MfqryZpjxSaXI8h3APQNNtA
         Onz3TDFPS5vt+S+Xz2ekcRnLkZAW+8cZ8cuj+FFiTHiUPOE6ZuXIl1+Z6ZAC7UV/31un
         iE3SanphOQti7jeNzP+nmUnHz70jxCoi59VSZfkITHOle9Lk4oE8VpITs2obwtw+vuTa
         CpnHwJwRP9FT4mD7uW+lspLMn0+Mah2x9cYj1Q6PH6SE5s4+4aXOcpRGCFxZbZ6EK8fM
         7T0jhllDcFnNofZo+exxNV4KKdmtyp2XGYAhPsbOHs5OmOtkerya3rACNqOUoGk4kpxG
         oD5g==
X-Gm-Message-State: AOAM531/E0biozLJf5ZATYb9qLFFILk9eHkN1j1833fL1e74pwBT35u0
        GeHpbHiXfGEzoZwpl0v4KsJvIQ==
X-Google-Smtp-Source: ABdhPJy/n8xO8YnxRehXQ1gZbEjZKoNLgBvMQ6gADrK7/3iIaYZ9CTI5ZfDCECnI+q9RXedO2sEsCw==
X-Received: by 2002:a17:907:72c5:b0:6f4:678:8742 with SMTP id du5-20020a17090772c500b006f406788742mr18676120ejc.607.1652770879157;
        Tue, 17 May 2022 00:01:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/12] dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
Date:   Tue, 17 May 2022 09:01:02 +0200
Message-Id: <20220517070113.18023-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
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

The core schema already sets a 'ref' for properties ending with 'names'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index d891ecfb2691..5320504bb5e0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -77,7 +77,6 @@ properties:
           Should reference the tx-enable and tx-rings-empty SMEM states.
 
       qcom,smem-state-names:
-        $ref: /schemas/types.yaml#/definitions/string-array
         items:
           - const: tx-enable
           - const: tx-rings-empty
-- 
2.32.0

