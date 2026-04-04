Return-Path: <linux-arm-msm+bounces-101776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vWCoMEoK0WlfEAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:55:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B539B1CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE6F2300C58F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 12:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B83025332E;
	Sat,  4 Apr 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="1cZeeiKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16411EFF8D;
	Sat,  4 Apr 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775307335; cv=none; b=sSKf9FRoai+AV0/xXpKyw/KI9/gHr0LhIDpYaSMbNqG5+4WGVUx3vQlbu40GTnd3vkorSL1mf/sF7CgV6floWAzt/aP3OZ0Zjmdee5Q2wbPuX4sjplHJM0c6hOYM2i5XQYI2C7VoC0nQpYcWiRiTJFxCAIy+L2lVBgmpJdRYjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775307335; c=relaxed/simple;
	bh=kwSMlM7CmKQKdLDUa7gL7UpF0P25dd0dAEHEGqsVT2E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EiZHnjTszzpR3frkn9NT8AWuaPXUCx6OgIaonFiLzQsGeZpQ144yBOqPnn1O5X5bndqJq/vzZkcmTE2CsuNmDpafQgI+cAxzM+Q6BeBRaqgib13f/vDQsiXRoSz8FEg2l882fE7JLueAGJ/dK9wx6YM7AnhBliH7EstUuxXM3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=1cZeeiKh; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775307323; x=1775566523;
	bh=G9YGoowS/m51Ow4HMgh69rAwU7k/HZ5h5HPrqFttNBM=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=1cZeeiKh69i6FMdtfmzh6v5dFnsdy0lR5WtgM5wEAetL2CRwYMpluD6oVyk6L/o8P
	 8wnfPmVjVzZy8tIo4zD12d5x50S2VgbG/aCkjB2pM/SCGnXJwT4pdWT+9YWliYPO2y
	 0nR9ge8gz8kLH+FpvK4pR+YT9FvLDotoKV9EW9qccLJwMrzTY5fPYj+i/qHdbuDOMD
	 g+Fr5EZlKOBAm5jHjp/16TWp57hmkgYEL6sG0+nTlJZfLrE2q9r5TdHz1eU0eunFnh
	 lPWb84aRk82R4kXgd3vW8H17gFIyBhY0/vyiha+UazkKOe8ilCihv4flkK9DqiFpE4
	 0X/MXHQXNrllg==
X-Pm-Submission-Id: 4fnwYN6g1Wz1DDLf
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v2 0/4] Introduce EC driver for Snapdragon X1E based Dell
 XPS 13 9345
Date: Sat, 04 Apr 2026 14:55:13 +0200
Message-Id: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADEK0WkC/22OQQ6CMBBFr0K6dkwLhQRX3sOwKO1UJkLBFhsM4
 e5WcOny/8l/b1YW0BMGdslW5jFSoNGlkJ8ypjvl7ghkUmY5zyteFAIM9j0sU4C6kCWgBiytrI1
 o0VaCpdnk0dKyI29Nyh2FefTv3RDFtz1gkv+BRQEclFWlVtrIusVrJKd8eFA463FgzXYYPD5f6
 df50LBWBYR0H2i+ZA6XGX6KIi22D410hXblAAAA
X-Change-ID: 20260331-dell-xps-9345-ec-e5f49d1bef61
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4494; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=kwSMlM7CmKQKdLDUa7gL7UpF0P25dd0dAEHEGqsVT2E=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJkXucxOz3935gPfCTFf3rnhovKbthcpH/i3VXxR5LxUn
 s0Tcx7od5SyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJuP1lZFhlnP/C1Ytff0NL
 5EvxhY+OTb3Lrzhz54MdF89P02e7JPSbkeGFQqLy6d6pu0v0bSasYUluCmhbLL3g66qZ7pO/5Nv
 +kWAAAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101776-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 490B539B1CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds Embedded Controller (EC) driver for Dell XPS 13 9345.
While EC appears to control most of device's peripherals, particular
driver addresses power and thermal managment issues. Key operational
principle involves initial thermistor constants configuration followed
by a periodic reporting of these onboard thermistor values from across
the motherboard to the EC. The latter then handles fan ramp-up/
ramp-down internally. Suspend/Resume must be likewise propagated to EC
for power management.

The driver was developed primarily by analyzing ACPI DSDT's _DSM and
i2c dumps of communication between SoC and EC during various stages of
operation (bootup, suspend, resume).

With EC driver in place, the following issues are addressed:
1. Fans were not properly cooling the laptop, would kick in late and
   spin lazily, resulting in heavy throttling. With EC driver fans
   start sooner and hit high RPM under heavy load.
2. Fans were not stopping once SoC temperature dropped, they would keep
   slowly spinning irrespective of suspend and/or closed lid until the
   next powercycle. With EC driver shortly after SoC temperature drops,
   thermistors temperature drops, and fans ramp-down.
3. Keyboard and touch row backlight were not turning off during
   suspend - only lid close would power off the touch row. With EC
   driver behavior matches that of Windows, suspending device with lid
   open powers off the peripherals.

As thermistor readout depends on pmic's ADCs, this series introduces
EC driver and its schema, adds missing ADC to hamoa-pmics, and finally
adds thermistor and EC nodes to x1e80100-dell-xps13-9345.dts.

Additional findings:
- Max fan speed depends on Dell's power mode settings, configurable in
  BIOS or using Windows app (relies on ACPI-WMI). It appears best
  cooling performance is achieved under 'Ultra Performance' profile.
- When the said power mode is changed using Windows app, EC IRQ is
  triggered. Windows performs what appears to be thermistor contants
  readout, though its not obvious what it is used for.
- Given similarities between Dell XPS 13 series (codename 'tributo')
  and Snapdragon-based Latitude, Inspiron ('thena'), including matching
  EC address and response to suspend/resume command the EC driver can
  be likely used for both, though in-depth testing on 'thena' is
  required.

This series depends on QCOM SPMI PMIC5 Gen3 ADC [1], which was added to
`linux-next` for v7.1, but must be picked if this series to be backported.

[1] https://lore.kernel.org/all/20260209105438.596339-1-jishnu.prakash@oss.qualcomm.com/

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Changes in v2:
- Update cover letter to indicate dependency on QCOM ADC series, only
  relevant for backporting
- Update description of dell_xps_ec_suspend: entering suspend does not
  necessarily ramp down the fans, if thermistors still report high temps
- Add die_temp/xo_therm to pmk8550 as per Konrad Dybcio
- Add missing header imports as per Ilpo Järvinen
- Add explanation for EC reset pin being reserved
- Fix device-tree: minor issues as per Konrad Dybcio
- Fix device-tree: alingment issues as per Konrad Dybcio
- Fix driver: alingment issues as per Bjorn Andersson
- Fix driver: handle temp value as 16bit register as per Ilpo Järvinen
- Fix bindigs: description and example as per Krzysztof Kozlowski 
- Link to v1: https://lore.kernel.org/r/20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com

---
Aleksandrs Vinarskis (4):
      dt-bindings: platform: introduce EC for Dell XPS 13 9345
      platform: arm64: dell-xps-ec: new driver
      arm64: dts: qcom: hamoa-pmics: define VADC for pmk8550
      arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

 .../embedded-controller/dell,xps13-9345-ec.yaml    |  91 +++++++
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |  26 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  94 +++++++-
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/dell-xps-ec.c               | 267 +++++++++++++++++++++
 7 files changed, 495 insertions(+), 2 deletions(-)
---
base-commit: ec07eff1fd1ed6c4dca399aee4e8da15856589f0
change-id: 20260331-dell-xps-9345-ec-e5f49d1bef61

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


