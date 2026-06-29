Return-Path: <linux-arm-msm+bounces-115200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y1M5BkCWQmrP+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E736DD088
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:58:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=RsAH5fg1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B65123062E26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6032043E9C3;
	Mon, 29 Jun 2026 15:48:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host6-snip4-10.eps.apple.com [57.103.76.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597D428473
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:48:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748114; cv=none; b=JeBA1F5HA2gZ+us0Wx+qq0fH5BVk3ROV3iyL8aOmU9yf/76dTCDOr9REy1E8NHXEa82k5eRq62BRBmCfKZvjk20AiYWke1Y7KHPL7izHroGR2pQlrNbEGWltFiJlXLHf897jytLvcQ91t8r9xy/6In1C4pP82yfguVB2Y7wyWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748114; c=relaxed/simple;
	bh=nt1xidh77PLL11Xy5ZZwkKmLhdJucIs7UxpbLbnci9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Acy287JnQYFH9G6JX1gja/I2MQ/G88IurAXiLlxazS+Qiw0rUBVZl9PjX5pHDWj6PMsgxTG2N1h13FE+m5DrFnbwl0vu0fDmYmGFuY0uVZ8yG+yMUHuw9onPaUxFKzHx/SZhFGldv8k2wfMrHb/DJ4B57X/ZGI4KxoGWBwNRcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=RsAH5fg1; arc=none smtp.client-ip=57.103.76.103
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-3 (Postfix) with ESMTPS id E02B61801BD9;
	Mon, 29 Jun 2026 15:48:27 +0000 (UTC)
X-ICL-RepId: 019f1411-5409-70ad-beef-2c032225d4c7
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVABkZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748111; x=1785340111; bh=oGgt+abRxX+I/sSsG1kHOzXeO7wMvb/snFF6mT8Ykjs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RsAH5fg1xYTnP1GR+ysLaIflE+liLVqChI2Sm5+R8BAtSWX2O7DOqCur+PzujOSJqUMFuMFaGsM8nVTH0Bx0MhMFHq3vDDL/MWva5gE4K+2Iuf58Dsm2UwoP9B6fk8zl4m5tuU++H4S8LpI8tRy0VW093WK7WaXNHy0IqWdATkU0W14viutgA8Ht1uO3FcBiBCrj1uwiLNyIPEpImW11fSlK34Bg7b4hK2qChyu074uUtPyZGuZxvjx4M3Nhz5xJRLtG4usF/B74c6QjHQRZkOrEPwh3Jxvex6rprHG8v9OdHdXPTj3+2SpJOUpWUvjd8H+dBXT4yN+rwRM4dFiWRQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-3 (Postfix) with ESMTPSA id 6A6FC1800218;
	Mon, 29 Jun 2026 15:48:25 +0000 (UTC)
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
Subject: [PATCH v6 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Mon, 29 Jun 2026 22:48:08 +0700
Message-ID: <20260629154812.9066-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX3q6nzKfsh+CE
 Do1Wk4brdmhrQ7IYRzPjta4+oQcNrR7/goN3ImHbWH2lXsLVG7JS/gfZbDUdQLr6KolKmdYMGyP
 9kahfeHMfqfkVzRLvBxS8IQ8Ims/R6VTxBcsGxnSoMaPc9B3gZ8B3PAyxf070gi1TgoXksZ53eb
 REmW44XOe/eIrKQwrJggPeZtCWt+fnHYP3cE1kTErpP+0pVz3mqrv5qSL2xLBa09p5HZIWK5NiS
 lO/c6/1nUlTXQKVwCFAFvES2RahHXa80jDxwru14QYUDB3BbCpSRgovFMcle9RhfPL0LU4qGhYN
 JzBgcd9h02CZLZFsNnK
X-Proofpoint-ORIG-GUID: e3dYQX4_p1C13rU1JO27WYDNglv68xii
X-Proofpoint-GUID: e3dYQX4_p1C13rU1JO27WYDNglv68xii
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115200-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E736DD088

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
Changes in v6:
- Reordered some more nodes
- Fixed indentation
- Declared missing phys to usb_mp
- Link to v5: https://lore.kernel.org/linux-arm-msm/20260628172640.23167-1-mail@etehtsea.me

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
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1341 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1347 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
--
2.54.0

