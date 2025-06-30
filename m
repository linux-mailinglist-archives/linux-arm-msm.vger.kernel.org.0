Return-Path: <linux-arm-msm+bounces-63066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D890AEDCEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57CB18826CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65AC289839;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkZ8+HM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87C5285419;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286909; cv=none; b=rIgAe9xFWq7sEFF3YMN9Yr8S3ysdy6LYGz6g/P69tde/uT0PJ8RUVPR81lQmJB02rYOM5uGO4zlw/ju7k48nQ0i5VTbGjaK85OQxRjPLLEoNdp/XNpz+l1T+l6QZxZY+PuwnzrqYQC6xQhiBvHiQYDjbIiM86+vXzL0ZbeC55xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286909; c=relaxed/simple;
	bh=6rSwfj0OgqcpS0whNGrBhLm2Rs5oxE6X+ajo/xI0UWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EWFQ/WY4t+MTgcLOgKnFbZhmqedqbswnQfKHWvZrn60w9Meh0tldnicsPjU/K3OAoguTQXrFU7LymbuuPpm1I9ATVSchlPwu9tkm1pBWYSZjpjWVuxKd+p0mqmAV5T2GLSXpPoG8rP17MfTGza9EQ3HU0ojunmR48Y0xFOOlYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkZ8+HM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26A44C4CEE3;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286909;
	bh=6rSwfj0OgqcpS0whNGrBhLm2Rs5oxE6X+ajo/xI0UWA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dkZ8+HM3yA9QIAJ94UkDi01PhTrCPGrdDPd+IvSAcVVO83QjQuUq2shSZcdU18p2u
	 NA4QH1G1g2jepZFRwJ1qN5VDWvSZQQNKA2N+HuZLove+rZBK8Dz1l0Q1t0/gAvuF0Z
	 WZLI0oCiJsdmoMSb1co22PqiikJGBxOlcz7s6TeUKsdANuABE2p8GK2rJ3lEe7cQCb
	 DaN7DM62JmnVwr8r1Fd9SJFrNsXIxxHfrncmz8KzDRNgM6EYM3IyMoS4j5F3DOAmeV
	 qk4KfNJrDQrB9VieUuKxbuVNvaJd6v6WDXJd+pZklBjVaEgv926eKPY9hbhHmwdQVU
	 K06VGuq1s/0sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17880C8302D;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v6 0/3] Add support for the IPQ5018 Internal GE PHY
Date: Mon, 30 Jun 2025 16:34:59 +0400
Message-Id: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOEYmgC/23QzU7DMAwH8FeZciYoduK03WnvgTjka2sELF07I
 qap705aDhSy49+Wf7J9Z1MYY5jYfndnY8hxiulcgn7aMdeb8ynw6EtmKJCEkoLH4UICWl46Q3/
 j3mpS5miUC56VoWEMx/i1gi+vJfdxuqbxtvoZluoPRUj/qQxccO+NbVtSAUke0uf1PaW3Z5c+2
 IJl3AJtBeAKCC11o1wDrgbkL6AFVoAsgEKQsjFCgsUaUFugqwBVAPDSAJb90D04gTYAVO/MtJx
 gTKc7Zb318BeY5/kbpdzPD7IBAAA=
X-Change-ID: 20250430-ipq5018-ge-phy-db654afa4ced
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751286906; l=4361;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=6rSwfj0OgqcpS0whNGrBhLm2Rs5oxE6X+ajo/xI0UWA=;
 b=Kvrm1AJSq5+XPEMqSTSBbz73Svierh5rH5IkmJtZWSQFxnpA9c5t37ljwFISOR59szpETEMy+
 9xJp5hJx82hAYhJ8VAVUvAFhRywRflhC6XAAhbjjz2fGsxgp57aQMnF
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
Changes in v6:
- Rebased on top of linux-next which includes the bindings (patch 2 in
  v5) and driver (patch 3 in v5) picked up from and merged by net-next,
  no changes otherwise.
- Link to v5: https://lore.kernel.org/r/20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com

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
George Moussalem (3):
      clk: qcom: gcc-ipq5018: fix GE PHY reset
      arm64: dts: qcom: ipq5018: Add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus

 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 48 +++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gcc-ipq5018.c        |  2 +-
 2 files changed, 47 insertions(+), 3 deletions(-)
---
base-commit: bc4672f3c5df8a47a3e5b4c31dead2b01103e70f
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



