Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3B607D0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiJUQ4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiJUQ4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:25 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0088812792A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:56:01 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j23so4514740lji.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT9p+O8jS1617W9ayV/G2VKwq2HucMY9DBAQPNerHK4=;
        b=rJ0DwSGCkEIE25pd95phrfcMNfbybXvcvh4bDPLhBClsVFB1kJpdbY9ZXdeqI79FaF
         Mji8bX6GF893adMySxKCv20TEpdIH+G1UbtWU48em/BNNZ/GZAZoT5QG72X6+zIDo8lY
         sdc4jWx06elCJfG/o6UMB4Dyk+1+5i2QTvWx4L4j58QEDHZU3ExKddPnXhoJigwHkSpK
         wPSVgBpj8Dp2pZutXokdwh7d5VCOoiSWCOjIZmUR4pnfKTkI0JOACnpeuF/frwI1vveG
         Po6ZGlFKoSKU7CMLJgqZTMjUawtVPzcgMD4lBOr5G9gWBpZUjrVZqNQWwlRaxlWyVssW
         PRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT9p+O8jS1617W9ayV/G2VKwq2HucMY9DBAQPNerHK4=;
        b=H6vCdIpbFAyLKSFFNNN7f1gfF8XjpgtLcovFayk8m1dHhT7TV9hItm0vnNhwH3M05V
         mK1bEPINl6ewGxNI2k2YUExN0sHebbHGsnnAIGnkTYSUGrxW8XUWKoQoMqSpixhnjMP1
         GyAe21fCAUJhX77eKU8cRyZbJUljop9bIzatJXTiTqDl8ZsHf0Lge/J8hG+fUmwDfi/G
         oq3XxzsP3fygYoYegfbg2FXT1+sp+MsU9ATS+/VJYHk3FVkUyUJvpV/9NwcUxOogV4o/
         2MnfFg7CGeifSDmN7SVQo9AkG4wMwPVWboX+hL9yBpa08PwTRSPOWr3iEucIrUzJaR7k
         bf+Q==
X-Gm-Message-State: ACrzQf0AlDxIaJSY8H4ij2oPsiIWTcAlJ23FZdvbYicq7HEvXjFO5smu
        PNQAXaXeu1pkwsJPIJ0WxAD2fQ==
X-Google-Smtp-Source: AMsMyM5DmLJ5rXTRgNdC7K58SnCb2aZlbYqY0kpaUJgU2Dzp2Oflwl8kkPrI4UQ6QWTOn0THOh0ktg==
X-Received: by 2002:a2e:549:0:b0:26d:ff5f:53c1 with SMTP id 70-20020a2e0549000000b0026dff5f53c1mr7415424ljf.450.1666371349092;
        Fri, 21 Oct 2022 09:55:49 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
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
Subject: [RFC PATCH 9/9] iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry
Date:   Fri, 21 Oct 2022 19:55:34 +0300
Message-Id: <20221021165534.2334329-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic qcom,smmu-500 compatibility string. Newer platforms should
use this generic entry rather than declaring per-SoC entries.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 9abc40c00f3e..3be81338a25b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -493,6 +493,10 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
+/*
+ * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
+ * special handling and can not be covered by the qcom,smmu-500 entry.
+ */
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
@@ -511,6 +515,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
-- 
2.35.1

