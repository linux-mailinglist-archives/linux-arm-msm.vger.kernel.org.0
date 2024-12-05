Return-Path: <linux-arm-msm+bounces-40564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E22979E5BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C2B61886FAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72956224B1C;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJC69m5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6E221458;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417012; cv=none; b=oKbSoZWLDw3elCbVZRV4+EKEHdV2g094cfU8A184xsbgF2DMlwdH1LBetVJT0xzW81kH1uCqPJtrm4OdIupDHZcOP+5NiFxFn+qf3Y/vD+uKaArdcZZMF9UuC1v8KCw07oH4PtPtdZzgsTl8NgMQdZAeWd5H93SXeF9pxV5aOlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417012; c=relaxed/simple;
	bh=Tl/s8JiV2SmGTZhlUaKGgX3/7+W6B+dH6noXJZ++bs4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ud8xZz4ixOgDixxz3HJYEVCyAAbInghte5ilxrtxejqwoMuCdfs5TVnumOgZ+VU4/Q1XYLfVow2cCXL1Rv0XKvkK8/xO36DoO9DYt00Sk+YJv6W3HTLTBWA4UxNeMR3ZKsQEtuCpTgTBCSJKrbQnNkw3YvCg8go4VBzQRgFyWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJC69m5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A17C7C4CEDC;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417011;
	bh=Tl/s8JiV2SmGTZhlUaKGgX3/7+W6B+dH6noXJZ++bs4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QJC69m5gichtZOBgjEl2dZk9CJJIUDa6+pBYXdrcVifpcFvSe8yaCISj/42BzaKZs
	 3nNadWCf4B7lTb069UdDHTlH7HX0OES9dCiZkbv0iHeyJJGZU4SRFb2lQbcgvhoa16
	 QUGDQA9ZYOAfW6csl2U4zN5UJ9lKJoMMRpADI1O4JPSWSWeAWYhSfkxb7lk9nx9/0a
	 IcKvskvjNFHxrpju9SLFcvEu0cdQqkjoR0nMOKXZO/aiHZ5MDOA4yG4fl8GDfhGiAf
	 pqOvOzt4gc+XiU6kgXd6kDPBBbxxxdvEVkp/amjxjY3OXhw24Gs6RpiKTj05Amlqao
	 jSKfa/NetnCzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2C8E7716E;
	Thu,  5 Dec 2024 16:43:31 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Subject: [PATCH net-next v8 00/15] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Date: Thu, 05 Dec 2024 17:42:57 +0100
Message-Id: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHYUWcC/23Py2rDMBAF0F8JWldBo7ey6n+UEuzxKNHCDyzXu
 AT/exVvkmJvBi6XOcM8WKYxUWaX04ONNKec+q4E/3FieK+6G/HUlMykkFoEqfjPkKeRqvaalUS
 83toKufUBqHamBmlZ2RxGimnZ1C/W0cQ7Wib2XZp7ylM//m7nZrX1TxkEHMuz4oI3Xtemsq4OS
 nz2OZ+7ZThj327irN8U6Y8VXRShLPgIghTJvWJeCkA4VkxRXIMYRMQYKe4V+6ZIfazY50doHHj
 EKATsFfdSyjhWXFFqVAQxRGss/VfWdf0D8zuZmdoBAAA=
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=6670;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=Tl/s8JiV2SmGTZhlUaKGgX3/7+W6B+dH6noXJZ++bs4=;
 b=jqz5a1dhjZiXqKcL3y2gtJfIRnyu4VHGYnJ6F8wTkQVkurHP9vUPM/EvymoExsa9f6VWqis4z
 iDIN2RYSxzVDn6mpr8/S5oI+NqZxvDfHbbq0RAUDemu2LbwTE1Mnw33
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

v8:
- dropped 'driver' in patch subject
- fixed interface rx/tx clock init
- Link to v7: https://lore.kernel.org/r/20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com

v7:
- rebased on v6.13-rc1 and removed RFC prefix
- Link to v6: https://lore.kernel.org/r/20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com

v6:
- removed dead code in dwmac-intel-plat.c
- yaml: fix indention
- validate interface mode in probe
- dropped patch#16 to fit in max 15 patches in series
- Link to v5: https://lore.kernel.org/r/20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com

v5:
- yaml: refactored compatible string to use fallback
- yaml: fix indention in example
- fix xmas tree formating in local variable declarations
- removed lazy rx clk setup
- drop PTP clock reading patch and replace it with stmmac_platform fix
- Link to v4: https://lore.kernel.org/r/20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com

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

Cc:

---
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>
To: Minda Chen <minda.chen@starfivetech.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Iyappan Subramanian <iyappan@os.amperecomputing.com>
To: Keyur Chudgar <keyur@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: 0x1207@gmail.com
Cc: fancer.lancer@gmail.com
Cc: 
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

---
Jan Petrous (OSS) (15):
      net: stmmac: Fix CSR divider comment
      net: stmmac: Extend CSR calc support
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

 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 MAINTAINERS                                        |   7 +
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c     |  16 +-
 drivers/net/ethernet/cadence/macb_main.c           |  14 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   2 +
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  15 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  22 +--
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  30 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 202 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  19 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  18 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   2 +-
 include/linux/phy.h                                |  23 +++
 include/linux/stmmac.h                             |  10 +-
 21 files changed, 399 insertions(+), 121 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20240923-upstream_s32cc_gmac-6891eb75b126

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



