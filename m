Return-Path: <linux-arm-msm+bounces-46122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51ACA1C0B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B942C16C3C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AF5206F04;
	Sat, 25 Jan 2025 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdRvdplo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C62063E4;
	Sat, 25 Jan 2025 03:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775903; cv=none; b=pVGxxtvVRLbYfglrt0KZxMr0m5oNPzI69th+P7YgEhKZbjK9c7t+HZmrH6+JDGWyR7F+t8+vczTaAfJ4Obk4V0rDYb9TDWhjGiuitzE9vTH1CqAMFDtjUMoeJftawNtuRDxOU1pumDefGysfZP3kDix2xqAwlA7ZnT1ST4CNuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775903; c=relaxed/simple;
	bh=GDujCMhOVVbF/OGkA/cD0FQzNrWz3/J//fAtWlpG0fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7uvMelT9xgvUDRpH4AtVacgyayoQFRi0I28K6xZ9Rh0Wh8Sy6domfcLDyK+pOEDi9mxkRLfU52aUzTvqMN6dX3XTwND/9yVpOTDoowCGr12U8VghTQPYr55SDaRtoYTot6fVrRNbATzraZur47zQ2898QdJz0UJC2DvX466bF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdRvdplo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4317C4CED6;
	Sat, 25 Jan 2025 03:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775902;
	bh=GDujCMhOVVbF/OGkA/cD0FQzNrWz3/J//fAtWlpG0fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KdRvdploAPIfn6EEtynU0HDdM0aQPYTyG/c4wjZB+1Bc3g+CZFIWk6D6Wgy5pTti5
	 6bHuKWW5V3zlJBiGPxeTtIdxQJfKnPK1FldhIh89NYXnW+ofF/u3igx0aZ7IrmJXwQ
	 BFJT1Obbk+B/2aJ1c6uQEQaJHujyTZtqVqxoDpgwZwLyIYGoE0/nDz5E4kAYswe1kO
	 JshrPKvgteelV40A9ybdUTnryJ7Nqw/y9oRXc0EwOsP6TXK9a63PpvsjCwS+VpYHo+
	 k4JBCVgFqjYC3Ahlb0Z8O+tGxuF0idbEBM/SFcoNMpeuV3ZzO5VkPfmciwginZGqyR
	 V3hPobjiZoTHA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 25 Jan 2025 04:31:20 +0100
Subject: [PATCH 4/6] arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-topic-x1p4_dts-v1-4-02659a08b044@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=1504;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=//cWEbi2fnq+Tpg4TDBCdb1vBluwbx64WbsKihfsqNA=;
 b=jQMru/hQw4aehAAXP9OupLWu1ucELuM6zrqR4TDeUoHjoT0I2sQlCYpvspCdD4p/oY5G7Yqin
 DCUA9PPmhzTBaSNr6xyovArY2a6Bs7AuULmECOMSC9bDLw984fVkmYE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Asserting the NOCSR reset line keeps the PHY registers in tact.
This allows us to avoid programming long tables of magic values in the
operating system.

Wire up these resets to PCIe PHY4 and 5 (it's there on the others).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..a244cbb84aecc23ce11414c41f2e5d0905f455ee 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3558,8 +3558,10 @@ pcie5_phy: phy@1c06000 {
 				      "pipe",
 				      "pipediv2";
 
-			resets = <&gcc GCC_PCIE_5_PHY_BCR>;
-			reset-names = "phy";
+			resets = <&gcc GCC_PCIE_5_PHY_BCR>,
+				 <&gcc GCC_PCIE_5_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
 
 			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
 			assigned-clock-rates = <100000000>;
@@ -3692,8 +3694,10 @@ pcie4_phy: phy@1c0e000 {
 				      "pipe",
 				      "pipediv2";
 
-			resets = <&gcc GCC_PCIE_4_PHY_BCR>;
-			reset-names = "phy";
+			resets = <&gcc GCC_PCIE_4_PHY_BCR>,
+				 <&gcc GCC_PCIE_4_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
 
 			assigned-clocks = <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>;
 			assigned-clock-rates = <100000000>;

-- 
2.48.1


