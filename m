Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DE14751AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239728AbhLOEfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:11 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:46486 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbhLOEfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 72793CE1C09;
        Wed, 15 Dec 2021 04:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEEFC34600;
        Wed, 15 Dec 2021 04:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542905;
        bh=o43MS1iwY7lmLuBfPF6I5dCF09PMcpDX/HWgUMI+gDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=khoy2vXylEnhKC7Y13qdpPVvvHKci5Q91HssNRiwq3hGoHktQs/oU5V2B3Ob6ra6C
         qz6iIMxPIsjEnhuRz/cYD60dpgwsqJX4XtZ0W5Z2RSYEXrAFHa7MCfk2aeuFhjEmBa
         xM/zloqiwY/35KbstZDu2pxmPaUXnHB+dJi1dqYpP6YxSZWGrhKAMDNaK/JKxFHLs/
         M+Sp8iMU6dKfZvtiMLp+Rm+sWUPOTbxy431g7FkYDpzEGBlopNV2WgD/LhrK8V8e+z
         BYFiAFxkJZpPzrjdE/M8v3bQMmChiewvdYcoQY6doCjPsSwyrtMjsbmEqb/Oq1K0hy
         pGSWL9Grbc4GA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 04/11] arm64: dts: qcom: sm8450: add smmu nodes
Date:   Wed, 15 Dec 2021 10:04:33 +0530
Message-Id: <20211215043440.605624-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the apps smmu node as found in the SM8450 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 103 +++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d9439c6ebfa2..d29680c405bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -615,6 +615,109 @@ qup_uart7_tx: qup-uart7-tx {
 			};
 		};
 
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm8450-smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts =    <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@17100000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.31.1

