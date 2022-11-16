Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A5A62BE37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbiKPMhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239082AbiKPMg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:36:57 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06842A183
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:36:23 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gv23so11002766ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZBT8P6Dv4DO8+VutzfmTjw2eFqXhFXatHTYor7MjsU=;
        b=hlQNk0rVp3sE85UQqVnwNbaSG3QuiVGpipf/JeuKhOANQCdtms+INmd4MyRonzImhL
         NUi2yie/KzREDVos/KrGeq2GPvdmgJgC9a8ZfgkMRp+sv1rBnlbOA9KM6d8L6j5xdhSZ
         Zoiy+q0RgUIABxqUTWbIwQWYMpLdjX1ovBvNpOU16Qlp7E3Fgr53z3/dKeZV+1dl8OUV
         qkyIq8K8QgVkJio3qrqhpamZpHL5EtnUrBDGplun79N2WJfkV/aFnzq2ZOoED1kDqqJE
         rUZZrWkwDp49YaVbf/sriTK4UqZackZ+IqOqi/MdbOz2vfEC4KD/GtiVt/beTThn4A5m
         PxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZBT8P6Dv4DO8+VutzfmTjw2eFqXhFXatHTYor7MjsU=;
        b=7fkGaT9QxBdHIMPDShKckitp9snZz68Cc80Yr28r3VRu57cS7L2iJGw2Xi64KtN0NJ
         xDdro6y2Q03FjukQ6HsU5B4MeIkNoJKrhMZpaVgjGzLz2mtzRniVwSS1ANOgwTr6FLrK
         v6TAE1tXBi6We1ZOlCq7sStbtVDQG90c48cXhyIS0nYOasaQ+adNuOly64p1AWZyDa6r
         l4+1qEHDoTeFRFV4cclBtspB2rjpIogK8TueuSWCTiIBRpMoOiCjUyeX3n8YQiCMnQDq
         jeabaft8exjOwKo7G4yoIZSXQSI+1BxIAaEkaDElfFSY1PjrNpc0q+WEctJeY93W9iSe
         IVaA==
X-Gm-Message-State: ANoB5plo4Eji0VTucrgDsgy2YMcmiuU4kkJqTf2SK8XkQDCDEXetRDJ+
        ame3Yh6sK02lF8YA/qxsYHdS32NpBRt0csQ3
X-Google-Smtp-Source: AA0mqf4I/YjZAzS1pjS8ZmT2wdWov+a4rkd9ETVSHA0x7+nwD2F7Hmk5eG3SVjUQrmdM4onxSJs0/Q==
X-Received: by 2002:a17:906:5f88:b0:7ad:92fa:589e with SMTP id a8-20020a1709065f8800b007ad92fa589emr16970948eju.668.1668602181186;
        Wed, 16 Nov 2022 04:36:21 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id cb13-20020a170906a44d00b007abafe43c3bsm6773346ejb.86.2022.11.16.04.36.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Nov 2022 04:36:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mmc: sdhci-msm: Document SM8350 SDHCI
Date:   Wed, 16 Nov 2022 13:36:09 +0100
Message-Id: <20221116123612.34302-1-konrad.dybcio@linaro.org>
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

Document the SDHCI on SM8350.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- pick up a-b

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 12def0f57e3e..31dfaff0048d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,sm6375-sdhci
               - qcom,sm8150-sdhci
               - qcom,sm8250-sdhci
+              - qcom,sm8350-sdhci
               - qcom,sm8450-sdhci
           - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
 
-- 
2.38.1

