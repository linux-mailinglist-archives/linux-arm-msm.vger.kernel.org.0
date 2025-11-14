Return-Path: <linux-arm-msm+bounces-81906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93170C5EA6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15A9A35D45D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC5B29D29A;
	Fri, 14 Nov 2025 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="h6soV9a0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m12888.netease.com (mail-m12888.netease.com [103.209.128.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D0529A30A;
	Fri, 14 Nov 2025 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138987; cv=none; b=b5143fHoWSC1/5F7r0GoBsKdbQkphd4B1WP9L9+Pq/g2HU+RG8962y1QXzJel74Do5hTvOl6+9g4wPHKBsRPP+Av6k5vqVcQoKDNgcgM4RulPI9TqIBVg9SiJYTVVB12Akf52YlyV4FuRj8SVreUUeBiKFOQ7YXTMFnammDbKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138987; c=relaxed/simple;
	bh=oIEQGUgyXycvV3HP3slmH80PnajMAqU2M28dmi/A7QE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e8LIZINYVqc5YEwJYZXRR1V3qnF/x2LR/RUaCjr7iEPSUJK2m+NscqicJgcbKNAT/XWyp5pSww7W2CC8kUudhTa284Sll0mHJC6X1ObhJDkzA43owUrwaQaHgVuD2FNzSAbm6Wb4nrdENeD33AglixtGHXMxpBK+WIc8gw/G7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=h6soV9a0; arc=none smtp.client-ip=103.209.128.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [116.3.204.103])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29a2e31ff;
	Sat, 15 Nov 2025 00:34:22 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board
 dts
Date: Sat, 15 Nov 2025 00:34:14 +0800
Message-Id: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAdaF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3aLSpMzsgkzdvNSKEl24aFJKspFxcpqhWWqKmRJQb0FRalpmBdj
 c6NjaWgDxnFnjZwAAAA==
X-Change-ID: 20251114-rubikpi-next-20251114-bdc23cf16ed6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763138062; l=2760;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=oIEQGUgyXycvV3HP3slmH80PnajMAqU2M28dmi/A7QE=;
 b=mzFyRZ4k7V3/HUi+NpLn/zfnKJVwMWCpLOCH8F7EDXL2mERNAqbktplckjrBKUTYcJYDGcy++
 jRHMybYly9AC0wSRftXNc4u/eEx08AYuJVozJVuLcxVHZncnl551Z1o
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9a8337c7c409d5kunm846241b3342e43
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEtLVk5MQxlIShgdGEMfH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk1VSFVJS09VSktIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=h6soV9a0WbYfr1V6bGhjEYZ38MAHRYyYm8iiq90vJOCFVTHFoakiW+PFd/qZo/e5eygThCSeExvSkqFvnhe3yDLUnaieVyafyV9OsreTpD/t8z1nw+T0tgW892Q53749nmGmhPUy4PLZ+4fF6HkifOPcn//sBye0nDOqEAFgQWc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vBPvvE6UYPc6oVt08inWdVoqSMDQvbjiUhzYZFepY/M=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 (https://rubikpi.ai/), a lightweight development board based on
Qualcomm Dragonwing™ QCS6490 platform, is the first Pi built on Qualcomm
AI platforms for developers.

This commit enables the following features:
    Works:
    - Bluetooth (AP6256)
    - Wi-Fi (AP6256)
    - Ethernet (AX88179B connected to UPD720201)
    - FAN
    - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
    - M.2 M-Key 2280 PCIe 3.0
    - RTC
    - USB Type-C
    - USB Type-A 2.0 port
    - 40PIN: I2C x1, UART x1

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
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
      arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
      dt-bindings: arm: qcom: rubikpi3: document rubikpi3 board binding

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 ++++++++++++++++++++
 3 files changed, 1417 insertions(+)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-rubikpi-next-20251114-bdc23cf16ed6

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


