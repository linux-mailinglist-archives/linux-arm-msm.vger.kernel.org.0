Return-Path: <linux-arm-msm+bounces-61980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87946AE315B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 20:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11A83188EB02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2EF1F3B9E;
	Sun, 22 Jun 2025 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="KwHGSWZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bumble.birch.relay.mailchannels.net (bumble.birch.relay.mailchannels.net [23.83.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC060129A78;
	Sun, 22 Jun 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617197; cv=pass; b=m1qNUTaHLl4LP8ji6epIM4RGVeDLgK7sizKUa7Nv6ylT0RhHVdij0bVrPE3XnWgSTsVgAUdzGhtmYfAqQbug7VjWcjA9/byg1DmZWL0hCpsue4XBLYMm7JIVb5Ow1xvbdjbIn5D4FwvJipsOgiShnDPJl3c0DoEmJkPAT9DG9Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617197; c=relaxed/simple;
	bh=2FBjTisACpH9fj5OF0/0Lwq1a5pOglylkWwX9ve/Z9c=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=etXTpnPrOVOwf1fr/EgdSVs0bUI1qj1N/0cruwJo2pogYauaU/SzVjL0RkbjeEqT0N+J4/t2i0cOB6eSQWOsbvcBjGeilvr9KQjogCosfWdOD4WaADgKiSAgVOX+vCVy4eYaDsf1gbMcth+KpOewRtqbHyEAXvttsyKZOGs9qsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=KwHGSWZp; arc=pass smtp.client-ip=23.83.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F046B78403C;
	Sun, 22 Jun 2025 18:26:44 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.100.153.33])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8D4B1783FDD;
	Sun, 22 Jun 2025 18:26:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616802; a=rsa-sha256;
	cv=none;
	b=52EdFduJcqe9ErntDzQTpS4NGCGlmFQfnOYIUhv6CFMh7v9v4mEkGEGckLxLivWMDry/RN
	B1/jOiN+ZuT5++J/IBZykvWYx/b2rlqst8y5iN/7Al63GEhw+H9RVC3R8jbptbbxsoHCOt
	DrPsfT0/VtMBMkNZfTD9YULJyeFZytOudkn0hegPHnnjNSUZRmhVlqA21QEOV9Lm9CRsgi
	FJ6PZ1jZ7awMIXr3PbD+VZGgLySLq2bMYxBfSqROaUPpFX12T2AWIvLQnrd5uYqKJA/wwo
	d4SkFlEUb4QkJ05JrS95YnmaElAYusT6zzymE8n36eb8QGCYWr3COq7OEuoZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=fMQajSbX/B9xTx+xMvWpCNmk72doBEFkzHAzUfqkWno=;
	b=SoRrtQ5sUsrkCUh5pRFuj70cjxR/K+bFIfUXsUsXLjrpwNcdLxIiDcTC+XLALtQ/2VakhU
	MV+rzRR+oisEWYCUlotfVa7sYtwNl0tya1SSi23BN+wrE5u56hyDiZq6EWG+B52HghX9qU
	mlxYgpDrice8NXSAubQIiY6v01SuEZWp2U7VhMBM3KPXHvbldqJcp832GM3cj0bGBmC2t7
	S5kB5BLSXHHQWkg87o5ZvxT7BITegQV93kpg113799HTPI3hHrctnjR7WMFi9wXz2xZ95c
	53mPofCc/hpLGhnx6lTz//KkZZWGOl+qKIqfM6g2aoqDfTQBSoh8wSmR2BtJLQ==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-q8vz2;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Vacuous-Suffer: 7a6c8cb23e14d072_1750616804724_4040051527
X-MC-Loop-Signature: 1750616804724:624159769
X-MC-Ingress-Time: 1750616804724
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.153.33 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:44 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRc29VJzKLL4h;
	Sun, 22 Jun 2025 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fMQajSbX/B9xTx+xMvWpCNmk72doBEFkzHAzUfqkWno=;
	b=KwHGSWZpR2sT4H6HFwHf11Fnhi/uc0u5uRXuGEid4c/8NXa8qbicgbuEKc9TQZonx94vVc
	VDANnwzGtvYfvJVVTRfhIZ7C5nRBaT0qVVbqniMVsHtFaqvhG8164SWlQIKn2oXnR56f0g
	Z0Rxuc7s+zxhI1v3pz9ZtS55XTCP9nYc73Rh1/+MBX8H9RNGFKZqjni0c40CJ0CF0BjPns
	ioPHySxodDebl8ESqbA2jTsqOMOH33opl55k7CTwiaas5jPDaOl2bcznViDYaMaQJA5Uf2
	AANTA90FoF+4K03oHms5ueR1LWj8Plk7o3RXzM8aNSfWoDRyMYAnG7byvZJqxw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 0/5] Add support for Sony Xperia SP
