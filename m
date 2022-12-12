Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD9A649E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiLLMLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiLLMLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:11:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95A865FA
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:10:59 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j4so18245429lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArZdgDUPTxxyHH9qYlQrCbZtI7IOKmLLf9ZbqR0krVg=;
        b=euJoDwYFzbm62Z2MoNPWwEh0uYkbDZZY5Ge2FXxsFmGKf8k35Tw5IyBCfaFR3xIuYW
         i5KD9wihfj0XjGvieZjDZneMohCZyhVsSmdu4QN++NKWb1Lz0uRB9c78yrNzGnG/qW8q
         BvdNUFd19wjl+xz3oHZanWNyR3v6Gf2DAl8vkURtOXaXTdr94MtUzuBECLaIuFUtrEB3
         KXgCzDdg+XG3SAN+esCfhrlOmynUDQfs7fvg+lCGvV3LIlcFTDLKsPNj7S07Rzix6AmV
         OwSHjBBTC62wSdr9InzccDj5Jlvcvfwj6vpq36jK901X3dRl3U13gK6zxHfckMI/uADH
         5pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArZdgDUPTxxyHH9qYlQrCbZtI7IOKmLLf9ZbqR0krVg=;
        b=ViF/i9BAxuupOeoIy/Nvl7nh7gsB8bnWEYUl8NSRtCVBPmn65AAGGeP5jwwZqVlQYm
         5T9D3AkyjQJ6xZk+paYF8Pj4vtXjJn39L+x8xjiWfo5itzDR74mudWlNHWFD1Y2lt2sy
         J1EjloKaC6AG/AyeDjwGUAfaskNS2syJTCQQfTzr7VaP1T3kHPl+6jDOUkdmK8NiRlsc
         0VlF3+NIeNFgm3mtCl8plDxVnZ0IT4HfDzAVOW0zEEap39ph3MN3wW2S9QdfGC1o0NSh
         smlx78d+++/cpBW7pwCFDfOeIt53nqthjdTS7mBxm9b09WHZeokTiY1IuEEzJkv7nBYj
         5nOQ==
X-Gm-Message-State: ANoB5pnhJLmcmP7QptjGPPYxJHPXYnB/w2D0PigTO6a1fAygFiIk0S36
        Be1C/MSHVKjYbPidRC1tLxlmKHf3s4ab5p1k
X-Google-Smtp-Source: AA0mqf4UwVm2QNGEWhCr8AWM3w7xJopx1vjnQH10HOcb31DgqEYIDHUbF+ieDqBsnWDwIh7npmW6Gw==
X-Received: by 2002:a05:6512:224a:b0:4a4:68b9:19fc with SMTP id i10-20020a056512224a00b004a468b919fcmr6308665lfu.36.1670847057942;
        Mon, 12 Dec 2022 04:10:57 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c7-20020ac25f67000000b004b55ef84338sm1604592lfc.305.2022.12.12.04.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:10:57 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Emma Anholt <emma@anholt.net>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add SM8150 DPU compatible
Date:   Mon, 12 Dec 2022 13:10:53 +0100
Message-Id: <20221212121054.193059-1-konrad.dybcio@linaro.org>
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
Changes since v1:
- rebase on clean -next

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 91d404deb115..ed884c85e262 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -250,6 +250,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mdss" },
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
-- 
2.38.1

