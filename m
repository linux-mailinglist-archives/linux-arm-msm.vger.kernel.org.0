Return-Path: <linux-arm-msm+bounces-75478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CEBA82BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378191C0919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63BC2BEC3A;
	Mon, 29 Sep 2025 06:47:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A9F2BEFF9;
	Mon, 29 Sep 2025 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128449; cv=none; b=WeZ0DlN9rjGWcmGwQZYNnnEqpRfDBahflTJtHoQqZkBHluP5XOvVxak/PJgZp6ZdZk6f6naX4QfxKkX7jbgexNNsWbyzvMPoNSWVcxZCGDIZ/ic+5KRr+IbO7KoKsflFNexJdTYvkrMUl/QdWbhHxVdjMSsaO6oRczwwwMSe3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128449; c=relaxed/simple;
	bh=Y20ShN7MXQAXzhkbhjDkC8nmDpuzrDaKoSwUszr/Fgo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LtbB4BlGIKQQvZ9bDhbbcLwbEsmdl4om30lA+TghIiV/EWoC0tvgxGIWLjim3c0MkI+GJM7oM5b8Z1ooIwEh8iwWtjqtRy0mFCR29MnL39NZin2vcaxpAr9J81McAUbJvWkhz6fCxiFpqr25vSc838Z3L07oiIKNNi/kJEHfy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1759128410t6a09a6fd
X-QQ-Originating-IP: IdaLYlmGSJLSQ1a+8luNa9lnBiG2H6cFH2F3fj9TJZA=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 14:46:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7642221811650524440
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
Date: Mon, 29 Sep 2025 14:46:40 +0800
Message-Id: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAr2mgC/33OTW7CMBAF4Ksgr3Flj3+wWfUeiIXjGYMXJMShE
 RXK3WvSRaMSsXxPM9/Mgw1UMg1sv3mwQmMectfWYLYbFs+hPRHPWDMDAUZ4CbwEvAeOJZy6lvc
 2cCKMSCEpspbVtWuhlO8zeTj+5kL9V5Vvf+U5D7eufM9nR/ls31wYJRfcxYhN8hGlbz7nkY/YX
 dgTG2EJ6BUAKiC0STvy0KjmBVBLwKwAqgLBRgXonSPc/Qf0AoC1D3QFpEDjdILohF0C0zT9AKO
 snMiIAQAA
X-Change-ID: 20250912-radxa-dragon-q6a-eedcdeaf3e66
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759128408; l=3080;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=Y20ShN7MXQAXzhkbhjDkC8nmDpuzrDaKoSwUszr/Fgo=;
 b=pq7hnzqvkF2nLnZgdO7cmhHHXJhlL97JFMkynfO7345AXY6F6WDo1yMNtwvxQyDHEoqGdkoMr
 f0ZAK1e9LtvBSj+/w12BNgTOvRRxPBywfj9/Dvh2gaD5fb6it9PZ82P
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MbPaY5COJkMKb0gJ8GqLIFocylMSmUQCjk7kR7ERXrKxFJXISHRMDOMX
	/vaVDROsMCEcZeizuStCC+9M+okHB56v8cYG3QyhOnoDF8dsSFyPhkqvs46O5IwDOL5LJLz
	VH3l2PNpenOT9z4uJJTn7wzD4JD8d/P2hQAgOOKODKlvXnveFjr5G93fYHCwwpgxmJ86NSl
	eL579hszWSA2UtV2ko0cunvULg4qwafSUG1ZH0y6HdBMQD+qNSag7IXuMNAG8t6Ef3/cFE8
	kefUPyisQxBjC5Q2c1zllOnrzeOIj3ImuGyhBdl368n96VrE9dClAlOl9uUmrG4XSlhgJ+M
	QXW1pVkPhNFawI6moib0Ul25TeGREatV0cqEAuvoTbgtnxLM3/woXxjm9+KsIZY0n0BvXQw
	Pu7lxPt3z2H3bKGJ7vN1s2cwVxPQEPjtPxYLvVs22ilnlXAh6+uG8EG383SIzoexIFAANQv
	fS55oilvGJXnS4sHvDLF8hz4HxzGsMV8CuLgF/YSd9Kr62SV/0pHXwXF84hW+x5MwRGSxsr
	YYTsZDciAPHM0NM8/ybViTBBngw1PFS8YJbzHMyIY+X3x2cgf2itOzOAv57Hjbp7ijWCimp
	o7UE1GeusC2aMUhYhhLlBfkd2Ct/zDoSqfTwT/IVLLzO+UC6FWIvc+vzE2xaAbEjQteaD6I
	1/BJcGeZB2OJo8yYiD52z0PFst1MUAPPTmZ7GypQ2luR4F4JmzhQKL6AUQnyeTUCjkS+YDv
	3FZpEyVCJVsx17i5Mmy2F6XABD0A1UMwuTtAQwvWk8O3BornugnU/gt/IEvsSZsHdFjdK8M
	NtDkLm38ZlDbndgm1v7eY6vzRQBzfjBAODrfAuJ5yX07ZTKpkCTD+FTbOq+tQ69lIH/tt6x
	3gl8qKywhM5i2EiK+t4JUczvTn6Tdvd1ZuzLibc6IKWm32kyxgIwRfiPJ0/ZBQT/FrI0BhV
	STbp0Dv5UUuKwjo6/tP+Cp7E79YuaZWRW8Mp4QHuBu0CguRRp9O3BwXnV8bakAf5YfN0HQD
	PpSs0AqSgnrn1XCJLrBGJ7MS9vtA8g/xMsCBZulg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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
Changes in v5:
- Change LED default function to panic-indicator
- Fix line break in sound node
- Fix status-not-last in usb_2_hsphy
- Remove unused regulators to avoid potential issues
- Link to v4: https://lore.kernel.org/r/20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com

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
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1095 ++++++++++++++++++++
 3 files changed, 1097 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


