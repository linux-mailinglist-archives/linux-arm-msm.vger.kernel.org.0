Return-Path: <linux-arm-msm+bounces-34206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5499B93D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 13:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CEB71C20AB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 11:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFCB13D899;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZnTiic0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8E13957C;
	Sun, 13 Oct 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728820458; cv=none; b=CUdXS304tdhDuIa49UvK/cNcbqWtz5eqg6ylv44C8cXTMpWJVMrTSEgrUiN8Yeskpklp3gIdZ/I6fEA4oODVo+4E4nnmH3n7eCpBt5042MwF6gl5itPs7jk4mRa/t8uGeNhe/fXH6HvgQ9P3bDFL7VAqM/nhkWqDXEHFhCQixxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728820458; c=relaxed/simple;
	bh=Wcbai3eP4t7HsGJkcTs4+ts9jqbaaBjX3tZjlISALD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZM17WMzwjBpkekjKg+Inlrs0/cuPLHVyUwb90ZCzYvFHCOiMa5dG+sG28zaF1+UNaIieYLvYRw9LMPydRceEY45g17XXJQDyxWggwkj/ovcnL5B3987ORdHp/oAMW7F5by4eg0GjGNrwZXniEp38qz0WUYZ/1miaVW1KDfSqz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZnTiic0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA44C4CEC5;
	Sun, 13 Oct 2024 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728820458;
	bh=Wcbai3eP4t7HsGJkcTs4+ts9jqbaaBjX3tZjlISALD8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OZnTiic0ZYdBaFgcWjWsGU4+reszR1TGu15JcVuIz9ZnEg45UxGH0QWsEYDEvzgHB
	 cv3NsHYxss5wLkEPnH8AFv8edtI4fLcsYfe2dfr/tuiNB4YCwI7q4l6NywUcoAs2sE
	 yzfuYwEqDUARLSdSB6t+7PM194S5/OgVQHQAs517hGtgSaElzM++ZZQQaahlS13dH3
	 Dekm3Gh/csOniV6R0Ve26yruBlJIniojz5iLwwzvoD8lrDFpbIzhWFtlRZTRY8bqLj
	 0TiJzXAOMNSBeJtHFCME0Jk3n8914xjnusz6S0RSKxkvSDh400HwEgZgx5PxNqaAPk
	 f4cl7dTVkN1hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD794CF258E;
	Sun, 13 Oct 2024 11:54:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition
 for Windows Dev Kit 2023
Date: Sun, 13 Oct 2024 13:54:02 +0200
Message-Id: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANq0C2cC/42OwW7CMBBEfwX5zFb2xiZJT/2PqofNZk0MASM7R
 FCUf6+TeyWOb6R5My+VJQXJ6nP3UknmkEO8Fqj2O8UDXY8CoS+sUKPVLWo4HaEbic8p8hl8THC
 /5SkJXaDmmphQS1OhKv1bEh8em/v7p/AQ8hTTc5uazZoq551tajEg1jVgqSIgrxHYoTjNZNqD/
 Ypjn3mIccxxvE/lX/7owq9alTNumjfOzQga2s6jNx2a1vC/2mVZ/gDq4iDyFgEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728820456; l=3562;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Wcbai3eP4t7HsGJkcTs4+ts9jqbaaBjX3tZjlISALD8=;
 b=hZ1fbPoax5FVB+iw4GuIDcvWjGOqGQxpuWmmEmoYGTEG/3ae9v+4mi3LAju/QVOR9Hx3qr9GY
 uarbXX4xAj6B7KVOdyMLsOyrjc/96n8YKqSMp6/yed7j3ZwS6E3Jjig
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

"Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"

Device tree for the Microsoft Windows Dev Kit 2023. This work
is based on the initial work of Merck Hung <merckhung@gmail.com>.

The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Supported features:
- USB type-c and type-a ports
- minidp connector
- built-in r8152 Ethernet adapter
- PCIe devices
- nvme
- ath11k WiFi (WCN6855)
- WCN6855 Bluetooth
- A690 GPU
- Venus codec
- ADSP and CDSP
- GPIO keys
- Audio definition (works via USB)

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Merck Hung <merckhung@gmail.com>

Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts

This dt is more or less deducted from the Thinkpad X13s.
It contains a lot of guesswork, and also a lot of research on
what works with the Windows Dev Kit.

The WiFi definition references qcom,ath11k-calibration-variant = "volterra"
which is unfortunately not yet in the linux-firmware. You can leave it out,
and the ath11k driver finds the default one for 
"bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
which is quite sub-optimal. I have placed a pr on github/qca-swiss-army-knife:
https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended 
board-2.bin and a board-2.json to generate it. 

pcie2 (nvme) is intentionally specified as max-link-speed = <16>. The 
interface is capable of it, most current nvme ssds are capable of it, 
but the physical slot isn't. This leads to a silent downgrade to <8> instead 
of the "device is limited by bus, capable of..." message.

It is in use and under development since May 2023, pretty stable now.

---
Changes in v3:
- tried to heed all advice and comments given - thank you
- re-ordered patches to definition before use
- added "microsoft,blackrock" as compatible in QSEECOM driver
- removed the qseecom node
- ordered nodes alphabetically {address, node name, label}
- amended indentation
- consistently used blackrock as identifier / directory name
- sorted identifiers by the same order for multiple instances
- added some explanation re WiFi
- added definition for PMU on the WCN6855
- added some explanation for pcie2 max-link-speed
- Link to v2: https://lore.kernel.org/r/20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz

Changes in v2:
- removed whitespaces and breaks
- added compatibility binding
- added feature list
- reformatted Signed-off list
- Link to v1: https://lore.kernel.org/r/5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
      firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023
      arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1397 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1400 insertions(+)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



