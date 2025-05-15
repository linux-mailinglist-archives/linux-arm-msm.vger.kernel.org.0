Return-Path: <linux-arm-msm+bounces-58145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B1AB90DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908A8A05505
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3D829B785;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq8yg5zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB862868B8;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341544; cv=none; b=WMRxPsB0b6zfLcSiUm3mczvlwL0muVrddwbe4fh5QTge1E5hPhZ2Vx1A+JoFXec0KbfFgmICiT/qdjbh24+EThhpInieMNMF/gy+vb9HMOXm12BySz25bTbr6O+5InBdhsvc0sUlvTotxdc1x4xJGDW2kGvR8uX6WA0JmKb1QBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341544; c=relaxed/simple;
	bh=0QBcmZ0wC7RDVtQZp8NKM02wZRMB5QN8hObcMC0OIF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HMAHL4+Xypb7GkKMJVRc4MdRy5vbN8Yr7qVOZ3k46RytdFfzsR8+MbbStMySCQKTj9LljXsezFJH1C6E51a1+DWadHstNra7N0n639LkiD1w/RXGkVIGu0EymSIn3f5IOP8QPLTVMBSQSC67l/g0Q6KC6yw/sJ/QJ5laLci8kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq8yg5zW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBE81C4CEE7;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747341543;
	bh=0QBcmZ0wC7RDVtQZp8NKM02wZRMB5QN8hObcMC0OIF8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Oq8yg5zWcD/QL9UVLT1Q/SiJHEV24fz8rimeDU+iPQW6ExuJkJpKq1+EZ7wxq3CpR
	 2IAxqfT567N8EvQzXQJojP1VSyYhfz/UJ1ItTJDkeLPC6DZKoPLbPeIhzjFJfo1j/p
	 Nz4t0mZ2y6LM56yJsx1kWGxrmV70FPeS2IrV3j478k+v8wIOxHnBciKFiEuMvve38q
	 y7YLUC2fppNwUwAhXEMLnhdYuza+zIc9o1O8vE4WcKQh3J/s8chE+kzDROiJExhhM6
	 jmkcqzh5e3j1LN2uESX8cVgjHM3+8okC8jTVO3aEgJNsnWEYjBvWQA8nU9hGixLdEo
	 DXghu4VTZye8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74F3C2D0CD;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/4] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: dt
 definition for Thinkbook 16
Date: Thu, 15 May 2025 22:38:54 +0200
Message-Id: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5QJmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0ND3ZIkQzPdlBLdVAuTZBNj4xQL8yRDJaDqgqLUtMwKsEnRsbW1ACk
 vhLtZAAAA
X-Change-ID: 20250511-tb16-dt-e84c433d87b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747341542; l=3438;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=0QBcmZ0wC7RDVtQZp8NKM02wZRMB5QN8hObcMC0OIF8=;
 b=Kqz7IEXkK/WWWXjx2z8vOWnf7jPhaam2wwa6g7OwSuFTNqpDSN9zzZAge9aA9Tb8SEObQqZvk
 FlziGZd5NlcAwTKd7o8LOwUyeWeP1F+AlUWHZqxMS5g4Dwo7Rwc1Pl4
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

Device tree for the Lenovo Thinkbook 16 G7 QOY

The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

Supported features:

- USB type-c and type-a ports
- Keyboard
- Touchpad (all that are described in the dsdt)
- Touchscreen (described in the dsdt, no known SKUss)
- Display including PWM backlight control
- PCIe devices
- nvme
- SDHC card reader
- ath12k WCN7850 Wifi and Bluetooth
- ADSP and CDSP
- GPIO keys (Lid switch)
- Sound via internal speakers / DMIC / USB / headphone jack
- DP Altmode with 2 lanes (as all of these still do)
- Integrated fingerprint reader (FPC)
- Integrated UVC camera

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not the faster ones.

- The Purwa SoC has 8 compute cores and a different GPU (X1-45, apparently A730).
The GPU is not yet supported. Graphics is only software rendered.
The SoC has 2 instead of 3 thermal sensor banks. I have disabled all sensors on
the 3rd bank to get rid of dmesg errors. Many of these sensor nodes have a place
on the remaining 2 banks, but I don't know which. So the thermal management is
clearly incomplete, but the firmware monitoring the chip does a power off before
overheating (not experienced yet). For the Thinkbook, it has a pretty decent fan
that can develop some air flow, so maybe this has prevented the emergency cutoff.
As a result of these unknowns, I had to modify x1e80100.dtsi and x1p42100.dtsi to
delete the non-existend nodes.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

I have brought up the Thinkbook over the last 4 months since the x1p42100-crd 
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform. GPU support would be nice, though :) 

Big thanks to Alexandrs Vinarkis for helping (and sort of persisting) on the 
fingerprint, camera and HDMI issues. 

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add Lenovo Thinkbook 16
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: x1p42100: add Lenovo ThinkBook 16 G7 QOY
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: dt definition for Thinkbook 16

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   30 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1654 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   16 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1691 insertions(+), 15 deletions(-)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250511-tb16-dt-e84c433d87b1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



