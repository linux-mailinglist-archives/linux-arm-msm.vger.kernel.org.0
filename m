Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A185A29BE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1794967AbgJ0Qqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:43562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812117AbgJ0Qpd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:33 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7808220727;
        Tue, 27 Oct 2020 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817133;
        bh=KgvixDujwjjmiT7PyGAR2BY3g6dE7vIDo/NAczXLdNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nCrNZxB1dtlcBX8J9JzGuCTAj20FOH7/VCP/PdanLT6Fb5XQhEgidui9+USPlaSAs
         1H7VlkU83l5Z/LO8EIJszpj175m5sNSU3e0gU4wAJ3TsoZaWWipa/fQ/fO9t1588Jc
         ZJnBk60bMhnVVmDrN/ZM+LUv0nJyFqwBwbz4atrs=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: qcs404: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:05 +0530
Message-Id: <20201027164511.476312-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027164511.476312-1-vkoul@kernel.org>
References: <20201027164511.476312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DMA controller binding describes the node name should be dma-controller
and not dma, so fix the node name

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b654b802e95c..339790ba585d 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -801,7 +801,7 @@ sdcc1: sdcc@7804000 {
 			status = "disabled";
 		};
 
-		blsp1_dma: dma@7884000 {
+		blsp1_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07884000 0x25000>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
@@ -1045,7 +1045,7 @@ blsp1_spi4: spi@78b9000 {
 			status = "disabled";
 		};
 
-		blsp2_dma: dma@7ac4000 {
+		blsp2_dma: dma-controller@7ac4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07ac4000 0x17000>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

