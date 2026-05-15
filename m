Return-Path: <linux-arm-msm+bounces-107957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN0mLndfB2pa0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:01:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA7555C92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1333D3281EE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34973DB623;
	Fri, 15 May 2026 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="hgcuTnjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2005i-snip4-11.eps.apple.com [57.103.89.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AD3DA7E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.89.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866183; cv=none; b=nu43k9f8Hykp5+iSj3zbTEgupaLVnXxIgBC8bQ70NbmURNvr4v5kkU86Q+yzLx8C/gM7hQaouBecKYvP/9BHYHE1Q0qvhDM3q+YIe7tfAt09pCa/RI1inHVNEgXsdJzMi4BUXjhDN7l86JlMHpCI7cOi3HTvg1s+P6zTTFvNVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866183; c=relaxed/simple;
	bh=W3l7a7YTs0FnG2tMoAdShNavMQSpVfyiuh/sPwwZJLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZVvdTmydyWV1HcEKywZb/jfvCogtMUsRmuYCJ1Y1v3H7IdFfIfD2h+Xyxd+3+camgGr8wVhLluQhXigzwXxC2XyhKUWvjvvXfshukFvnoJ3M275HMgEiKEhXkqvYjblCtc0xTD4ZdhfcA3eyYr8G3KYDqzsxWqQm39KzIuIXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=hgcuTnjV; arc=none smtp.client-ip=57.103.89.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPS id DA49E18003BC;
	Fri, 15 May 2026 17:29:40 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXloRHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCE0CWgVSAEYXSQVYDlwfQRQVUgRbK1cEXBBHHlIKHB1cRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1778866181; x=1781458181; bh=AhRIg9TaLC7KZPAE4b6a3NupgUoxNT9U9Naf8sMrt+Y=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=hgcuTnjVJ2I9AYeOHXeX18A1pIizPe0ihk8H1dgyWPp+EBDmuGJc2J4168LJfLqila6RRSgsE/+bgMgBndEpJjbqrVH8+3ULwoX43QONygUnImxPtEtmIvVXPLIXrl6FCbDindJbsq/pYR/Apgvgz+7h9wkH5jiM8STLrSaRA41MhpzV1qwNgq+PBn9MdHNJkMaNMlaG5t9F8SD/JYsiJx2rxbqESrM4YeCwGOo+cFAxOWKFXAm7d+NnXqlz3E97rwzaVpRgtNexPISO5WBzeFK02tTF7xoW2NTRtla2eDMWF+sLAdUE2icg/uD2xaUwsXhYNB85RfLB9wWX81nc5g==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPSA id 32CE118003A0;
	Fri, 15 May 2026 17:29:40 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v2 0/4] Introduce HONOR MagicBook Art 14 device tree
Date: Sat, 16 May 2026 00:29:22 +0700
Message-ID: <20260515172926.16597-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=P9k3RyAu c=1 sm=1 tr=0 ts=6a075805
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=z9go4UkmAAAA:20 a=K29ybRGQ_vFJyb2kU-YA:9
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3OSBTYWx0ZWRfX0DJYbcvXE7me
 7a8l086P97xhotmkTm4ek5zusHPD+0DhFD044DQpUoHMEwNlMGQPUp/+Mvc7eMt9oo2uii0j0GE
 HK3UnVw5w4WCjorRZrDsS3T6EtkfvgRri7i6MEeU77Ob+QjFLv1CbKHO+Rvh/nA7vCDzhEKdVWI
 F/CuNDowjCrDI2MwkTPTnuJpNPAgnDTLLt7s+9FjV7RHScGWqOKtaoM1DEuI0PmX5Nz4xrtD8s3
 c+jlCgt8zr3xA3IMvHb9oqH2zaM4DzLsQITXguV7ECqPtWloRCuojJq2vjeCV76Mh1tGRx1LV8l
 ZXH+0BTb+kuVrkBwuc9G/hWlciiCL0bbB4ZW5IJnOl+yZuTA9OFn2GIBsUhtzo=
X-Proofpoint-ORIG-GUID: DafAFvPBKgvPaceg5hk-MXI44-fjAR5Q
X-Proofpoint-GUID: DafAFvPBKgvPaceg5hk-MXI44-fjAR5Q
X-Rspamd-Queue-Id: 34FA7555C92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107957-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,etehtsea.me:mid,etehtsea.me:dkim]
X-Rspamd-Action: no action

Introduce support for the HONOR MagicBook Art 14 laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with an external display connected to the HDMI port as
a daily driver for quite some time now.

eDP support is broken (screen is eigher grey or grey with noise), thus,
keeping it disabled for now.

Supported:

- Sound (with alsa-ucm-conf config [5])
  - Speakers
  - Headphone jack
- Bluetooth
- Battery
- HDMI
- DP over USB-C
- Touchpad
- Keyboard (with backlight)
- Touchscreen
- WiFi
- USB-C ports
- USB-A port
- UFS
- H/W accel

Untested:

- Camera
- Fingerprint reader
- Sleep/Suspend

Broken:

- eDP

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
---
Changes in v2:
- Disabled eDP;
- Dropped displayport dai links (they weren't tested);
- Dropped SBU MUXes as they make DP over USB-C unreliable;
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260501155612.5490-1-mail@etehtsea.me
---
Konstantin Shabanov (4):
  dt-bindings: vendor-prefixes: Add HONOR
  dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
  arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
  firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1314 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1320 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 917719c412c48687d4a176965d1fa35320ec457c
--
2.53.0

