Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1966C62D752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbiKQJog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbiKQJoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:44:34 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0EC70A10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:44:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so1939042lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07jxP8RcYFdE+SSC8KiN//xkr0d7SR0+oxWGO499peQ=;
        b=LSZF9vPxP9SRCCRRlugy9ekXBT9pLaqSLEk4FXkTueoXWwiDMw19beV0kmm08vw7kR
         bwFK8Thq5hj8JJOUhxvARAOmaBPC6M5adxr3RPiQOQi080uZYk36NZ1j/Jl8dfD+DKDz
         qVYcDwazmdvFKb9sJjUuc/krbW8lWq61lMD6YxBmDTs7nO1eOzkJiWBJLgkzeJMfZDt0
         7ll36P26rnm5q86x2O0TU67grttZJ1H1jkd71HOkir4oQq+tdXaNz6mfVIzmv3hVWKtB
         I+Giz3NUME+0SGNGMPx3WM/1Gez/T1gup38sDDvLb2Gt6HWiIOkjlzvAOUiLZMbxPno5
         6JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07jxP8RcYFdE+SSC8KiN//xkr0d7SR0+oxWGO499peQ=;
        b=jwMmFjYPIs7LXRDjXa8zt2bZk/8d3vRg2J+RWcaRJJC/9cUUV4p/yua89bJM9w6nku
         qyKcrF+g2YKJ8ixRThSQhqUaBvxaSji1U3QiTcz47TvAg8tunmnQ2sinkezTr7CQUMOe
         AWAP7Ju0+r/Uqv+4qFyQQbWN5zvCuWJb8cqt7S/P7SE7IAagHmtwXXMuPWnUtyNIoDuP
         owYMPnIOTC/i1MFnKqzZT+z268LEsFsP1MKBnhXLFrCXctKFlrE5J7yPT+iNYoNGT6Ac
         J7OnAqHinjTqn5T3r7GXstlQaZV/1z/LXtbQicws5AHSB6jnQcyw3FGJWa7WKKpttC5z
         P+2w==
X-Gm-Message-State: ANoB5pnmF9CJk2FQk16qwUiQ77A2d9R6p1OZKMQ/A78uAn1/0IFTeA57
        m4wFz5vW+nINO3vmrYXrPuLc7iVLwI1uG5Ho
X-Google-Smtp-Source: AA0mqf7sxxHmLU3xjf1JZJdrXwApfX2dW3Xq6Qp0TygXefNSEF471QrQQDVzmNSY/KnTae89FV4c5Q==
X-Received: by 2002:a19:e048:0:b0:499:af06:a77b with SMTP id g8-20020a19e048000000b00499af06a77bmr581604lfj.202.1668678273353;
        Thu, 17 Nov 2022 01:44:33 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id a23-20020a2eb557000000b002770f0a742bsm105312ljn.41.2022.11.17.01.44.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Nov 2022 01:44:32 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@chromium.org>,
        Emma Anholt <emma@anholt.net>, Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: Add SM6350 SMMUv2
Date:   Thu, 17 Nov 2022 10:44:22 +0100
Message-Id: <20221117094422.11000-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221117094422.11000-1-konrad.dybcio@linaro.org>
References: <20221117094422.11000-1-konrad.dybcio@linaro.org>
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

SM6350 uses a qcom,smmu-v2-style SMMU just for Adreno and friends.
Add a compatible for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index fd97db178696..fa84a69b9439 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -513,6 +513,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm6350-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.38.1

