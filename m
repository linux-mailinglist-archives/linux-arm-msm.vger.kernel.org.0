Return-Path: <linux-arm-msm+bounces-72664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43067B49CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 00:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09EC1749F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 22:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346DF2ECEB4;
	Mon,  8 Sep 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyRS6PlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0B2E0B5C;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757370960; cv=none; b=T86q+AniJUOtq7s0bTP4C2vQxboD7XPqUYr880diJzptFm6EUnOZodE4L3aHsqdXCYZCPvisR226y4EGbwKBIKc2zrLXUFcItVU+PaFXjaR3aVhnJlbnvXbUDzcd96kuBt3Iwx2KNqvsKFyOO4arT3CXw0qldlXwbb1YlxhkD7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757370960; c=relaxed/simple;
	bh=9JCQcoZ6SyxRiC8mfnatzWhX/1/ju52mg6bWSNkXm+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mtHPrUl0P8Z1It66yX0qgL1tfz8mL9WrAta+RiSkP+PQI61o546UbHCMzO/1y4WVb8EIkEu9itvaMcsSUanZFAZBiv6WZKHaqQm4JmC5cQ8/jDUboWgU+42B/Wme7ygQmtqE+HC1BqaPrk2+rPdplm4rbftltIpQ29UaBPcjqFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyRS6PlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE71C4CEF1;
	Mon,  8 Sep 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757370959;
	bh=9JCQcoZ6SyxRiC8mfnatzWhX/1/ju52mg6bWSNkXm+s=;
	h=From:Subject:Date:To:Cc:From;
	b=EyRS6PlQ71J6iTIVu9UOrtjokNmOQYgWM6havGo3QP4nnuoDIB931W77CyU1eNEPi
	 FQ0plhqAP0zG8wvzXrdMpioPjilxE4BlVb8jnUiATqb9vn0AwpbavvZI+uJFZ6vCQE
	 LOpCqb+UHkzmm92rI89mduHaGZ97oF4v4eBptEAfAfV5UKtlqZL0TqR2hsrK8BaVFO
	 AEDSfGCh15Uy+xSZajOMK1stTKVv8eSXlkdkxFejI6T6sWE5uccUJu108nV1yyQBKl
	 b7snjQVLIWTTk7qgJiCUcB3bRCl8KT6T4YAsIrKYVhUyxPDMBsVkLavue4WGpe/4Q+
	 5JXF4apvZTpmg==
Received: by venus (Postfix, from userid 1000)
	id 8F2E2180B21; Tue, 09 Sep 2025 00:35:57 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v4 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Date: Tue, 09 Sep 2025 00:35:49 +0200
Message-Id: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEVav2gC/33NywrCMBCF4VcpWRvJpVdXvoe4mCQTG6xNSUpRS
 t/dtBtFisv/wHwzk4jBYSSnbCYBJxed71Pkh4zoFvobUmdSE8FEwWrJ6di6/j6AoSPPI0VNjUE
 lpFEGrCLpbAho3XMjL9fUrYujD6/tw8TX9Q82ccpoiawEVoFFZs/adx0oH+Co/YOs4CQ+SMOKH
 UQkpDJQmIoB5ELuIfIbKXcQmRCpsUQtOGDd/CLLsrwBWpqZez4BAAA=
X-Change-ID: 20250831-thinkpad-t14s-ec-ddeb23dbdafb
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4850;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9JCQcoZ6SyxRiC8mfnatzWhX/1/ju52mg6bWSNkXm+s=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBov1pMmNPzN2B534BYR3XqGAuq1dhnRHXfUDWVY
 xLEPTE61eeJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaL9aTAAKCRDY7tfzyDv6
 miD8D/9uo459C7AnYkinDRYbcXNaOsOYpensNXYlBvrVVUT3905+Ki+ejmkS7JiKGrTum+3kNWe
 lwLGw4WaUhtmb/aFqOdrd6Uh0roctYqxkeKqCNpMk7ywW5R8aqtPqNjtzKk4FlIW1P5nzjZWkHo
 8SzSnhmca1l+aD6imZieHSrd/hPaEsu4lSW4yrvFttbfqQyd5/AO99ixk1AG5/nlhLQ5RGDM9Bx
 22oCEPVeBrsvWZEeAis43vfsyDNWrsKTFXIom0bEoV+EFsEGoOjb/xuLvjAXurp9ihIcn5xbX/1
 yLtAT1J2CMsU+HW8wDupdTpyux2jyVA/Y17nLNE/44FsN34bO9vCvD4taDCTq1JzGj5N4hYxTio
 yzUI1jWNWcvt4JZ3+oOksBIzlscHvpOhqWpgwqzZiJ9Pz7ZqkC57BebUfzZcc62tG4bvZW7aS+3
 tCVrTRcd0X2OO7vzvCCkyyEnqMQsL/TbYq7N7txVgZR/HwRuXbnghIRuBCfGc6q0DdQhsWB+Fhb
 FCNwz2ss1UoAsxehhjmy3QheH25Mq1SIL5tiPU+re868wlFe4bJF8q9W85w5C6cgcYW6iPKNynG
 UnqBtXdLiQY8hSXsDPLtr/0l3GE/cgdNacsMKI80mg/9VMnLpT2N2F3xD/hUE1KRU3UIgKtfuTH
 sb/KyimXN1fTRiA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Introduce driver for the ThinkPad T14s Gen6 Snapdragon EC. In theory
