Return-Path: <linux-arm-msm+bounces-101253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IzrJeXLzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:40:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C83761D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CA48313EF04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D0738C2A3;
	Wed,  1 Apr 2026 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="VEwKhf4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45438A707;
	Wed,  1 Apr 2026 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028846; cv=none; b=XWaWqy4fVWLUKKc8D6TZ4a756T7yX3JTCnMqRrBe8bW2+1rLGAg+MkNl1Y81hGyZLDC+R2LW9oWPJ+PeDuzqY8qaElhwh0x3SX81hnFpR62hjnHBY4eWoqeRz4LWucLJmuKIlBkigmJJ976/+DdLkykXh0mCyeIprDGIzMB0Ixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028846; c=relaxed/simple;
	bh=2GcFOJjX1AnO7H5r0kjFzXIVQGMcfOJjJ+MW/bueJ0s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XRs02ZPYBjVL0g+fZpKaBUiY0IOvP3y5UjZ7zp5Mh7dnvZFbmYscShWI5+f2JwqFNyLxPTmRQLdzV0RXTEuLvsRWFXl3bWc20xUWHtHoTZ4Jk6NPLaMQRsLqDKufR5B3jZ93ovP2+XCop5dcyehfSbN1EH7DDAkQH/NboriB+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=VEwKhf4/; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775028829; x=1775288029;
	bh=Rde7q74qxf8lDFPD+wE2Tm30AFRT8y1GKoT/Zc7Ga+w=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VEwKhf4/WxgZmwwqxnLDZm6gcP8R4GM0VESMjGjOMLgmyn3ktyLUzMKjQLPodhq9L
	 kAhhDQ1buJA/fs/8Q6mAli2nAURhOA7mDoBJOp7ILN8YzwolmC06EFu4asi/GV6CRf
	 WJJ9gwJTS/vw+WAgWHGwzrfRCn1IXnVkZES83jeagIZCSNpTPp0FN5gCb+ziw4xmnO
	 GAQHVYz3FD33Cth6BoNisWfykC96Wa2Xbk8V6uVtVhJP/r0kJPuK+EsrGYg+nvn6dD
	 tTksFL9KQ1XusvaWn7jiP/VAxLp47aIavAUup92uvQf2f2pC3RJKr8c8dbRYUY01R+
	 oPmHQLaHQc73g==
X-Pm-Submission-Id: 4flxYl60t2z1DDLK
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH 0/4] Introduce EC driver for Snapdragon X1E based Dell XPS
 13 9345
Date: Wed, 01 Apr 2026 09:33:09 +0200
Message-Id: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXKzGkC/x3MQQqAIBBG4avErBvILMGuEi0qf2tAKhRCiO6et
 PwW7z2UEAWJhuqhiFuSnEeBqita9/nYwOKKqW1a02it2CEEzldiq7uesTJ631mnFnijqGRXhJf
 8L8fpfT/H4+39YgAAAA==
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
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3414; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=2GcFOJjX1AnO7H5r0kjFzXIVQGMcfOJjJ+MW/bueJ0s=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJlnTkX/vKG0N2LXikPmTF92dWZVNFenHGQJU8hLnGBnw
 nbrcubfjlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjAR33mMDK84mXdMm6W+40MR
 7xWb4w4r838IJMlxRE6ap2FcUR+39AHDX1mDzdIcBqyLXW84B0qe/H7+8PPDhW1Tr3c8L7gtfrb
 3ERsA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101253-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid]
X-Rspamd-Queue-Id: 1F6C83761D0
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

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Aleksandrs Vinarskis (4):
      dt-bindings: platform: introduce EC for Dell XPS 13 9345
      platform: arm64: dell-xps-ec: new driver
      arm64: dts: qcom: hamoa-pmics: define VADC for pmk8550
      arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

 .../embedded-controller/dell,xps13-9345-ec.yaml    |  86 +++++++
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |  11 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  91 ++++++-
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/dell-xps-ec.c               | 269 +++++++++++++++++++++
 7 files changed, 474 insertions(+), 2 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260331-dell-xps-9345-ec-e5f49d1bef61

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


