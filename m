Return-Path: <linux-arm-msm+bounces-72167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42AB44B1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE18A07EB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA5C1E570D;
	Fri,  5 Sep 2025 01:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCU3QQCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2751DF755;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034579; cv=none; b=V6qI//+sI5M/EehYqcFtwphChDhe7a5Kl6XVsX5VkAgsY/8LYyPLcMf0RBNyLQw546OqNva3y3cNPJJu9uHIVnCNunx3yzrMYVvaN8dzXuQWMdnBUSXxugnhxIB1UrLLtRC486SCGqJij//Syriqxje7OPz082YHoLtxcOUZUys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034579; c=relaxed/simple;
	bh=zlThuuzkt1QkJxp3SzFyL9usQnMhVeyLmEtHSFL+eoI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P+3mGQMTrgTM6jLsEyQZkgxJ8Brmmmx9PFy8VcL1/wgGJH6IKcUnLrZt0fJ0rMYClc0zDMH4sfbh5+4oY2me41AjcKGlAo6+DLuGD/liN7eRrXrqOxFvA0EsxlGar2DoofytMeXsoqCkZJWGNXuOFQJr1PPapUIqKamPdVXr88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCU3QQCe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40281C116C6;
	Fri,  5 Sep 2025 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757034579;
	bh=zlThuuzkt1QkJxp3SzFyL9usQnMhVeyLmEtHSFL+eoI=;
	h=From:Subject:Date:To:Cc:From;
	b=YCU3QQCefhSJs2BvTMKR8N0lkgVYD1xPSo3XsRlSeJMfOiKTGKN39PSF6zbD9vI6Z
	 s1eOPMdIbJvq9U6uY+gnpr+HqQ7laQ1NqEH616zi21gANJ4cu3/qbnKIeVIx1T91s3
	 G+tZCHBYC9ksmubKBlD08+poVhIxtYUxDBWre+60OEm+sDvdWHyF/YzeWR2NzBQglp
	 6wGam1VsgJm6JZ2CQOUUQHtpxjXZzfBW4KqpQoz8PVjYj8OtHjzigglu+HtGn2fwRh
	 ureQ5C3IEXJtBjKzGkhvaXrx29wlGEYYsRxDBMUuffGNSGyq/QUj+3N7NglTlv2duQ
	 +w8fUgW3rlrcA==
Received: by venus (Postfix, from userid 1000)
	id 0DB9D180B05; Fri, 05 Sep 2025 03:09:36 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Date: Fri, 05 Sep 2025 03:09:30 +0200
Message-Id: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEo4umgC/32NQQ6CMBBFr0Jm7Zi2KBpX3MOwmLZTmYiUtIRoC
 He3cgCX7yX//RUyJ+EMt2qFxItkiWMBc6jA9TQ+GMUXBqPMWV1rjXMv43Mij7M+ZWSH3rM1tbe
 egoUymxIHee/Je1e4lzzH9NkfFv2zf2KLRoUNq4bUhQKr0Lo4DGRjoqOLL+i2bfsC6MLCBrQAA
 AA=
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
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zlThuuzkt1QkJxp3SzFyL9usQnMhVeyLmEtHSFL+eoI=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBoujhO2kpGKRTK+MHUHbmu+kG3VkOiIiJswsqrd
 zKjR05CI3iJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLo4TgAKCRDY7tfzyDv6
 mn8fD/9R86xT85YjvMkSbbB2j0G+gyXjPGYnqnA8ogeXZAVOyoyoZhgUU5hlX82mVazTSotNSbO
 rQpAqPni/EAsMlFcbPt8p0SfRyBinCInvvvVTqlYpn6b+1aeyif/tKDJQ/YRv2Nro6uwmfBzALh
 VVjwmULNdGvFAZnDz9BQEVMvjTzjlTkmagdnsrBP/VLNqlzzoip1hpld1TGrCYNb2N10HNhC9MT
 5gzEG6ibbdcOExLhctTqsb/PBXKGgU5f0b41QvtC2V4QCChbC76o1p+9aeSW0PL1m0OW6xKiBFZ
 fSFpcCPcqkQ7aBRW9pjJAqcbp5sveHVOLmzruQQOQ9G6BzTlDXPFgviVUpsNwYDY3Rj5ZYgRlFt
 K9Ef9xmHQoCIf6Cdpw/uF2gNW9lt8DJCkHUrX0+2ePF8gmLB6/UctFNa9/nmFQAVoc11hhsXOE5
 rNyCtOgw8dg9UKKoSAPSxyQXPnbG2e8feCNUe+0RlPz70sEUKZcrANQ1/cTFqlgowS3bBriWGpF
 fcEcI8NxGAoqMLG7wkpdhe7jAt835Vl5sE0/8+W9iWWqS/BtDUJ/2HJ4DG2MiomMiqoIBHeltUt
 B5MR9fC3NuRrwiurXK9nTopDFK+HYI3SCB2URz8CZk1i8JbTW4iyZ83+Qteuk2swHKsd4OZwHbr
 UYxAts/rJzczTHQ==
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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 610 +++++++++++++++++++++
 6 files changed, 711 insertions(+)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


