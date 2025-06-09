Return-Path: <linux-arm-msm+bounces-60587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DBAD1C9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 132C816B649
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B42571CF;
	Mon,  9 Jun 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cok8Ntyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8B256C61;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749469491; cv=none; b=jEDCTknZ6EnxV9IyRn6XwX0QlO5efsWC+4HPENE86VlIL8T3oJ63eW+uV4uVBr+EoFhswQaiCBWA7n5w/UAd/sDkJ14+jrA/s1PBAo3Y4rfzbShpw4gr6M1dii7PmxrV1YVYRp3GvhBbBCUWS84UzWYgCRy6tZ1o4bqGv5jZGB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749469491; c=relaxed/simple;
	bh=WzM5y2OoQkwywYk7ze1eYenAU+huZ1+9rx3teZ27zKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy1lEugjoCeyZHAWO1AINKEaH9tuo5/1jIlSdpZY0tYKYofdO6AeUyjhFtt9SytLeWsRHnKRSkRNgM8zbOVhoW6RcodqDyrCHV1ZT9CGPNKdpP0oiBRfofO4Do9NQDexWIYV3HmZ/OIXYPTl4Hgf4KYooLipu0de2MDjNUznx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cok8Ntyh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 187CAC4AF0C;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749469491;
	bh=WzM5y2OoQkwywYk7ze1eYenAU+huZ1+9rx3teZ27zKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cok8NtyhE2GnLb485W2zUWhwPBCwZ6+MBCncZHCH+bZWSXxOvNwBnj1cOcRZMEf4c
	 rBWhxgbT+QJBYHkFOAk97hWXh2gFuVMqWHqL2QAtDQ4CmujXPg1Qpvsq7ZDpMr2chv
	 K3W8CLIfVyBjbN8qatzLalenY1qQZR1JSkFeuCoPKcxkB1r1+Nd0TW30mhyehI5YFY
	 j//yOJFfpSQa7EWHsiXrWrCsxQCnrqeF8wKmCGQHqL5OLaqpVnitUASSMew8GYgGWv
	 72sWx3Fsq/PMAqnXKDBrm6WNdPRkfEgbyhUZ+DAnHD/5W7lxabQfyI8JLDScK3HPqC
	 sf1Bl7Vw14L5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E55C61CE8;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 09 Jun 2025 15:44:37 +0400
Subject: [PATCH v4 4/5] arm64: dts: qcom: ipq5018: Add MDIO buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-ipq5018-ge-phy-v4-4-1d3a125282c3@outlook.com>
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
In-Reply-To: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749469488; l=1519;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=jA4BQsaw0tlEf36IZrwvZtR6C1am2pcwyAdrevsj4Hk=;
 b=vImvIeQwzSwUc+rbiclCTz4Ys4pHteCBdtldlzs5ipJTlIiIvTGmq3hTylA091FSc8v6+PRoO
 Ry38DIV1pZ6Auh20FpJlRjcB5C7M6aG1AmrR1nGPa409Zs17X5QzWTN
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

IPQ5018 contains two mdio buses of which one bus is used to control the
SoC's internal GE PHY, while the other bus is connected to external PHYs
or switches.

There's already support for IPQ5018 in the mdio-ipq4019 driver, so let's
simply add the mdio nodes for them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..03ebc3e305b267c98a034c41ce47a39269afce75 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -182,6 +182,30 @@ pcie0_phy: phy@86000 {
 			status = "disabled";
 		};
 
+		mdio0: mdio@88000 {
+			compatible = "qcom,ipq5018-mdio";
+			reg = <0x00088000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			clocks = <&gcc GCC_MDIO0_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+
+			status = "disabled";
+		};
+
+		mdio1: mdio@90000 {
+			compatible = "qcom,ipq5018-mdio";
+			reg = <0x00090000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+
+			status = "disabled";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5018-tlmm";
 			reg = <0x01000000 0x300000>;

-- 
2.49.0



