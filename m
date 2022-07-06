Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E0568BDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 16:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbiGFOyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 10:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiGFOyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 10:54:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51611092
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 07:54:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu42so6512845lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYz/2ar4XaWyLjU/EN2u7W1gwGxP5zgcaoxekh4PU0k=;
        b=luEcINPjMGndzgVE/7GsYD2UxUeYGGHYyrNSO+U28zgb4VTV8NlAWNvZwTds/11yKG
         JZcD+SUG1xszxCwrExTUSAeIBLxlUQFI9aM7iTG9+q0077pYx2o0FtqlYydlmVgbS3DT
         79ABFUeXPie2IFne8NctCAh7IOg+7KXhUU8o1lmsa4ngp8hu5GbGDAshYURacZ03DKYc
         Xdgy9BOhCwWhc5Mux6RB687BQvoMMb+WwBDeHPw1ecCJ3ym6BvADBrpakvYixJJH3Gy7
         aV33Mamy8L2HWmtPOLYgGUWU4aLhM9HwY0nOFYTG5vblJJIBz8UAPDMnZx5VnoE7J7j1
         FjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYz/2ar4XaWyLjU/EN2u7W1gwGxP5zgcaoxekh4PU0k=;
        b=iqStxkCLM/DX2rxjjlLxvQCT0QMcWmAnN6POOiB9UxNnlaztePJWpMJ8wPnrEu8kdI
         InNdKpd7g7/LkDpMk653PgdVW8ana9OBJRkogOS4UV9qLx+FeU22fdWzvhui6xNor8yg
         GvOu6kFkFDPCCuuinUHRpocQ9aJQlgUbVeIzEHf4IbC3nh1yBTtBc/sKzpZ9TceStfrS
         YlyABjpDeyoUtTWVjJH63WYe5O3Xa2JZ4gmaf0xoinVrume6gGKqJCrk11B93Xoh2UMa
         ruFe3EvtmlB1g7ASjxThKLsdEZWhMfuIArkzDRLERiNEKL/WCeHRVlj5pAMRDxnWlmM8
         1GZw==
X-Gm-Message-State: AJIora8P0TQgu2M85VpZeJPUHjbOA+ZjGQjtyNfIQss36XH+ai9bid1P
        Ffc3gAzjwhTZboBsw3Lyv+hX9XrwKv0GEw==
X-Google-Smtp-Source: AGRyM1veRLphLktXO4fxaGaAsgmuhTcFF8hm8Imqpqqxz70Vv9BIHHGAyZC/mSiHa13ZLFwW4L0GYw==
X-Received: by 2002:a05:6512:39ca:b0:47f:a9e1:e3b8 with SMTP id k10-20020a05651239ca00b0047fa9e1e3b8mr24810444lfu.564.1657119255107;
        Wed, 06 Jul 2022 07:54:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i28-20020a056512007c00b0048650aee2b2sm359374lfo.144.2022.07.06.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:54:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: sc7280: use constants for gpucc clocks and power-domains
Date:   Wed,  6 Jul 2022 17:54:08 +0300
Message-Id: <20220706145412.1566011-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
References: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease merging of bindings and dts files, the constants were replaced
with numeric values. Change them back to defined constants.
While we are at it, fix the indentation of these clocks properties to
follow established guidelines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 40e700cebe56..a3def1022ea2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2405,13 +2405,13 @@ gmu: gmu@3d6a000 {
 			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hfi", "gmu";
-			clocks = <&gpucc 5>,
-					<&gpucc 8>,
-					<&gcc GCC_DDRSS_GPU_AXI_CLK>,
-					<&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-					<&gpucc 2>,
-					<&gpucc 15>,
-					<&gpucc 11>;
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
 			clock-names = "gmu",
 				      "cxo",
 				      "axi",
@@ -2419,8 +2419,8 @@ gmu: gmu@3d6a000 {
 				      "ahb",
 				      "hub",
 				      "smmu_vote";
-			power-domains = <&gpucc 0>,
-					<&gpucc 1>;
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
 			power-domain-names = "cx",
 					     "gx";
 			iommus = <&adreno_smmu 5 0x400>;
@@ -2469,12 +2469,12 @@ adreno_smmu: iommu@3da0000 {
 					<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
-					<&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
-					<&gpucc 2>,
-					<&gpucc 11>,
-					<&gpucc 5>,
-					<&gpucc 15>,
-					<&gpucc 13>;
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HUB_AON_CLK>;
 			clock-names = "gcc_gpu_memnoc_gfx_clk",
 					"gcc_gpu_snoc_dvm_gfx_clk",
 					"gpu_cc_ahb_clk",
@@ -2483,7 +2483,7 @@ adreno_smmu: iommu@3da0000 {
 					"gpu_cc_hub_cx_int_clk",
 					"gpu_cc_hub_aon_clk";
 
-			power-domains = <&gpucc 0>;
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-- 
2.35.1

