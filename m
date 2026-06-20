Return-Path: <linux-arm-msm+bounces-113888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VRYvNYLTNmpBFQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914C6A96B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=pnQZv99t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E6F3015716
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308463446C4;
	Sat, 20 Jun 2026 17:53:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host7-snip4-7.eps.apple.com [57.103.76.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D2224AFA
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 17:52:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977980; cv=none; b=XTnQOcEMwbFA22setwZs4Bt52OUvf1CC3LgVp9U99bwEDmslskAZvORJe1dxnJSxvKhZCJItv7qKVYRV1Rsh3vJlgyHZTMTKHADn+cxudUNPnQzkhmIkTsF0aZ5RVrCsUuoeUSLrnktQEKwzp62J5CV5/DsTxQHFER5IC220I9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977980; c=relaxed/simple;
	bh=OYOz2+Mv+1vLRIAfoeASfc2Bz1jkX9VMrB+3c43QTK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZv89zGqsPKPSSu7vEQGU8+ic/UQIN6ZKxLnNQd1/UJCAnm5x9y5OFWo6YT2aBdPZ6N6N7/+Fyu/ascG9aCMNqqxDg56K4sBy3qK5wA2Nf/DXVW3QiSd8GWPhqyL22V9YxfUqyb+qFBXuVFegsWYjyGcZzXDLICQhZ6cD+MmO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=pnQZv99t; arc=none smtp.client-ip=57.103.76.70
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPS id 08198180042C;
	Sat, 20 Jun 2026 17:52:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVFC0kDQwZSB0YKVQJAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977976; x=1784569976; bh=j1X/Ds2feGMKaXdIajPmaqIDJt4TQxievyJDnIh8RDc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=pnQZv99tQc0fK7jSREMszQ8qkD1UhDvAjjxYjP+wjYMPz6gjySKYRoAWanMNN92puNMy0x9n2tCqHz6jmH0OjeNDr8bZ52Z6myX1YMpSAmH2KqQcekOKyC180CfItoByBnJFgHPqNT+/16wcijdfNS28yzQfmS5y7/C6sKW0seQFdpKjmSRlFSnvT5GsKLbJpMttPG+rrkCOR3BoE+FPvdnc5H7WOLp5i3DU5HImGryqeFQWXGYj5ZU1rxFM1I+MZgH4H4n/Q+WJaexpLA1t0+eRahUDBCnwxlsxJ0sQzC9VvBfwH4V8Uetn3IDGQ9AitzyVQ70LmAA7lRGY2NCLeA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPSA id 3EAE818002DA;
	Sat, 20 Jun 2026 17:52:54 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sun, 21 Jun 2026 00:51:54 +0700
Message-ID: <20260620175210.19563-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Yr7jeoXRAIpz4NqQdDqXyZClyE3NHLY4
X-Proofpoint-GUID: Yr7jeoXRAIpz4NqQdDqXyZClyE3NHLY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX291u3NahS3wL
 B6rrQ7YfuCkqL53RnN4TyVoXxZc9x0MMsK+iO0LfuvxJc3RVSr82lb/rDk84a1XOT08YELp6Qc3
 /GEETiy6wL5A2cvgLRPi5iBu9qtdZojD3zAF+FdGX4wWNlddXbkKSgYtRYKXIvLZPMfVHNAKHIk
 TtdsIXLF1l2jrwNzQUj5BBaEYeEr++2Wy5oA9492a5TNSDUcmEkhhc02fH4UfpeViZB4DRrlSFx
 jvPKuP2htLBqZvCUFURxcUJKAMC31QKPmpj17vv1alXbmBWsu5N7Nxo4jGvE6/c6k+dlL5ujGgb
 QpFX6eCgVTIK6rpUPed
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113888-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[etehtsea.me];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etehtsea.me:dkim,etehtsea.me:mid,etehtsea.me:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6914C6A96B1

Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with an external display connected to the HDMI port as
a daily driver for some time now.

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
Changes in v3:
- Update sound model to the board's name
- Dropped unnecessary output-foo properties as they are controlled by the driver
- Reordered properties alphabetically where needed
- Updated mdss_dp0_out from 2 to 4 data lanes
- Dropped extraneous USB related comments
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260515172926.16597-1-mail@etehtsea.me

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
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1309 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1315 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 9ecfb2f7287a967b418ba69f10d45ead0d360593
--
2.54.0

