Return-Path: <linux-arm-msm+bounces-36213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F169B3B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A8A282FF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8131E0B77;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNIwv2SD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064561DFE13;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=pMQz5shLOPlgFrK4FdTd/C2G46MK73Z5hOyqwmOAEjechLgPXOwZ90Dpoze1bON1ZENIY4zX4LBKuGubw8P+29GLoNEuRMdvVsJeDZmFuiYLq1KF9vPnnKkEDYg3J6qFLssFqkt4Vd/6RwBKZvAhxXIzvNYP/ytfv3nvY2nVxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=x72DIkdJ+dbrYxpjyuwJKT4rc/qdhrX6DFb2ZupNZNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FOrQk2ZHcsSLZQCqA+Ax0i+FzmR4553PLiy8qzCO07Ep+uNZWFhtWDwvcQGK0JRYGNI0UulOWEmvwM6tF1qJkfH0SEhXQPLb6d0v4CSMcstkDkwwBOq3Uvu8j8s29YtWlWjISpG1E9xnKM15z/xXOZJL5SpNTKia/8Q1dciUMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNIwv2SD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BC50C4CEC3;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147127;
	bh=x72DIkdJ+dbrYxpjyuwJKT4rc/qdhrX6DFb2ZupNZNE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qNIwv2SDbfOGNqFCkUg6YA9kJ1Uf+KFC2pnHYP/Ng0EkE27cjvnOZ3QvTm0n4GwqK
	 7R5HheIaMMgtBZ2aM1EDr3BJzeKM1c0hlHW6rI508yp9olZk7RnTfR9ZZq+tVw5E2g
	 ibHhZS99IgJEPk+8DcNNzImIjdEEhZvuzB3Qb4++gk+QohObS/3lbLynLSn5xgh7fk
	 AqAWQuyxightAklii8UBFuICBzExsKsUR6UftD46jX/okzH29jYao+ben6jqjMzYWx
	 40oJmyU2J3Bb/q/V+BrxUEQSYHT3waVyQzAXe4OkXALaWctpKDWcm6Fx9E2wEl1ZnF
	 u7Lbzo6UAXlgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE26D5B149;
	Mon, 28 Oct 2024 20:25:26 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH v4 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Date: Mon, 28 Oct 2024 21:24:42 +0100
Message-Id: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArzH2cC/22NOw6DMBAFr4K2jpE/fFPlHhFCttmAC7DlJYgIc
 fc41ClnpDfvAMLokOCeHRBxc+T8kqC4ZWAnvYzI3JAYJJcFb6Vi70BrRD33pKS1/Thry6qmFWj
 q0ghZQVqGiC+3X9Vnl3hytPr4uU429bNXT3Dxv7cpxtnQFKbUVW1axR+eKF/2kFs/Q3ee5xda7
 KhJuAAAAA==
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Andrei Botila <andrei.botila@nxp.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=4214;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=x72DIkdJ+dbrYxpjyuwJKT4rc/qdhrX6DFb2ZupNZNE=;
 b=Wx80umWnOC6Zz+ZI46LBUU0/We5FtPXNXPhHRi/X8BKuo9N+nFU2vdpH9bvZfMhJYs0nyc5Cr
 5chzLuKcAuWDX9ABrIVFroQgc2qeNV8BxBpQSX6NRDsMFkG6d+ue6uj
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
interface over Pinctrl device or the output can be routed
to the embedded SerDes for SGMII connectivity.

The provided stmmac glue code implements only basic functionality,
interface support is restricted to RGMII only. More, including
SGMII/SerDes support will come later.

This patchset adds stmmac glue driver based on downstream NXP git [0].

[0] https://github.com/nxp-auto-linux/linux

v4:
- fixed empty commit messages for rgmi_clock() helper patches
- fixed yaml path in MAINTAINERS
- switched to platform_driver::remove() as suggested Uwe
- yaml: returned back all compatibility sting values
- added better commit description for rgmii_clock() helper
- Link to v3: https://lore.kernel.org/r/20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com

v3:
- switched to b4 WoW to overcome threading issue with b4
- extracted the hunk with the typo fix from v2 patch#1 to separate patch
  as Jacob suggested
- removed dead code for RMII/MII support, which will be added alter
- used new rgmii_clock() helper in other stmmac:dwmac glue drivers
- yaml: compatible strings compressed to simple one "nxp,s32-dwmac",
  removed duplicated required properties, already defined in snps,dwmac,
  fixed example

v2:
- send to wider audience as first version missed many maintainers
- created rgmi_clk() helper as Russell suggested (see patch#4)
- address Andrew's, Russell's, Serge's and Simon's comments

Message-ID: <AM9PR04MB85066576AD6848E2402DA354E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>

Cc: 

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
Jan Petrous (OSS) (16):
      net: driver: stmmac: Fix CSR divider comment
      net: driver: stmmac: Extend CSR calc support
      net: stmmac: Fix clock rate variables size
      net: phy: Add helper for mapping RGMII link speed to clock rate
      net: dwmac-dwc-qos-eth: Use helper rgmii_clock
      net: dwmac-imx: Use helper rgmii_clock
      net: dwmac-intel-plat: Use helper rgmii_clock
      net: dwmac-rk: Use helper rgmii_clock
      net: dwmac-starfive: Use helper rgmii_clock
      net: macb: Use helper rgmii_clock
      net: xgene_enet: Use helper rgmii_clock
      net: dwmac-sti: Use helper rgmii_clock
      dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
      net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver
      MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
      net: stmmac: dwmac-s32: Read PTP clock rate when ready

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  98 +++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
 MAINTAINERS                                        |   7 +
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c     |  16 +-
 drivers/net/ethernet/cadence/macb_main.c           |  14 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   2 +
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  15 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  20 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  30 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 239 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  19 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  18 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   2 +-
 include/linux/phy.h                                |  23 ++
 include/linux/stmmac.h                             |  10 +-
 21 files changed, 431 insertions(+), 119 deletions(-)
---
base-commit: 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
change-id: 20240923-upstream_s32cc_gmac-6891eb75b126

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