it seems to be compatible with the ThinkPad ACPI driver, but these
devices are booted with device tree. As the name implies, the existing
ThinkPad ACPI driver only supports the ACPI interface. Looking at
the implementation, the ACPI DSDT contains many mapping functions
to translate the low level I2C messages into the interface used by
the ThinkPad ACPI driver. Adding DT support to the ThinkPad ACPI driver
would require adding all those translation functions, which would add
more or less the same amount of code as writing a separate driver using
the low level interface directly. I don't think it's sensible to make
the existing ACPI driver even more complicated, so I went for a separate
driver.

I managed to get system LEDs, audio LEDs, extra keys and the keyboard
backlight control working. The EC also seems to be used for some thermal
bits, which I haven't looked into deeply. As far as I understand most
thermal and fan control is handled by a different controller
(0x36@i2c5) anyways.

Apart from that the EC is involved in proper system suspend, which
is something I do not yet understand (I don't have any documentation
apart from the dis-assembled DSDT and existing ACPI driver). Right
now I disabled wake capabilities for the IRQ, since it would wake
up the system when closing the LID. Hopefully a way to mask specific
events will be found in the future.

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com
- Add thermal zone event IDs and handle them with a custom dev_dbg() message
- Use lower case letters in all hexadecimal numbers
- Improve comment when userspace does not choose blink timings
- Change logic to use == instead of != comparison for led cache check

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com
- Add <linux/container_of.h> include (Ilpo Järvinen)
- Add <linux/dev_printk.h> include (Ilpo Järvinen)
- Add <linux/interrupt.h> include (Ilpo Järvinen)
- Align CMD defines (Ilpo Järvinen)
- Rename thinkpad_t14s_led_set() to thinkpad_t14s_led_brightness_set() (Ilpo Järvinen)
- Replace && with & in thinkpad_t14s_audio_led_get(); good catch! (Konrad Dybcio)
- Use regmap_assign_bits in thinkpad_t14s_audio_led_set (Konrad Dybcio)
- Directly return input_register_device() at the end of
  thinkpad_t14s_input_probe (Konrad Dybcio)
- Remove THINKPAD_ prefix (Konrad Dybcio)
- Also use T14S_EC_ prefix for LEDs states (myself)
- Collect Reviewed-by tags

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com
- Apply Reviewed-by tags from Bryan O'Donoghue
- Apply Tested-by tags from Neil Armstrong
- Update DT binding description, location and examples (Krzysztof Kozlowski)
- Add missing wakeup-source to DT binding (Rob Herring Bot)
- Update DTS newlines, pinctrl order, nodename (Konrad Dybcio)
- Updates to EC driver
  - Add bits.h and bitfield.h include (Ilpo Järvinen)
  - Drop mutex.h (myself, leftover from development)
  - Drop DEBUG define (Ilpo Järvinen)
  - Add THINKPAD_T14S_EC_BLINK_RATE_ON_OFF_MS (Bryan O'Donoghue, Ilpo Järvinen)
  - Add THINKPAD_T14S_EC_KEY_EVT_OFFSET (Ilpo Järvinen)
  - Add THINKPAD_T14S_EC_KEY_ENTRY (myself, to keep line length sane
    after THINKPAD_T14S_EC_KEY_EVT_OFFSET)
  - Align values of thinkpad_t14s_ec_led_status_t (Ilpo Järvinen)
  - Use u8 instead of char for I2C command buffers (Ilpo Järvinen)
  - Add some more newlines after goto/return (Bryan O'Donoghue)
  - Use FIELD_PREP/FIELD_GET instead of _SHIFT (Ilpo Järvinen)
  - Explicitly map to LED_ON/LED_OFF in audio_led_get (Ilpo Järvinen)
  - Add missing , after .driver.of_match_table (Ilpo Järvinen)
  - Change from KEY_MODE to KEY_PERFORMANCE (myself after seeing a patch
    for HID lenovo being sent to the list)

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Sebastian Reichel (3):
      dt-bindings: platform: Add Lenovo Thinkpad T14s EC
      platform: arm64: thinkpad-t14s-ec: new driver
      arm64: dts: qcom: x1e80100-t14s: add EC

 .../lenovo,thinkpad-t14s-ec.yaml                   |  50 ++
 MAINTAINERS                                        |   6 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  24 +
 drivers/platform/arm64/Kconfig                     |  20 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 619 +++++++++++++++++++++
 6 files changed, 720 insertions(+)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


