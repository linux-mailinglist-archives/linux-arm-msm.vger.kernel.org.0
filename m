Return-Path: <linux-arm-msm+bounces-65842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1AFB0BC77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37B1E189B28C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA3426E6FB;
	Mon, 21 Jul 2025 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYEELwaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E781819CC28;
	Mon, 21 Jul 2025 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079017; cv=none; b=Ry9Z0IIOGdcT9QxrKtC2Jd2N+Wv1/oZa6VbcXB2mOCuOL+potyoxaICd6n6tvpEcdJJ5nSyyn2IGiTXLPtG59zFsF4ZSBrgz7z+kRV501UppUJIwW1FMjEbtraaUDXRZlD5N8RkfJ3eWscy747Um8grD3hhHjaH+p3XFopB3/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079017; c=relaxed/simple;
	bh=EpzZ1chbGmj6M6L6Q6mW37Aq6ZLgODJkZguouWUYmng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k0OOQ8ouiGvjKnyz0ggwNWwnFRULxEbnFQbjxHO7eysTs5eUb2K1JqrwyvA7L0R/hvgejXT4zYkQbpX5zlnWiMOpOvfci1+J29+38+vhgYr26AoOsma9xK3QSAz91XpLJxqppQnFHP4t6PkzgVZGHMSW1H/A1ixYGPryngeTd8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYEELwaA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78664C4CEED;
	Mon, 21 Jul 2025 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753079016;
	bh=EpzZ1chbGmj6M6L6Q6mW37Aq6ZLgODJkZguouWUYmng=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RYEELwaArKkIu6qzBmhtWIxfINaR4c8gAXgjg2L4eH0Rk6m4JWuMrtDiKhB38A9QI
	 R4niS17Cyrid/CDKuWDA7yrcAfhGtG1PyjfsVNM3mZxnBHNkG5Rg+8H2B5+PUE6qWJ
	 9/qVRr7n8lXDP75MsCc6q8SdJJZht7seND9/gQlo35koksooXYrjqPjN8nIC/tAGu6
	 n4iCHSdag3BPOvU2WCKn2LpGxQRNNSEKGPBoeYq+XGN44xLecBNhChvm2tRKHEa0s1
	 6JQaPVwpWZtxRGHzHUtYNOosLEWEZaXUCxduS4xITJXfYU9AVHPeEIQTiQU991WHTn
	 tIKPFpHDCftQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586FBC83F1A;
	Mon, 21 Jul 2025 06:23:36 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 21 Jul 2025 10:23:15 +0400
Subject: [PATCH v3] arm64: dts: qcom: ipq5018: Add crypto nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-ipq5018-crypto-v3-1-b9cd9b0ef147@outlook.com>
X-B4-Tracking: v=1; b=H4sIANLcfWgC/3XMQQ7CIBCF4auYWYsBCnXiynsYF5RSS9ROhUpsm
 t5d2pXGuPxf8r4JogveRThsJggu+eipy1FsN2Bb010c83VukFxqrmXBfP/QXCCzYewHYlyWukL
 UquIW8qkPrvGvFTydc7c+DhTG1U9iWf9SSTDBOArkal+jEXik53Ajuu4s3WHBkvwE1A8gM9AYI
 0vjaqts8w3M8/wGkT6AOe8AAAA=
X-Change-ID: 20250523-ipq5018-crypto-0265b8854b0c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753079014; l=2180;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=J7Kj8AGCaV+4NMDZs5c16HAfFcd9pqQ9Ya9RXPBBCE4=;
 b=T2UCBYnEvjDVJoACQtBlUe50eKXdhA9k69VNsgEAEBnFjUZO1CF3LzGCieWxeZLAAz/Hr0Vi3
 fH7FPS77mweA8if6ZHeCSH7GYvLDCHgLvYZADo/dLjiCzXE8lklEXtv
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

IPQ5018 uses Qualcomm QCE crypto engine v5.1 which is already supported.
So let's add the dts nodes for its DMA v1.7.4 and QCE itself.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v3:
- Rebased on tip of master for patch to cleanly apply, no other changes.
- Link to v2: https://lore.kernel.org/r/20250524-ipq5018-crypto-v2-1-faa26aedc4cf@outlook.com

Changes in v2:
- As per Konrad's comment, the BAM DMA controller is v1.7.4, so updated
  the dma controller node accordingly.
- Link to v1: https://lore.kernel.org/r/20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 9ce73682e4ae7cde90f151dfcd41a5201ced2aa6..a6d1f9dc53ff41b7f21caf658ea5ddb5d84ff05c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -340,6 +340,36 @@ tsens: thermal-sensor@4a9000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		cryptobam: dma-controller@704000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x0073a000 0x6000>;
+
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			dmas = <&cryptobam 2>,
+			       <&cryptobam 3>;
+			dma-names = "rx",
+				    "tx";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5018-tlmm";
 			reg = <0x01000000 0x300000>;

---
base-commit: a350d73e26be09ba893b878248f29c9021528802
change-id: 20250523-ipq5018-crypto-0265b8854b0c

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



