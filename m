Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424EB6930F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 13:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjBKM14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 07:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBKM1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 07:27:53 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335D63A091
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:28 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qw12so21913329ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFp89ec0Gr3RlKfBxRJjtE1gTMumSINkw7PnkXnimnY=;
        b=xk2doebZQk6auFDtj5Y099pDIP8MRfOdDuETsAZCKXxbAFDrNHqvoWJKumQkRcWmVo
         scg59xqSLqN4MBxnrDUvGLzHEBBZE67AhYwwOopbRpF+U/UWJvHrWIcSCRA2DyAuyAGH
         D9rjVKAdhGPLozHkdhPLfFQ+6XU8KapCeY7nOV6iLo560OmwQ08bXsthRvt6q7oCc/is
         rxy0K83qK0+aBLXe742rYNoK36PFOQLnKg3TLgktJJvbjfgplkb/G29rwCuHQyUGQcfC
         9MIMDH9mBYfUBgIxrGld0ZQMsseOnb9IwCpGq7RwmZoHgSmcH8z07CirveHCbWdwFS8H
         5bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFp89ec0Gr3RlKfBxRJjtE1gTMumSINkw7PnkXnimnY=;
        b=wlhBhejBeDvtO4y1j0rwW9W5eaw4nMXxx2JtfGTLHvND+6cGZQ79Z5K0rbrCTFN6hM
         0KlBUMxHAPpkdghwsgkEH7wrbQiczYq8FoGQgW3PFfBNGwKzrAoT077wZ6/CX6VxSZ7I
         45v7WGwuwbb8ghOfBdTQ8ScTzbhsKSzBveidyMpnxqfL1dDayD2C4nRKvgu7g4ueE4gh
         zn9h869dax3nC2dMW/iEXNAbq/fZdp0vj7LOjPRiGTYe1Y3nzahSKRAE0+aTDThK0cVx
         h/EXK4nWdHIiq7r29EvqzzYftGhg8UArZl+0XcRc+2kqZQRSm9gJdRrxb/ML/78zL7NG
         K4DQ==
X-Gm-Message-State: AO0yUKU9Yy2pZzLXmvCtuNKhcISNBKaihg+KPzwRfLevL/TRYHWFVBCL
        JGMBw3/ptsFprzO4pgesBp7WEK1tgNKfE1o4
X-Google-Smtp-Source: AK7set9p+k1epdfPMeJFIaVVZ7jZqPY7vKLLqQRPkBgc/mL3tFJSTXK5kqJUzyLMwwkvBXzWQas3DA==
X-Received: by 2002:a17:906:7c07:b0:880:2870:7849 with SMTP id t7-20020a1709067c0700b0088028707849mr20575594ejo.74.1676118447566;
        Sat, 11 Feb 2023 04:27:27 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 04:27:27 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] iommu/arm-smmu-qcom: Sort the compatible list alphabetically
Date:   Sat, 11 Feb 2023 13:26:56 +0100
Message-Id: <20230211122656.1479141-11-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
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

It got broken at some point, fix it up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 959516bbfe65..d49cf7e0a777 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -251,10 +251,10 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ }
-- 
2.39.1

