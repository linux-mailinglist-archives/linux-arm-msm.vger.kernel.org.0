Return-Path: <linux-arm-msm+bounces-63465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1614AF63DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 23:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34DBC1C441D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C66423BCEF;
	Wed,  2 Jul 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrxjdOhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BA2367DA;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751491356; cv=none; b=PnlecfasFcaFYs472he4b0dj6NmBc1thvzszhHOFlAQe8G6quRYqnhv2cTv6hdi1s9wG4T/ArJGRB2i+g/SqyDkjXQ+uX/hCDnHm3iegwsJmihLt5IeopP11Ivotsco+WxkiOXxPHaLvWXtxUKa54vAZAYHp+OT5/0S0feArVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751491356; c=relaxed/simple;
	bh=kj8Gg0AYv1enYAMQtc1VtjA66fJWq2pJJvt6NBWJetw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bs7dSUsIDA+1KGPfFEj7aUwjEJTtwwilvYxlewagmvtYcdwG9QcDN7IwIOly1pynn4nFBBuxDTAf/9wuFyLx57Ob50jqW4WZ2A6ackTaJzCyEGaMs/DZRmaOBenJFxqjHXQIUKsnaO8lYd/GRjOTPk1viIDR4xxUszoUiu6Vqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrxjdOhH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90B62C4CEE7;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751491355;
	bh=kj8Gg0AYv1enYAMQtc1VtjA66fJWq2pJJvt6NBWJetw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KrxjdOhHeNyRoMRycUrVTa6ipwBK8DDsL1SdSo63AKjo25HTAQ4d6LvTCNZEr1w6m
	 y7y4XJjnRhNBBtWoIoV37Dpqpktjqtxl3IF8a1DZL3lc8wm+ZB3zmKWEvN4lC4Rt3c
	 xnK3JjyXBJXj77VmhxE2PzdyfMaBFI/Hv3jsKD3rDTj1aiSpfHrIaKE3sKe9CRJk5w
	 B664comzDS7G+wB5mEcp6ZhKJrSBZXQ//tVrml65fL7T38ZNR2XTqgFQtHKaD7y4tZ
	 b+ezVutnSCPpc/jbliyrPh4Ahb9DagOS5GT6nhdJqhpYPyLm0X3m0/wcsRlJjle6Qx
	 Ld71aRJwHtpQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DC4C8303C;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Wed, 02 Jul 2025 23:22:32 +0200
Message-Id: <20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABijZWgC/22OwQ6CMBBEf4Xs2Zp2gSKe/A/DQWCxmxDadJGgh
 H+3cvYwhzfJvMwGQpFJ4JptEGlhYT8lwFMGnXtMT1LcJwbUWOpKo3JBraZICYraHIfC1ravLaR
 BiDTwesjuTWLHMvv4PtyL+bV/NYtRWqGp89LSJUdd3fzYS+e8H8WPrzk9knPLH2j2ff8CRDcSj
 rEAAAA=
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751491354; l=1939;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=kj8Gg0AYv1enYAMQtc1VtjA66fJWq2pJJvt6NBWJetw=;
 b=UnlBq+pRnFNJFLkVrmu3lnnjVmlaV74mBYVTdfg+1nhXv6hjHdHSFQON/Scs1w+w+IcR+9pE9
 Bh2pnTdmku5DzGoRtp1TP9V+E6mMVmYXG/remFxAep19aWFTP2U7s6A
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

This patch series adds support for the HP Omnibook X Laptop 14-fe1xxx. [1]

Since this is actually the same model as the 14-fe0xxx, but with an
X1P-42-100 SoC (Purwa), it needs a slightly different device tree.
To have as minimal duplicate definition as possible, the hp X14 gets 
commonalized into a dtsi (and it stays compatible to the derived 
device trees, like the Ultrabook G1q). 

The supported features are the same as for the original Omnibook X14:

- Keyboard (no function keys though)
- Display
- PWM brightness control
- Touchpad
- Touchscreen
- PCIe ports (pcie4, pcie6a)
- USB type-c, type-a
- WCN6855 Wifi-6E
- WCN6855 Bluetooth
- ADSP and CDSP
- X1 GPU
- GPIO Keys (Lid switch)
- Audio definition (works via USB and with internal speakers)

[1]: https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- remove pm8010 handling
- Link to v1: https://lore.kernel.org/r/20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Split HP Omnibook X14 AI in SoC variants
      arm64: dts: qcom: x1-hp-x14: Commonalize HP Omnibook X14 device tree
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    3 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1550 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   42 +
 5 files changed, 1600 insertions(+), 1541 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



