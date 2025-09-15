Return-Path: <linux-arm-msm+bounces-73472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F856B56DE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 03:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF4D3BC053
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 01:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017E41F5619;
	Mon, 15 Sep 2025 01:32:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A91EFF93;
	Mon, 15 Sep 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757899951; cv=none; b=TQrGLvsUhKwEgu5aZ64KRzh2jHVoEDAM0ANnPCUGVhIIcXHneEOr0kIt3jklk1W2gzTudfkOH7CtNjJyVqwn/Reh6orWtYAvI0zEHfw0BN3Bo0jRzR7aC66f3b37ZBi0uVTZyTSUanQJbqPAi2nHxNvbHmonZ9zZhTMp3TYsL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757899951; c=relaxed/simple;
	bh=lvidUG8xIovgF0d9LL8ZGFo3gqiaBXkWU7d2hEVgmWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ku4dd5+TFYICGHOd6hN/SP6rqMlbmoBBGNZaFNGjrLgqrr2rCpAaTZMA/V4KveJM6M5Fmq8Lbxzpu05ltGIHc2Mp/veWHdfsfD5VkX2t6BfixXUWWy/MjoonrCFVJ+GW5hyW6BMvM1GRJJrZHLr8SIewsBb/NisMraxEY0NOMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1757899916t913f9665
X-QQ-Originating-IP: nwHaNI02pSptv4Q6eLKA36+y5Qu+HXeiH9HlF4VQjy0=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 09:31:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 91257603119882613
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Date: Mon, 15 Sep 2025 09:31:42 +0800
Message-Id: <20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5sx2gC/33Nyw7CIBAF0F8xrB0D9KG48j+MCx5Dy8JioZKap
 v8urQs1MS7vzcy5E4kYHEZy3EwkYHLR+S6HYrshupVdg+BMzoRTXlHBOARpRgkmyMZ30NcSEI0
 2KG2BdU3y2y2gdeNKni+vHLC/Z3l4l62Lgw+PdTaxpf2zkBhQOGhtlBXaMKFO68lO+ytZsMQ/g
 fIHwDNAy8ruUXBVqC9gnucnx8a+LQYBAAA=
X-Change-ID: 20250912-radxa-dragon-q6a-eedcdeaf3e66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757899915; l=2518;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=lvidUG8xIovgF0d9LL8ZGFo3gqiaBXkWU7d2hEVgmWA=;
 b=OaDpMfL/+Vt2/InKa2csPxEbthr2d5zTkIgppa9rr6Ak2th4LKTAYoPOYdTyzPTQzTDRhj6vR
 3kP6qYRoLp2BR2DMG7R7FKmIlY0tsjPfaouOWHWEjM7e0gSJS0q8m/G
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MRY6qckr/MVJ4juorSvkG3OkTLwmBHBchSM3BWj3TN9zyl1+WX/a070e
	9R/ba0RvubFpFfY7d+pwFNIKHD7NcPLpNh6OpR3vB3ZUAqr5aoIu18J467NSyLesO97Q2/A
	CU+lUIZo28nVqLYoUBtlbWmImNC85XK0KVcXaI0qbArA1w/qcN88g0ELFGPi+TKzrfqwcyZ
	zR+Qy0xNDCa0kldebPoyBNnG3TNJ05aOIjiUm9hxfRP5C8OGTLsl/l0875B+SWmYN5m7dqH
	uoSG3+U7N9xYIqJO7KqY95EinSt3xbHl7S01ZnzKBybur2kanDT+gIdNNIksxQ/S6cjLImE
	eb4/8nZJFFnWyyTP7V5dMm4LunAOoLnsc+rH0RCi10hPedPVJ4XaYIb2qyKpyeTrYYRA0x2
	pay+/K3Wf6jvVFsArq6iwhFIiQkcPvKiAlO7Vcqm4+FLlDaN00MhN+xzjFU8+rankzwsbs+
	uagldJ0pGujc+jnfCSXTv2df9Z71mJJzfSQg19/HEiJ11Xq34ZJc7UqivyWrpi2AG6CrDaX
	xmrRui2vo2OtAM+D6G3jjZ66jpmwI+kMcOC2dnLukbEOWCWBwWjo5w7RV6kLY26ArxqiP+8
	+9o5Gvxrvc/0aOTp+iXiWXr7SCCOTKFm3MlEqaxPk0FQWQ4J9fgy7t9eODD5HY6XYWLlpSz
	+UsX4Y8RSqglvVo0L0Ru0r3a87AC2PGpXb7lA/fywnMoWYvICEU6ZEU+Yz695O4GtGD2Et1
	UUeRbrp2q1wTZ6s3NfAUNeSg5+rwiiATnfZPDopFOJDJZcOLI8uGfeMHsNU/zuJSXeYK32M
	XCx+Mrz8s4Xr7BTwnRSibZbM+MS/K1XH9vG7CzY3ltUy8IwOZLAfhYDLN0vvX+/uX+eAiHX
	y9mYBkzUfhYCbih9/irYDBoGlyhS9ukCLT1hAzhiRX0et8gZVTVQnxTlwHIoEPiuYvuAsPv
	tomLNfr7uNdumtlgVWt/kDkfQrpgSeMShYb6MFUaU8f5CtwO4UedRiiqBonm+ZN3jcn7j5W
	MCWjDVIxuecm/jHVXh
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
computer, based on the Qualcomm QCS6490 platform.

The board ships with a modified version of the Qualcomm Linux boot
firmware, which is stored on the onboard SPI NOR flash. This allows
booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
supports replaceable UFS 3.1/eMMC modules for easy user upgrades.

The board schematic is available at [1].

Features enabled and working:

- Three USB-A 2.0 ports
- RTL8111K Ethernet connected to PCIe0
- eMMC module
- SD card
- M.2 M-Key 2230 PCIe 3.0 x2
- Headphone jack
- Onboard thermal sensors
- QSPI controller for updating boot firmware
- ADSP remoteproc (Type-C and charging features disabled in firmware)
- CDSP remoteproc (for AI applications using QNN)
- Venus video encode and decode accelerator

Features available with additional DT overlays:
- CSI cameras
- DSI display

Features that will be submitted separately once the required bindings are
merged:

- USB-A 3.0 port
- UFS 3.1 module
- HDMI 2.0 port including audio
- Configurable I2C/SPI/UART from 40-Pin GPIO

ALSA UCM and Audioreach topology patches are available at [2] and [3].

[1]: https://docs.radxa.com/en/dragon/q6a/download
[2]: https://github.com/alsa-project/alsa-ucm-conf/pull/601
[3]: https://github.com/linux-msm/audioreach-topology/pull/24

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v3:
- Dropped patches for USB/HDMI, UFS and GPIO.
- Removed Reviewed-by tag from the board DTS patch as it was significantly
  modified.
- Link to v2: https://lore.kernel.org/r/20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com

Changes in v2:
- Move codec before cpu in sound node to get sorted.
- Drop patch dependencies in cover letter
- Separate the changes that have unmet dependencies, and mark them as DNM
- Link to v1: https://lore.kernel.org/r/20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com

---
Xilin Wu (2):
      dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 961 +++++++++++++++++++++
 3 files changed, 963 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


