Return-Path: <linux-arm-msm+bounces-60583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEADAD1C89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1393A85CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5BA253F1B;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/TTuP5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF71C8604;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749469491; cv=none; b=iQ5l5MCwapjIQzIShOoJnilgj8irvPawLhZ51Ey0d0DXsn2cjIgm+ewsnZhENyD65h0n9u9zyop+OB0Y38pi1oecMTa9E1YxgLLUR+jSXv1w0QyYCyVaaRiZDtfyE25BCBHHXp0rfTVFsXzETuR37OoXNZduyaIVzqKsF/cbZzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749469491; c=relaxed/simple;
	bh=72ROgsceAbh3vMokXfXqWXOso7SCfFxFePbiSzbwxwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nPyNwi6Hb+plHY8BeGMTnIz1r1Gr5gefWOK8qe6TPGNHDWZ6ogg0lHNjKH8Nil+p5E+4GqI9q+XxrkDSyLzmCrF10CaEuNOB0AG5Gv5jWArV2lYwPH7zZee79arBmJ2OsdOZdtZjkcbCqbjqnRraXJav2nlshsEMrD/wE1OTeas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/TTuP5b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2F59C4CEEB;
	Mon,  9 Jun 2025 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749469490;
	bh=72ROgsceAbh3vMokXfXqWXOso7SCfFxFePbiSzbwxwQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J/TTuP5bWmP/QoEvXYYyXoYfBV7PFQcW0XsFwkuyNxUfZqA30f0ibsLgJWUK0uaGD
	 xq9TyTEdqaOV0bTeEq/3P0rRDgutdmH65f1grFPjTkwjsFfgWAg5WOsHh3ARf3HTMc
	 FQ4oCRi/HYtwdv8zmMnxb4u3IbFc7LEMBkCuNApffPGfYLcEiDNEC0B2v2vLm0riDZ
	 NsLD5+ZtsEOYJ4jU6ejImQE9XBy1dyIJjd9gWWcg/mQ/BqY+UVpkV7CDlFW/6rxDFe
	 FGnCpvvC5FrXHY+N4Je6V95pT2eB/M3xnFjBn68C1gdFg43W3ZglV8pYiePoMHwOOo
	 CnNBq6zP67qAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD013C61CE8;
	Mon,  9 Jun 2025 11:44:50 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v4 0/5] Add support for the IPQ5018 Internal GE PHY
Date: Mon, 09 Jun 2025 15:44:33 +0400
Message-Id: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACHJRmgC/2XMSw7CIBSF4a0YxmLg8mjjyH0YBxSoJWqpUIlN0
 71L68BHh/+9Od+Iog3ORrTfjCjY5KLzbQ6+3SDdqPZssTO5ERAQhDOCXXcXhJY4f7pmwKaSgqt
 acW0NyqMu2No9F/B4yt242PswLH6i8/VNCRD/VKKYYGNUVZaCWxDs4B/91fvLTvsbmrEE30C5A
 mABiGSy4Lqgeg2wDyAJrACWAQ6UsUIRRiv4BaZpegFHN/WCMAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749469488; l=3740;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=72ROgsceAbh3vMokXfXqWXOso7SCfFxFePbiSzbwxwQ=;
 b=FrUjWNPAJ+ft1zj4iRHjMYysifyvX6IyEx87r+1fOkerDyfPpYARB2b2A7Y0NIJjX6QpanxyM
 0fbPO62nQBQBtpGpKBrB3NOHFG9hhNURPHnvngCTi2FBVHH8UZRFP3Z
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

 .../devicetree/bindings/net/qca,ar803x.yaml        |  44 +++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  48 +++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 185 ++++++++++++++++++++-
 5 files changed, 269 insertions(+), 12 deletions(-)
---
base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



