Return-Path: <linux-arm-msm+bounces-36076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5913D9B1DBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 14:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A8E2281B3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 13:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1C3155A2F;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuvQZBkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9E762D2;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034141; cv=none; b=l7FvjUvVxa/f/9IYHvEpeQ8HT4umRl/jhao+HwE3ERUdWymj9okcVeYGylEeqhTpD0y5vsdWZOy8w5tMpu/XwxQpTzlY9dWoxzVBtue6jQFIc4wY0Dex8KzKqw9GlBrZthS/eZhHZAiyEOyRkNwPV5W3ENeLefbRbQDRmWKQ2vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034141; c=relaxed/simple;
	bh=2rkjcFwK0Py1jv662REF1gLRHu3ZVW1+5EOnFztegdA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cm0pYirSVunHmuyirREpPAW+alB/nDB6SzH+1GUsEWXtPcnIFxBM2wlPUah3/ciltCFJHiggkgbPYicdGV1QfrQfyQ30N//B7/CBVTU2W1eE0m+2wer8l8dMpBz7YMsMEubn6gJAD87V+q9fmsJSRbA0BGQCXRVhKLVbf/po5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuvQZBkH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12CBAC4CEC3;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730034141;
	bh=2rkjcFwK0Py1jv662REF1gLRHu3ZVW1+5EOnFztegdA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XuvQZBkH8NtfeLwHEG04eUIvH9v9XMQJ92exEt/PAld+dHAleHvKf/qyIDx7YDSpx
	 sNO7sDaHypLzGAIL1wUFK+1fltpKuKzV0IKcnzYfsVNyJHqtRzMGOw5hdCXd4gmv9b
	 uqlUl4wikNiUpgB7AsyUEwYV5DEsOcE1AmBIbCpDWfWY4d/klBf6CHJuqfd0gqET+V
	 wbXh3vpG7A7eJkOutCdXLkSRef/Flbsp2uM+15459+a+d4BNkCPF13mchW3VEkV+hT
	 axnpO9Pm7Oa+B0ZFOgKPojDiIVcyGTiQaRGS6TxAqqljqsZaMUaKp9fBpzwJF2EwDw
	 TPh41wzkDCWAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CD9D1171B;
	Sun, 27 Oct 2024 13:02:20 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt definition
 for Windows Dev Kit 2023
Date: Sun, 27 Oct 2024 14:02:15 +0100
Message-Id: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANc5HmcC/43OQW7DIBAF0KtErDsVDFBDV71HlcUYDzGNGyJwr
 LSR717iRXeNuvwjzfv/JiqXxFW87m6i8JJqyqcWzNNOhJFOB4Y0tCxQopEeJXwcoJ8oHEsOR4i
 5wOVc58L0CV3oKBBKdhpF+z8Xjum62e/7lsdU51y+tqpF3a/CRmtcxwrYWAeGNAFFiRAsspWBl
 H8xb3kaahhznmqeLnPbV5/79C3u5IIb849xC4IE30eMqkflVXjI6l9WSaUfsbqxTvtBG6fJcfc
 nu67rD49PNNhtAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730034139; l=3963;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=2rkjcFwK0Py1jv662REF1gLRHu3ZVW1+5EOnFztegdA=;
 b=0XeGeiyNBlb9dEK8wgisG4nlvq5mHqFL4ylLMud6YBtllUOO1Z0yKn3yllvx7ri6+zqSdSKQD
 keq3TI0bYO+DL+UPOUuwMN2Ma41TMBan4kXhAnKTHYKMqLpTnOGjfrT
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
Changes in v4:
- removed the redundant regulator definitions
- changed the pinctrl property order
- use microsoft instead of MICROSOFT as subdirectory and device name component
- amend spacing in audio nodes
- change external connector dp1 for mini-dp to DP-3 for consistency
- Link to v3: https://lore.kernel.org/r/20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz

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
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1383 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1386 insertions(+)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



