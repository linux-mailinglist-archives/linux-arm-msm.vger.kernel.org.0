Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4402E29BDB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812897AbgJ0Qql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812476AbgJ0Qpt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:49 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F22C620727;
        Tue, 27 Oct 2020 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817149;
        bh=4jUfUYDm1HNKAzB02JcIWgYnCiZyAD081RmZlDCr/G4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ega+gtkTq6cEFfb+TQahnvv1Kwx7H0vplsB/YEfs0ZtDyiFq78SMTNF2eRuKN7qk7
         iF3n1vjCez5HOlbozYE6If78GvDC4/bLrL0ctfruuZaumPKKX6vMInVJVqeRj29N64
         KI8mmod/DE5aVoBsE7y5fyOUYcmrqR8BV+Wpq6Ik=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: ipq6018: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:10 +0530
Message-Id: <20201027164511.476312-9-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index a94dac76bf3f..1bdcebc809d1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -192,7 +192,7 @@ prng: qrng@e1000 {
 			clock-names = "core";
 		};
 
-		cryptobam: dma@704000 {
+		cryptobam: dma-controller@704000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x00704000 0x20000>;
 			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
@@ -252,7 +252,7 @@ tcsr_q6: syscon@1945000 {
 			reg = <0x01945000 0xe000>;
 		};
 
-		blsp_dma: dma@7884000 {
+		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07884000 0x2b000>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

