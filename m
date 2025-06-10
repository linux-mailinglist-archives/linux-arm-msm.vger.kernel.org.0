Return-Path: <linux-arm-msm+bounces-60725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A20AD3093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1BE3AB730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F43327A906;
	Tue, 10 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rjm4/r/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05E41D555;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544687; cv=none; b=jNoJuDdVMbMm83A52uDFKMbtTJxfDQHJNhObLgazLorOZpT398THTE23jg+KA/9fWNzQ4sxufhbHLEzPzxpsiI3UPlbkCEhXmixHpMVCDkP1RRse7CeVmWNuN+k/3OTn9XnDDRNXT7zC7DoIZVmTrm1XdHEu+8Bn1qixSrkQ/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544687; c=relaxed/simple;
	bh=/aYos+rPD2Y4dFN66OBYv1f3rtmQl6eqmHlQLOMph6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GjqIKyLv472nyFPleB4hNEDImR49YpUtg0TdPzfc0U59lBm8TQujUJbns4+SxQ8Tm8MSktTksMoyBWxEVGINZh7Dt3QjN/3SBmsnUApi9GDdcti9aT6zKdLcU3/Wc/tGCulMi6Eg32H4Tr8VgxGEnNrfh5K6CQEh6DAEbs/uyzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rjm4/r/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CFE2C4CEEF;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544686;
	bh=/aYos+rPD2Y4dFN66OBYv1f3rtmQl6eqmHlQLOMph6w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Rjm4/r/y4LWZt/taUrSjd849ukEIigVyqsK9NcwaJVCWXWbt0sIMtYPU02FDiTP/5
	 Rdy7O20Fu6pIvaAVTfMHx16QKBzUJ9o+GvLp1WehVLMXsAHUJc5pftCmPBh6R/d89W
	 U9TEe1nsIa1+aTpvffnN9mTXf+F2Zw3SiO01wLAMq4lp7RjQ/A3NLHSDvPVhBEvnmK
	 PzZLTi6TCnfBKAUkj5yZD9OHPvZD40d19EeyGVoakU9jiKvu6cFzzbDsYECCMUEkjg
	 T+rBQTzPXbRol7c+cL4kj5S+4TdOjWNL0Kv3hFrUP9wvmMzXqRL5UmMrBFLqwRxkJG
	 ni1ozzbz99O6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73094C5B552;
	Tue, 10 Jun 2025 08:38:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v5 0/5] Add support for the IPQ5018 Internal GE PHY
Date: Tue, 10 Jun 2025 12:37:54 +0400
Message-Id: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOLuR2gC/2XPQQ6CMBAF0KuYrq1pZ1pAV97DuChtkUalCEgkh
 LtbcCGhyz+T/zIzktY2zrbktBtJY3vXOl+FIPc7oktV3Sx1JmQCDCQTyKirX5LxjIZNXQ7U5Ik
 UqlBCW0NCqW5s4T4LeLmGXLq2882w+D2fpz9KgtxSPaeMGqPyLJPCgsSzf3cP7+8H7Z9kxnpYA
 1kEwAKwBJNU6JTrGMA/kDCIAAyAAI6YKoY8hxgQa+AYASIA3KDiEO4DvXlhmqYvQajisnEBAAA
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749544683; l=4433;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=/aYos+rPD2Y4dFN66OBYv1f3rtmQl6eqmHlQLOMph6w=;
 b=ErY5VM5/oi8F8MyZ8xNVUFP8isDxbUNFIt0N0v1lRgTUTd/ciHKkyFtfqhYIUmT8NYRH9cYS0
 nYesuaI0rKMB0kaXcNXiB92GPAVKQw7ikoyC1VgFywYwQLVg20qHZ1C
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
George Moussalem (5):
      clk: qcom: gcc-ipq5018: fix GE PHY reset
      dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
      net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
      arm64: dts: qcom: ipq5018: Add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus

 .../devicetree/bindings/net/qca,ar803x.yaml        |  43 ++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  48 +++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 167 +++++++++++++++++++++
 5 files changed, 258 insertions(+), 4 deletions(-)
---
base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



