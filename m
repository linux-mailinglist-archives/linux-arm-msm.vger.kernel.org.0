Return-Path: <linux-arm-msm+bounces-105518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIfOLgjQ9Gk8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:08:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2654ADEF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35D54304F868
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968423D331D;
	Fri,  1 May 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="cRz6Y2NZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2004j-snip4-2.eps.apple.com [57.103.65.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C68D3B2FF8
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650995; cv=none; b=tRvOtGgUYsU2ZfQj3m1L8qWMBRWvSrvt24GOrFj5j+53CHuuFqkj7nRgppMVa7RGuJp0niwe17Yl11UuDy2sGj1dSiWICSQOwcwexpryJcimq+8R/+m1JJbgzws//1vxxjUYe3CquBY319x1dYQJGtf7MrFYe9y/BnpUsv3wO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650995; c=relaxed/simple;
	bh=YfIRItDn14CNBMZcCOaaF94rc9K0uQaalpnoXSA1g8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rg27s+mX7eBjz4Jd7cvLmeGRMwV1Z7TY3Mh5G9J/um7PTuDmcFCZPG1wK41xNOTTMfxsZuc51M2VHl1ZLSCgtzCW7gPSyMpReLRpKEm/5K09xr3u9kKqM4sjdwx/JCyYZbwzgMtY8jpPijG9ZvwxFJ9U6vnx1uS8nwWY9gmNX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=cRz6Y2NZ; arc=none smtp.client-ip=57.103.65.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-6 (Postfix) with ESMTPS id 232D01800240;
	Fri, 01 May 2026 15:56:31 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YDXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777650993; x=1780242993; bh=ZZtWfVzaHJWKMPy9qGU8l0N1qwLoNuG8Asya+JqQJvA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=cRz6Y2NZhSiTfVBTkhVgvW8sgaaAHQnMlhrZrvXHX3mPmtKxZCcQSSELWN4LrXcCB4XvfQ73wQdAtVrk/pGxeUzhrmKrmGjD3148QR6UHLhX8heUf5sqkhhLXAJ0FChkGDiCDnlTqEZzqFik0P9LIFceQaVIS4RP29RMgZlHUEePyE4rLx/uatmlTXwYEEFDitznImMV7O9rH1vKIpe6v92Wnv4Y+0MLwNdxDKgWPF339axPg6xUPzrzthJV7M0CwKoGxlnG0POBNkUkrqFs0lY+i2CcUulOS1I+6qFpMixkHEaKNv05weq7P/0sQTbQXNIPlN7PSjzN/sKfwqWmOA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-6 (Postfix) with ESMTPSA id E98011800238;
	Fri, 01 May 2026 15:56:30 +0000 (UTC)
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
Subject: [PATCH 0/4] Introduce HONOR MagicBook Art 14 device tree
Date: Fri,  1 May 2026 22:56:08 +0700
Message-ID: <20260501155612.5490-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m9iP05F2jfFm_qhLumZoSpI-ybNyn_1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfX1GYF9n+iMLM5
 jwtW5WcFqEAUy+jpzofWIaAACpukYCxJ9BntZfIdPmuQ0dpsHiwJ/w1rT13tDb2ncZf8KhxMhsN
 VR0fLO4qAKf67IWpL7iv+2uBwLZQiM5Tw0HL+pSBmo90zR7DuonoacIz1EPBO/+2NB3j84oN0uj
 0q122omiLCzkR5sflF91TKN1iW3oTro51hU1TtPl9f92Nix7e81UtC3AQRuouMzfE/tlojpLT+x
 5wjqcq6f40Zdt8Iv1JXayEJCJ90qD+HSizFukcn4H+v0oAYlmv20I18UECLArum3OBCPFClez1X
 zWSpcx/2xYRrccNslxU/RxPMUmkyA8d5em6iNSh+b9M+WoAQzN6x6duEfdk0Tc=
X-Proofpoint-ORIG-GUID: m9iP05F2jfFm_qhLumZoSpI-ybNyn_1K
X-Authority-Info-Out: v=2.4 cv=auK/yCZV c=1 sm=1 tr=0 ts=69f4cd31
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=z9go4UkmAAAA:20 a=7tzHwC8QtcCRmX470X4A:9
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Rspamd-Queue-Id: BA2654ADEF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:dkim,etehtsea.me:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


Introduce support for the HONOR MagicBook Art 14 laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with an external display connected to the HDMI port as
a daily driver for quite some time now.

Supported:

- Sound (with alsa-ucm-conf config [5])
  - Speakers
  - Headphone jack
- Bluetooth
- Battery
- HDMI
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
- DP over USB-C

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755

Konstantin Shabanov (4):
  dt-bindings: vendor-prefixes: Add HONOR
  dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
  arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
  firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1542 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
--
2.53.0

