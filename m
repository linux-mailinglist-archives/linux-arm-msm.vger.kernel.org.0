Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6036E49AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjDQNRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 09:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjDQNQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 09:16:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDF0B77E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:16:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ec8133c698so6561067e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681737371; x=1684329371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsLURC3owKowAjRUI95QJeyM80kZGGfPZpm5Kswf0kM=;
        b=QZtv10Y2snGGncd4MO5kH3pmmGetCMOhqXtUrRRzNkRvc44rvq3UFR8AFaAgPUqYDh
         6PIPhEiozSblVj3y0JxZyCBM7Nv7LKGlVpYaNO8PJsd08J/VnB4gclMh6hLBHEvj9mpj
         S4QX9HEa/fCx1Gg5m3pqFeCdibHfISsKn/28n4BA9Q4JVbop0OcvkB2FGyKtThldIxV5
         bqYXuzG3vmaGOwzf92B1Yl9/FDKX5PHTnmwfQPcfd5NtsIeKJhgjQPR7CQJsadZOuWsW
         muhuiElA4HBA+4l3kBF3URdZctztYDqgvVhH58wX53O5G28/UCnn5ZmtLLfmoIZDe6ba
         EPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681737371; x=1684329371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsLURC3owKowAjRUI95QJeyM80kZGGfPZpm5Kswf0kM=;
        b=YJWdRt5OuYdMpfkVvEEZPRdHVvqm2cbRxm7LARVT+CjExyFAJFk+btpDobEzc5NfIy
         UpMveyUVlBiS/IMk6Yyvvq9ytXDd8iXbhS01dR55f3Bl+M0fbYhKfqHRIu6tR0XciBMb
         bvpnZslDWnF6KnOwv1717Cr3JGbgDnlOWqGAKOF3wtJECfOO7wVqmBEpyzs8stMCGyk+
         CkxZSOEdhPc2ha7ztVoTWsWWzqasYES4oex4N8AS6TUNWkhImpzNph5AT2O5Uaj6P7Zj
         NxwBeBZVAJ3PDfBZxoWj3CB5eFx+6/j0cesA8xp0P+AA15E6q9o01DMl81MS2elKfem6
         1rOw==
X-Gm-Message-State: AAQBX9fI0COGnIb6XIgpzp1aVciLv9yv4pxWx2e6cHTpa/QyNqDB1tvn
        YV0hLUumPaghFJtThnhS3bpKquZwvfnQGX6tLPY=
X-Google-Smtp-Source: AKy350bJEuoVoO4QTZYeoYWWPIdSxw+1myKTw9gC+605fCIC+2nf0RlG8vthQd5PUQimlR+IOFcaJQ==
X-Received: by 2002:a05:600c:ac9:b0:3f1:6f57:6fd1 with SMTP id c9-20020a05600c0ac900b003f16f576fd1mr4444391wmr.9.1681736333441;
        Mon, 17 Apr 2023 05:58:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c471500b003ef5bb63f13sm15557546wmo.10.2023.04.17.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:58:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sa8775p: add the GPU IOMMU node
Date:   Mon, 17 Apr 2023 14:58:44 +0200
Message-Id: <20230417125844.400782-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417125844.400782-1-brgl@bgdev.pl>
References: <20230417125844.400782-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the Adreno GPU IOMMU for sa8775p-based platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 191b510b5a1a..92712d0c4100 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -605,6 +606,42 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sa8775p-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			dma-coherent;
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HUB_AON_CLK>;
+			clock-names = "gcc_gpu_memnoc_gfx_clk",
+				      "gcc_gpu_snoc_dvm_gfx_clk",
+				      "gpu_cc_ahb_clk",
+				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
+				      "gpu_cc_cx_gmu_clk",
+				      "gpu_cc_hub_cx_int_clk",
+				      "gpu_cc_hub_aon_clk";
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.37.2

