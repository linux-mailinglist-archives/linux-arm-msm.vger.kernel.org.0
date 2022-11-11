Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB35624EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 01:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiKKAgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 19:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiKKAgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 19:36:16 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B34F95BB;
        Thu, 10 Nov 2022 16:36:16 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id r2so1876777ilg.8;
        Thu, 10 Nov 2022 16:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQmrxV8UAMx8aTkAdlv23yBJFQlgUNmii3sTAapLgyI=;
        b=By+u2s1zlMxrmcdLwoh001J8SribOcDyS7nZQpDSP6pEnWTPhIXGqKuoKdGgpVx0Ie
         m9KJiuMqABLulmOmezG5pmPlNwYgZz2dNc58kHp69zkdV7Vf7VQ/tqcoJAsAqdq5N2K2
         xI4u+XXNwkDCUBO+M19sMqbJnBHSz7Tim6llxRDwJUbAl3QN7Ph6vy4bmM1M9gN5mgwv
         bh6VjwDQsLjHK4hUwgnRm3BpS7JwW2ForNcfI+3y//TYLxQZtiuE9srQqdq1Oxl4jCtt
         HOiE/lv21om+670aij+fQ33k9rW5YUlTfavlSPgA2ky55GCsbQuLPYejHmg57/YUhk9s
         Hbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQmrxV8UAMx8aTkAdlv23yBJFQlgUNmii3sTAapLgyI=;
        b=0M7ct0AM6XUfbUh1EVoEbUwX7NCYrRKyCUOR5ciWxA4S7mOWibly/5QMYs2J97eSt+
         eIzmET5/+BOvBKy1PTeeqgtWFi9guKez++xG3baawDeuFg7wJKxaUKfy6KCxrVT624LT
         GUXxmOEv4XPnnbnAjvgNN2tuPhpBdkkfYP9puMIjdeKcI+UJ2X63WfG2Q2cqZieJcFzs
         CAkdbcVDuTgWSzfYmPsqwcbmdJ0tEPXISReZf2OUQoTF2gH9rt9kCuXw+iBJAe3HxS9P
         kunjTnhKpXPF02uP3O+0KDGctnrqU9UfeX47V+xMUCHDzywqmyV0sEyraUDDbJ8MkHpK
         7dVQ==
X-Gm-Message-State: ACrzQf2zusoIqaX0KNoYVOZM1xeXMAltF4PinyYx59z3yQoy4FeJDmal
        feYlPUdssPdkN4WlvVJsZz0=
X-Google-Smtp-Source: AMsMyM71OO5VNIX7PmdMMq8lznWfKCNntmbM6yx3dhGyaXm81q8wjDKI1gErrOmwXTLw7P4RV00jPQ==
X-Received: by 2002:a92:d909:0:b0:2ff:e1b0:b150 with SMTP id s9-20020a92d909000000b002ffe1b0b150mr4087211iln.147.1668126975442;
        Thu, 10 Nov 2022 16:36:15 -0800 (PST)
Received: from localhost ([2607:fea8:a2e2:2d00::61cc])
        by smtp.gmail.com with ESMTPSA id a12-20020a027a0c000000b0034a6d12aa25sm343343jac.4.2022.11.10.16.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 16:36:15 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 1/1] dt-bindings: iommu: arm-smmu: add sdm670 compatible
Date:   Thu, 10 Nov 2022 19:36:06 -0500
Message-Id: <20221111003606.126795-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111003606.126795-1-mailingradian@gmail.com>
References: <20221111003606.126795-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 needs the IOMMU for GENI I2C. Add a compatible string in
the documentation to represent its support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 796dc7d4dbdd..f77597e8ed39 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-- 
2.38.1

