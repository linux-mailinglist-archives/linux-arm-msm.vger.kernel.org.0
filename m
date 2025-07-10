Return-Path: <linux-arm-msm+bounces-64344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C712AFFFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BAAF3B342B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C28D2E0919;
	Thu, 10 Jul 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5J+BDKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC12DFF3F;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144654; cv=none; b=glCd2Ga4gr2HkRqsem8QIjqHeeJV+Eo9MBpYxbJ7XazyChgm5FCxNCAG59Wd7tKPVsjUj50OxrUwnpDXY/CSPBi6DptbxDo1Gr/VZcUjlA2ChzNiKolOWLiXKFXKkfFQ37macVst88LoGoZSndCpnm+SWDzmZX+LkKrklg7tkwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144654; c=relaxed/simple;
	bh=TyjR6U3fmebUUtdkdddQWsqftQQOEHluzjIlcrlBipU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Woz9997MpxnUjvoW58I7EuADDnCWc43hPru/2IF6HzDKjTbPW8MslXogJuaAQJ8yrh4A+ZWM29xYlRTPa956W57cZN6iK9On99bkL97WZF9o8vhk4b65GaVQtR83d6AoV9JBjzA9Gid03Hriy6Z/rGyK2G9Rv9mFOI8LAdPm4ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5J+BDKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD50AC4CEE3;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752144653;
	bh=TyjR6U3fmebUUtdkdddQWsqftQQOEHluzjIlcrlBipU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R5J+BDKm704vgum+GIL9osTIowFBhwTlMCxiS7xO5UM/IEDsiCOSiYKvqP1lQvCrF
	 sYbts9g0olO2s4563RXR9Uln2gGQ9ZPoW946z8s7C7yx2U88WDvwqJWIzJPQs4Tyd1
	 yXxk1Z6Jd1d03LeILlfGha66ePzjuANIULa3HiGiFc3fk2XUehfVqiyYa6Hcg08XE2
	 cQDVQo5ZEhRkzkHcbo1i3OBbWgjJs41GhCzs4tCEIN3TdjqbIbRiysI3YfUa5Y9xar
	 UIbdGO7VyTypXGhmO6XQynOpc0DsS2xImlGHpuRGjHj6WOSUR/aZjlFSI4N7JVlq4x
	 S/uXJU8oyqXIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0A3C83F1A;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v7 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Thu, 10 Jul 2025 12:50:32 +0200
Message-Id: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2ab2gC/33Oy2rDMBAF0F8JWldFo5elrvofJQs9a4GJjJWap
 MH/3olXNjRezOIO3MN9kJamkhr5OD3IlObSSr1g6N5OJPTu8p1oiZgJZ1yxjnHaj/QGEm+kyQu
 epbY6Wk2wME4pl9uKfZ0x96Vd63Rf7Rme33+ZGSijHKxQOhnBWfdZh9hCX+vQ6vBzxUXt3Zdf8
 jRn/trh6LisvDImgu3soSO2jtg5YnVyAia8xFWHjtw6audIdCAIBdEnl8EcOmrrmJ2j0JEyWNA
 pO9uJQ0dvHbtzNDpZqhDAaKd5fOksy/IHCjC65hkCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752144651; l=3424;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=TyjR6U3fmebUUtdkdddQWsqftQQOEHluzjIlcrlBipU=;
 b=ciB6pgXf4LYS/hl1zPnTKQa61Hjor8BEWflr2M+WDVQnOb1wRTPrBxRkYpTnVHikDbP/Vc47I
 SvaOgeyEY7GDlA3Ok724j94jjgbXvt/JeebMuZr2K9FUXfPs11E+2ZH
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
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1549 +-------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   33 +
 5 files changed, 1589 insertions(+), 1545 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



