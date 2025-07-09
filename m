Return-Path: <linux-arm-msm+bounces-64284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC7AFF1C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 21:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F431893CAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 19:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6545224166F;
	Wed,  9 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tvibuhpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368D23C4FA;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752089230; cv=none; b=CgJZpMl3tob0HVBLA+z6BcG+0sKNOV11cs2Q2viu4TB5ayyizEd4r0rslXfBty8LBLSxkANh+8IpyMyzoq1Y1bzhNBnhIERM82Pm/7hDhT5f2O61YRUChV3cokTxZjGiy+x31vjsVaL/V/wFgrkgDNkli7wyLWpOZzdOZFtLIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752089230; c=relaxed/simple;
	bh=9xgq7Yye1wmMDCjeCn2l/VYFm3PkgPlGRaN6phVB+SY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cn9ErL3YNlTDsB2fatBCvA2n7p+0YjSjG+UYooqxDq4b0HtlCfFHkX1HD/+ynJwwsptarft15IrODAoY+ailIq9iLy+uO6pzU2k43u59CqorQZNEtYuz6dvzf+EzaeHGCLgIkLr/pN7yvoBTEr3LM6fQINEGIOPFJp28B3+2ZmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tvibuhpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B16AAC4CEEF;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752089229;
	bh=9xgq7Yye1wmMDCjeCn2l/VYFm3PkgPlGRaN6phVB+SY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TvibuhpgRTWixWAAskCFCMt4bTEYK19t8ifvzudrZlhoqkqFww4EgQ6NubekSSV5M
	 uBWa6g8J8sT8B4382S49lJuv8e7ZVdWZtM8YmR2o9T4sGY2b4il9Z/BESecgzw0Gst
	 1gMCucXVTJ6ozM1E37NHvd6Np+YXiy2WpRBEdpR169BtsflyeiUaEnLioWGHdWoabZ
	 Ybs+i7clgM4goo4kH107BkITCLJBXdj9Lz5EKNcyARsNj2pBx8zPfh1zw/hA82Psx9
	 0hMEPliNcJHmHFQ6UWyU5FgWKkMn6BAXoeaB55g/SQsOOnSvUGnSI3Xu1th4S5437x
	 vvmhKp6IrthiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B45FC83F09;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v6 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Wed, 09 Jul 2025 21:26:51 +0200
Message-Id: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHCbmgC/33OTWrDMBAF4KsEraui0Z+lrnqPkoVljWqBiYyVm
 qTBd+/EKxsaL2bxBt7He7CKU8bKPk4PNuGcay4XCvbtxLq+vXwjz5Eyk0Ia0QjJ+5HfQNONHIO
 SSVtvo7eMCuOEKd9W7OtMuc/1Wqb7as/w/P7LzMAFl+CVseiUFM1nGWLt+lKGWoafKy2q7yH/s
 qc5y9eOJKdNJhjnIvjGHzpq66ido1YnIQgVNK06dPTWMTtHkwOdMhADtgncoWO2jts5hhytOw8
 WU+sb9dJZluUP5Fj5vdEBAAA=
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752089228; l=3154;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=9xgq7Yye1wmMDCjeCn2l/VYFm3PkgPlGRaN6phVB+SY=;
 b=G9GipB54aRQHawnqgL67IVL0d0u7HSYkPxlXnAxUFPMRHePz6LRumPKjql1MYb/5hy5clLfJR
 4Ducc3Lsu4IB1ydeildbOyJhhST+BLYAcXJhSI/1/731zhbBHvB7QII
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
Changes in v6:
- rebased to next-20250709.
- picked up reviewed-by for patch #1 (thanks)
- corrected typo in patch #1
- removed model, compatible, chassis nodes from x1-hp-omnibook-x14.dtsi
- amended copyright strings as discussed
- Link to v5: https://lore.kernel.org/r/20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz

Changes in v5:
- rebased to next-20250708.
- changed commit message for patch #1 to reflect what happens
- moved gpu node into the common dtsi part (always supported now)
- switched over to gpu_zap_shader definition in the individual parts
- Link to v4: https://lore.kernel.org/r/20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz

Changes in v4:
- leave the qcom,jp-omnibook-x14 ABI unchanged, reuse it for the -fe0 variant
- hacked b4 to create an easier reviewable patch: https://lore.kernel.org/all/20250705-format-harder-v1-1-55c5342be55c@oldschoolsolutions.biz
- Link to v3: https://lore.kernel.org/r/20250703-hp-x14-x1p-v3-0-affe103b4356@oldschoolsolutions.biz

Changes in v3:
- removed copyright strings
- amended changed commit message  
- Link to v2: https://lore.kernel.org/r/20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz

Changes in v2:
- remove pm8010 handling
- Link to v1: https://lore.kernel.org/r/20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add HP Omnibook X14 AI X1P4200 variant
      arm64: dts: qcom: x1-hp-x14: Commonalize HP Omnibook X14 device tree
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1549 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1549 +-------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   33 +
 5 files changed, 1589 insertions(+), 1545 deletions(-)
---
base-commit: 835244aba90de290b4b0b1fa92b6734f3ee7b3d9
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



