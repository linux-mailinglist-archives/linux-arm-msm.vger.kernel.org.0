Return-Path: <linux-arm-msm+bounces-59293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFECAC2FB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 14:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A38189EE74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 12:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C091C5D7A;
	Sat, 24 May 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emYY3i9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250A12B93;
	Sat, 24 May 2025 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748089896; cv=none; b=ezgrFbrhiQ7GdZhVxTFhtgrTig3ZhGg8t58O+cE+DKyw4GxkAzfGU/9Pi9kBu90Fi98EZTSYn67qSoH/Pm/ppsKyIhM1SY5Mp41pV1NIeAzXrKbRfUsZeMGEcNRBuyTFF90Ze3ABgFKxs34dnpC5xktDuyN2Gzm4L8uplz6njDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748089896; c=relaxed/simple;
	bh=Z3IGYqO9v/4n7a9oJbzTR4w6KIlION9VPYOwL2P0dAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q8IE8Fggn+INIneAnNwY3eVtrs9vk4rFUbfZo3JfnKdOggMkK8Im3ZAjQwSlMGxWts4TccW4BKxEczK8aNWM9I0yuyvmK1L3Qs8uYQ03c8tI+sUAn4UaY8f4FaPRMdik7ZlQ025Hg8w4+hkAtH3Q7MroGWvevnDRhDwVqVzTHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emYY3i9E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 333BFC4CEE4;
	Sat, 24 May 2025 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748089896;
	bh=Z3IGYqO9v/4n7a9oJbzTR4w6KIlION9VPYOwL2P0dAQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=emYY3i9Exk24sZyQVq3g9XMv8mpyiLdNbCLTcLj+4B5+fvH67cd0NeG/rl5Y1Lm9E
	 eGfpJTKCE8VzFS1wxko8/86lI3ge5Ksc6g/o7GJlQoacx0NGQqTg1qhg6BGqYfpPXL
	 1Ua5NHtNZeVgfQqfrVkA5cMP2vHVQ13h7onFUmr8mFBJFunRcCDG9ZgniBBscszoeZ
	 58p19pgNueBto1fa8OousJAG+mME1Hc0UCYIs4/eSUlG5edbNq7DLecLGbAMWplpJi
	 GMEsftViVx9nWb8h5hEKUPNF6QIngRqxp1KjqLr8ET46G3u8S+69NI9vEuue4obKxn
	 f53oqKt9Eyw8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E9FC54FC6;
	Sat, 24 May 2025 12:31:36 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sat, 24 May 2025 16:31:31 +0400
Subject: [PATCH v2] arm64: dts: qcom: ipq5018: Add crypto nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-ipq5018-crypto-v2-1-faa26aedc4cf@outlook.com>
X-B4-Tracking: v=1; b=H4sIACK8MWgC/3XMQQ6CMBCF4auQWVszrVQnrriHYQGlykRlaotEQ
 ri7lb3L/yXvWyD5yD7BuVgg+okTy5DD7ApwfTPcvOIuNxg0Fq05KA4vi5qUi3MYRaE52pbIli0
 6yKcQ/ZU/G3ipc/ecRonz5k/6t/6lJq20QtKE5amjRlMl7/Ehct87eUK9rusXPKCAw64AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748089894; l=1977;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=jiSu2brkAB+drch8iI9SatYPuZQZCSdgzO/6G8YlqTo=;
 b=gsBBt/IwZPLredb8H5qjyhqegJwbNZiUPk6cHuz0sEvD1lHRY0C2dCa1nG5sXkLG2XQt01bAy
 vf2HK3DM9E5D7Ke2mSZxzQak3OxUqp2t2cKZ5d+mpe6o7swsdzmQ4pg
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
Changes in v2:
- As per Konrad's comment, the BAM DMA controller is v1.7.4, so updated
  the dma controller node accordingly.
- Link to v1: https://lore.kernel.org/r/20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..558a97a050c6b87ffa9ab45e80ede18c1eaffcc2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -182,6 +182,36 @@ pcie0_phy: phy@86000 {
 			status = "disabled";
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
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250523-ipq5018-crypto-0265b8854b0c

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



