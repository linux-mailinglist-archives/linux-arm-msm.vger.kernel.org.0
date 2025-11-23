Return-Path: <linux-arm-msm+bounces-82988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236DC7DC52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E65274E12B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF47C285073;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUtz9uOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBC27FD59;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880284; cv=none; b=QGdEZCUzCqUt0Fz3/T0CZf+FRxgFsshWzQZAlQ9eMvqKYKMlgLwUoUbhMwT0TdKDCUbHfZ/TXR1WGjYz2yr45J3aYNRjkG56zQTFZzf6P79Ik87M5FPqLuSNKPiB/fmtCX4Kh1ZCrIT2HWQCcRGIVhFcvNvmzuKT1bvFD6/n+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880284; c=relaxed/simple;
	bh=8NUXGBoCZMozJu+Ndmf4cKRPIKek+O/M3Gt0Gpz1SDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GUUaG9HQosyfO7Mf57sf+zBc4q6WSFbGLJ2n7ZGtqUCUUUXoDpLN6jIccbPKaGon4Mv5GArqCKB3GrvAeiUrhhuelX0a/tqEcFECXWE/fDvsoSNhCdRFgp/+r1B0ti3ohfMviICJKxlCFOu3N0Uvkzf/Li8P2ucb3InpjMuR+2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUtz9uOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 246D4C116B1;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=8NUXGBoCZMozJu+Ndmf4cKRPIKek+O/M3Gt0Gpz1SDE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LUtz9uOo8Bbfj/N5/FHm9h3paMSwCUfRtEYdwmEgKOjeEc62T/WQ96sqmGfoD2DwJ
	 05AuvU86aEtf2vtq2l1d4nXnqng1IIZFiXXsUJ685giPYW73+5mZshcqf5gPTLBfaA
	 B5Vstf0vpkuoVPZg29pKv9oBcuekSJoX3qGBPUnQhKzZYhqlTtIpAyD165Dy4oyQab
	 CmyI5xULrOsy/5BjcmwDU6BHf9kUrwMlod2i2kJ28leZPdzuRBnyGB/93o737p4kLn
	 faudaxqBIsyLWRPJo5CS3Uy1voNYjWsd2DcYD53lTZqDtnmIzhnfjBrlW1xS1IczrR
	 gjGnsF0jx9ERg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11641CFC26D;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] ARM: dts: qcom: msm8960: expressatt: Add more
 peripherals
Date: Sat, 22 Nov 2025 22:44:41 -0800
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmtImkC/43PTW7DIBAF4KtYrIvFgMEQVVXuEVWWSwcb1T8NU
 CtR5LuXkE127fKNRt+buZGIwWMkh+pGAm4++nXJQbxUxI79MiD1nzkTzrgEAEPx8h0wxj6lbnG
 2663FqZv7YekmP4yJulYj49q0oBXJSt52/lIaTu+PHPD8k4vSY0jmO1eKDtUrtIoDU0YrYWojW
 g2iVo2QWnJmALQWBoypPxqarscvDAtO9RqGN3K3Rx/TGq7lmQ0K/u+7N6CMKqEcKMekdc1xmHs
 /1Xadi73xJ4/D3x7PnmwsNkZYq6x79vZ9/wX4EL3LegEAAA==
X-Change-ID: 20251119-expressatt_nfc_accel_magn_light-f78e02897186
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=5042;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=8NUXGBoCZMozJu+Ndmf4cKRPIKek+O/M3Gt0Gpz1SDE=;
 b=I8ro388ukVAMsA3At0ZekHrN7DUrhAg8tGGirbzwsTVjWv9RNrNf8WdDaPtWPiT7xPYGovFNc
 V/Kzt40x0wMAPWwTiyk7HQl0DsgOP5w/XRDT0FQyU/OYnPLumm1QGQL
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
    - Proximity is currently floating, even though it matches downstream
      GPIO pin
- Magnetometer
    - Regardless of orientation:
        - X axis seems to always be negative
        - Y and Z axis seems to always be positive
- NFC
- Accelerometer

Tests:
=================
Light Sensor
=================
// no external light on sensor
/sys/bus/iio/devices/iio:device2 # cat in_intensity0_raw && cat \
in_intensity1_raw
0
0

// external light shining on sensor
samsung-expressatt:/sys/bus/iio/devices/iio:device2$ cat \
in_intensity0_raw in_intensity1_raw
915
163

=================
NFC
=================
samsung-expressatt:~$ sudo nfctool -d nfc0 -1 -p
doas (user@samsung-expressatt) password: 
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
  Tags: [ tag0 ]
  Devices: [ ]

=================
Magnetometer
=================
// no matter the orientation x is always negative and y and z are always
// positive. The values seem to be changing during rotation, but for some
// reason the magnitude is extremely large
/sys/bus/iio/devices/iio:device1 # cat in_magn_x_raw && cat \
in_magn_y_raw && cat in_magn_z_raw
-441672
1223706
3275580

=================
Accelerometer
=================
I believe it follows the mount matrix guide located in the kernel:
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/mount-matrix.txt

// phone is vertical with charger port closest to the ground and the
// camera closest to the sky. result: +y
samsung-expressatt:/sys/bus/iio/devices/iio:device0$ cat in_accel_x_raw \
in_accel_y_raw in_accel_z_raw
4
488
-47

// phone is flat on the ground with the back of the phone closest to the
// ground and the screen closest to the sky. result: +z
samsung-expressatt:/sys/bus/iio/devices/iio:device0$ cat in_accel_x_raw \
in_accel_y_raw in_accel_z_raw
-4
2
496

// start with phone flat on the ground and the back of the phone
// closest to the ground and the screen closest to the sky. then rotate the
// phone so the charger is closest to you
// next, tilt the phone onto it's left edge. in this case, it would be
// the side with the volume buttons. result: +x
samsung-expressatt:/sys/bus/iio/devices/iio:device0$ cat in_accel_x_raw \
in_accel_y_raw in_accel_z_raw
499
-5
8

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
Changes in v3:
- More formatting changes
- Remove output-low on nfc_enable
- Resolved TODO mount matrix for accelerometer. My tests are above.
- Will try to eventually solve the following problems:
    - Couldn't figure out the mount matrix for magnetometer
    - Proximity is a floating value even though the downstream kernel
      matches the GPIO pin
- Link to v2: https://lore.kernel.org/r/20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com

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

 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 105 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  96 +++++++++++++++++++
 2 files changed, 201 insertions(+)
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



