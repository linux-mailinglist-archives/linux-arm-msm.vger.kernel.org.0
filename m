Return-Path: <linux-arm-msm+bounces-60045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6EACAC04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 11:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16ADE3BAD87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06401E7C25;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBHURkdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD272638;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858005; cv=none; b=UOZJ6QwWqLrSxoMSisdJr7iWXbvW1gx7EbgaK6raupN/FLGSsUX+Y2mhbq91maHinYJF9Slu2mZ/N9xPZ48ZgAvZyUr6r0eAYkS2OKw3FwEF3oRu8h8pf/CDqnZZWM7tYcsfDBf6122OLmlfycKmXz+uTK/5NOqXKbKf5u3ns1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858005; c=relaxed/simple;
	bh=amsY+BaYvrHOlicu0uLhK5nM2/c8GjObiUUPtf09ZQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aBvccjsViZKkqmJEvIicV1uFot6Zn6E6RlElc5YctedISNTiEpm2zAXg2K4jZfW98lFHUTE2XN7Kh/a2CNERkoQNqKhOhJ7UA5gAb11PtivwTXjwG1iHJWhm0eGcZC2fsqS679+Kli0tBWnJ38hgBJiJNNDCc6ZiBIz0Iz2ue8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBHURkdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DF52C4CEF1;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858005;
	bh=amsY+BaYvrHOlicu0uLhK5nM2/c8GjObiUUPtf09ZQs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UBHURkdqD9MtfSFRxiRX13Ct2XSyk88hDe7Yd5zj3erL+AKkGTWVVmRqnitsP0Ite
	 73nl2nycPcEjOp/oyoDIyXt+c+mUEZGdK/LuF8plsbqYeImBZAq5NSdgA3GGu2kOH4
	 +xxk1ziDwKZzX8d8XM3kO4YA2Wjpk2HYxdV8lEaPUl5goL+KDsivbnT83lgLG58uf7
	 1bKUsbEyCtJgUIBAOFJ3icMr8VKpwW02aGRn648UybPA5+kgO0vSXaOGjYJxjE1TGh
	 MXpoTvNORn0Otl81MkUFU3MOHUPXp/q9yK8vho4CCk7FOJhiLq0vlyGoWaxCNfa7Rr
	 SufJZ6du5SSyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C798C54FB3;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v3 0/5] Add support for the IPQ5018 Internal GE PHY
Date: Mon, 02 Jun 2025 13:53:12 +0400
Message-Id: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIh0PWgC/2XMSw6CMBSF4a2Qjq3p60LjiH0YB6Ut0qgUW2wkh
 L1bcOJj+N+b880o2uBsRIdiRsEmF53vc/BdgXSn+rPFzuRGjDAgghPshjsQKnH+DN2ETVOCUK0
 S2hqUR0OwrXtu4PGUu3Nx9GHa/ETX65sCBr9UophgY1QjJQjLgNf+MV69v+y1v6EVS+wTkH8A2
 wBS8rISuqL6G1iW5QWwiYfu7wAAAA==
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
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748858002; l=3186;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=amsY+BaYvrHOlicu0uLhK5nM2/c8GjObiUUPtf09ZQs=;
 b=qT8k+dmDpyQNLaKfvAiglNzAB3A8PYvF9qZqsTNi3NMfyhcBzmy9M8EG0ebI5fd22dqUOafQw
 Bn4HVsk+tQcDQ6ut1SrXvaSqD8NtuRrnmSR9rY9ZN5ngIwM9h+wDAPX
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
Changes in v3:
- Replace bitmask of GEPHY_MISC_ARES with GENMASK as suggested by Konrad
- Removed references to RX and TX clocks as the driver need not
  explicitly enable them. The GCC gatecontrols and routes the PHY's
  output clocks, registered in the DT as fixed clocks, back to the PHY.
  The bindings file has been updated accordingly.
- Removed acquisition and enablement of RX and TX clocks from the driver
- Link to v2: https://lore.kernel.org/r/20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com

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

 .../devicetree/bindings/net/qca,ar803x.yaml        |  39 +++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  48 +++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 185 ++++++++++++++++++++-
 5 files changed, 264 insertions(+), 12 deletions(-)
---
base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



