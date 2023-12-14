Return-Path: <linux-arm-msm+bounces-4679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F68129A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D01851C2128D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0881401B;
	Thu, 14 Dec 2023 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAiIqQTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE312E78;
	Thu, 14 Dec 2023 07:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC456C433CA;
	Thu, 14 Dec 2023 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702539819;
	bh=l55zeFifKbWF2oDn+P1nsRBo9MUetHUzY3iyTXVZNo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JAiIqQTZBc9pQiGXERJe4aqi8/+2XYvgN/+3b8ZZQDxRd7HamMCXO/GC8SzDfvX3R
	 StzBUroTXkpgIs7tvpQ5B9T8CIlFfKM3xxgiNaLp8p6u9sjscfJGrwISWUgCSI6K+C
	 pcKUqUa7FjgjA/FH+ht77vAFh2q1rU2PD8bbf3kRzFYmZLq6TURu/I2T3wwGhys/0E
	 ghTOSWCEwvey6PQgZtswFsyqHOBTh7cwOs9zHFlFQpkmdDtIBtow9lZwok9etn2wa2
	 5SfT7uvIWBgYshvY7YTznt1oAOr01k+8wDhB8n1Eo7iVfhXMSi31rzdo0q7v0gd37l
	 BhCxZ0bXaHovw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rDgNf-0002sA-18;
	Thu, 14 Dec 2023 08:43:39 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc8180x: fix USB SS wakeup
Date: Thu, 14 Dec 2023 08:43:19 +0100
Message-ID: <20231214074319.11023-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231214074319.11023-1-johan+linaro@kernel.org>
References: <20231214074319.11023-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB SS PHY interrupt needs to be provided by the PDC interrupt
controller in order to be able to wake the system up from low-power
states.

Fixes: b080f53a8f44 ("arm64: dts: qcom: sc8180x: Add remoteprocs, wifi and usb nodes")
Cc: stable@vger.kernel.org      # 6.5
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8f95779c75fa..7a53d6d18498 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2549,7 +2549,7 @@ usb_prim: usb@a6f8800 {
 			compatible = "qcom,sc8180x-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
 			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq",
@@ -2623,7 +2623,7 @@ usb_sec: usb@a8f8800 {
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 			power-domains = <&gcc USB30_SEC_GDSC>;
 			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-- 
2.41.0


