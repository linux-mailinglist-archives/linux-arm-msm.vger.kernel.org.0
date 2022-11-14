Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F5662868E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238112AbiKNRGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238148AbiKNRGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:45 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93F12D1D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id c1so20324349lfi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u8ckjitOk87OPv1Jwz8aOeKIkjevPLVEgZLx8LVKu0=;
        b=RKwF7+xKIOGSnKveI2PAInWKUnqEGSjLhQQFfCvQVMPJtbi24+cGu0b3OcSyBWppll
         azC4x8354D0ekmcZLlbmkrrPTGLZ6URFJGHgfgj6MZRRWKbm57ekKj/VRsrX+dLG6mtT
         5PdEX7ghguLGv4P9P6nctM16YxC1j3bEkYx6zSCnVoY1MApK84obwxNNeWUKGAkktnf/
         9EKacFihcXAH7XE6hu1+s5RMFbm4zIF5/lyodKZHmITBZ+RWQmbFTpfQxDiC8rXNq5pE
         aqiHMTlwOuWc4bWrCVEZB8e+kQGeIMo/dbg3fznpg/d2JzLVAhAytnSORJJP/Qa74Z8x
         NXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u8ckjitOk87OPv1Jwz8aOeKIkjevPLVEgZLx8LVKu0=;
        b=quJa8AbGeH2D53K70l6bTHdlnCYmbXvVaOoyMswgwcx9n/pLbULQuhq0RJvfIEo4cs
         rVZE9qADSshme2zZ6EC8A4HXK8bYPcPO6YWcIuhqMm6lKFm8c3HIWa24L624mfxyFqrP
         avJRd6hQJ7Iojd34J5lceUVpQnxJDJLjwFyB/3+vauFuvvbpmUJPJCaLoVsENUpiX8AF
         2IcQA1AjV9j5FuACTdwG9AHiMm0K1960Cy2m7blBiuLx20/9CMENF0JCahXEPKaAGssR
         2VGuv5cnKSJGhOGjOutVhthE8HpiFtKrI5troNJ/WSxNWJ7D/496gJwBQsmM/HZzmjN/
         4pmw==
X-Gm-Message-State: ANoB5plVnQpwFMEso3i5atkSKouk1hTZkdBjeOvt3Z5K5OQIK2aYxkgF
        qFJztdwMc6TPGfCggNHhZgBO8A==
X-Google-Smtp-Source: AA0mqf6iE8d2S2e+OPdybOymDTWtPOKfA6NgyrVu0mdAo+HMp22j6G/cBaBrN6dsAlqFPBVieiGcXQ==
X-Received: by 2002:a05:6512:79a:b0:4b0:efed:e3a7 with SMTP id x26-20020a056512079a00b004b0efede3a7mr4543580lfr.323.1668445604416;
        Mon, 14 Nov 2022 09:06:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:44 -0800 (PST)
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
Subject: [PATCH v1 10/10] iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry
Date:   Mon, 14 Nov 2022 20:06:35 +0300
Message-Id: <20221114170635.1406534-11-dmitry.baryshkov@linaro.org>
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

Add generic qcom,smmu-500 compatibility string. Newer platforms should
use this generic entry rather than declaring per-SoC entries.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b93aaa0594d3..0830e614f3be 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -496,6 +496,10 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
+/*
+ * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
+ * special handling and can not be covered by the qcom,smmu-500 entry.
+ */
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
@@ -516,6 +520,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
-- 
2.35.1

