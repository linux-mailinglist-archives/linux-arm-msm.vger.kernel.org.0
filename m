Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEDC73E297
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 16:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjFZO4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 10:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjFZO4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 10:56:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D552AC6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:56:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so4537441e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687791409; x=1690383409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27Hbm1nSTxidmaHo4Rsegreg1V1tH8Gk8PNfLl0C8PA=;
        b=yP0c98lED55xbAKz8zbKU1ATE3K32QLBopwmRpSh8g1Y1Ojq8YClIoGm4+vYsfDFq8
         ggIT1Qu2kJ0+KUNB0Me+LyObyRutbVBuRbfZXe1Jguah+T60OAoQWMA0O6w6HMP8HuU+
         DGnxXZ2h1qqG4TCTgMeekRp0ORKF+L76Cskmrf3OLXIVoscwkY5hS4B0KrVo1euF3OJL
         yH/VPdDAuhlD6fkNmMvX5xUSXioRpTjxEi7z/0ZwBJ2M8yEywwhWKdyE0ef7nsxE72lJ
         C1dsPkqMDgcfrrjRJpVKxEnIMuFpI9EKvfl2KtTcoomhOyEv831f+hcbGqd/gC3k1XDp
         rqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687791409; x=1690383409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27Hbm1nSTxidmaHo4Rsegreg1V1tH8Gk8PNfLl0C8PA=;
        b=AbJYgANO+r18XQudwEWyXRY3JbJOXcIyIQznTnZS5Z2gaF7nP4CLmT5iDxFGcAXC7r
         wlguwMJhgE7A1TzK6RUbstO61YFYbxGuuURq6C1VMVG/KC+Sfuy5v/2e8WBCBU6wf4rh
         aFkPSGcSiC3nhHBXzLlrY7zzTuQI99ghbM8eonuADjmO25s4Mph3gYjAYNx8G9PJEIy5
         +zRX00QjYuMQBgqttI08UCday7e3khMcsRl9ev+XCfwVkKJZPBKJy+OZwXfQ4m9t+Y4Q
         fzSMqkfTP+c9ld35cAZ3+EUczPP65aHnq+vzh/QNTn917P3jh3Gwntu6kyzqdWO01ydS
         dGMw==
X-Gm-Message-State: AC+VfDyi/PFHqoBgRiTfee4wXAQ2jqAUtvtpTNRpqaGp6yxIVCg0rV+m
        lASvB8Ac/inmhvFzRODsPI2VoQ==
X-Google-Smtp-Source: ACHHUZ6P7QfhEqbtbj9aseFYQVWHwwnAwptFktv1oZjineiJeroop5wpb3fzQZhk2mVjtmuWOBq71Q==
X-Received: by 2002:a05:6512:3b95:b0:4f9:5d2a:e0f5 with SMTP id g21-20020a0565123b9500b004f95d2ae0f5mr12270695lfv.19.1687791409014;
        Mon, 26 Jun 2023 07:56:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w10-20020a1cf60a000000b003f9bd9e3226sm7945737wmc.7.2023.06.26.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:56:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: dma: qcom,bam: require one of control methods
Date:   Mon, 26 Jun 2023 16:56:45 +0200
Message-Id: <20230626145645.646136-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The BAM DMA resources can be controlled remotely (e.g. by trusted
environment; needs qcom,powered-remotely or qcom,controlled-remotely
properties) or locally.  In the latter case we need to provide its
clock.

Require one of methods of such control to properly validate DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index c9c34f7cdf5b..a0af90ec86f1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -95,6 +95,15 @@ required:
   - qcom,ee
   - reg
 
+anyOf:
+  - required:
+      - qcom,powered-remotely
+  - required:
+      - qcom,controlled-remotely
+  - required:
+      - clocks
+      - clock-names
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

