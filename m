Return-Path: <linux-arm-msm+bounces-59341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66441AC3607
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0A73B3C47
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEA221129D;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5xcn49w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE25143C61;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195768; cv=none; b=Gzm6umqBkwqJQXiD+PmYeW/a3clm/tWlPZ3DMkDHmT1h6KLfr5CsG4Hv/JtTDWESYKnHcfc6EbpWXe8X0q9OVWRGwyQfSsM7t3tb3TUBuoA6ZRNqfhlJ9iPiEKzrz0Jz9r+0ofaFgW6rggmiz5/pbHUXfINK5rgfby5XJ5SfWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195768; c=relaxed/simple;
	bh=gAGGrpFaUot6LvUtyb2oJD1jQBlcQMlGQ2LEDzh1XzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IDwnK30QnuVSZAAqE0mVjp/ugQvxq0fc/jAReF9iEaNDeyIhuLAeJVoEf71pLNH6k3UQ6G7UFqW9FMYp3eJ14/9BNsjZh8DtA03WcJ0tfbMYvQytZjqLCHkwzwDmUtlAiK5Vy+eiViba4pNFOPGSZn9EPdhxFFBjtTTkiWwuTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5xcn49w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03C61C4CEEA;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=gAGGrpFaUot6LvUtyb2oJD1jQBlcQMlGQ2LEDzh1XzY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C5xcn49w0aBuf/jAK3LO5aPziNZnwsF3TX50BbNhvAL7TjkmN38X0k+cR6KEltc+v
	 +Be1ecwA5Y8PgwMyXM8iK9bad++n65p8w0iTHzPLgBMpVWt1E9MXm39smu+c2N8Oz/
	 BoF/Qp/Uldr6Tlr1g7QUibMWJ9k1jjPBpZ9XVoEgutEvRbQYe7PELvshTTOHIdu2sj
	 /zqINYZv+Hjifx4ZLh0z9lSMN+tYBJshZuPY5HrUZcSOfUnMK5MpW90Ima4NqjCm95
	 +6jbBd/sPtH3LRZ0Ikr7g3NrRnfffNzxzjDqDYbSOYfIWENxzhADogzT/dpMVVdp9S
	 fsFp78P4fyW2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4256C54ED0;
	Sun, 25 May 2025 17:56:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/5] Add support for the IPQ5018 Internal GE PHY
Date: Sun, 25 May 2025 21:56:03 +0400
Message-Id: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRZM2gC/x2MQQqAIBAAvyJ7TlDTiL4SHUy33IuZQhTh35OOw
 zDzQsFMWGBiL2S8qNARG8iOgQs27sjJNwYllBG6F5zSaYQceTMpPNyvg9F2s9qhhxaljBvd/3B
 eav0Au7tQZmAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=1665;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=gAGGrpFaUot6LvUtyb2oJD1jQBlcQMlGQ2LEDzh1XzY=;
 b=ETlaBtS9A4SDI9CPrwyMaAyaR/EcnY1qbqF7EUT62PnT6kmIhqi+xx7bxpZ8AKxo4F5RYUTG2
 88D7dh2zvHaBiTDGz0BT4Ljm5VSX4nmKwdBizoSNLETbp+V2sOXx+qO
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

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
George Moussalem (5):
      dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
      clk: qcom: gcc-ipq5018: fix GE PHY reset
      net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
      arm64: dts: qcom: ipq5018: add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus

 .../devicetree/bindings/net/qca,ar803x.yaml        |  23 +++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  51 ++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
 drivers/net/phy/qcom/Kconfig                       |   2 +-
 drivers/net/phy/qcom/at803x.c                      | 221 ++++++++++++++++++++-
 5 files changed, 287 insertions(+), 12 deletions(-)
---
base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
change-id: 20250430-ipq5018-ge-phy-db654afa4ced

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



