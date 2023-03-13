Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE686B7E0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjCMQsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjCMQsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:48:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D28113DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y15so7016890lfa.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4EPxcSMKiqyNw8mJBAxwHQ7n6kIvPBes74o/rWBPSc=;
        b=WGT3m6Bq+FlMV89lAyG3qHtf4a7T1H74+Zt8ihSuVZidukp4nDaGzKHmFa6q8SuA7j
         EDSs201AUmv31A5BHRpq2n51b458N4EvR8I7r7vthkBwWOIpqQdu/JNLreVpqtMk09hq
         cU1aPHmMkWqVNY+nupjvZBQX7dOmxcd6PGVHAcgmndK6UGTIZr3YYfbnyKZj/LUma8Gb
         U4v0ehJ7U5kdnEnb4BpMvW2qB2X+SOzcuEY9V21ucFMBjdAjECYLzVG148tj4qUCkrvI
         EWB0khNY5ToBkHQS7WGdwCttlL7zYurFiuEjI4z8gpnMGiSq7lG8avHwuls7gAZTmaIF
         8meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4EPxcSMKiqyNw8mJBAxwHQ7n6kIvPBes74o/rWBPSc=;
        b=DAfVIAjOImJNUJdbDwXvA5i+/O+3/DxBdErUZdapy5AG/JSs4rI8NjcDqa0IbpVJnu
         lnrGjY+NvPROOC7HakMpOYA41G7ZvDRa6UGL3be8vE0C76ysnBsKQl/4KhLBq5/pf8Gk
         8K36BMbIwT+2t1bigwlMqmLrHyiHAcbUJyn7DCjLTe2wyM9ild0pWb2IlhWr3XxLR4ir
         FonVDIsgapSfyeOK98uggSnUKAC+HzBQdSYqfxQWj0983xnZwjR7eEfOZGNlL24OXASu
         d+TrNLTozINHUiJNMTFfLQZpwyBLpYzH8AT1rmeNPF7GCz3Jvs/dr8+DAAdO6Q4CAk5v
         ECww==
X-Gm-Message-State: AO0yUKXV+GPtcoHTkWzpZFCR7pDi9X2lKufx/9d12SOqRDkmopO9g2ZN
        q9uy3rvGVOWs1wbKpRVIM45gxw==
X-Google-Smtp-Source: AK7set/Jbk5EExCKOsl9LSNiNwUukfcT6PIrHp7lrdbYtZkzlEltDW1HfF8bJ5S6P8Vybs45H+Azog==
X-Received: by 2002:ac2:4859:0:b0:4e8:3f35:6844 with SMTP id 25-20020ac24859000000b004e83f356844mr1879171lfy.19.1678726077472;
        Mon, 13 Mar 2023 09:47:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651238a900b004db48ae69cbsm18134lft.206.2023.03.13.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:47:57 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:44:21 +0100
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8350: Add qcom,smmu-500 to
 Adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-gpu_smmu_bindings-v3-6-66ab655fbfd5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678726067; l=837;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=B33R6GkwOZUQE4WAkOBwxyKbh5vZSkdob4J+byg527A=;
 b=rbYRN3k+OOfapcGQJCdMVaFAS/giXvdxVEt4RJwwDV+/PVlnyaHmUoaBAJDQCYdc7LLb+ZIY3uwb
 Pd3VvH/pDaIRSt3IcFGDqmVWwr3M5IlEKmWKVPvQv/qNIJIohQhy
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1c97e28da6ad..19a6a9785936 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1907,7 +1907,8 @@ gpucc: clock-controller@3d90000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x20000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;

-- 
2.39.2

