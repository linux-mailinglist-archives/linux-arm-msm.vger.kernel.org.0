Return-Path: <linux-arm-msm+bounces-64100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD925AFD869
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 22:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF891AA3CCA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 20:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B8E23D2BB;
	Tue,  8 Jul 2025 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hs+xTpob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B414A60D;
	Tue,  8 Jul 2025 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752006904; cv=none; b=LZWecjKI1XyuCV1emDlq4Kc1htGYhdua970KKQWfweMbIcGOI3wlWhV2fRMU30poSVNCecYQ+h1ZzDVgrwKEao1IYm+HtWzk4dQYhG3N9p7n+bM0cx5Fh3wu1D7bGiV/H/n9u7bTpXEH2YBnJP4tHC+2AqAGmCQpuNOKcyuLZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752006904; c=relaxed/simple;
	bh=UdVYacj6Mib4orZETsuAysGxr6C6iUDRbuCqAVxQQac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oqGqOUy1NJlMjvI9pqo8UTgvUh+vPj3Rii6y3Z13lNQO2FWxJL/3SDU8FGkqZiOhy6PGinMsuOQ7S647ePM2ukOLTRcFMMqKjzRO1y9L/sJQ+EX8SmXgGJaJiwFpxGer4vnSzXqPhsHfxAd7E0uos5DWS/xvpSZGFNgBdcWEmhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hs+xTpob; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B751EC4CEED;
	Tue,  8 Jul 2025 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752006903;
	bh=UdVYacj6Mib4orZETsuAysGxr6C6iUDRbuCqAVxQQac=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hs+xTpobr3DvSd4OzwjFJxzENFRZ7EfEC3jftR8Ho04A/S6YiR18PNrsFiTF13Czd
	 q9RqtraWct80HRXxXRE0LKLJ3KrE4oWWO5fEOlaa4BOq83ONfUANHWqA10fVgrWPPO
	 8YFE+bYCdcQPs3i+6LT+d5onflzqi1nahxf3lNLD5+HEaPHnBkQIMjqyetU/ebylX5
	 SJqrW7llYwuTcNRPaTbjzKf4HYZwVBhR9pSPGvwiOgGMKy+wwaqQzKe1Gk7THQw9NJ
	 7jh4xGzWik2i/6uFhFPd5rpK3fe2qZgF2QqXduyL4NTM8frCJXekBepssJWbufvv7H
	 lUxAYThHIjFcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D397C83F0F;
	Tue,  8 Jul 2025 20:35:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Tue, 08 Jul 2025 22:34:05 +0200
Message-Id: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOAbWgC/33OywrCMBAF0F+RrI1k8mgbV/6HuGiaiQ0UUxotP
 ui/O3bVgrqYxR24h/tiGYeIme03LzbgGHNMFwpmu2FNW1/OyKOnzKSQRpRC8rbnd9B0PUenZNC
 FLbwtGBX6AUO8z9jxRLmN+ZqGx2yP8Pl+ZUbggkuwyhRYKSnKQ+p8btqUupy625UW5Z2LT/YxR
 /nbkeTUwThTVR5saf86aumolaNmJyAI5TSt+uvopWNWjiYHGmXAO6wDVD+daZre9m/TC4kBAAA
 =
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752006901; l=2812;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=UdVYacj6Mib4orZETsuAysGxr6C6iUDRbuCqAVxQQac=;
 b=X+dCIpe5hHOCxCRl/F5YBc+z7qFiq90Rw7Rt4wobRbfOsQNHe8S5qJjfDpsowN9AIpobG1xBF
 EZm19XqbmdGCug3ilt6SOjGQN9lBEHvAGV9Gqjqi+ucylWjnPeW5aLS
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
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1553 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1550 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   36 +
 5 files changed, 1596 insertions(+), 1546 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



