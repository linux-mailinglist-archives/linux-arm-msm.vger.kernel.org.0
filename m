Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2716229D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiKILMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKILMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:12:46 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE6127CEB
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:12:44 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id l11so26693492edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/pc7jhWkIohCmzvLPeFxuZOhmufYr1Nl7f4rSC4zF4=;
        b=CuYAPoJXdqq8N/Hkqw6+Dyphx6DZiSKDjujPOlLyWRAxasWQOjLGr0mDvDWXoz0LfG
         wd/cMAMguAOFiOumC2hM7NQhgDNWyucdDdBhx1PBoqFhG9rQKfUsjRbWMBTWDao31/Tg
         Xnyzbg6Alum5LrezL0ZhqG+bsaka3rGY4Ml5QHHrbdMxBJft0Ul42cT0TDRvPikeulk2
         Wh6kyjBF0Z6TOY2Ab081x7OjhMv05XhAHbELPiMGftSpoJUpYyuCs968qPwY2o1PDfiJ
         Bfhgc4K491D9RUQ2zyN7ClaRF2KojHazUQ5NfCSSS8FSWlXR/xUGgReuaIiyk0h0Ccyu
         DLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/pc7jhWkIohCmzvLPeFxuZOhmufYr1Nl7f4rSC4zF4=;
        b=6c7bwcQc5nAWMJ9iL6V81gRrO5W2v4xxqgKOJEASV8L4Etxdbm5iJKhIe1bzo+XnBn
         Q/nJXxu/P9wWOWq0qhfFAiwdKekMpYf9QjmHDHa3D4YHfN3S/FF0eDos4ZX16i1ngrWM
         K6XVGZBTo+L356uSsXGOfDeRSRcfWktdS9RNy0D5TzDczf8Kf63UJSWSg1H/4xCRWXSG
         PJ6hFfsE5dZB4eZPx7dHCfvgNVL7/8klpiVinzgdGtVonLYaAVyW0qTJUiaJs6CHi40w
         GEvqw1183YILYsSroBEhhuLlTSlOT8HZyRsgKzBq2p3rU2BTG3uKRO94PNX/zGtkkUpX
         DJvQ==
X-Gm-Message-State: ACrzQf2q9p4VNRyATnI1+AYKdlgvxxbzVdH97WQtqB87SYAqnATc+BEd
        tirWcmscqhxTAtKiX/4eDnAAoOmzhlVi7OYF
X-Google-Smtp-Source: AMsMyM7GeVr/zvBHi6rK2a85LLgMSVm6NEWavbdp+4Oo2zE/I5mfFViR3XR+UwerJ7HyyO3kN5UJqw==
X-Received: by 2002:a05:6402:2793:b0:462:39d7:3bbc with SMTP id b19-20020a056402279300b0046239d73bbcmr59490539ede.47.1667992363232;
        Wed, 09 Nov 2022 03:12:43 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b007ad9c826d75sm5825899eje.61.2022.11.09.03.12.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 03:12:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] dt-bindings: dmaengine: qcom: gpi: add compatible for SM6375
Date:   Wed,  9 Nov 2022 12:12:27 +0100
Message-Id: <20221109111236.46003-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109111236.46003-1-konrad.dybcio@linaro.org>
References: <20221109111236.46003-1-konrad.dybcio@linaro.org>
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

Document the compatible for GPI DMA controller on SM6375 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 232895fa1d8d..e7ba1c47a88e 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,sc7280-gpi-dma
               - qcom,sm6115-gpi-dma
+              - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma
               - qcom,sm8450-gpi-dma
           - const: qcom,sm6350-gpi-dma
-- 
2.38.1

