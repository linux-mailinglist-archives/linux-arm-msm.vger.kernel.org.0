Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B100A75A9DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjGTI5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjGTIfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:35:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE64626A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso795088e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842129; x=1692434129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sRMeYBiTFf66+qgNaHYdfUCWajfWqb0DHM4fZ8M2NM=;
        b=ZQ9Cl4LDiRtqhKVtiRqFN3MChytDZUkiVAtZFtcTGqyybC8SsEgw3W1+lhrjynZBz0
         yea0Lu6Ruvbf8pEbqmNrBCF0ulFPB1bbKcEMQdALE4u8c15XJeSJpn1IuPp4fA2tK62B
         FyzYs44T+faoxCafa6IBoEam+78wUwzp/wZhGRCpRWNjxXxYPoVGpVwflgELTpPGrG2T
         WDKZgs1NM8Y9Y7Zh25FH5vzQGlXhlFdv6IZvo+n0Odu83FNgia5algKJpP5UYX6sGmC+
         xGEbLY1qfCs1rpcWy7WD0VfG4u48pbhiZmxLb9ctm20vetCZDanxfryaI7AXdfM9QZSc
         q7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842129; x=1692434129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sRMeYBiTFf66+qgNaHYdfUCWajfWqb0DHM4fZ8M2NM=;
        b=cFSShdzlUAqZv5C9M1cVEKARbwfG1B5an+xDd2eQptgtZ0anudPd9yfXoFKLU4F/Mz
         lcaawPx/WJzZa6IYoSpmXSCIgVavWawwxzZDTDNp1tBhRZ8Dz7Erqf4rYMIqTKlXrAk4
         3zX2KFZsq+5R4lbTmWAtRjcB79DT0ZpX7fhIpH39PLaK8qg4iZRs6WZQhcogF7LuXu4v
         9zkMH569eQro1NsxSCAh42jMdmpNFAQEiHMzlJ0np7in12IGWjx4gqrWJk/Dj71Sq15S
         hbhKkZzAs5nOxfgZzvWHlUBDLyhyWPhRh0WBqenI1DSWr/A4NRLD6U55ym1r70JHOpPh
         KFjw==
X-Gm-Message-State: ABy/qLY19qgg61mupSqkDxupdS4yGzKoQhUuIgyfeSHSpdVbc4Nr6Vi7
        wAR8m2c0UHFqeBr2gDpasd3p7g==
X-Google-Smtp-Source: APBJJlGA6g6PPVisG5hJskzzxgHicwcVPFmlhZy1/UZWPPpF085TgKrS3VU8sIXZpab5AS/zRhFf0w==
X-Received: by 2002:a05:6512:2248:b0:4fb:96f3:2f4 with SMTP id i8-20020a056512224800b004fb96f302f4mr1165800lfu.51.1689842129242;
        Thu, 20 Jul 2023 01:35:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d67c5000000b0031416362e23sm638430wrw.3.2023.07.20.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:35:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: document PMC8180 and PMC8180C
Date:   Thu, 20 Jul 2023 10:35:25 +0200
Message-Id: <20230720083525.73622-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document qcom,pmc8180 and qcom,pmc8180c compatibles already used in DTS:

  sc8180x-primus.dtb: pmic@1: compatible:0: 'qcom,pmc8180' is not one of ...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a9ab2b7decd..debed393fa8c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -72,6 +72,8 @@ properties:
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
+          - qcom,pmc8180
+          - qcom,pmc8180c
           - qcom,pmd9635
           - qcom,pmi632
           - qcom,pmi8950
-- 
2.34.1

