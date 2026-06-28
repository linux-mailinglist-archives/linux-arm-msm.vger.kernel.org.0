Return-Path: <linux-arm-msm+bounces-114787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C+MFNqRbQWpmoAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:36:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2A6D48E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:36:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=cj5wzwPu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E49300D69C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 17:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A662BE63F;
	Sun, 28 Jun 2026 17:36:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2003l-snip4-11.eps.apple.com [57.103.86.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7DA2BDC0B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:36:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668194; cv=none; b=dn3Yc4NycebdEZ6aEx0nCn1riXHLzd6mG9d9YjcqCZG6q+SD8rdqOeDcrrQkMqmb+hxwUf0oAoKJ6wPirQCtALnbohggLlRXGShbdxIf1YPD+Wy2AIMm1iXbVbI6GLqu8UawkZb026v7t5Ugv6Ec+qHbiyoEQUzGEvB+sFHCCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668194; c=relaxed/simple;
	bh=PaEV54u0UzWf/ynqUPT5fv2DRmlgWpcqPkgfIe9cPnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8sKFQ0MWsuFyLieYZhuMyzlwat+mkg1Alc8OOyKx8OaXbAD/DbTDiU9W9VJWOm0VVif7hrheAl3C2U0cF7TXqKckcorerMtldmyxLSedx29NILPDMuI7g97oziV95MLgkYE5aHIneoYAe5ZOY5TrlRR5esKUt1P0l51KIVK0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=cj5wzwPu; arc=none smtp.client-ip=57.103.86.123
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-1 (Postfix) with ESMTPS id 150EE1800F83;
	Sun, 28 Jun 2026 17:36:27 +0000 (UTC)
X-ICL-RepId: 019f0f4d-d914-7901-a730-5b052ff0d8a0
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGlofHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668191; x=1785260191; bh=e1rpYzzmHerF+0vitXqtGeA4NeV4/a9bvahmDR6kY7M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=cj5wzwPuXhzkkxraFmg013wG9s3NwQ+0d62GuCDRxgn5AyVxKkGhS/4OkiglsEkOlUxId5gRBIUj4sVZ6h0pW+BWTUKuTbhPgekw3PmtqWqiRhmOEXE/Yhkqj/A+KDaTV8Ey8shMhMgp98eiKoO3hlQapOFZqVTOaXztyTXneT2InulHRYYmosGx5hIhaOMihj84oPbEKfoNpbFUtM34fiCUEr1H6ymwVMc8zOlmUx5H44dvwfpFU2DFtmDk6ItFz1HTFy01Fpk58uMM2lZM4cgSEWkPSoXZJFqHRszAvt/CS6UF0eoFbr7SHLyitRoxHiQ4w+XH1YfwE7oW5LOlKQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-1 (Postfix) with ESMTPSA id 61BC6180016A;
	Sun, 28 Jun 2026 17:36:26 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v5 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Mon, 29 Jun 2026 00:26:36 +0700
Message-ID: <20260628172640.23167-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XOddrQ2xrhJS-unZnGe4krZp_6Fts2-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NyBTYWx0ZWRfXw1RUHV0fK3NC
 gBebpK3X3CZ0QBKxPbrqP1XYbivVFY+RACUOvIT0xlulf7y3rs90Rc9aALBp5vQ4WdQfBygBUAk
 ngfUz6h3YPFC2ZTUqxx8uvYIQ/Tb2DHFWNRTGEcMOUytv8j+6Nu2xzRgIng3krjwRNeOZ+7cm/Q
 akxlEZ0qT6tuemmdsle2V27UTS+vkqAMoZk0NIQ+ahnZa1bOW/sDM6WoF1U7rC0msVCJWMD0xiE
 nCVgNqe58Sz1hga3APwSAoAIsCWCfZ29X9334xXEcsIZGA7pjjc8IzysO9C1NuVj01hRoZvobD9
 ZdsMzyzV2MXf3pHpgbF
X-Proofpoint-GUID: XOddrQ2xrhJS-unZnGe4krZp_6Fts2-e
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114787-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-hardware.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22D2A6D48E7

Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with two external displays connected to the HDMI port and
DP<->USB-C (over external hub) as a daily driver.

eDP support is disabled and hopefully will be addressed in
the follow-up [1]. I can confirm that the RFC patch by the link fixes
output corruption (thanks Valentin!). Though, I have a suspicion that
the issue can be resolved w/o introducing the panel driver as the very
same panel seems to work out of the box in x86 version of
the laptop [7].

Another caveat is USB-C orientation as I could boot from an external SSD
only with specific cable orientation. I've tried the patch [8] but got
some instabilities (last checked before v4 submission) , so put it
out of scope for the initial submission.

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

Disabled:

- eDP

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/qcom-x1e-7.0/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
[6]: https://lore.kernel.org/linux-arm-msm/2095cb86-6729-41f3-a0f3-b806d6acafd3@mrs.ro/
[7]: https://linux-hardware.org/?id=eisa:edo-edo4179
[8]: https://github.com/vamanea/linux-magicbook/commit/b855efb02268677d84dac4b9e27b1c5c9425d81d.patch
---
Changes in v5:
- Added hdmi-bridge definition compatible with simple-bridge
- Link to v4: https://lore.kernel.org/linux-arm-msm/20260628094031.54452-1-mail@etehtsea.me

Changes in v4:
- Dropped output-foo properties from TLMM pins
- Sorted pins by their index
- Dropped data-lanes from mdss_dpX to use the default (4-lane)
- Added a space before the opening bracket in the comment
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260620175210.19563-1-mail@etehtsea.me

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
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1330 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1336 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
--
2.54.0

