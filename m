Return-Path: <linux-arm-msm+bounces-24764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B591D671
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 05:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABE51C2104D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 03:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1329EEC8;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jY45DYKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CCFB674;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719803133; cv=none; b=n+BBRG2v0SX9ZHTyesCKy3dkOpdnO1TnhJ9LrpVEcgk5NJoTqZs7KSe1pi1X6jBR6vsOU0t8tiMpT0ASp+HzYGKxgwM3HKUvQnFdEFytXIchZkbnKS7BLwYImRY8saGPEOyrWEX9CCrZsAncwTLzNOL2ts0ew/jfEgSbKSD2kVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719803133; c=relaxed/simple;
	bh=enfSla1oEQ5uMl5/ygYkJVshNSyPP2rR4pO+6RkqLcI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YvSD2QN6lKzAFh7Or1DpPqjdxpMoBGC8/oTOkB9mWNIA7wIB3mDcngFeCMS5V170l5QhAZY13jWUuVrevX5nuioVfvbCO38DyVKNezAhW2+QJZSG1XP1tk/mM2pLZ2O+0pDZzhbwbq/aK4CvYPYzr52U3FJeM1JBm+cq/b2RbuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jY45DYKz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F3D7C2BD10;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719803133;
	bh=enfSla1oEQ5uMl5/ygYkJVshNSyPP2rR4pO+6RkqLcI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jY45DYKzsEwcV4crDySIyXA3uISzC+msrRDNrXAXQ4dP6EwdfhuIoX4XkSetS2svN
	 FE59l+DFn2YLaR0njP4LhyPMEzDcFEJW0RALLTVmlK22YscbgQI/BUwcD63YnEivg1
	 EhdYqIXCHsOVE/B96vMEa8DZnu9iPnZLka+R9POoKjGqHvlNN65xrZ7StX7rncZQ+6
	 SsPGUV5YCuaWDjeR71CTAoP8TkMLw9u9/3+KUE/1EgUkABEa7rr7ol1+8Xf63TOhsm
	 /1M3+jj17YSxXCwmlcws4mIWYLcPZN4nSVDoc68M2gD/uiTii46dioTJDazWM6skJU
	 S2oZg39CnE7VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A0CC3064D;
	Mon,  1 Jul 2024 03:05:33 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] Introduce ASUS Vivobook S 15
Date: Mon, 01 Jul 2024 11:05:16 +0800
Message-Id: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwcgmYC/4WOyw7CIBBFf6VhLaY8ysOV/2FcAKXtRC0GlGia/
 ru0qy6MLs8k59yZUPIRfEKHakLRZ0gQxgJ8VyE3mLH3GNrCiNaU14IqbNIz4Qw52BAuOJEGS2q
 4lkowIhQq3j36Dl5r83QuPEB6hPheJzJZrr9qmeAaU0M8bySxythjfzNw3btwW+L/TE2dZbpjH
 RFiYy5/ZLbZZvW3AisF67x0hrdaKLYtzPP8ARiLYpMuAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719803130; l=2291;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=enfSla1oEQ5uMl5/ygYkJVshNSyPP2rR4pO+6RkqLcI=;
 b=KxiQVibuq5ekY1Uhfv4SMptiObIIoABq8c89kLJc8fRTFADUafvvbC2wUh459QmITm61qVFI1
 +lFO+a1aeAQCaOQrvczgTwXQO4JR6cFV2rbKgDGyWOQpQ5pc0pTDStU
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
Reply-To: wuxilin123@gmail.com

ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
SoC (X1E78100). This series adds initial support for the device.

Currently working features:

- CPU frequency scaling up to 3.4GHz
- NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
- Keyboard and touchpad
- WCN7850 Wi-Fi
- Two Type-C ports on the left side
- internal eDP display
- ADSP and CDSP remoteprocs

Some features which can get working with out of tree patches:

- GPU [1]
- Bluetooth [2]

Notably not working features:

- Battery monitoring via battmgr
- Orientation switching and altmode on the Type-C ports (USB4 retimer driver needed?)
- Two USB Type-A ports on the right side (dwc3 multiport controller)
- Front camera
- SD card slot
- HDMI connector (using a Parade PS186 DP 1.4 to HDMI 2.0 converter) 
- USB4 and the retimer (Parade PS8830?)
- Anything using the EC

Dump of the ACPI tables could be found here: [3]

[1] https://lore.kernel.org/all/20240623110753.141400-1-quic_akhilpo@quicinc.com/
[2] https://git.codelinaro.org/abel.vesa/linux/-/commits/topic/b4/x1e80100-bt
[3] https://github.com/aarch64-laptops/build/pull/103

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
Changes in v4:
- Fix usb hsphy vdd-supply (Abel)
- Link to v3: https://lore.kernel.org/r/20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com

Changes in v3:
- Add comment detailing pmic-glink connector mapping (Konrad)
- Minor changes in dts (Konrad)
- Link to v2: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com

Changes in v2:
- Fix accidentally changed Makefile
- Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com

---
Xilin Wu (2):
      dt-bindings: arm: qcom: Add ASUS Vivobook S 15
      arm64: dts: qcom: Add device tree for ASUS Vivobook S 15

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 616 +++++++++++++++++++++
 3 files changed, 618 insertions(+)
---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-asus-vivobook-s15-72a497863168

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>



