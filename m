Return-Path: <linux-arm-msm+bounces-63447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE40AF621E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 20:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13E14A05E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 18:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D432BE641;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKW7hkKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979501BC099;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482750; cv=none; b=cdhK50Ha7nXXApgZJjPS29fC+7TDaxc5FQMRXBQHqma6eaY5hk/1MCnSLpvXfB0JtRkLq4qpoLkrk5w9nNaJjCQtvZik1kg/Tl1KWGjU2XPH8hdGHMhQiBrBJgPD9jy4+C0U8/f2hw+OQ/iels0IzSVJjcL7FhXohymz2rwk1xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482750; c=relaxed/simple;
	bh=ufCSq2mnEigby6k19PzJHNyU4EvjZ6YL7/Gy0BO5pIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WUHGxIdqdZDEzo7T8Iz72Ns6HOKobGgo/a/qJvpF40+hTdyIxDIOfC8UDALhQNYMAeYIeVKmYayBXyzZjEy50lsUPGR9PKNU7OWiawqyMQSCffUjiKzon0sf6Vf5veq3pp022qOF7gAphrIkGCQD3F7KqVKMBhwINZkPl/VsQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKW7hkKe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74005C4CEEE;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482750;
	bh=ufCSq2mnEigby6k19PzJHNyU4EvjZ6YL7/Gy0BO5pIw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uKW7hkKeKG3NjGBmnIA0Ee/vMADBvbLLr2z2H5MKHFRwXEOt/tczKIal+OSiDBYn8
	 JT/pU3rCfo7nKjhkPp7GAbavUlIKwSzfJm3VFG4Ie40PEa4RdhFfJwZPJOmEy5X95r
	 HEkc1mP3xgDZ6b0FCgflN3yNVfm/9hsGE0oTfFYfrA9QVl6K8OisKwAJSOR72vNw2G
	 84y4nTL0fddxKHPNzdd5SVGWKWU/pbNgzBUhp20SUlwQzMsivDh69EkSmRPYv7ZMf8
	 XONq7vHZRg53na1zHr9s7tcJVqlYMpZ/aCX7f+2VgTcmoB1b37rNQnFuLVJwhlU6j9
	 l6zcHSST+y0UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6EFC77B7C;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100
 HP Omnibook X14
Date: Wed, 02 Jul 2025 20:59:06 +0200
Message-Id: <20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqBZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3YwC3QpDEyAu0E1NMjZKMzGzNEuxNFMCaigoSk3LrAAbFh1bWws
 Ao1UWeFwAAAA=
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751482749; l=1788;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=ufCSq2mnEigby6k19PzJHNyU4EvjZ6YL7/Gy0BO5pIw=;
 b=48krut28s2uCWZcVmbvxRSPKMTblVAb7E4agH0+yx2UP8YBjvhi0zBxfTKwpwWj/dUdmGCzpb
 PT+Spq/lLjzDCUntbJ3I50YFp0Hp46J/YnrAju2pG0BW8h006DUPesA
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
Jens Glathe (3):
      dt-bindings: arm: qcom: Split HP Omnibook X14 AI in SoC variants
      arm64: dts: qcom: x1-hp-x14: Commonalize HP Omnibook X14 device tree
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    3 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1550 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   44 +
 5 files changed, 1602 insertions(+), 1541 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



