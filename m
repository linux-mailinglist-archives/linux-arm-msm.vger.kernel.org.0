Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7E129BDB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812889AbgJ0Qqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812037AbgJ0Qpa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:30 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DA9920727;
        Tue, 27 Oct 2020 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817129;
        bh=wu7qH77/sMjF/rlV2OwWq0clMhb7r2R1kaC5yiqqKbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rTVt0ewWA6rz4H2BJo5/ULoqhvWWi8IXP4pXN/uQwbXyKegpJ6YyljonRgxlB1BR/
         AP9cDphEVPDETUm1MPoNQM8BBXFll/0DsOW9podjBhUtcU6Z67QqJNn89bgAmdhFWA
         4gKky0q8Mqx9PVL6p/rJXx4av5W8dRJQjE+5q8cw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: sdm630: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:04 +0530
Message-Id: <20201027164511.476312-3-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index deb928d303c2..37d5cc32f6b6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -830,7 +830,7 @@ sdhc_1: sdhci@c0c4000 {
 			status = "disabled";
 		};
 
-		blsp1_dma: dma@c144000 {
+		blsp1_dma: dma-controller@c144000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0c144000 0x1f000>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
@@ -944,7 +944,7 @@ blsp_i2c4: i2c@c178000 {
 			status = "disabled";
 		};
 
-		blsp2_dma: dma@c184000 {
+		blsp2_dma: dma-controller@c184000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0c184000 0x1f000>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

