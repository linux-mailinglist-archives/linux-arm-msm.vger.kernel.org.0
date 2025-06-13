Return-Path: <linux-arm-msm+bounces-61163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1013AD80A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 03:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4595318996DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F991E0489;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGnWSRQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C413C9D4;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779723; cv=none; b=AUEPWLJ4VFViJ5tscJIhZaEgovaQ4UAPriYMQQ9wnu5ti+Bh7v3A4jSYt2cJlW3mG2ospkixnDfUuqJET7nDYz98LqSj/7xOt0LuKDSn0XL9G53Wxa0a1jf/7fYWscnUwq+bbjQLypnszoTJ7zcyjcBSlkM244+AsT4Sa7qRSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779723; c=relaxed/simple;
	bh=Ntn9IiFPx8N6O+ViIz67FABe2gTeLIkgTCgnOwwHOGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WxOiEB49sDD84sFIULXFrYUOKjR66lOIlhQqw12RXZRLqWLAx1bKilDIje/Q3I3LKwAusaMecmUrq3AP4RfbrXYFMo6sy7D6ejiDy7bQ97WlWC4nT7PjGX9qFDrlNuaK5sTSPBA/vLwHMNG54JbA7+oyfjcdjp+0l/NW5oxLvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGnWSRQ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3319C4CEEA;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749779722;
	bh=Ntn9IiFPx8N6O+ViIz67FABe2gTeLIkgTCgnOwwHOGE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XGnWSRQ+RmTdUH1HwxU0YrDe+698fAKCLW5XN39C1G84hz5VrRlfkPVsfZ2m1+rCB
	 cQtz7KrBkK9PGtGSC4HTOuafQFZOFRBjIwdzodBUoAO5OJm1aA/PSk8ugLYISC/V31
	 niR819TWdiDrWTPzO/NXkmjCucIab+7rTf3iZUTxWxpZ/3LO/MhSjOSic+e0T7oLz7
	 EGDkyNQ3xsD7NU33+hlJ35kow7exIfMfxcoOipVWLn2A0mS62FBDKMutsFMtPles37
	 ZXrJkj8K4mFqKcDQ2mIIGEMaeQGEWzGx5hMh4kSznMC8BlzSS2zk0p2rBAwsD7D6Y+
	 B8GxmIYx1rtYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDBFC61CE8;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH RESEND net-next v5 0/2] Add support for the IPQ5018
 Internal GE PHY
Date: Fri, 13 Jun 2025 05:55:06 +0400
Message-Id: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqES2gC/2XPsXLCMAwG4FfhPNecLdlJytQBVgY69hgcWzQ+S
 hySkIPj8u4YL+Xw+MvSJ/nOBuo9DWy1uLOeJj/40MagPxbMNqb9Je5dzAwEaKFQcN+dtZAVjy9
 dc+OuLrQyB6MsORaHup4O/prAH7bbfG+262e5pZG3dB3ZPobGD2Pob2nnJFNn4jXod36SXHDnT
 F1VWhFo/AqX8S+E49KGU8ImeAWqDIAEiAKLUtlS2hzAf6AQkAEYAQUSsTQCZQ05oF6BzwxQEZA
 OjYR4H9i3L8zz/ACbxrHYhQEAAA==
X-Change-ID: 20250430-ipq5018-ge-phy-db654afa4ced
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749779719; l=4379;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Ntn9IiFPx8N6O+ViIz67FABe2gTeLIkgTCgnOwwHOGE=;
 b=YV16xTbHfHIVmbf+WUVNtN/N2G1iWu1uFOXAw4O3t48z06uRKuaTrA8n8OG4pIvPFJWKcVS1n
 0cSBkwwFXKSCapU1/eFjCIwB6QK4qmoz1tNh7BNyy4IOfqw9iJYZetZ
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

The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
interface mode, CDT, auto-negotiation and 802.3az EEE.

The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
The LDO must be enabled in TCSR by writing to a specific register.

In a phy to phy architecture, DAC values need to be set to accommodate
for the short cable length.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v5:
- No changes to code, but this version contains 2 out of 5 patches for
  merge into net-next specifically as requested by Jakub
- Picked by Andrew's RB tag on patch ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
- Removed unused macro definition (IPQ5018_TCSR_ETH_LDO_READY)
- Reverted sorting of header files for which a separate patch can be
  submitted
- Added a comment to explain why the FIFO buffer needs to be reset
- Do not initialize local variable as caught by Russell
- Updated macro definition names to more accurately describe the PHY
  registers and their functions
- Include SGMII as supported interface mode in driver commit message
- Changed error handling of acquirement of PHY reset to use IR_ERR
  instead of IS_ERR_OR_NULL
- Link to v4: https://lore.kernel.org/r/20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com

Changes in v4:
- Updated description of qcom,dac-preset-short-cable property in
  accordance with Andrew's recommendation to indicate that if the
  property is not set, no DAC values will be modified.
- Added newlines between properties
- Added PHY ID as compatible in DT bindings for conditional check to
  evaluate correctly. Did a 'git grep' on all other PHY IDs defined in
  the driver but none are explicitly referenced so I haven't added them
- Link to v3: https://lore.kernel.org/r/20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com

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
George Moussalem (2):
      dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
      net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support

 .../devicetree/bindings/net/qca,ar803x.yaml        |  43 ++++++
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 167 +++++++++++++++++++++
 3 files changed, 211 insertions(+), 1 deletion(-)
---
base-commit: 5d6d67c4cb10a4b4d3ae35758d5eeed6239afdc8
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



