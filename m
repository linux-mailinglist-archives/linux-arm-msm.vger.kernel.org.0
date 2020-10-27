Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880DE29BE70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812924AbgJ0Qqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812244AbgJ0Qpk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:40 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 114EE20727;
        Tue, 27 Oct 2020 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817139;
        bh=EvUpr/4Jj76ag2w9gd6gTlbLaqRs2cq6xglW7LfP0Lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HiNcshk5z1Q/F5SwlvJCDURo63WmP4gZ0zZGP6Ux/cmwk/swyOrLm6edN4MMdEWhN
         7Y2lLW1f0DFoacMXdzDfU0VsEQNSacrlYnXbG8sMqriQCNuUSPhmb7Nz+2aV1Remm3
         UWjnjPWYEDi+kgeIniU11Iispnp108SNjCAg6sKc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: msm8994: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:07 +0530
Message-Id: <20201027164511.476312-6-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 6707f898607f..fe537e370e80 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -305,7 +305,7 @@ sdhc1: sdhci@f9824900 {
 			status = "disabled";
 		};
 
-		blsp1_dma: dma@f9904000 {
+		blsp1_dma: dma-controller@f9904000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0xf9904000 0x19000>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
@@ -401,7 +401,7 @@ blsp_i2c4: i2c@f9926000 {
 			status = "disabled";
 		};
 
-		blsp2_dma: dma@f9944000 {
+		blsp2_dma: dma-controller@f9944000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0xf9944000 0x19000>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

