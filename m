Return-Path: <linux-arm-msm+bounces-82827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F7C78E55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 133343526A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2C334320A;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN9FJlrI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFDF824A3;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725485; cv=none; b=GRqu0PK23XopzvWKRJVyRbNbu4B6pxwvA/z3Ek/FwYy0Xk2iQ7mtzJVkFTixhL2i/y0A8/X6V4hNq59YLOmpnLMhS3+DZdkEOS3EJVW9/NmjpdHO724pSskz3xVKEEYs2fnSv3N0tmU1ytVXfdsr35hHsswy4Xnb9KZtP/W91pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725485; c=relaxed/simple;
	bh=Yi/oXfy9j6fRDTfKxTvKwXsP2XvE8pwQxQuLxQPvpMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mEsw2JLkUZtFmdAiRfe/J7ADZk0hoa0zM3QHLOL+ttvipGtZj+OswoN1yxc65lKEEvrOtZXhHIttSC61YuqnNqhfpGYgOBOqhEiHAsMYSF0QfcHhopsVo7lGB2AhMUIKkU3kPXIPEO91uI54vg4d5ayiU3wF43lz1VpGGoG09Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uN9FJlrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EBD6C4CEF1;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=Yi/oXfy9j6fRDTfKxTvKwXsP2XvE8pwQxQuLxQPvpMc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uN9FJlrIDGZUaHj7Xrdl83sKLvTshPVJM33aRrzdqZTBEEzphbu+BTRneVO4CJRxe
	 RBJkOrXBa/OBU9xK6KHBN3cZ4b+MLprFRgwnlPsfcHpbl8gWNPT7N+YchzIqm/VJds
	 NSmqYVn6ySYL8HKUeyncpzQz990YnT7+YKA9YFHXS83xBq+2ukI/PkDPLaQH5IANz4
	 WRLGvIllRQrvu4fB9dA+1WE8Z1T34Iko57bUXoNLB5cRQEGGhNCF04GkJPBCMODtWv
	 xM6O4D9GkdlNLKMUvaeuUazHwDTYdPHCH1beqGKH762CAKruGgi5ROPZMiLy5ZFIyj
	 PaVXgKixMN/pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10816CFA759;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] ARM: dts: qcom: msm8960: expressatt: Add more
 peripherals
Date: Fri, 21 Nov 2025 03:44:43 -0800
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtQIGkC/42PUW7DIAxArxLxPRCGhEA1Tb3HVEWMmQQtIRuwq
 FWVu4+mF9jns6z37DvJmAJmcmruJOEWclhjBfHSEDfZOCINn5WJ4KIDAEPx+p0wZ1vKEL0brHM
 4D4sd4zCHcSrU9xq50KYHrUi11G0frkfh/fLkhD+/NVSeQ7I8dEfo1LxCrwRwZbSShhnZa5BMt
 bLTneAGQGtpwBj20dJyO39hijizNY1v5OGeQi5ruh3PbHDI/333BpRTJZUH5XnnfHseFxtm5ta
 FXPZ9/wNW18L8KgEAAA==
X-Change-ID: 20251119-expressatt_nfc_accel_magn_light-f78e02897186
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=3612;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=Yi/oXfy9j6fRDTfKxTvKwXsP2XvE8pwQxQuLxQPvpMc=;
 b=hLfsrD5gEKvsBouEZ8uueZRE9XQ2YD5veq8OcCbTneNMiejLa1IcrZF53GjnU7a5tyULi6GGn
 9EPnkelO1GJCf+RGk8/zB9jkCP1OAF0dys4GZaYIoepXpI+urVY8Jwp
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

Intro:
=================
The following is now working on the Samsung Galaxy Express SGH-I437, an
old 2012 Android phone:
- Light Sensor
    - Proximity is currently giving bogus values
- NFC
- Magnetometer
    - Maybe need to update the mount matrix?
- Accelerometer
    - Maybe need to update the mount matrix?

Tests:
=================
Light Sensor
=================
/sys/bus/iio/devices/iio:device2 # cat in_intensity0_raw && cat in_intensity1_raw
0
0
/sys/bus/iio/devices/iio:device2 # cat in_intensity0_raw && cat in_intensity1_raw
163
28

=================
NFC
=================
nfc0:
          Tags: [ ]
          Devices: [ ]
          Protocols: [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
          Powered: Yes
          RF Mode: None
          lto: 150
          rw: 15
          miux: 2047

Start polling on nfc0 as initiator

Targets found for nfc0
  Tags: [ tag4 ]
  Devices: [ ]

=================
Magnetometer
=================
/sys/bus/iio/devices/iio:device1 # cat in_magn_x_raw && cat in_magn_y_raw && cat in_magn_z_raw
-441672
1223706
3275580
/sys/bus/iio/devices/iio:device1 # cat in_magn_x_raw && cat in_magn_y_raw && cat in_magn_z_raw
-364650
1206172
3248674
/sys/bus/iio/devices/iio:device1 # cat in_magn_x_raw && cat in_magn_y_raw && cat in_magn_z_raw
-439362
1214092
3180892

=================
Accelerometer
=================
/sys/bus/iio/devices/iio:device0 # cat in_accel_x_raw && cat in_accel_y_raw && cat in_accel_z_raw
16
484
-48
/sys/bus/iio/devices/iio:device0 # cat in_accel_x_raw && cat in_accel_y_raw && cat in_accel_z_raw
13
489
469
/sys/bus/iio/devices/iio:device0 # cat in_accel_x_raw && cat in_accel_y_raw && cat in_accel_z_raw
433
106
48

More Information:
=================
- Device page:
https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)
- Downstream kernel (uses board files):
https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-express.c

Note: These patches were assisted with AI (specifically Claude) as it
was easily able to translate the old board file into a DTS format that
mainline understands.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- Fixed formatting issues
- Use GSBI instead of i2c-gpio
- Remove regulator-always-on
- Link to v1: https://lore.kernel.org/r/20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com

---
Rudraksha Gupta (5):
      ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
      ARM: dts: qcom: msm8960: expressatt: Add Light/Proximity Sensor
      ARM: dts: qcom: msm8960: expressatt: Add NFC
      ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
      ARM: dts: qcom: msm8960: expressatt: Add Accelerometer

 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 110 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  96 ++++++++++++++++++
 2 files changed, 206 insertions(+)
---
base-commit: a771210bab42017434c91411e16694ac4fd7afc2
change-id: 20251119-expressatt_nfc_accel_magn_light-f78e02897186
prerequisite-message-id: <176210698639.937813.643585209118839199.b4-ty@kernel.org>
prerequisite-patch-id: befdfe1948c2fbfb867597a6de917c8067fd57be
prerequisite-patch-id: 70a2b0837b9846d8a775f464295da73ca8ff26b4
prerequisite-patch-id: 20e005aa4312c3525e1b90f33a398189b9e2b3b7
prerequisite-patch-id: 970e0eb8af1736e4565fc37830576a67bf7b3227
prerequisite-patch-id: babd3b55d9ff28f19dbc3f7978742c58ef436aee

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



