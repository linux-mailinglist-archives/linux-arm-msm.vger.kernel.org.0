Return-Path: <linux-arm-msm+bounces-56388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030EAA6226
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019161BC68F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B828C21B182;
	Thu,  1 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="HOK0vlRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71720E026;
	Thu,  1 May 2025 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119566; cv=none; b=aoE6NeX78LTd6ksXrDYBOaAfbV3x1omPM8thRScgRgn+IYLIgGPTBsc1sr58dnh38tB/Wyf3QZtK4aOvVdNLrA4eRQYXuRdGLH9b+Kw5RMYTmN2SLyjs9YMhkP0prF1jQlRIB2HoAD7mWXqVg81iEq/pUlVYSN1JJTYF8k+RwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119566; c=relaxed/simple;
	bh=VM78bnqXE6eBOsA+BcpvbWTxuAL5iTO9ndxW92ZfweM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DaSB7gMSbIwK2ufD1kvNzc+waYfMXtlUJVZfI0LiJ1UfAmJ4y+ksJQwgoPBj3FJSFGTZOSCuRPicHQo8eo3SWlRRH9JvyXXlEm4PRmBD/K6x7+n+hBbSouvXNjKkcrqUvWNFDqP0mGpP6pLo4aZUspuI5zsj3cs9IjbYgK8kNAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=HOK0vlRr; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119051; bh=VM78bnqXE6eBOsA+BcpvbWTxuAL5iTO9ndxW92ZfweM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HOK0vlRrQKQgAm5pcY19eaL3KqbKi1yjbW+WGjiKp/mgcx94VBHMdluWkEOtzmzkC
	 JhWEs0WxC3flaYtGJf4lRhUZyCec37iYwNFP0aZ/yLOLJsdMOFQSFKFA6PcOPnNGQQ
	 cji/PZ5g8690q8EkvpSvIS6pJ4wCncmAzFIstJ0c8WOkrUo1gv82QvB1t8Xg/8fXFX
	 ayy7GWZsJejAUAGQF+UdXK1g5vHw1S4tuftQj/3XIQVobfKmFkwOeVG67MvSdg/QvH
	 rnPZzodePuCJdYMNqEUIgUUIeliaUUSzk48HM4I0dtJaY3UOiWNyGq2LRJEQDLaiAW
	 jSHbN4pcXcWNg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 51278C8A0;
	Thu,  1 May 2025 22:04:10 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 01 May 2025 22:03:44 +0500
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add PCIe IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-sc-el2-overlays-v1-4-9202e59e3348@trvn.ru>
References: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
In-Reply-To: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=VM78bnqXE6eBOsA+BcpvbWTxuAL5iTO9ndxW92ZfweM=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mDMSb7bhALw+kYQyx0DJPksw1Tp6tDtCIVT
 VAzhM1CHkOJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOpgwAKCRBDHOzuKBm/
 dT6aD/9bydQHaQH0g2TGtfomvL3MSPf6xBGIm4NhbG7lXqTbJs0/2j17oopnSo1O/Ddgx7qtSvP
 BY/YVip3K+FqbC77+p7K0tAogrvYRdPsfW4c5YqB1zSSqRJHw6CHksYrn6bNmkUX2a/j8f8A6Us
 VpyC9Aglz0WVJcHop1lfbv6BsDnNAUXF+YJoseenFmCJh4xxu5MSserovfl5YaHUhvBN68L39KC
 RS3b23sxB6U3urL/UIFUvkoSYPrarHDGBtX99rWmOVavRY6uEJRowJN5Eyq76djw+t0R0aA6FKu
 vKjdB5RrcRHC1JwMsCLeRQWXFM0WrfxDx6L9+RJb5R44CQMloORdkHT1QvRcRgyedYPBqKtdtdR
 4ep2vqaNTjnetKWUyu4cNrIpSp9jAMcU9xaCv9km0W2PJbUHzDB4Ljrz8G2vIc8uLh6qzS0JEuB
 YdQgam3yaM82fvTKhp8QLBxSUrIAD2GwiKJl4FO2Vyakxna0cMraZrA2nMDzfWOFXX9bZ1f4Dxo
 RvOri3GFTdHAEqULgiqAUyvSABE8QSxz89GnW3fKhmd1obA8osdVlDwzhMmeu5O8lRFy1kI1nfq
 xnJIPvSutUVKmnF1RKjkl2EHErOfGTqNlY2et16vWnnTZek1rSruamNi7UTm7dmg9s0WqdJx86m
 3lgVaqw+DzZ6wsg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

x1e80100 has an SMMUv3 connected to PCIe which is normally controlled by
Gunyah and is thus transparent to the OS. However if we boot Linux in
EL2, without Gunyah, we need to manage this IOMMU ourselves. To make
that easier, and since the hardware actually exists, just not "usually"
managed by Linux, describe it in the dts as "reserved".

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..7a3e75294be545a719f3543a8b874900f7c78f99 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -7940,6 +7940,20 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		pcie_smmu: iommu@15400000 {
+			compatible = "arm,smmu-v3";
+			reg = <0 0x15400000 0 0x80000>;
+			#iommu-cells = <1>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "gerror",
+					  "cmdq-sync";
+			dma-coherent;
+			status = "reserved"; /* Controlled by Gunyah. */
+		};
+
 		intc: interrupt-controller@17000000 {
 			compatible = "arm,gic-v3";
 			reg = <0 0x17000000 0 0x10000>,     /* GICD */

-- 
2.49.0


