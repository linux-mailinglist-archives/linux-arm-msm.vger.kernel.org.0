Return-Path: <linux-arm-msm+bounces-74611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB024B9A7B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0B116A261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227B830BB81;
	Wed, 24 Sep 2025 15:07:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F5B30B52F;
	Wed, 24 Sep 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726477; cv=none; b=I+kOFBvL1B7y3WH396w24lQgSUmBtjpHZYxpu+aguZjLwn4rbCfzdM+tZRcJ/0VZiWZ7nkvjLRmzXlsafX5K73DMBWuDkj67IPbkZiTsef5F86Tp4uRbxAz5GpQ2VkrVuwi+EXZ8fI2SwQ2gJCHdqa9sztxpyQqjFbFlHju/lA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726477; c=relaxed/simple;
	bh=rob6VsaRffSuHjXv2ajeCCuyHX/yLfcYRsNA104LtwA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aZMPY+nj3yJg4ej9imNoe+U0LptgUK7P3wF/QVNMQmpPONgCGNLjebzZROf0pnsNGJqRepaUYqTla2k+Ye4htTNlVg0nyJwLWrq303FqTu1zv5ZEOGy4DrrJ3XKzD5vI68Gj3G9S6MRcDhPicu4+tq9Q+3r7j2m6v5++3nVQi+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1758726439tdc4d5328
X-QQ-Originating-IP: qc4X8a09ZeggEiYvjiUodEC60JVCK2k4cLDi4JCKAJs=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Sep 2025 23:07:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2614494011913514824
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Date: Wed, 24 Sep 2025 23:07:08 +0800
Message-Id: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwJ1GgC/33NTQ6CMBAF4KuYrq2Blr+68h7GRdsZoAuptNhgC
 He34EISicv3MvO9iXh0Bj05HybiMBhvbBdDdjwQ3cquQWogZsISliciZdRJGCUFJxvb0b6QFBE
 0oKw5FgWJbw+HtRlX8nr7ZIf9M8rDt2yNH6x7rbMhXdo/CyGlCa20BlULDalQl/XkpO2dLFhgW
 yDbAVgEkiyvSxRMcfUD8C2Q7wA8ArLQnIGoKoRyC8zz/AZ9e4CDRwEAAA==
X-Change-ID: 20250912-radxa-dragon-q6a-eedcdeaf3e66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726438; l=2793;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=rob6VsaRffSuHjXv2ajeCCuyHX/yLfcYRsNA104LtwA=;
 b=Bh8h5ZifNTM/HK0RYE6g8o6kmJBFLfNTGWk/YZAu0i9HT8noN5jLV+SSiv3ctWMb9dI6gC0WC
 nlJgzuE812/AjKJVK2A2t36AhMc4UqCtxyfPkvgd6msr24MagYnuB7N
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Ocq2PBofhnLIGUYNqXDdebUqpeotqdzkvWar/Ss9F1DHHC8DSQh9p5u9
	vIBKRQA6Pqd5rne4fJthqxjAnHJ48uAZnLh/zHADk7U4RTMWrKLuj82rc0/duL+x9MaAjqc
	SZGBNoa5BuL9y3Ib58epYuaOC0WBz0AqGHXZpzyMb0opmDeJEuGSdBkyTmusx7ZmuKY7l2N
	JMHHzibuqD3PcpWbKOX7b/9Rbn2qT+d/iq+MM01pd7Z518Wbm0VIpdJo7wZIsnNUVs+bsn0
	uQg/0WsD21aLI3Qf/Yak+FNxmTFOgOrzi6tWwksmjBMBVXpgGF3cyuRwBZtl9xdSgwnRwFL
	gM30EjB1foduKBq9y2BVr1SyviTmDGDb2NGofdzqXLGW5XFjChi0G/lubaIrxFi3AhbEZRb
	B9A5LfzzmtvJ0o0jsEdYEeLPtCR5KJXrZEXzrLHWw54iOz+wC3Zaz8ivXZjKXwrYoDNmKdv
	ZDUP3eZw1T0Y6Jh28KI6yxc+rxSloYTpy3gM04quFSDb0aTlAjWWNr1wtgBO4l78V0S78WU
	62dnAiX0pmoN8baeAF84nHsIk/ycyAL/nkWvKYflJkDxXTlxxv+JsXaQcoWu7ROH9oHgaC9
	7GmEuT05MzEJv3AmazkpGyH3IH3TqyLrOeaXabcnx2+dcBrHMhIvKnnOTIFdXCP+cbBrOch
	jaC/kn/dHUXn9K9fVq7OSLpJKkG4h6iAqlgXRlTi7Xn44SAISULyjNfsPM48bFEUK8nYrua
	xqhe9q0jeN7s/mIF4CQfuXrurraCwRWPghbug7SHU9geTQtyKI9OfZkN91WoSk2TJ93jw+0
	W6cr25L093TtFrnzbmn+eCMkeGw/8c65HQSsj48ybjk8V68PpnwcygE6TBwgwwKUh60FA2+
	slrleLxSs7zyigwIkaIqoGQCXQAg8yePoFXVLZtzXS4YfDbsMGZEjkA3Uz41Ye5m4T9YAjJ
	Dc9Lj5AiMFAeN7tS3foYpexOLEWN4VqqzmT2K9WjyxlhE4YVikaSw3/LzqWmdeDTmN0o6lw
	7nlEYmjCU+9M369PnI9Q2sFqx3DErAnHlnwJ0wBg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
computer, based on the Qualcomm QCS6490 platform.

The board ships with a modified version of the Qualcomm Linux boot
firmware, which is stored on the onboard SPI NOR flash. This allows
booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
supports replaceable UFS 3.1/eMMC modules for easy user upgrades.

The board schematic is available at [1].

Features enabled and working:

- Configurable I2C/SPI/UART from 40-Pin GPIO
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

ALSA UCM and Audioreach topology patches are available at [2] and [3].

[1]: https://docs.radxa.com/en/dragon/q6a/download
[2]: https://github.com/alsa-project/alsa-ucm-conf/pull/601
[3]: https://github.com/linux-msm/audioreach-topology/pull/24

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v4:
- Change CDSP firmware to use the existing one from linux-firmware
- Describe onboard USB 2.0 hub and ports
- Add configurable I2C/SPI/UART QUP controllers
- Link to v3: https://lore.kernel.org/r/20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com

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

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1107 ++++++++++++++++++++
 3 files changed, 1109 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


