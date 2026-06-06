Return-Path: <linux-arm-msm+bounces-111528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /KMDL8txJGq56gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:15:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 208B564E1A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 21:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=aopiUIlB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7340303663C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 19:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE7C3BCD0A;
	Sat,  6 Jun 2026 19:14:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m32113.qiye.163.com (mail-m32113.qiye.163.com [220.197.32.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653B2D8DD0;
	Sat,  6 Jun 2026 19:14:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773271; cv=none; b=m+pvRnnpPK6AeVw01nc3bT82To0XH6XR2TAfgkdVN53n8IXbE7wLfnPqBEwC58Vo0K6t88nCF1/ODDm/a7So0wEEL1HuM+xA157s0ndbLY5MU2K/l5uqwJYpjx4a0Zq9wxQqxLoH199bBVuBrLtuWTeEEcSM3NdgnkMsZcHkM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773271; c=relaxed/simple;
	bh=IABZdxqTlxrkAaJmB/SbLJ3bBbi85l6Cufavt9VzJr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TqYGUNBsME0uYA82W7XdqOjNHkn4sEJARYy6o/aSU1ZLYxd1Bvgkr0ZRkBR0g+mVzEUYWnWAaNy6QvO8IGB7LaN6QLo9trjJ/DQrUENshzWzU8oqaN7Bb9+YsggOYGajPg+e94ymcghD8Mt62g4JL2ItOdekkvUTHUIrdCzO1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=aopiUIlB; arc=none smtp.client-ip=220.197.32.113
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a25036;
	Sun, 7 Jun 2026 02:58:40 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/5] Add audio support for QCS6490 RubikPi3
Date: Sun, 07 Jun 2026 02:58:16 +0800
Message-Id: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhtJGoC/z3MywqAIBCF4VeJWSeodKNXiRamU02BhVYE0rtnB
 S2/A+cP4NEReqiTAA4P8rTYCJEmoEdlB2RkokFyWfCC58ztHc0rMYvnxv61N0YJkVUyMyXE7+q
 wp/PtNu1nv3cT6u2JwXXdXt+yonkAAAA=
X-Change-ID: 20260605-rubikpi-next-20260605-fdda114824d7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=2048;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=IABZdxqTlxrkAaJmB/SbLJ3bBbi85l6Cufavt9VzJr0=;
 b=DLy1KBU96IPFfCZ47AKDLWzKxCnoAj166h4I62bkXoOa+LJHHZHYy5DPgo3PS9ihpBxEUr8uL
 cLWYb6N2+F8BecqgwW9+IOwtINiC6bHopXjhNRr7jbaPflmQrIHqNDb
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d33d609d5kunm343af971138ad4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx8aVh4fSR1MSUpNHkhDT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PS1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=aopiUIlBTgUq8fNPkhb+/npOJ7x+bkViNOTC3EtoXmw310p5zdTdJEvuVNBucvnifx86PXkbXQ8JVCmcRAVm7Lgr/+L102K+Lu55yaLYjjkojT3JCZILtR2OGlEBY2WY8uEqFm4TsGr/m/dhc6p6kgh7xpU+VN/Kb/vWVv0UAH4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=hQ46BKVamGSK3m9eVxhd/n4maC8WpfGZkI/xp74gi4o=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111528-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 208B564E1A5

Add audio support for the Thundercomm RubikPi3 board based on QCS6490.

RubikPi3 uses AudioReach/GPR on the ADSP, an ES8316 headset codec on
primary MI2S, HDMI audio through the LT9611 bridge, and SPDIF TX/RX
on tertiary MI2S exposed on the 40-pin header.

The series first documents the ES8316 jack detect inversion property
and the board-specific Qualcomm sound card compatible. It then adds the
missing q6prm MCLK IDs required to drive the external codec MCLK.

The sc8280xp machine driver is extended with per-card data so the
RubikPi3 MI2S DAI format, MCLK, BE parameters and headset jack pins
can be handled without adding DAI format properties to devicetree.

The final patch describes the RubikPi3 audio hardware in devicetree.

Tested on Thundercomm RubikPi3:
- HDMI playback
- Headset playback and capture
- Headset jack detection

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (4):
      ASoC: dt-bindings: es8316: Document jack detect inversion
      ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3 sound card
      ASoC: qcom: sc8280xp: Add per-card data
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

Neil Armstrong (1):
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 196 +++++++++++++
 sound/soc/qcom/common.c                            |  75 ++++-
 sound/soc/qcom/common.h                            |   6 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 +
 sound/soc/qcom/sc8280xp.c                          | 319 +++++++++++++++++++--
 8 files changed, 575 insertions(+), 43 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260605-rubikpi-next-20260605-fdda114824d7

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


