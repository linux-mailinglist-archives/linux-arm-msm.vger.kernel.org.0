Return-Path: <linux-arm-msm+bounces-56640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38363AA801E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196691BA0D07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1899E1E9B26;
	Sat,  3 May 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="neXzAxVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8B1DDA00;
	Sat,  3 May 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268809; cv=none; b=X6rn6bfP+hX0KnHaeY48Rj7V4Uek/QKdr75hX8T3sSbyu8UsDl2AIcwPvtzi7oRgPyZnX3U8PnW3JXoFmci+D2mgVa+bbMYTY8YNcblBzMfjhKD2FjoR1dOZmTm5W47cgrqS4SDDTuS17E7C8gMN/lAmBbJU4LZWkQBk5YW6gvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268809; c=relaxed/simple;
	bh=VM78bnqXE6eBOsA+BcpvbWTxuAL5iTO9ndxW92ZfweM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcvYT9qXcwJUgA1BP8UpaLbFlsAcNJe7g2aUAY/Hghof0mibgIJfiYaLcE8//QLFbOrJQcqkiHXlKStybHxgA/jOLA61wci6863Xl6E8K52a18d7DZ8emat3Ez3Oyp5kXxG1Lkrf/A4mNm+GipN3xnVfoBqjjdCbMvSQzeYTHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=neXzAxVj; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268803; bh=VM78bnqXE6eBOsA+BcpvbWTxuAL5iTO9ndxW92ZfweM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=neXzAxVjwHs/q7EVyU3mlsLOMxUj9UdtTE0ZOQrmnj45Rmxvl7aBQ/8o8TiMNVt4H
	 Cj0NM89CXAiKn3tgALppq7J0R4+0cpbQjxqnGprmGVNYc0bCmXPdEx5XP0+T00vd+4
	 nIFhULWMuaz5TeDAXRfgPhObG/2gCU2XQ/kue//W9des5+Bcumu5PDdhnkkUt+nZDc
	 NDrkk/c9+/bIohTh88hpH1/nLUte4vqwMKJ33WSJekInl+TFRem/c4AulA6l9gWwL3
	 ceRsHWnKGdHKaaopdiUutbJfO6zk47Pd9zWzhe//TL+32pgHSZ1kuZI14K6SrB6JUM
	 IzkO0M9F7OELw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 37020C995;
	Sat,  3 May 2025 15:40:02 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 03 May 2025 15:39:31 +0500
Subject: [PATCH v2 4/5] arm64: dts: qcom: x1e80100: Add PCIe IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sc-el2-overlays-v2-4-24e9b4572e15@trvn.ru>
References: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
In-Reply-To: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
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
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ7aOsXspvdR4afafYLHfc7zVuVmThcjx+y+
 YgWuneG8wmJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyewAKCRBDHOzuKBm/
 dRFpD/9A97XMAN+kp2VjUzOrl3pQ1Fb8f7wH57nYgMHqsnCcQvyaI7ZoPIjzSrQwXfvA8VrLPLz
 uLkSho69HjBlPPF0SPJ8e4TPaEQOWtlaq2tHPOWcHKRcE7CklL5ZcVmSS+eDlRTtr9blhkiScMZ
 vAop/Rfa3eOM2yq++dG0bbd+gRF2mNpQkbSNlJFXv1dW4xhsGogvpJHLDiw/8rnv1c4f4nzx4AX
 zBZE6Sk9H5QI/HZcFkcAa4klhAy6xZlHxYKTEWBXIMVcux8vGMuSjDU3bSUzJHJbVLLKlATXpS4
 rWOlYgmOKzM96Nnhz8xbysoHRuXdYSnw6jbvOZSiQnS0lwRTYzprHcdcaoFcXNaKd+OfteMvL70
 h8jDHu18DI9qIt5FbGBK19nnbuIvNPnLqkykQ65YPyzqfivH/d2fZuamLMg/cv0VelSu0+iGSy1
 buTwtGa3RueP/ArQ3KPWudqwklNbu0voCO6gmcEq9HpKVQ6rR5VkYSdTzcck5FkgR7BM4e7AnHF
 nFIwxDkBe8JasUeeFTUZ+NxpJM0cha64OKrRCm0WyzeZNcnwxZLqmXTVTX1KS7rkeR42waPUD/U
 klMFyfJG/VcgpZs86KCaSWmtYpvPe2WkEVKycHW3XBrqsrXdo9KoleHOwcRKao9nSXhl+LIxFPp
 dPiDuVdbpy9FRJQ==
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


