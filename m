Return-Path: <linux-arm-msm+bounces-72387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B0B467DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 03:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEBAB3ADD20
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 01:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4120318FC92;
	Sat,  6 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc85nQdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E6DF49;
	Sat,  6 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757121149; cv=none; b=G60F/N3B3/O5nJaN/HBdNqa05uPRd23S4KkKwEbWnaGJT3gWkKTJZG/Z1DjR8A+6QUAK3rBeCMiI/j0RU2XRdNDgnFALIfRqe7EF5cEdvBUsN4eo7PTA9OwqOueBQaz1pbWz88picnU6bkM3b7vYfUUEWLNrvmFR3DXNe3ACeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757121149; c=relaxed/simple;
	bh=hWDMBBurSQ1kFU0x8+MG6LMQbMWAEOJcNOkBoQiLmWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f38/Lu4+hLl+EusCJVLTa3WJlDS7kg14FDbJq2CUMONB6PHlhvLS7ZWvGnPDfs91YP1/wd3cNqQCiStBXY3kusDCd1LlIffQi21QzNCPoxTYTwrpjngSjD9Sp0rasMDWYeKpgnJkgO4ADDUWZdoltcWnyknJnibgv3pc3VQAZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc85nQdR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F33C4AF0B;
	Sat,  6 Sep 2025 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757121148;
	bh=hWDMBBurSQ1kFU0x8+MG6LMQbMWAEOJcNOkBoQiLmWw=;
	h=From:Subject:Date:To:Cc:From;
	b=jc85nQdRTQIn73jG/WMycs8nt4O8pLhfsj8Y3jHGRGSj717lhwRw8CUgbmZZc3XMd
	 jW+e/cjeQZSWidsO4Vs2KpEhQEZa1SdgeiHV1EOK1b+LEZIjfDPWHBx5ooRujq2cDX
	 yLdFeg9GGkXmX7aeaUOKbXGyoh5UUBM7PloB6xaYON4620F5nnFZf3FZ/QwCiRbzY2
	 GtOnc9OtUl9e2emUrRs1c4oVyUIJdYSRlolMSM1wG0PE7I9o678yFT13tJKi7I97Mh
	 8e+08SunCPTmQ5XedYGRtirxnAhuxAVjsv/iunJa0cEcJieXpDf51g+7vmKOT3PjNw
	 W/FoWVcYOm1wg==
Received: by venus (Postfix, from userid 1000)
	id 67162180B10; Sat, 06 Sep 2025 03:12:26 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Date: Sat, 06 Sep 2025 03:12:02 +0200
Message-Id: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGOKu2gC/33NTQrCMBCG4auUrI2kSX/UlfcQF5PMxAZrU5ISl
 NK7m3YjiLh8P5hnZhYpOIrsVMwsUHLR+SGH2hXMdDDciDvMzaSQtTiokk+dG+4jIJ/KKnIyHJG
 0VKgRrGb5bAxk3XMjL9fcnYuTD6/tQyrX9Q+WSi54Q6IB0YIlYc/G9z1oH2Bv/IOtYJIf5CjqH
 4jMSItQYysAKqm+kWVZ3krKjdP5AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4467;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hWDMBBurSQ1kFU0x8+MG6LMQbMWAEOJcNOkBoQiLmWw=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBou4p4NEg2YI2IuvcxnfJMfcL1M7t21H2m5UjS4
 jw2e+lUXCKJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLuKeAAKCRDY7tfzyDv6
 mseZEACkSPadcqjZefa9PQ5tx24NPdJZSCEjtFopiOCJLMCGiewVu5B03RVU9KsWdQZ5vVLoOMU
 psg59eDy0vxZMzA+/6QTE1rXxpvw3yiWOjZV1FpJugVdqaWi8oTMf0cLCeFNSYnAD55Et7UbLKq
 xWmEN0h23N81udDAh2s1dNg1uvrvELXqRo7mdsMVKTuVAn767ksRqzuf0B61SWo+tsUo3hJyh+G
 Y40Q/DUq4i6eoSdsY6CE4oTkfalIVbG096b7PykkaCQEp8rL1yaCgq7znr5PKJrd/8iVAjijnu2
 8T1/+dW3QZ38JkP550GvwwfopkRFh9uluUtNjbLg13XU8wHMsy1wi1Zks7KxNOi2puGfFzXS8Yh
 yj8oIyVt2J01K3fL2ba1eoz3T4uUgo73vR6qtTtQj3DIG48Qg6wcVkQ9EbqCp7s86ZIoCb3AMdR
 xpWY8CpNqWWus613wfRbJLg6gFZ8ex7K061K+aoXRn5dZEt7CRurzzdL0Vx57li1rmpYNHGldTc
 SLzojZusHJ+oaltvB11vX4Z8eN6LRtNljwYnW2kepJpbI8pOnZCzM2DSQlgJdal6JzRzXvlbkuc
 fXUn472nwvhNNlF4uIfI15P33QJc6rsrjCjgVKrXipTcCglBbSiYXs8PsbjroYArjtV67ljCTRn
 HettiJ12mp27Bmg==
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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 607 +++++++++++++++++++++
 6 files changed, 708 insertions(+)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


