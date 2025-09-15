Return-Path: <linux-arm-msm+bounces-73496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441EDB5719C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C943E17A672
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA892D6E5A;
	Mon, 15 Sep 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huHSAOoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385DE2D640F;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921717; cv=none; b=rYaNllPBD5oH2FCUEar2CzgEBoQwb9mztoXDgiYwBHh8Fhc/UBy7KoGuqod1xEp3MIMgCNpDCRyejIOxpzwAGKNsPC8p/O/TvlLWa748/eoUbXhdE5uFZ+JNE7HY1fagdNTUn/V8Qoc9UkCVDe72jou3zCvlO1+P78Uvr4h85ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921717; c=relaxed/simple;
	bh=pqJLiaWaQH9X7RAJXHVhivU56cK+jqLVrIFbuYipMtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y2CIsauJaBNmwxoH8KI2uDKhg3GeZJU3crClh+M8L4BzbYnKKE4FhU/abmwo9gv6l1n4gbhh6CZK9r+LdFQ/WZ1oiE8R2y2SYSFuJ7zEjozQNyx9BSpWr+FJmsD6t8R5yJoXztQ3NHAmQBH6mi5aN4Ny3g14OjUQ2w72wZXJQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huHSAOoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C07A0C4CEF1;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757921716;
	bh=pqJLiaWaQH9X7RAJXHVhivU56cK+jqLVrIFbuYipMtU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=huHSAOoGFEW96CKHc37p+prxQ+MBp7L4RbzZKUpFVtSQXXaJaN2k9SchOl3wc6mFv
	 0WpDxKhoQoxbzSUs4drCkJxVjPTLK5TsA/1KV87D3079E8SYAeAw/C1zSD5SC8c/mr
	 Tn4v/emuScK1iTumL6U/wN85nqXHy6SF6wOfl41sTsXp5yoSRHb8pUqNr7zVekLVzk
	 fZH++ZCTHZNPkxCuE2V4cOOgoLXmrkkU/MCOgWJfDV/fLZO3XJQnLbWzAHHtASHK+j
	 aYqgyzBG4xPbX69ljvo4rP/6AF4MV5CJF63Ha3TuJ1DRJltTiaDmM7J6GXJ1IYVZSe
	 TFTvS/S887Geg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A338ACAC58F;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v9 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Mon, 15 Sep 2025 09:35:03 +0200
Message-Id: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnBx2gC/33Py07DMBAF0F+pvMbI4/ew4j8QCz+JpaqJ4hIVq
 vw7TjYkiGYxizvSHN25k5rGkip5Od3JmKZSS39pAZ9OJHTu8pFoiS0TzrhihnHaDfQGss1Akxc
 8S406oibtYBhTLrcVe3tvuSv12o9fqz3Bsv2XmYAyygGF0skKzsxrf441dH1/rv3589oa1Wdfv
 sliTvyxw5vjsvLK2gho8NARW0fsHLE6OQETXrZWh47cOmrnyOZAEAqiTy6DPXTU1rE7RzVHyoC
 gU3ZoxKGjtw7uHN2cLFUIYLXTPB46ZuMA2zlm+QsDsGDBgHCHjv118E8f2xzLLHeeaUSAh848z
 z+hQ7OSqQIAAA==
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757921715; l=3869;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pqJLiaWaQH9X7RAJXHVhivU56cK+jqLVrIFbuYipMtU=;
 b=RWd8+poZ3KJKaCnMBMAgo1Vdi7m9dDVXiv3pYW4OmiX2kHB1MOe15hQJbwd0mdj9vUEr191Qd
 C3RiyClUXaQAOCTuL7FrtNEMdEiyQbFJwX/F9mHGqHof3cA+GLiQtTY
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
unified into a dtsi (and it stays compatible to the derived 
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
Changes in v9:
- rebased to next-20250912
- fixed patch overwrite from x1e80100-hp-omnibook-x14.dts to 
  x1-hp-omnibook.x14.dts (thanks Stephan)
- Link to v8: https://lore.kernel.org/r/20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz

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
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1544 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +-------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   33 +
 5 files changed, 1584 insertions(+), 1540 deletions(-)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