Message-Id: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRKWGgC/13MwQoCIRSF4VcZ7jpDxURb9R7DLExvjYRjeEuKw
 XfPhlYt/wPnW4GwRCQ4DisUrJFiXnrI3QB+dssVWQy9QXJ54JoLligZqzmj4F0JDKUIqKxzBhX
 0073gJb42cJx6z5Eeubw3v4rv+qOE+qeqYJx571FLq6Q56xMlt9yelAvtfU4wtdY+yxbUt7EAA
 AA=
X-Change-ID: 20250601-msm8960-sdcard-e21de49aa8e4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616795; l=2505;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=2FBjTisACpH9fj5OF0/0Lwq1a5pOglylkWwX9ve/Z9c=;
 b=9YqKaD/Zj39dXWbHZ4NqTUEpjMFjbnTQztL1KLjqLzFH7pRR00m7fnqgHT+wE9YF4I2zz/EA6
 Ixkj5b9vOoXBbh+ROQx1jgnPPz+yYoO3kJcpWD9p9lYf0yJZ6IHVbmG
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:36 +0000 (UTC)
X-CM-Envelope: MS4xfFr14+EZCO+7OKCq5lOGyxFjatEttFkEWMrD5alRA1n+irfH9zWq6HWiE2PRWMz9PgGjgmtXScCnfIrvQi0GmUqZJyvTeGMPVNjQH+sKMV9l/NFqbYZB xCbgvAqUndRAHlxElXeRBJohNxr3emVKPgj0550mUynPUhaflRNvKvdjP5hhVHT7oh59JNQJs1HjXaB/guCuCJJm71Da93lAC43/VG1rdxsnypsSy9lXyXc8 tgQuW2pR9uXqA6ZWxDV3YUkRCwMB9PRllEHj81S2Ma0j7deeJvXYzfjGxcXN2bq88M8Ra7p4BoZsFQl7aLGdmssE8vGBMeTr+WnP0iO8U2Ojh+31jwqyB6L2 BCEr92e/Boxt4KTz2tj/PSSrL/pQe2piKEE0BWhLU1nP+ahhcld/CvbavV3xy5uTU2ZiO9GEZZVSt+uMtd823hhY2E8rPjKtr4qhEnrplMEwvx5k2lNomu8I YtTIOcD4NVeU5O6AglzkoAYfFHyAhYv7///bfT1tQZ6owcrT8aVcq9zvbSg=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584ade a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=nOCiSSVSubMVZeN752YA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

This patch series adds initial support for the Sony Xperia SP (codename:
sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC. The
MSM8960T is a variant of the MSM8960 featuring an upgraded GPU (Adreno
320 instead of Adreno 225) and a slightly overclocked CPU (1.7GHz
instead of 1.5GHz).

The following changes are included:

1. Adding sdcc3 pinctrl states to ensure micro SD card functionality.
2. Adding gsbi8 node and serial configuration for the MSM8960 SoC.
3. Disabling unused gsbi1 and gsbi5 nodes in the MSM8960 SoC device
   tree.
4. Documentation for the Sony Xperia SP.
5. Initial device tree support for the Sony Xperia SP, including serial
   console, GPIO keys, PM8921 keypad, eMMC, micro SD card, and USB OTG.

This patch series has been tested on the non-LTE variant of the
Xperia SP.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Changes in v2:
- Add explicit bias-pull-up to sdcc3_sleep_state
  The Xperia SP board file actually uses bias-pull-down, but further
  validation is needed to determine if this is a quirk. I checked the
  generic MSM8960 and Samsung Express board files, and both use
  bias-pull-up, so I believe this is the correct approach.
- Fix alignment on gsbi8 node on qcom-msm8960.dtsi
- Add new line before status in gsbi1 and gsbi5 nodes in
  qcom-msm8960.dtsi
- Add short booting notes to the qcom-msm8960-sony-huashan.dts commit
  message
- Link to v1: https://lore.kernel.org/r/20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com

---
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  40 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  32 ++
 6 files changed, 446 insertions(+)
---
base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
change-id: 20250601-msm8960-sdcard-e21de49aa8e4

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


