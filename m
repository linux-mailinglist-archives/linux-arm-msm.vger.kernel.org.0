Return-Path: <linux-arm-msm+bounces-71327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411EB3D556
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 23:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2C41898F60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 21:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352ED25EF9C;
	Sun, 31 Aug 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8LlZQdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0637D2580D1;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756675758; cv=none; b=NVoW6b7kPxJX6VS4KSxs9Bv4Q/6fdtVU7UUtNwCyDHJaKNe9ZUwytnRrU2LrmMGd+BV04qdzzFD9X3BP3rTBTV2gL7nmuVw4Mvr8e+IUHsX6G1YWXILLsBK1CCTJJqttWyAgVNWP1rH5QGrNhgTVpH6dfNUuSu+Js4tIzKeLXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756675758; c=relaxed/simple;
	bh=HjxjDXbNtCQOwloSI6X9nCdoCGhNWNgzFGup/yOEOxo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mNZuIX7/lC+xIXmqsv9xdraPKdxcE2tDavIFYaYkslcXRJXVhzf2Nv7QJRwqmCiuPdCSJCFP3OiSKpJUFc9yCorcHqiGohhsju7GPhxxXzz5igXwvRRTfCZmtjHRDo4HMUuL+Y6vbGAyq/DazKVqXocooO4RkMbJZuGBKJTkkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8LlZQdi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727DAC19422;
	Sun, 31 Aug 2025 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756675757;
	bh=HjxjDXbNtCQOwloSI6X9nCdoCGhNWNgzFGup/yOEOxo=;
	h=From:Subject:Date:To:Cc:From;
	b=k8LlZQdiSuECiq8reC9r2m6YgIXjYTUo014J7YjxvG2BI7fIdBuVjVfLnj0Crvpy9
	 oJNDsOaXERxhgN0ijjZTVtQkXuHMS6FNV85P3y8GlHMcmJiJqHj2wMG2ERpCXC2nE/
	 IQwuzq0yZ2x7D2Elr6UM+SqqZLkvAirum/UdnLdNsYtZM8qHxmXq67i8Flk1RPsvqy
	 71lFIhgiAlOycDS3uh/NJRC7Ph8mSZNGsio9t7s33bkWp6S73TVt2yU/l/WCsxjxcG
	 ZQwAChSebff6blVqSw4Z5ugfUtxfrYpc5SejwKbXxhCiBhj51ldKNXDiswFHU9bx4x
	 HwvJe2fVs5A0A==
Received: by venus (Postfix, from userid 1000)
	id AA459180FA9; Sun, 31 Aug 2025 23:29:14 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Date: Sun, 31 Aug 2025 23:28:30 +0200
Message-Id: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH++tGgC/x3MQQqAIBBA0avErBtQK4iuEi3UmXIITDQiiO6et
 HyL/x8onIULTM0DmS8pcsQK3Tbgg40bo1A1GGUGNXYazyBxT5bw1H1B9kjEznTkyK4OapYyr3L
 /y3l53w+Iv7BMYgAAAA==
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
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HjxjDXbNtCQOwloSI6X9nCdoCGhNWNgzFGup/yOEOxo=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBotL6kS908FD6dq6aodhRrf1QqQCY0apxy4/jKo
 MhxLHN3jiuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLS+pAAKCRDY7tfzyDv6
 mgQ0EACIPLqw2p0ytn13LICAsUIUlatISjuhde94+jEpt/RgwumC1GNPa8akvExtI/q3Qw5TfBr
 MeSOXD+h0FwuBFMl+m6BuGCrOM5VkMt2aSMHeO3I1iu4/c+dC9qzKffTB3UMd4n1XJw8dzsT8ng
 9Ox2UZq1R4fRmjEFsQBgDdHbBwkgE5zoBdlX4iEceE7zpxSVOXP4Nqk6UR7KhxswDHfdVojwyhh
 BQsSzb9NAAVgz4PyJyp6vLvycO1yy7fzWkvWFqP0P3FUnS/zd90qsDcpcMt01Ek9lOHH1P/SOW0
 EJ+1PSqQ029hJLzNlcmkP27IWY9Wm5j/eKFFYbWvXayzGYWs7WTnrdPeGgJKr61uHYUBl8GczFz
 et7HkvmL14u8cf4+maZUQECX41f9/zFsLCCPtwU+24THx0eErUlH+Zx6oZ5ogM1XeZckH3+6fF5
 Rv6CVySWWg+FRB9qt5zua6kmDjBXQhDBCNbkYh2Pjk4h37AQOeJdv0yU76CR9Par2eu3T0I5x4F
 WiG2CYPMRMgdAbcMmFjRfuhzEShtSXvOFp9QrR9m4wNaR0kowHIfomd3ujPkEY8zBz7DBBWmLXn
 YHjCOGEZbfZWZplFSSkphuLI6Tdr5RinOkp4tyXU5LoqBO0jfUIptJMMz+elsX8IRKWBLo0zOH5
 lrArceJ9ZZCTctw==
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

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Sebastian Reichel (3):
      dt-bindings: platform: Add Lenovo Thinkpad T14s EC
      platform: arm64: thinkpad-t14s-ec: new driver
      arm64: dts: qcom: x1e80100-t14s: add EC

 .../bindings/platform/lenovo,thinkpad-t14s-ec.yaml |  49 ++
 MAINTAINERS                                        |   6 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  23 +
 drivers/platform/arm64/Kconfig                     |  20 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 597 +++++++++++++++++++++
 6 files changed, 696 insertions(+)
---
base-commit: c8bc81a52d5a2ac2e4b257ae123677cf94112755
change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


