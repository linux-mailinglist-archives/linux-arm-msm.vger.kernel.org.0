Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82E16CCACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 21:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjC1Tg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 15:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjC1Tgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 15:36:52 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B883C0D
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 12:36:48 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p34so7605584wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 12:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnMzj7ZL79LUqbUVPGQil7x2FOJbb8kWmQlz9dfo7dA=;
        b=xWi7Hv9NpattlAgLrE5n4/25XF6YG9IMjnz6bom/kF+tMy3RnLf1pW5INeMugCkSyw
         SASbBVXtYrWuX/fXcxoapxKAcIZPYh8hsfbHEclxV4iUj41b1SkVQ2/XFO3NMWQTa7BJ
         2OxTiaEye4sH0t2nUGfqsBJZt++ifJ84wbpfejsSuhlsIrsbvmeOhh3TpDgaJn8Fj45a
         xmsGaRLSyvqkpUYmnR14iw26U5+TFs+ZyWwTUvIwle0pv+IR+viJ/D3//quffnFzGBBI
         uo7v2+7FNCqAEdRLMg72+rOAKHDZVtbgaW7YZIcNhIsVwextLdSL0Sr7OiNFtaRBsT8Z
         iOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnMzj7ZL79LUqbUVPGQil7x2FOJbb8kWmQlz9dfo7dA=;
        b=L/Q3p6jwDX9o7y5WVmJFvbG/hSl4mmXrXvApgURdLVZZbFBXbF2DD5Hbf9XdvDTPnG
         ud/mINEnhiE2S67pSxz3OrAGT0cNDXY6NQVDK1MC2oiVndJPA9r/W6+Z5lnaNpYRPLy2
         yHOI8zdVbIWTvAK8E18wnRKvBxqzgsFZGqqXAvX+h2XrLrdvuQWWxrr39kMQHbdrLtgU
         /vXVF/QuY+PG8lns+KPbpiEbEmOrhKk01hr35ofBMfhUWJhoYCKd4gDcPoVLtIBW2rqd
         qQ85OWp7MElrimJ+8z+a6uiE9/hfgPr2R+wzgmu4ynrW+aqTfIRb2Za6DT71tc1Rf9dD
         7e3A==
X-Gm-Message-State: AO0yUKXeZufxIR7jUgdsuu7XqDKQFNcx5pD5Wf7ZjO/VOLfEdXrnLcpd
        6jV2Zo7t6xGmNsXSe/hXpXkWig==
X-Google-Smtp-Source: AK7set/amkAAst5aN5iawLGDEAZKdW/QVQ5cwY3lBH30XnzTf2CTyiV7lWHVjHV2Dk6mjnns57wW9g==
X-Received: by 2002:a7b:cb81:0:b0:3ee:1a70:7ea2 with SMTP id m1-20020a7bcb81000000b003ee1a707ea2mr12434106wmi.3.1680032208496;
        Tue, 28 Mar 2023 12:36:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 7/7] arm64: dts: qcom: sa8775p: add the GPU IOMMU node
Date:   Tue, 28 Mar 2023 21:36:32 +0200
Message-Id: <20230328193632.226095-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the GPU IOMMU for sa8775p-based platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 4c45ad1cc7ff..de5e8449397c 100644
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
@@ -603,6 +604,34 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		kgsl_smmu: iommu@3da0000 {
+			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
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

