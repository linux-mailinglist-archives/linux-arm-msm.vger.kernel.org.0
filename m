Return-Path: <linux-arm-msm+bounces-72862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE2B503FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32661C24785
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4680435336E;
	Tue,  9 Sep 2025 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOk8Nvc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46F258EFB;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437361; cv=none; b=ehMRGBnkF52pWOTE4ySdkhbwgpRY7Lp5djONigoU7iJg65ShRCAw3lWsFK8fAuaJZVagYUW0PJHgS1yz5aVaLhVnBjSNPOQA9GSks5B/qH5eDdRDCUndbMdnrZTgMNe3Cj4+HYcPZb25uJbxah5/iZbUwT2PdYopMpxV5juys38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437361; c=relaxed/simple;
	bh=DtoJG7abkzsETSxv7OldiFAld+o5s9NMo3AjMGSPYiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p/8PhKHdf36UcZ1Xlwtd/pPdUUXE7nxAPlaaeBSefYdqDpLfE2/ztLD6z/XDsguN3odIQVnB9VH8MH0yp7k2qAy1C7jFKJtlxP9WcBanZ2qZ32xqR/i1eIHsclMaOBMa4GVoheAmhqTxBV+qhR00f/3GNDWR3Vg25TuOcYjji+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOk8Nvc9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C1B6C4CEF4;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437360;
	bh=DtoJG7abkzsETSxv7OldiFAld+o5s9NMo3AjMGSPYiU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pOk8Nvc9eKTxgpzYthousH3T1n2zp7kP4xPq5cE8CDt7gqAg6rWFfZO0Q2bXBL2Gz
	 P0xKzhAIrOxf4y1/u18OARMiOBdy7Cup6ing0p1MyfADxQwnYL1Q5JL3SEzhSNiodh
	 Of5Y+HnYDqyDCsBJeIpwcd3PRuWdHldyfOSMYAm8U3VVsYgw7Flk/Fu9VQOMMcbZIk
	 6VfnnyxFKZzT2VGDkpSu+62TcLrMTUgwY8HWozyparVjIpkvmRfzmDpQwoNrso/kWt
	 OipFBKBpU8IyPTVE3YpH3OcJX8JUwwjUfYR7Y43u+bgCcDVHTJJl0ZGCCju6ZtVz2B
	 apmbP/1wkqLHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB4ACAC582;
	Tue,  9 Sep 2025 17:02:40 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v8 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Tue, 09 Sep 2025 19:02:32 +0200
Message-Id: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpdwGgC/33Py2rEMAwF0F8ZvK6L5be76n+ULhw/GkMYh3gap
 h3y71WySqCThRZXoMPVg7Q0ldTI2+VBpjSXVuoVg325kND761eiJWImnHHFDOO0H+kdJM5IUyd
 4ltrp6DTBg3FKudw37OMTc1/arU4/mz3Duv2XmYEyysEJpZMVnJn3OsQW+lqHVofvGzZqr135J
 as58+cOR8dn1SlrIzjjTh2xd8TBEZuTEzDRSWx16si9ow6ORAeCUBC75DPYU0ftHXtwFDpSBgc
 6Ze+MOHX03nEHR6OTpQoBrPaax1PH7BxgB8esf7kALFgwIPxTZ1mWP0lsjNhhAgAA
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757437358; l=3619;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=DtoJG7abkzsETSxv7OldiFAld+o5s9NMo3AjMGSPYiU=;
 b=tpfJB7ah+j3pZkJKGYYIYfOfiV9l2YhBGKfAP2IE5W/bfLFmbX99IRk9NhmrMlnkbF1JcDzHC
 TdxjL12fQ2rAtPuc8S+bvydp3msSv2vs4q/0zhqeyGkxvUrDKsS0mJN
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
Changes in v8:
- rebased to next-20250909.
- picked up reviewed-by from Konrad (Thanks!)
- Link to v7: https://lore.kernel.org/r/20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz

Changes in v7:
- rebased to next-20250710.
- reworded commit message for patch #2
- picked up reviewed-by for patch #3 (thanks)
- fixed link ref in patch #3
- Link to v6: https://lore.kernel.org/r/20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz

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
      arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14 device tree structure
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1549 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   33 +
 5 files changed, 1589 insertions(+), 1540 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



