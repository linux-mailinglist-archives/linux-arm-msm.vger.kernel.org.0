Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3F45FFA6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 16:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiJOOFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 10:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiJOOFV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 10:05:21 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC222D1FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:20 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id x13so4199987qkg.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxQPINt+WD8WuWGRIKOof3DJAfj05njiHZmcwReVibA=;
        b=yZ/y5Cys1uIvd1d84CoC8Sw3LmvRXIQ9X05Zp7sAY9BPQHYQW4BOgLaN5q8mO9jXHP
         YGayNBP6G6f2KR35YOqkpU345nbUzFq+r86wXek9O57trfy08SYyYUljH6UNDV7WZ/Md
         dU9hlBYNp+VF/zAPpNXlqR8PGpyVhgTOjZLtTlbNh+XHv1/Yyd4jiNR3TPEJjYQiQGvh
         o1/s4AH+p6Ncm9gc612XF8Gm6oMDTJH0nHb3sDzAxUF7T2vRYY2uLdRzoTVhIUrv4T2K
         fXX/5Ef8qbtwVe/cZqtEGZYOwEZ0ToCPsi5OnH7NnZUB/i5dCCOJTBhJUOuxRgUV3BwO
         2GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxQPINt+WD8WuWGRIKOof3DJAfj05njiHZmcwReVibA=;
        b=3jW96e2PNVGjf8of5P93b54V5iXBK0UBrOLmIZc73jL8NXJZVrwfVALVETsB4T5961
         V0bzkGevp/CE4L2FucZg+tAcASvaU9PFgUIca++uZtFE8yQfr/AV5KIT/wjkZ/xpCRkT
         omRnXbw/XNCIN8HdilwbutY6VGi+RaS1qCyIz5OrjXXjbzh+JU1s2eWo92dNbZGcw+Gb
         AeMK6hGFii5xYe+3yQ6loWOcBoiPzyf0YVQIQAaO+IJnwwML95KYk58WxdjTwQ6O78wA
         CNvd/YoFRkZ5MWD1PT0nQTCxb00Ua6obw709vI2ZP3dHKukjVnJHuXl6OgLtvNnL+SY7
         E4Ew==
X-Gm-Message-State: ACrzQf1NKcpIv+vAaYgv/9To5brFrHktMISYOQwxeKfcqz4ibyoTzOar
        hlROFrhkxwrVaMZ6DLm9wI/4aSyCkWatDA==
X-Google-Smtp-Source: AMsMyM6Hcu1eUOkpo13EhIvyf0AMrU43dujRoT8jGalprpgIhx3d8qMXUqw0CYlQDaE7USwtuGYaPA==
X-Received: by 2002:a05:620a:126d:b0:6ea:cff7:3832 with SMTP id b13-20020a05620a126d00b006eacff73832mr1865407qkl.694.1665842719902;
        Sat, 15 Oct 2022 07:05:19 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id s21-20020a05620a29d500b006bb78d095c5sm4958022qkp.79.2022.10.15.07.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 07:05:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: dma: qcom: gpi: use sm6350 fallback
Date:   Sat, 15 Oct 2022 10:04:43 -0400
Message-Id: <20221015140447.55221-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
References: <20221015140447.55221-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several devices like SM6350, SM8150 and SC7280 are actually compatible,
so use one compatible fallback for all of them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 750b40c32213..0c2894498845 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -20,12 +20,14 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - qcom,sc7280-gpi-dma
           - qcom,sdm845-gpi-dma
           - qcom,sm6350-gpi-dma
-          - qcom,sm8350-gpi-dma
-          - qcom,sm8450-gpi-dma
-
+      - items:
+          - enum:
+              - qcom,sc7280-gpi-dma
+              - qcom,sm8350-gpi-dma
+              - qcom,sm8450-gpi-dma
+          - const: qcom,sm6350-gpi-dma
       - items:
           - enum:
               - qcom,sdm670-gpi-dma
-- 
2.34.1

