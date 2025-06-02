Return-Path: <linux-arm-msm+bounces-60047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF6ACAC08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 11:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB17D189DDC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5171E9B30;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tX1dr5eW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45591E5B79;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858005; cv=none; b=JCwlcH7uqo37Wbe0xtrhDilnPDjbY3VJUt6G+H7eTPoMNXTjzv5gDSwTVdGkXqYMMECX7KPIfTWKYw2WafdpGZKXeofi5o1Ag4lGuIaD2dMYYlPoXqxU6JPaBlgyZSuHDefM0e8WBmpWUsfa1t8zBTW8Iun2GWgeQ23soe56ZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858005; c=relaxed/simple;
	bh=WzM5y2OoQkwywYk7ze1eYenAU+huZ1+9rx3teZ27zKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlf3lMj7GvNAOkL4P3trR0qJRQdIjtw1H6DymzcTWJiuTsP5HUOE1KM39BriHjHFfeGDuDpoZ0L5tBtEGjSRRfkyz2ZCNg/mtqnBcVdmNSqg0/RVghRXziYAuzGg9UFRF1ptRcbKkbXojRs/FsEl4kFwN02LVGbjkvtYWvacWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tX1dr5eW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79780C4CEF6;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858005;
	bh=WzM5y2OoQkwywYk7ze1eYenAU+huZ1+9rx3teZ27zKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tX1dr5eWKynSKfmWSAYpOyg3ugGUosfD+f9PiOpf8uYe/qmJ1eUPF2CJ1pSE6KKj2
	 LrJHvfA26P8Ts4uANSKh9LRniSVKiRbJ6vfJOgm0+ypiwfyyMdgoTpqCpcx0EmCCdj
	 SMyDKn63YJmvGEtOBYDXC6j/xaVxAMZ1Tqa1WlR7wXGrL1v67wmxwmvZOg3ofoALqz
	 IzHrh9Xv9tITranVkvWW0+5JUHeF3XGOZMJcgrtCCRoHCFOc9Dx+qbOEz6hISqSell
	 smAneXBGqZ2vlIycQNE+5okpRR0teqyVwBqnVHrzqIGUhbAxb8c5Ab1qa3mlr50UMH
	 zr00rRFqrWK3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF8AC5B549;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 02 Jun 2025 13:53:16 +0400
Subject: [PATCH v3 4/5] arm64: dts: qcom: ipq5018: Add MDIO buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ipq5018-ge-phy-v3-4-421337a031b2@outlook.com>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
In-Reply-To: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748858002; l=1519;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=jA4BQsaw0tlEf36IZrwvZtR6C1am2pcwyAdrevsj4Hk=;
 b=NKCtDXN7RAmyNzxNa/6j+qVmGVrCf1O3gdGM/jwcWO5FteGqhVjf2noBORSB+3q62GOwf28hv
 nwuz2+YP+0QDanIMtL3pfWcLD21c7Q3IFgiJ01pyWz2BW4rMrSd8D5D
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



