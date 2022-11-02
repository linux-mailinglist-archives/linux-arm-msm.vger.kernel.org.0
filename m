Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78308616CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiKBSof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbiKBSoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0492D1C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:31 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s24so26176469ljs.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yehdn7gwZYYtQmdw5gvSKZrzS358tipn1+pOWTvWz3g=;
        b=eo2JUGq/uE90Rl3eR+ppoQE1tYMLFhWmT7FezYI2xZxsvK9YV5L8KsNZ+OcdAb9uqb
         dhOdxa4Uwh2/uHNzv/3h5jaP11y6Vlr/IYJp2eneceuPf1j5QvsXs9ieHGbxCYex+10j
         Nv60FWrCjAlHANqhtP8iufqAF8/syzAvv1nsipbh+V4BLZXqQvVHcPXHof2u8GISnnq8
         vYjAZkHsdXkJFMdV+3qkrCBgT5MmSFktXfz0okp7bcQuypavNgz3sRQN/DDT+2tHDmYJ
         NpsbYYqjdpZBFdrac5efF2DNkuEXpcss/YIde/jgl+JviWn6vZ/YUSLTPPs1B4G+bq8m
         0YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yehdn7gwZYYtQmdw5gvSKZrzS358tipn1+pOWTvWz3g=;
        b=knKmQEDQMke25r+I5ec2YZeMynqLE19bpleBTd3CZif/cm8V1bpdBSyJOYqwun17yu
         inWgEHe4uZn69njaIVkufqoJknq43dfgqclfFT5C9/xY539Yv1lLBRszsWuWA2sYNXTC
         QiuLHyuSR4Ve3tZo1JB3oFNHQnjc5QJWrAOlzrxVBAQQ6wk6CDTBxDk5xh70wdafVW+n
         Bu/T6ttx8HdLOSSdWUdJoPRYJSzIS898vt5/KgTpF43M3TWovJDfy+kEarU01A5t+dRo
         BSjK5kHxiqZU/BTTI5Y3LPxMqn0awtlh5Jp3Xt8wmDOuNnGFeQ+Qp9rmMlMANFVMj4tw
         IF4Q==
X-Gm-Message-State: ACrzQf1TFFiyLpn4PDqwLHUMkPMvaJGtG5FMqThrqrhf2Qh+uVtIC6WA
        9R3v7jUTWAnKnufdbMfkDg/irg==
X-Google-Smtp-Source: AMsMyM7mizVF0KTOys/pbmBZMouRiYVx/gmHUF6UI8HRmU7ngsANk4dEuPMrUp5gdpO6trffqfQdmg==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id m7-20020a2ea887000000b0026a871ba16dmr10577873ljq.482.1667414670299;
        Wed, 02 Nov 2022 11:44:30 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:30 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/11] iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry
Date:   Wed,  2 Nov 2022 21:44:20 +0300
Message-Id: <20221102184420.534094-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
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

Add generic qcom,smmu-500 compatibility string. Newer platforms should
use this generic entry rather than declaring per-SoC entries.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
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

