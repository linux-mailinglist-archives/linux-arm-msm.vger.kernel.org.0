Return-Path: <linux-arm-msm+bounces-73427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DEB56A53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 17:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59C7A3BDD3F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCF32DAFB1;
	Sun, 14 Sep 2025 15:57:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFD28C006;
	Sun, 14 Sep 2025 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757865448; cv=none; b=EOlE6QTRKWCoUxUv0Lxfj7g0AB6A+TPrQLfLG8+y7pFeSpr84LS/hAm+2mjnnyhQkPaxsgHSzLPHQY6EEQYmV59A5bWMP0wXafP8EYOd+4/yq2dnNMbPNnpdft382qIUqol1HvVHpVoAFY/GveaUbfkKy3gVGEJWamfaa5czQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757865448; c=relaxed/simple;
	bh=g+j9G1JMFQCaEoE45GeD1Bv7WIV+89CDkBoMBn+Pu+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aLakj2fp8dgWiNctlQCJ2ync/0+n11roT2c72GlwyL9m5NYWXATZ0ejAjrgNEoTBe/7XABHad+mCrOdGE3cno9ZsGjP0SI2elbEdmCzFT9p2ocdV+MOmoit7EhKlmGUXXUwX4EnQvg43+CygPuo9VSSVdFvDZD/Mz0UVnN4iFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757865428tf0424ebf
X-QQ-Originating-IP: LpRcLqKqEQW4gJd0Jj2vgVXF0NfCzSUTf3ehn9L04pI=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 14 Sep 2025 23:57:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16197753940588448195
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Date: Sun, 14 Sep 2025 23:57:03 +0800
Message-Id: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/lxmgC/32NTQ6CMBBGr0Jm7RhaIxFX3oOwKJ0pdCGVKRIM4
 e7WunDn8r18PxtEFs8RrsUGwouPPowJ9KEAO5ixZ/SUGHSpz2WtNIqh1SCJ6cOIU2WQmSyxcSe
 uKki1h7Dza55s2i8LT8+0PP/k4OMc5JVvF/Wxfx4WhSVerKXO1ZZU3d1y5GjDHdp9399d5WTMx
 QAAAA==
X-Change-ID: 20250912-radxa-dragon-q6a-eedcdeaf3e66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757865427; l=2489;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=g+j9G1JMFQCaEoE45GeD1Bv7WIV+89CDkBoMBn+Pu+8=;
 b=7zH0Wwjb3cig4yRvdk+es+6VSXRwI4Nntabwg8cndC6aAPDHUgzyyv2ZBGIetezr8UXoCL+Rf
 4mPRPiUilZjCAq6+8TkoH8KMcOf5V7y1+K/w2Ejl5HrYkiYfjppBK2C
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MSyoPQEuxKCu1bqJlXMgn8OI27+njOCZqOZsprdfGdF8I8H5Yo5yl/GQ
	VWGOgk0YfwHkSYk9hXzxbrdwVG72qEGsG9RJMP6wmAbVxpxJBxmHOuKIIYwj9eYyrXTWWm8
	poEaVnnqF5DKp2g3zL+y066AQLiJwXqSFFRJ8DR6xL4qyL5mZm5UaKJoxsPpSGRIN0reF3j
	xD0JPG6gK9Mvs+UVECR3fEBeQ5a7IJcO1Rydkc06MLxFZpN4M+I/46bWmfKTwpyfuV5fYpR
	pg4Mo0to1XZfV+SS836yXTCweOcYJb/GFgs3x1srw0lBMUtbbkqJwu9bwTqrOW3ZiGG6sHr
	gjrcMmcLDafnRaHgjYTDrK76llBRaCVhMOivURmXM9khm/99BENr6Q97gYpZYsK7P8PmVgt
	VYXQL09GtCr+KZqy4Qhzwa4kmGqp0yORDKUwYwuK4RZXKCg6XarXdfQy+56EjdK0aphcTLK
	zB2N8MYXQjgppKovuTUIBSff4tF4QSdfolnF3a4VD78s9qgEP/VJNBNyXcO1+Zbxl8W/6zB
	XbT0ztPitKBai27WZ7BAcx30Nd9YHxyHQN/x5Dougu/dRfkTiG7qeR4A5J/WtDE6N6AyHu7
	3SI7Mcnw53/ELWK3Mw6q7t8JkiMdsb/HcI22LDQFKlHjz7XAa2CR+i7v0Cu8WgA0pmkMphU
	1HKw5PO1RINOHUA9EysJk0H+TwtxUDladJP9RpOGmR9SzMzbM6/AmqR0xvCCU8Wf8qUUz3E
	w7CBVBPlkLeW3LXDsiQqnZxrOkgsCoxTqdkk4VAvuQBTStsRW7NNB9NnnhkKuOX7YNdyrs2
	uYPLlzmOysPNEWTnl5Q4bWHbMOfENtKh0yy48ta0aMyv55OEUdi1cX1ffoMQRiPefqEv39H
	Pgkhuc6epaVic7eYK+evLMpnwLd5SOPT5BvMZSoCAJkEuxVm02pd0NeeyEJPr05wnFLlOcv
	ATNfhgfGXI6iuWtTLEQmgo2xuytRyBg+84c9803j5zwEr+psbZuQNvwx5on6L1DGqm+QeO/
	fkuT+0yg==
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

Features that require unmet patch dependencies:

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
Changes in v2:
- Move codec before cpu in sound node to get sorted.
- Drop patch dependencies in cover letter
- Separate the changes that have unmet dependencies, and mark them as DNM
- Link to v1: https://lore.kernel.org/r/20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com

---
Xilin Wu (5):
      dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A
      [DNM] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable all available QUP SEs
      [DNM] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable UFS controller
      [DNM] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB 3.0 and HDMI ports

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1208 ++++++++++++++++++++
 3 files changed, 1210 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


