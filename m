Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125A46B7DFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjCMQr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjCMQry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:47:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCE75FE86
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s20so16511808lfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Yo87SopvSTYFbNwKaVbRwGY2TMdOf6bHGJZD1J1eo0=;
        b=NKIXcw9uta969+PU2SON02k6GmOgEInQ4anjg2luLs9NPybUADCzQo4nsxCljR1ea9
         UENy4d1Y7g91IbD85NPKfpIJDN3tHOMRZxJS/xfhk2NXeW4uocgkmCIHyKDvEvPjnjaH
         2oqmatIOPwWRX2epetvnea0WV6xtxSQFtbHN0O2WZR5UKNmjb0COvLVhjw1GZE/X4CrQ
         1IZNoQ3nrDXd3eCiBymhAxNpELpO6Dmu+cur8rTiPUm0VIP9hO7GELFy1wTjckuLq06f
         1y3NfbQLLBtmeTaiSWtnaErnlsyifV6639nvTzbrsGa39zRKPRnglvkH5o7TAhhC1365
         CKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Yo87SopvSTYFbNwKaVbRwGY2TMdOf6bHGJZD1J1eo0=;
        b=QHM6J3zE40MfRH9EQsxIT5syzdNIXuPC/EGYgJCasSGP6MrpW/18aACqTXxQ270vlG
         nAuHbkxqvfG4KNY/MVVxTnKdBiih1s2KVRrZtnQPVdbCPHoWfJVULREnNOGhU6ha7luJ
         lp/fJpvBj+LqxZ2hmYT//wnDZUp2eCp77iIgpCSxU07DGAFRZUXLdU9ipbSdYp4Ma5og
         vpl2SZWOgebH8Ka69rtFMwinPRYGDXmhPO7gH6gaKFP0v1erK34vYvUeIUHMew/WCnm2
         13jBMLl5rUtpDJj2Lu6V/KO1CFG7LpFXVVaKC9WTpcJx8ErZsvjVVbM3cgVjMHg2rSQ0
         rZeQ==
X-Gm-Message-State: AO0yUKWMLNSouqCsLNSVCnlCWxuXZiDExWuhE3odwoZx5g+a8eCWxQ9K
        hdBtujkFxc+D3YwPKw1ehMSs6w==
X-Google-Smtp-Source: AK7set/rkSFmEu0jr2YChyXdXriFzdGHdJJd3/0sjw4+ciA0zUlQ7LfW3THGNZB6anXiqPkVMNgzsw==
X-Received: by 2002:ac2:5df6:0:b0:4b5:964d:499e with SMTP id z22-20020ac25df6000000b004b5964d499emr9528201lfq.8.1678726071789;
        Mon, 13 Mar 2023 09:47:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651238a900b004db48ae69cbsm18134lft.206.2023.03.13.09.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:47:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:44:17 +0100
Subject: [PATCH v3 2/6] dt-bindings: arm-smmu: Add SM8350 Adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-gpu_smmu_bindings-v3-2-66ab655fbfd5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678726067; l=865;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=B/7JuXvSPkmV63gwiluzQNPX5/X7vrzG//wDw5Uxkl8=;
 b=HO3ZEEgM++a3WoqurmLBCAItYNMDRWz4wPU32KFIJiUO8nToF2vRRyX8Bmi+72qFjm3KpIhtABWo
 EP7Mu8yaAlMcZJP0gzblqgeH66+QOL5xDI2AKI61Wuq1xsowsT05
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

Document the Adreno SMMU present on SM8350.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 40f91a2e5f3a..a6224b7e5310 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -81,6 +81,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500

-- 
2.39.2

