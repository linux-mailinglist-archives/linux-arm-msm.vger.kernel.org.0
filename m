Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7EC57BE6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 21:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbiGTT2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 15:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiGTT2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 15:28:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE5F48EB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 12:28:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n18so31958228lfq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 12:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rSBQ7JAB+vjeRoqorLkGeTA/zEJLIaKb2x2azJOWcTw=;
        b=gfI/K/TNFcBfDJGFoOa5ZIwPpi22P63+Yy4snJWbZUnIqcaTs7PWMYawLV0u42j1gg
         6SAizAsdZ07oIO5WR+BjaVwcExwiIyPNjA/hwprpMgM9mds+BkSC3tDsyy//VfgxVWnQ
         sXO/JP8fRjr9Eh1v4UDc4RIiIdUJqI1FUoVRQtnfhDBiS5kqDtmY7HRbAh65EfwAb6ms
         pOq49Bd9jeYpEaCPU2fgkEcN7wXwOE48eQ1j6Z8SGztZPB697BnDGbTGkxv8eyPYGEuc
         skdiQD5vFfEEDG4NeifksEDcp+3iopKyoYhWJT6MZ0ZNJHdEZtX2GBvyCLNWptIorrk2
         hzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rSBQ7JAB+vjeRoqorLkGeTA/zEJLIaKb2x2azJOWcTw=;
        b=UB+QQzzRxP/EOCi45iBtAUjF/+iGLz97u5ClTlIiHlAh215gsuAxYnlysM+OnFI9yD
         /DMSZJ8NXbETiQjx2y+Q3Q0fq+VwhRsmjBPQi7+SFbZPEON6xtoqiIa8eVWuVD5gUMme
         xkCoIlLJLIprnAOM/hxYNKX6RfII+cn+uJ+1LBD/sV+qwh2fb4/Vn/5ngj0GUoJIYBGB
         9DHKF4QIJL4C55lewCG2a+JbXYD2VSefQObowfgIHWFBKbNF5DgbeTBbaDOAZTAlTR7+
         2wDFcKFxRMed47WLqlyE7KJDNX5AfNPriyUuYZM9WenHw2h+QueJyctLbG6T8EDFGfXw
         bvSw==
X-Gm-Message-State: AJIora8Wv/fRw4cUAgsOliwAT3wCS0TKXt5xbtKOyuBOB3HOPEm5J/zz
        d1qYXGRJe2KYksDZTYZFVvY56A==
X-Google-Smtp-Source: AGRyM1t5JUB4BiPdMRrJAR4SN7NgCflQcP4z/9qo1349hofBeiS3KfqTb2LYhIPLfW1uoOIY6y6T1w==
X-Received: by 2002:a05:6512:3c96:b0:489:e6c1:a5a7 with SMTP id h22-20020a0565123c9600b00489e6c1a5a7mr22357322lfv.38.1658345293788;
        Wed, 20 Jul 2022 12:28:13 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id h32-20020a0565123ca000b0047fac0f34absm3985771lfv.196.2022.07.20.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:28:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [PATCH 01/10] dt-bindings: interconnect: qcom,msm8998-bwmon: add support for SDM845 LLCC BWMON
Date:   Wed, 20 Jul 2022 21:27:58 +0200
Message-Id: <20220720192807.130098-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720192807.130098-1-krzysztof.kozlowski@linaro.org>
References: <20220720192807.130098-1-krzysztof.kozlowski@linaro.org>
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

Add compatible for SDM845 Bandwidth Monitor instance measuring traffic
between LLCC and memory.  It comes with different register layout:
called v5.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index c2e697f6e6cf..32e2892d736b 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-bwmon
           - const: qcom,msm8998-bwmon
       - const: qcom,msm8998-bwmon       # BWMON v4
+      - const: qcom,sdm845-llcc-bwmon   # BWMON v5
 
   interconnects:
     maxItems: 1
-- 
2.34.1

