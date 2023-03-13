Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786066B7DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjCMQrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjCMQrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:47:53 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFBB5DEF8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m4so3522679lfj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4lJzMktySZ0YxvT+SDsY5Au8uqrj62Y3kZlZfPHm68=;
        b=boTrP5jaTP5wbIyFAyc03VKpGq56wxAv8y3L6JK0HhCtMKCnCthoms15u9UxecLN1e
         zO+GLo35CV/xwd4jRcYV+6qAMKphmk1A2t8bxwScOYnI4pLfgwgMMPRFj9/mvGHdN/bw
         TSWSLqguTDna1QHgFLsOgn/64c+hd/FskGqHoWdetzK/6QPRYTrqzb/PgcfzdOePvhTV
         nyFuUfJFhJDs91+c9L74CpQ+im87k6prJymi0lKp6M5gs3gi5fZnfpbGve0LinigAV8X
         HYdkCCYbGuVYt2hK7JJH0oZksyi9Yshi94hPF6hsfxToOa1ZypSlWinG/JnxA1TEMZNr
         4pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4lJzMktySZ0YxvT+SDsY5Au8uqrj62Y3kZlZfPHm68=;
        b=OCK7uWE0+Bl/QnM3YPtTiVOb1xEOMe4UjL3SI7zVn23fGeMqKADwrhqIKKRdahYlF/
         jeQ2GsnSO6sJCtvThRpArAyJv6vWfnCEtT0trAeddPMnwjeO/jSn4z/TJN/GwdE4PoLM
         XxTLap+gzYwsiOx61bxS586V43uPcPWxxcTc47mnFpHgYU9c9OW/6rPS0vODozhGbPCy
         CoUl3C9SZG0cGqddpISMv38wBIcz5DwstFFvCXZwpMdoJnB218RnSb+Nx+Qz01R9m6y/
         /2y83iJWGRtyWW0VZY7PiahZnHWfLQLdWZ6iWWeFYhk6Nuk2XXfrTLDG1nVtXMNbq3ge
         nrrg==
X-Gm-Message-State: AO0yUKXrnxmdEonkFG3jNUZIqv4i9lP8xtl9/RlQJTl7RFwi9SSePCNi
        lcynfUdb2zNfKsHXHdUPlg0ZOg==
X-Google-Smtp-Source: AK7set8L7Mi+oCmpNq3mMebZrFl48jgH+xxOHYNzhp0MzeC9VmghXRGFTN0tznCtAYLpNwWejAPA+Q==
X-Received: by 2002:ac2:5106:0:b0:4db:3a92:2c85 with SMTP id q6-20020ac25106000000b004db3a922c85mr10136348lfb.67.1678726070516;
        Mon, 13 Mar 2023 09:47:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651238a900b004db48ae69cbsm18134lft.206.2023.03.13.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:47:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:44:16 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm-smmu: Use qcom,smmu compatible for
 MMU500 adreno SMMUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-gpu_smmu_bindings-v3-1-66ab655fbfd5@linaro.org>
References: <20230313-topic-gpu_smmu_bindings-v3-0-66ab655fbfd5@linaro.org>
In-Reply-To: <20230313-topic-gpu_smmu_bindings-v3-0-66ab655fbfd5@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678726067; l=1686;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=w5BAPOiJsD8VMYsyYwieokILoy0RKIWq1n3EcNs9gfQ=;
 b=byr01MF2m7kfZjSutcFjM0A9eVqAI6FA1nVnvJNjcUzTwQWw3sBBCrUPKus0GYr/kwM1H/FC/ATf
 03em/rC4AziS0Q7TxG9YIjPp9C2QEiMb22PGrLeX+BXKvOO2MPSC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,smmu-500 was introduced to prevent people from adding new
compatibles for what seems to roughly be the same hardware. Use it for
qcom,adreno-smmu-compatible targets as well.

While at it, fix the "arm,smmu-500" -> "arm,mmu-500" typo in the comment.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 807cb511fe18..40f91a2e5f3a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -75,9 +75,19 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
           - const: arm,mmu-500
-
-      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
+      - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
+        items:
+          - enum:
+              - qcom,sc7280-smmu-500
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-500
+          - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,mmu-500" (legacy binding)
+        deprecated: true
         items:
+          # Do not add additional SoC to this list. Instead use previous list.
           - enum:
               - qcom,sc7280-smmu-500
               - qcom,sm8150-smmu-500

-- 
2.39.2

