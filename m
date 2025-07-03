Return-Path: <linux-arm-msm+bounces-63481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F28AF6AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E23188F523
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 06:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129C6295DA6;
	Thu,  3 Jul 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOmfveil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43AA292B42;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525956; cv=none; b=eq6MyvvlNJBPC5mlYMcXInHh9eG4XSFDvETlGL853t0WGNfF4xENpbdlrYGD7Y7hDVQQGur0QgqHyCkkfHWK2Hwm1/LDBTnyRSQoHcKXXYWjxxjvEmy9Zo3Qvff/88x9TUWGz24cbhfoxpoi2ZzO3JH/LztRs5eh5DYngVvGrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525956; c=relaxed/simple;
	bh=tQJdnJYlTNIs5lgbSl8DiVHPrsh3z/fqveMuaTC90Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iGPe4l/HrVFetRuep78xKfDlqfadBxr6jP1co9ZWMmVJ3QvjogC2QmfoX7wr7VeDhc0UQ7R2gnQLD6FY0oM4HWFBx3LQ+m9fpk2bpLH0ljFPQsxPAZ8C++h15W6IwQE5/034xjzOTAKU/mXvGEtbWZ2GDf2J0yTWP8qo0ioBM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOmfveil; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67F0EC4CEE3;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751525956;
	bh=tQJdnJYlTNIs5lgbSl8DiVHPrsh3z/fqveMuaTC90Og=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DOmfveilTtx0t/c5/RwXmiADFbeZITJU5cUD2pWtuxK0Cp0JCkROwyF/gM/kcXWMU
	 rWLoCurzMjh5rkWxL72rCu5bf1EHoiRZgOR+/qwI73BtqFs7FrQu2vxP9zLBIGYryw
	 2yRb6bBQzR9Iw8mVAwfQvNByeIXb2fgjUhlmTLDv5mqT7MR7rniSIO2YzH9Au82byZ
	 OlNLkJ0zSOmjPXzsJVCAoh0fgDA2IZiUgdlA7NsLVYsyvA8OVAm2i1Rwty27UXtO5b
	 EH8B+SLqqcB3J5hTjmpblMuVAzO6u4rtRN6doOU32ODd07z4BOlK7fk9IYEVdrTHJG
	 1wuzoT6d04gGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537F7C83F03;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Date: Thu, 03 Jul 2025 08:59:10 +0200
Message-Id: <20250703-hp-x14-x1p-v3-0-affe103b4356@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4qZmgC/3XOwQ6DIAyA4VcxnMcCRVB22nssO6jgIDFiwBE34
 7uvep6HHv4m/dKVJBu9TeRWrCTa7JMPI4a4FKRzzfiy1BtsAgwkqxhQN9GFlzgTta2AvlRaGa0
 IHkzR9n45sMcT2/k0h/g57Mz37V8mc8oocC2ksrUAVt3DYFLnQhhSGN4zfpSurf+S3cxw7gA6T
 S9bWdeG60qfOtu2/QDJ7uTo+QAAAA==
X-Change-ID: 20250702-hp-x14-x1p-eb32f4696d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751525956; l=2124;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tQJdnJYlTNIs5lgbSl8DiVHPrsh3z/fqveMuaTC90Og=;
 b=IYn8bd9kGEwYlsibDlmnND/7ucFXPmAwIBpJYyW+D9VKz+iOMZp/t1SKVxeyH+VMnaWrftfCr
 Xp7lo6zh01pB3ck+4C2aOJDK6zT3EkXhNnoc3r15KUSwJTY0YSrttqH
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
Changes in v3:
- removed copyright strings
- amended changed commit message  
- Link to v2: https://lore.kernel.org/r/20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz

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
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1549 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +------------------
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   40 +
 5 files changed, 1596 insertions(+), 1542 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250702-hp-x14-x1p-eb32f4696d96

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



