Return-Path: <linux-arm-msm+bounces-74110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BEDB87190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 23:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5991CC2D12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 21:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FB92FBDEB;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZifNUVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B902F83CB;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230457; cv=none; b=TX2QlECQ9XJfsmd4XzAhGqKY5yGVTPDsGm4hUfSjSo4CUkuH7Kolthba+S72xReklcPwYxFsbhvyZCMfj7ddCuwa8xRCk+cryDrxqVaQd+tcScbPeWxQ1LZmAy6bw8nqLEkG1VzkQPS1/weE6iGV5kxGl2kqpfPK25BpDNNcjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230457; c=relaxed/simple;
	bh=peflRt+r7kYRXiRSXLW7eRnqdBJ38owSOJg+Z+P/tHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qP1Ka2IoayZqgJJHXDC5qQF5IK2p3ftl1eruTvog9lvhAoAvV782iGQKqztwBTbDJB02xpQdn3/trtkJlH6udQTY4QhiJ9TeiDq5pySydMi+YiUf6yJfDwU2mFk0oakYF3lkvdfhPXdGmmJ24ymM6QjhpTJpns23GuEzTu0tcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZifNUVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2277C4CEFA;
	Thu, 18 Sep 2025 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758230457;
	bh=peflRt+r7kYRXiRSXLW7eRnqdBJ38owSOJg+Z+P/tHQ=;
	h=From:Subject:Date:To:Cc:From;
	b=aZifNUVI9G/FZavECe/vYs9H7I4HjouxDeMA4IGYSKso95vkMdQAWHwz2Ki4VQAQt
	 cAIce8/5OiN5Qf/QZuO1GM4BlH5j+6znBF/loag6N6NCqk3zs4qVKxa7nPMhi+yPfn
	 By7bReCssGkafGwQJdc5IaV4EqImkNytEW0lijztxYbEL+EwCiXKLyXJGCDcWVyUQ3
	 EAeMAVgYvLFoYBZX1KcpujvTiP6ftAqcaN8MIECzZu7iRdoenl68ABVyps/dNvMRpb
	 IUSzKfwJRQ2HQDWSU7KtTXnr4S5ZHGa+SvTBdotKFppimsRP0zTnz9i/X+FcrsRoJM
	 ugFJ1RTvTcZ3w==
Received: by venus (Postfix, from userid 1000)
	id 266B4180F75; Thu, 18 Sep 2025 23:20:50 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v5 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Date: Thu, 18 Sep 2025 23:20:25 +0200
Message-Id: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJl3zGgC/33NzarCMBCG4VuRrI3kp0mtK+9DXEwzk9NwtJGkF
 EV670Y3igSX7wfzzJ1lSoEy263uLNEccohjCbNeMTfA+Ec8YGmmhDJiqyWfhjD+XwD5JJvMyXF
 E6pXGHsH3rJxdEvlwfZGHY+kh5Cmm2+vDLJ/rD2yWXHBLwoJowZPwexdPJ+hjgo2LZ/YEZ/VGO
 mEqiCpIi2CwFQCN0jVEfyK2guiCaEeWnJJA266GNJ9IV0GagjjwVpoOAYi+kWVZHmJgzHWDAQA
 A
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5104;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=peflRt+r7kYRXiRSXLW7eRnqdBJ38owSOJg+Z+P/tHQ=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBozHewbkRvpu0MmUZ50Q2vCC+j47DSL3IaSgD87
 KwxeP9a9/uJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaMx3sAAKCRDY7tfzyDv6
 musNEACXNhT1OVKH2JRkk7BXRMypkZf+h6zHY+737my+nseHmU4VkfwJopLBsFRl9XpGBqqtidN
 KYcfa26xrfIZxm5+VnaNzRHmOzOxoq21itLL0A4evXlrV6g+WW3Xw377c7T42OkeWLsFP07L2pc
 pIsqHbASQlHZ5lI+qj/4URbuqcY3erWeSZwNAYd1pNJAPekH86VoGE+ll+r6tozoz6LxyRhUda/
 Gl3JDoZ05o4jAa/bPA/fv5jUhfF31ZdgPyfi3kQkZXNvbznC2vPg++n08FmJGU2DEqliWDb72yS
 iXakzwm2IDwkpPm9ZMwHZ0QsicghYS8F+buNJ6AYkAS8DaeeLJ9YulVoSlLklTPj1l8/aQcdxUK
 +4WksC/nTftb0j6kcufEx1jY0Q+Q28YYDYYxVL51aIet/c5fI6KVw9PBlFyTDjnEkEzKDbujGMm
 2If613veY5xulbeycEx1dW7OvsSJd/lB29QweEaE/UgO7Jvy/PnT5TBn2aUkO5mgGuBNQysmn5t
 z2YsmIjIresMzPrG3m7vUsCv8Lxf+SNQdMfAiMBfVq1eMG7hsFNm4niSGD9utkrJhnAShTylcdo
 P0xQtWv8gLP5x1cvI/Ge6mcgqnHBTCqeKprnnDFuQHuTXwJiTE95gMMxOZANfCKEH0UcNhlKXGn
 YJazYOMocXNJ3eQ==
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

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com
- Change order of u8 buf[4] in a couple of places to be closer to for reverse Christmas order
- Drop thinkpad_ prefix from all symbols

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
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 616 +++++++++++++++++++++
 6 files changed, 717 insertions(+)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


