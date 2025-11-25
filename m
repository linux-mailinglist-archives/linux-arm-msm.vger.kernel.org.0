Return-Path: <linux-arm-msm+bounces-83288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68DC86302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6AB3AD85F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00FA277C9A;
	Tue, 25 Nov 2025 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="dqjErjAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com [220.197.32.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BD24A046;
	Tue, 25 Nov 2025 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764091416; cv=none; b=IGExnLoM46JopdKkIH/b/dZPr/d6gQX15gc/sX4i9vB1A6SatNMR2qIDSs7EzyySL2foSFhWoIRAYZCq2n2FdKYMEG2TX/FVNQfAI7z5511PZ1Er7reAb2m6tqwrS+lVmh46RYTgyND6aaa5AnMqGZwgSMZ6JHJYRs2AqAwZQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764091416; c=relaxed/simple;
	bh=Ip/2xDhgrWj8Eeyz8/jCVB5XTc0M/040teQKmyiHFWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rohXi4UF6WS/4HFxWoC+qqNRUQ95jdjb1zx4xzSlM8zE1aeRmqAoXJAyxsEKLNkCyX23Lv99YY28vmFH0MOgFmH4eNxTGsLI/Z5UWgNag0kzlWFQwcC8fyhg+X0k0mqLVKounTX+49QISEP3DRjDSg6mzLo4ZqVCApVMvpTYmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=dqjErjAb; arc=none smtp.client-ip=220.197.32.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [116.3.204.103])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2adbd1579;
	Wed, 26 Nov 2025 00:07:48 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v7 0/2] arm64: dts: qcom: Add qcs6490-rubikpi3 board dts
Date: Wed, 26 Nov 2025 00:07:01 +0800
Message-Id: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACXUJWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNT3aLSpMzsgkzdvNSKEl24qGGaUVqSsVmKhaWhuRJQb0FRalpmBdj
 c6NjaWgCs5OUkZwAAAA==
X-Change-ID: 20251125-rubikpi-next-20251125-1f2fb36d8917
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764086868; l=2995;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=Ip/2xDhgrWj8Eeyz8/jCVB5XTc0M/040teQKmyiHFWo=;
 b=Re3dK6PcMGYp2SKIg6w+3Eux55vebvjGqaIFyRWRSwMV8Epxfb/KMyxQuMsIC/lwW3vQYfSXp
 MqPNz8xHN1vDdFkzXtTlG3Snrak1oPhPmT2HZKArfpSFoLK3Bpk6A1w
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9abbc567e209d5kunmc9d8d2b544210f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGU1NVkxOTB9LS0wdQhgdTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk1VSFVJS09VSktIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=dqjErjAbtzvmHQJaWn1o15gDJT8GacdEbyjcCrFjHFhZd7OnRfkiOYH8n6HnWIWoa23wXfUEFi/deasqLaggwVT1n9AOFgsgtKqKONjW/7yMmMA1AmkHDxUwNyWjWPs74ggkAyeLRui8Ih1mHeVM2dVfscVwK9FhgfwejMJEEQo=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=DCQ0iKJmmLsbNGJ2rpclKIvZmN7kU7/3TMFLVSVOM3A=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 (https://rubikpi.ai/), a lightweight development board based on
Qualcomm Dragonwing™ QCS6490 platform, is the first Pi built on Qualcomm
AI platforms for developers.

This commit enables the following features:
    Works:
    - Bluetooth (AP6256)
    - Wi-Fi (AP6256)
    - Ethernet (AX88179B connected to UPD720201)
    - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
    - USB Type-A 2.0 port
    - USB Type-C
    - M.2 M-Key 2280 PCIe 3.0
    - FAN
    - RTC
    - 40PIN: I2C x1, UART x1

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v7:
- Revert the changes made to PCIe1 in version V6.
- Change the ADSP firmware path to `qcom/qcs6490/Thundercomm/RubikPi3/adsp.mbn`.
- Link to v6: https://lore.kernel.org/all/20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com/

Changes in v6:
- Fix device tree formatting issues.
- Add firmware-name to QUPv3 nodes.
- An "Internal error: synchronous external abort" error occurred while
  executing the `qcom_pcie_clear_hpc` function in the PCIe1 RC. The following
  changes were rolled back(overriding the configuration in `kodiak.dtsi`):
  03e928442d46 arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
- Replace the three monochrome LEDs with multicolor LEDs.
- The drive-strength value of the pins is modified uniformly.
- Link to v5: https://lore.kernel.org/linux-arm-msm/20251025122724.633766-1-hongyang.zhao@thundersoft.com/

Changes in v5:
- Fix device tree formatting issues.
- Add fan control that follows CPU0 temperature.
- Link to v4: https://lore.kernel.org/linux-arm-msm/20250930043258.249641-1-hongyang.zhao@thundersoft.com/

Changes in v4:
- Enable PCIe0 node.
- Added AX88179B Ethernet and UPD720201 USBHUB power control.
- Delete the nodes and attributes defined in sc7280.dtsi.
- Modify qcom.yaml to add binding for the Thundercomm RUBIK Pi 3 board.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20250924161120.27051-1-hongyang.zhao@thundersoft.com/

Changes in v3:
- Rebase on linux-next/master.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20250924121541.128582-1-hongyang.zhao@thundersoft.com/

Changes in v2:
- Fix problems found when running device tree check.
- Enable USB2.0 interface.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/
---

---
Hongyang Zhao (2):
      dt-bindings: arm: qcom: Add Thundercomm RUBIK Pi 3
      arm64: dts: qcom: Add qcs6490-rubikpi3 board dts

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1410 ++++++++++++++++++++
 3 files changed, 1412 insertions(+)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-rubikpi-next-20251125-1f2fb36d8917

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


