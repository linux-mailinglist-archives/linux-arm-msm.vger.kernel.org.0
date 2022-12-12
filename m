Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD82E649BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 11:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiLLKGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 05:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiLLKGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 05:06:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906B4E0C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:06:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id s8so17683849lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxHwpzdAgeysBPjazrb8MZAklpvcch7q79EoiQSklm4=;
        b=a/cqR3OmFlwQ2CdWLT4/9k8uaKshPkOmZbfG58+OuOX46knLAG7cQEu2GCEwRyPqEs
         y/hD4vUys0tprqY3OHNqDXo7pdF4W9IOwifvY+6SIB9TvrQWqas14voG4g4kXszGsOvA
         NXtqYPzKGddJg0cs9et+X09UEkCyx+/dWT4W2GNM0wrmvOoP28wTJMLQNVnDyxgT076S
         I6L9kDhnyEsTfpFw6PLHrFYzHEXpNx+Mf9F3PFJFgKtz7I60mQqetqkr8qkQaRX/wj2w
         PI/avCbXLGjhbVdybY4qsfoAh38TItwsuK7GO61nal47ZsRU0eOnsY1bDwBvpL9ym8hy
         2tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxHwpzdAgeysBPjazrb8MZAklpvcch7q79EoiQSklm4=;
        b=zGduTwJcvIyQ99SEN4LxBGYCf/BFHkMznYYUpwRoks7oHCZnx8atdcxw32oruxpFoS
         Pu+Chho3OwjmjHRejh+XL03k+ZvFXErFUgJgqLLKaf0exmjFZCB+o9Bacf2AF0enNg2c
         50qgJnMsHHux7RX3v3PBU8ppmalbPwtKlQ6MlM9cIzRo1dHG4bukRUI7uhwZOCsnmvzl
         MKyZgS6j55UKKKCgWi7YZ++wRg/SmrxNZQLmDL+yueAgxj+1ZOHlZysrHd/nTBV7aa+W
         v6Bl56mc3p3qdAR1u1mn/DElY3JCtFL5HiUs9Ryx/2JQFnv2XHdjFLjZzKLPaiQYAoNb
         2tLw==
X-Gm-Message-State: ANoB5pno6x9rQbpMo1oeGP0VxFlielHdmovhBMF5aNyCTGN3Uyfu3GUP
        Vk+2hCUI0Y3SkzZsYSb8eeL/2HBLPHOFT3D/
X-Google-Smtp-Source: AA0mqf5CzScTMQIXPiYPV2YD594XKdZ5k3C8WvM0e52jzUu7K/7Aeq2ynaYjH+BhVeHCMGpOTa6GRA==
X-Received: by 2002:a05:6512:358d:b0:4b5:6c00:429b with SMTP id m13-20020a056512358d00b004b56c00429bmr3733559lfr.26.1670839580725;
        Mon, 12 Dec 2022 02:06:20 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id o27-20020ac25e3b000000b00498fc3d4cfdsm1586330lfg.189.2022.12.12.02.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 02:06:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu-qcom: Add SM8150 DPU compatible
Date:   Mon, 12 Dec 2022 11:06:16 +0100
Message-Id: <20221212100617.18190-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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

From: Marijn Suijten <marijn.suijten@somainline.org>

Add the SM8150 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on the binding here:

[1] https://lore.kernel.org/linux-arm-msm/20221212093315.11390-1-konrad.dybcio@linaro.org/T/#t

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6610f5d2877d..cd74c1efcfde 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
+	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ }
 };
-- 
2.38.1

