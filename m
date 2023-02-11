Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACD26930F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 13:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBKM1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 07:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjBKM1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 07:27:53 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02473A0B6
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:27 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id fj20so7420139edb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdYk9f9xZDTgf7++vtBxARo/4rBCT4rMDxIslWxq824=;
        b=XFW3adb1zch9guAWqlDZJx7PXhNPfga6MemDDiAYnjDISLOUN+N1haoUVl7RpfQPJj
         qO/nSMkkNaqQ7GcoqVLaLV02K9mPdO8hp1D64QT4U3OCN798PdaQ910Km9keYyOCOKg5
         L7yfYRiWjAaD+EDbZUJnE9cpsxKFITtC6v0SlvdbeNnKK2LbCWbFr+inmS3jfhWeQ0yQ
         EFocP1eaLnd+XzUGwicKdYPF4vqNMvriamsE20Xc0rWSPmMVS1OD8VgvYlg92EYlH0Fl
         QXHvVVBdSwZLXQuwGsAiRX/F7cL7CqzTrD7rDphPPhjvPz1PAG4XezSk80DL8MjB5v7x
         rErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdYk9f9xZDTgf7++vtBxARo/4rBCT4rMDxIslWxq824=;
        b=cmP52C1e6kUZHnwqWS6ENpbfUUSobQ5P0Eb5ifZ5dtXOAJwaQWm1bwXGjDTOQUgAM4
         J4HrVFnZq0UBTdEnNu77HNZFWQ9eo6K88jMOOc8TDjuKkGpxK8gLN3ZWFr1Z8WXFJnHe
         cCawHGmAin9dXZ6dkZzP2yu40vUv6RLn302lxUyWUZpx3hDUCRGzazQdekITs2rfUBdw
         FY7dkja81r6ClfDp9APq9Xh1MN6JH14jJGBlKheyzoC4U8MhHfCgXphtQYQMm1jo2M7l
         lTGLsOK0ZS8FUq3GT/asoPCWWV/ExqsnY64NtZSLn5s5SBSDFlR4z/pIi0XNX7voTRxO
         Re2w==
X-Gm-Message-State: AO0yUKW0Vyb+SVF95r+IliMhn3YOP4owUP+Kv/6txPSEHXsuqP3AAfBl
        FOpCdbnBfU8+sKmi/IbZA9K8CfZyjP5PX49m
X-Google-Smtp-Source: AK7set8RJWXxy0bu+ZjFPEAtLK9+4VFI3A097m3egemW1JuCWeoEg1LHps//l/YFLahjDvycz58u3w==
X-Received: by 2002:a50:d087:0:b0:4ac:bdeb:6dce with SMTP id v7-20020a50d087000000b004acbdeb6dcemr17053edd.39.1676118442898;
        Sat, 11 Feb 2023 04:27:22 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 04:27:22 -0800 (PST)
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
        Emma Anholt <emma@anholt.net>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
Date:   Sat, 11 Feb 2023 13:26:54 +0100
Message-Id: <20230211122656.1479141-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
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

Add the SM6375 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d1b296b95c86..7425424da974 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ }
 };
 
-- 
2.39.1

