Return-Path: <linux-arm-msm+bounces-1199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6487F18EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EC56B21853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4438D1B26D;
	Mon, 20 Nov 2023 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0snwrBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF91E523;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCF4C07615;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700498618;
	bh=DC95nfTMAwwngRHqJh8ElRG2sucSbJU8XrRK1NHwywg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0snwrBCmfmGdWevXrCP9VIENSRNOBZ9tDrkgxeyFmQjVFhSllxoDS+9+8e9BryfB
	 YgCm2Qxe1jmN2Zlk60C0lZAQ1gG9UnNlohuVc+mH5x49A+EUzo3+dwrk2OETd4eJ3a
	 auy1Vj2X1qHiBcRYY+OAdA9ufHeZWiE6roWUkROGVkTYbQUAkCI3q3GiqBuWMRJvwC
	 yaSGMCYKWqIBERY5Wkr3miYxk+Y8eAiPjwZyvqcxTnjd0Il8L7JB1sYScF73fHCGju
	 aiexUqYeoPCadkdTjSbH/qKzSlSPRzoB4mFcMZaBoFk2dUSCg5eFEnUSQRcVFjFSDq
	 KzgbqPFLWcIOw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r57NE-00027d-1P;
	Mon, 20 Nov 2023 17:43:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 06/11] arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
Date: Mon, 20 Nov 2023 17:43:26 +0100
Message-ID: <20231120164331.8116-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120164331.8116-1-johan+linaro@kernel.org>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP/DM wakeup interrupts are edge triggered and which edge to trigger
on depends on use-case and whether a Low speed or Full/High speed device
is connected.

Fixes: b080f53a8f44 ("arm64: dts: qcom: sc8180x: Add remoteprocs, wifi and usb nodes")
Cc: stable@vger.kernel.org      # 6.5
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a34f438ef2d9..7a9cb0418ac1 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2550,8 +2550,8 @@ usb_prim: usb@a6f8800 {
 			reg = <0 0x0a6f8800 0 0x400>;
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
+				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq",
 					  "ss_phy_irq",
 					  "dm_hs_phy_irq",
@@ -2624,8 +2624,8 @@ usb_sec: usb@a8f8800 {
 			power-domains = <&gcc USB30_SEC_GDSC>;
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 490 IRQ_TYPE_EDGE_BOTH>,
+				     <GIC_SPI 491 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq", "ss_phy_irq",
 					  "dm_hs_phy_irq", "dp_hs_phy_irq";
 
-- 
2.41.0


