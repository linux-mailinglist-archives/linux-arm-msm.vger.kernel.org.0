Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC12A61F266
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 13:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbiKGMGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 07:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiKGMGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 07:06:03 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7471163
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 04:05:58 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b9so15902323ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIQpUknokjs3QFKaGMUkV8vshn2qA+chP0pID9rWGu0=;
        b=hUjzv4uq6McMIRbtnD927Xh4H4zD7dS3mU/clZiqOlMDQy73URdVadD2ucACl++UVp
         +6JIDQGoN84wGy7oLBtjkHsNuAZvQ1Onbor2DLeF8DKHn62xtyfAIlbMJ/ryRA6+VmT/
         Z/HAbqb3iloLuCHTr+16utOMjBvnUPhyrLsOf8iaeqweR2LV8GDN8V6IRykNKK3aAmAI
         MRwmamZc6s9o6knDEzNuwSj7C+muM7DJcsnPxBmJZ1tIoA0jSXbttDbmw8qehE35Hmpl
         gkgkLSQPUAA9GUluwp7bdeP7tWenzAFKnT6PCCWre0NoASrCYL0zdGYI5aCL0nvVBSKD
         sMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIQpUknokjs3QFKaGMUkV8vshn2qA+chP0pID9rWGu0=;
        b=yjy5x88wP3OuUMES4TK2Uq/28PL64GTp5rCZ3zo/IqSQtA4cJSfe334uHDpbLo7m4X
         GIBlex4t+nKrLJl2mx6SkXmeQFOotVfAs8QEXKLjySz36CF6pNRMUJ8WD93gj731bNZF
         NBtGv6mztsYkUh1jmngQ1p5B5zwnjygXwVyr6MCZIIGdn0Zft80xEpSmvLMwAhzW2EqN
         dayuQMkhP1lo9YcxXKHMM8YI8MtF5LLcegY2smxjUFfsNbsPfDA+NxOH6r5C9pomSU8o
         sOJTtS9dz0ERZrIVQcReKXSkti74mwfjh/DdM2HltinP5yeL9yrL8xQuKt4p/JWKcUdv
         QaPA==
X-Gm-Message-State: ACrzQf1Z3ZNUoqHglGzM9NMJQsMPFEFn60NuXmdOJW9zPctNuVM8SQiQ
        YI5nxelAg87WaRK9C2UfDniF15wKgqdZXQH1
X-Google-Smtp-Source: AMsMyM7uVZOfkrfUV29LP23hpD30iklFEu0Lr9zkTjjTqUbzCG3iCT0qPYlZ0RAEcSDbQkDUDY+++A==
X-Received: by 2002:a2e:bc26:0:b0:277:f49:b234 with SMTP id b38-20020a2ebc26000000b002770f49b234mr18054013ljf.1.1667822756088;
        Mon, 07 Nov 2022 04:05:56 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p13-20020ac24ecd000000b0049936272173sm1200065lfr.204.2022.11.07.04.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 04:05:55 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: arm: cpus: Add Kryo 660 CPUs
Date:   Mon,  7 Nov 2022 13:05:34 +0100
Message-Id: <20221107120539.12305-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add a compatible for Kryo 660 CPUs found in at least Qualcomm SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Pick up tags

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5c13b73e4d57..b2058345bb8e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -183,6 +183,7 @@ properties:
       - qcom,kryo485
       - qcom,kryo560
       - qcom,kryo570
+      - qcom,kryo660
       - qcom,kryo685
       - qcom,kryo780
       - qcom,scorpion
-- 
2.38.1

