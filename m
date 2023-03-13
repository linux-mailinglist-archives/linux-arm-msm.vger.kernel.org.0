Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6D56B7DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjCMQr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbjCMQr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:47:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2C36C190
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t11so16541541lfr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW1M70yoKw3ke0qEOUQPfLGKsoDrv1fmhxabJtB89iA=;
        b=wwUQVnHhbc3049K71aadXxOGKQz2vf+KAAqaYJJoYFRJR9BA012g2i59rRuIUA2pLS
         kS6wElwmsI1XMLYXxf3rqg7P8a+r0p0FpU1D90sCKTpfVDFVUB73eCiaobQTTnlmedG0
         yXOdv6I4MJhAF2iQv5Yut22IWJVsCj7+yi8JniCu9MHfRXWP93GaggCG4rEcqx5gWGZE
         08xA3H6aU8gmcNGZJWhkklr6n8ax95DY8XaZFKmR6WDwMWtyiDn6cV/YKYECJvjCd6xT
         BIK7Bb7cszhUQ0SWL6L2qLhks4q2AkGI+B4e+5oLFWiIgGkY+3EHUlXZRpRirJ/6bL+z
         sTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW1M70yoKw3ke0qEOUQPfLGKsoDrv1fmhxabJtB89iA=;
        b=t9SzXMNKIpgy3REjssY//YQjD60zDG46uYmbT4n7Tnr4e7rUgpWbV4myIL21H0xA45
         GmLyKLMeXeWXB9bLxlvfOEWy1n7TtsJ9TeOqZqDTAlvkU1gHpPMHVbxatJ9PDjnJF2b6
         8ThjXolv5jl5FKARZzU7MEAZkasXRqVPft5EOYBL6ZTQvNOSxDg5VUhH2Gh5ReqqpL0k
         jvZIE7h2nyVvWUkIhP5JJmyUP6f3+/PiY1wFaBJ0SDFvuKc3oPC5JjK527ZHNkKuB4cZ
         FKqv+LF2dqoVQjQ/Czh6SQdD+bBSGoNqkQvxlxJ0FZ9YivsaEn40C8/C5+Mm3JaxWwZx
         eXrA==
X-Gm-Message-State: AO0yUKXuuXrrkwpdprmrfZ3v3yWa8iXt2YeBbjYzPUGQEphJCkFTtLFl
        7fxGwlOb2oWGU/kKkF7nfmGAyEx5fSfc7RtKDTs=
X-Google-Smtp-Source: AK7set/79RAqTXgUcyo0/9OVGLI8K8Ozm5tldsnWuZhqzbGDycoXPGIAuPL7eQvUpyrZgCYgdPU/xw==
X-Received: by 2002:ac2:43d0:0:b0:4e0:ee54:fa23 with SMTP id u16-20020ac243d0000000b004e0ee54fa23mr10052308lfl.8.1678726072993;
        Mon, 13 Mar 2023 09:47:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651238a900b004db48ae69cbsm18134lft.206.2023.03.13.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:47:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:44:18 +0100
Subject: [PATCH v3 3/6] arm64: dts: qcom: sc7280: Add qcom,smmu-500 to
 Adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-gpu_smmu_bindings-v3-3-66ab655fbfd5@linaro.org>
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678726067; l=817;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Zh+jEUOMmT9/VT4x0QSgHjBYntMVapKrbrD9iYrPORA=;
 b=SOL8f54zRgke4vKcoczqjI0hOupoIyo4vGDDVMQNALFlXOnHRldhV7kcBbl4QhKY9Q4HwveBJGUu
 IFi31BsJBl3SEGVQRdXI2wu6E25Mzzy7Uq62RPAEkKG4CH1SXmG2
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

Add the fallback Qualcomm SMMU500 compatible to the Adreno SMMU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8f4ab6bd2886..5b1f26d433b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2679,7 +2679,8 @@ dma@117f000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x20000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;

-- 
2.39.2

