Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3FA628683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238093AbiKNRGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238094AbiKNRGl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:41 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE532AFD
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:40 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so20306328lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M86vyazE9Kflr9n552n2x/ESkf8Js4Xoz0IPa0raNpo=;
        b=fgqOwllverskI61dHhNZtF3+xSvrcivld3PuPj3bkEYBDO3Jbv50ZHOMblFGOSBHSm
         +si76klJ+5ctBfWH6fCJMz6WhtAxw1dN3FbKN6oJk1im2Y0ChpqDXHXVHxpA26178iyl
         tbEU4VsLcvALLKY3egWPEjOdPCzmNdguj9NoUVfouoPfXq2xlma9mDlczpQUU+RQnOhg
         XT8LW+vpBmGYDs/LlJF/jNuOGepJuH4ZFIKmb3f6JSVC6SUda4VpfJ3r6uhoI8MAD4Lb
         37uyOyiyOLzhm/yU8KDnoJEVpCL8qGSNNLyB/dW038cuSZ9hwNg1xc7sxJFDOez3l/Fv
         f0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M86vyazE9Kflr9n552n2x/ESkf8Js4Xoz0IPa0raNpo=;
        b=grEvXL2WUPsRyYPOps4/KGcbErNFMkWMJe3ynY3AiMQ+b+eSieGqA555nxNPj+lmqg
         IPLMtGThihFiYdSTjz7gW/StBdBZxNgs3r1BULA7wMjARhMW4FN3fJPhu3VnIq8zCx7f
         6teumVjyz9aDiX9VLhx+QlerlGte7BLguWQ8LmawEjk5bUHbWVEZAJPMEhWjYg3c7YlU
         8wffyuEcQXPg0jCFF9K3HS8NchKxwJQtxt3kuSuimg2egRAkcvKsU42U1M6/TqTZoZuA
         LbyCIPm5bMZsWwvei2FzNA245laMevJ+eqL3kGyZLwFl51mc2T3dV9xVpR6ZalE/v6La
         tA6A==
X-Gm-Message-State: ANoB5plhsWn7cWicSwmOypE7Znahan3EDg9SY59hasPo9mIBDg+BXPL5
        dCewEhsb6kgdV4SHf7nz2Y/1Lw==
X-Google-Smtp-Source: AA0mqf54HDkotHA1FucjW2uec3Ub8+MjnMSJp6XZF6+mS6lVAK+bcof5fa6YOgzHa27BsQPhfyrL8g==
X-Received: by 2002:a05:6512:32c1:b0:49a:75ee:d5c8 with SMTP id f1-20020a05651232c100b0049a75eed5c8mr5089951lfg.152.1668445598742;
        Mon, 14 Nov 2022 09:06:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 03/10] dt-bindings: arm-smmu: add special case for Google Cheza platform
Date:   Mon, 14 Nov 2022 20:06:28 +0300
Message-Id: <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
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

Cheza fw does not properly program the GPU aperture to allow the
GPU to update the SMMU pagetables for context switches. The board file
works around this by dropping the "qcom,adreno-smmu" compat string.
Add this usecase to arm,smmu.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 99f34a40cfe2..29a8b3ff8fa0 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -69,6 +69,10 @@ properties:
               - qcom,sdm845-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
+      - description: Qcom Adreno GPUs on Google Cheza platform
+        items:
+          - const: qcom,sdm845-smmu-v2
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.35.1

