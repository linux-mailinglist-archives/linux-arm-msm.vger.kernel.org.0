Return-Path: <linux-arm-msm+bounces-60730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE7AD30A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A74A188E016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09612820D3;
	Tue, 10 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFIXccSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A328134E;
	Tue, 10 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544687; cv=none; b=k8SiALqhRWRdQsvPOpk6TTeEq6J6pj/9TlMZvxBbDZXUB2G10BT/FQsSmPBG2yVTPLYswcUXxs3AlrrIv0GuYvp+CHeOIHQ7T8k2TG0yl0s+ybqmyQAwwkW8dNSuxOisVBC+0Vnl5adA2JcDIzT32wzollH1KyHwiCNDtQu2FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544687; c=relaxed/simple;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4GXQHOSGznNYnrZdTuEfZq9xiVngpzfA+W8aPXq33d6YXgI6KgPspie3qyh7q5emhjXoPczzBjzvLti7QjQUs3z3YsjxTvugkSIATj9/U1Opb3DLs/3liGsiJGn95llhD4ijDhXEna/6UGQISgtnQ9+ECw8s4N2pZw59OtcwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFIXccSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC05AC4CEF5;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544686;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SFIXccSH7RpfZmy9fQXhsOmQBdyuLthpHn6jExJY9Y1yEoAH2urzKGdKmfBJYuCWD
	 tu9u9xA13wbutNtOZeMkLEuQGnv4tJV/66W/xrh4kKsf83hpdJHkeyvh7GHj3Mr1Zx
	 JbnOwOvrQIUxiZ+CCmsXG6u+YC7WvhPiZngCOU3sbJ5bfxHyguGksgRdSlXEIsmvxs
	 otnW4wl5s6x8TgIAx8IS2FIdrs5ozlBAqRbMPgfKeg/Ajy02Z7iiH8OxsPwdEomaoQ
	 /FujURbqWrgMOgAbi+92jay6DbWEuFuwaVtsUN9LY5YrTWBf1YouiOKkQGi63ZZY+H
	 /b19VGlmAX2+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CDEC71132;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 10 Jun 2025 12:37:59 +0400
Subject: [PATCH v5 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ipq5018-ge-phy-v5-5-daa9694bdbd1@outlook.com>
References: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
In-Reply-To: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749544683; l=2285;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=hFpy0osU/0n+A52muRC0D3Drst6JCZAX5hmtJZDrLks=;
 b=un9tciC84pDmPnVnCf6Uie9NGEQ6Hd5vibaYUdIvTGuG8+/rnLmHQVbnV/UwXhl3YMHXPCqml
 K7G9SC7SM27BTOaRCX1l9VJrPxs4PqCQ1UOA5HOIdXpOK582Tm1ZjcU
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
As such, let's add the GE PHY node to the SoC dtsi.

The LDO controller found in the SoC must be enabled to provide constant
low voltages to the PHY. The mdio-ipq4019 driver already has support
for this, so adding the appropriate TCSR register offset.

In addition, the GE PHY outputs both the RX and TX clocks to the GCC
which gate controls them and routes them back to the PHY itself.
So let's create two DT fixed clocks and register them in the GCC node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 03ebc3e305b267c98a034c41ce47a39269afce75..d47ad62b01991fafa51e7082bd1fcf6670d9b0bc 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -16,6 +16,18 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		gephy_rx_clk: gephy-rx-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			#clock-cells = <0>;
+		};
+
+		gephy_tx_clk: gephy-tx-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -184,7 +196,8 @@ pcie0_phy: phy@86000 {
 
 		mdio0: mdio@88000 {
 			compatible = "qcom,ipq5018-mdio";
-			reg = <0x00088000 0x64>;
+			reg = <0x00088000 0x64>,
+			      <0x019475c4 0x4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -192,6 +205,13 @@ mdio0: mdio@88000 {
 			clock-names = "gcc_mdio_ahb_clk";
 
 			status = "disabled";
+
+			ge_phy: ethernet-phy@7 {
+				compatible = "ethernet-phy-id004d.d0c0";
+				reg = <7>;
+
+				resets = <&gcc GCC_GEPHY_MISC_ARES>;
+			};
 		};
 
 		mdio1: mdio@90000 {
@@ -232,8 +252,8 @@ gcc: clock-controller@1800000 {
 				 <&pcie0_phy>,
 				 <&pcie1_phy>,
 				 <0>,
-				 <0>,
-				 <0>,
+				 <&gephy_rx_clk>,
+				 <&gephy_tx_clk>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;

-- 
2.49.0



