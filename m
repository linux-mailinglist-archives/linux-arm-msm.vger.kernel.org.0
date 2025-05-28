Return-Path: <linux-arm-msm+bounces-59708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D1AC6C18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF3231BA37F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6C028B4E3;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNxar7ja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB91CD21C;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443552; cv=none; b=fom9FDxeIyz+GpB+Kid5+EJM5NOYx/oSH5eBJGrVIjjrC4JRC+4rkxcAp8LC+WLVKgkcRReUoeVxr6yg4Z9jWx5qe0h4Bm39NRkzCP70lrYYMcbXh5ZvBy6aUvpBUzJol2NM89U+x6ZRobaVKo8pyMes7Ab7BolvxlSJJx9sfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443552; c=relaxed/simple;
	bh=mcxHScRRpkp4Uu2d9/8fUpUC++QWS+mrt+7i0BGybRw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NaF5m1uO8/YhKKShnXQ2A671L8tArPeZoKOmQVF4inxpnNUCxf39L3bJHyJW+Ga87EN7MA7kXf0e9Zx75DVl7RBoW9cr++m9zg/S3BRd5QaKs/fQ0y8La32nclzl3JW78kgS+c6+29XQ2HspQ2X3JtqAOpx4OFsyFVOzjEHTwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNxar7ja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D5E1C4CEE3;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443551;
	bh=mcxHScRRpkp4Uu2d9/8fUpUC++QWS+mrt+7i0BGybRw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cNxar7jauXnukzP9wHTPQvY9aZbUDCBDtwkvaqzNAZV978+r2bTUKV+EivkasdSJc
	 Skc3x5nJJZUVFM9yoSfs/9QHCTN9WSFOOAsE7fDrX8LPDxWMMThvlsmAH+hm0+eD2v
	 h3i5Y8Z7RQ3glWMoMRHirmg6PM8u95vTVYf4SPQBbIntom+ZHUbNMx6L69qtvEyYiy
	 PsKwSiue9aIXJD4Zr/JIr1Q87ENu8N4CfbVmpl+PAFGHvR/hhsuG3oThLaSv3/Lain
	 ColKAKoZNelWuolMdgaXvCIgcaTzVmekXDhbnaYwmWq+DEk+AC32VhGRdnTe0cISot
	 DXnYLfrjvSYIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68289C3ABB2;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v2 0/5] Add support for the IPQ5018 Internal GE PHY
Date: Wed, 28 May 2025 18:45:46 +0400
Message-Id: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJohN2gC/13MQQ6CMBCF4auQWVtTSscQV97DsCh0sBOVQouNh
 HB3K+5c/jN53wqRAlOEc7FCoMSR/ZBDHQronBluJNjmBiUVSl1JweOEsqxF/oxuEbY9oTa90R1
 ZyKMxUM/vHbw2uR3H2Ydl91P5vf4oVPhPpVJIYa1p6xo1Kawu/jU/vL8fO/+EZtu2D0swIkSuA
 AAA
X-Change-ID: 20250430-ipq5018-ge-phy-db654afa4ced
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
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748443549; l=2668;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=mcxHScRRpkp4Uu2d9/8fUpUC++QWS+mrt+7i0BGybRw=;
 b=6y1+mzVRoK34jBTmE2aoRxLBA16LvQBIi3RENJ/8xDnL4keYU/GcoKnpIA+UdpJPgWJyYlRlE
 Qb7IoK10bvVBmW1HkRfAgHHcx9uQPPwmzvUx/ftcpq56uxRbl0/XvF6
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
output pins that provide an MDI interface to either an external switch
in a PHY to PHY link architecture or directly to an attached RJ45
connector.

The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
802.3az EEE.

The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
The LDO must be enabled in TCSR by writing to a specific register.

In a phy to phy architecture, DAC values need to be set to accommodate
for the short cable length.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v2:
- Moved values for MDAC and EDAC into the driver and converted DT
  property qca,dac to a new boolean: qcom,dac-preset-short-cable as per
  discussion.
- Added compatible string along with a condition with a description of
  properties including clocks, resets, and qcom,dac-preset-short-cable
  in the bindings to address bindings issues reported by Rob and to
  bypass restrictions on nr of clocks and resets in ethernet-phy.yaml
- Added example to bindings file
- Renamed all instances of IPQ5018_PHY_MMD3* macros to IPQ5018_PHY_PCS*
- Removed qca,eth-ldo-ready property and moved the TCSR register to the
  mdio bus the phy is on as there's already support for setting this reg
  property in the mdio-ipq4019 driver as per commit:
  23a890d493e3ec1e957bc925fabb120962ae90a7
- Explicitly probe on PHY ID as otherwise the PHY wouldn't come up and
  initialize as found during further testing when the kernel is flashed
  to NAND
- Link to v1: https://lore.kernel.org/r/20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com

---
George Moussalem (5):
      clk: qcom: gcc-ipq5018: fix GE PHY reset
      dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
      net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
      arm64: dts: qcom: ipq5018: Add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus

 .../devicetree/bindings/net/qca,ar803x.yaml        |  52 +++++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  51 +++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 197 ++++++++++++++++++++-
 5 files changed, 291 insertions(+), 13 deletions(-)
---
base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



