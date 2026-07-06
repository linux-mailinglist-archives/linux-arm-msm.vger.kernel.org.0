Return-Path: <linux-arm-msm+bounces-117015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5YaXJxkOTGoAfgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:20:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB47155F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:20:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117015-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117015-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA3330A7005
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D540C3D7D97;
	Mon,  6 Jul 2026 19:22:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936973D75A1;
	Mon,  6 Jul 2026 19:22:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365776; cv=none; b=jFEWQRr6R7bb1XlLogtu+aw8CRHS1jJIA7jIR2hfh/xRY2HXVpkZpr1wku5gVsC2/yjBuxRhEOniL5p/8vYJEy3qbhWMnNu2QEo3ZmNIGFtt/pRtlShWatyqp09sywc6dZJ5xlq2XYdR54OLyzG/84Kfgpn0f1Y9X3+do2Oofeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365776; c=relaxed/simple;
	bh=4HdCUlKl2jxE90r5lCVy4pFlF5Ba+jv6ykjiHzgKjvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDFKpobOkoqN9+GN6SmW/fcX/tis9HnvQLP2X8h9Jyj8n+W0yPxPoxSn6JMF5rO/9AN2TbAc9ahuo+rEfVgUgkaZPSKy1x8MCkaL4zYFyGq2YAzKEfDAyShZ0cfenXzY8qfUMjVBXplygGvhg2R+XfwkgutGrcUasxbiIax7Uuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvDlC59W5z3hhTH;
	Mon,  6 Jul 2026 15:22:31 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: codecs: add the Qualcomm WCD9378 audio codec
Date: Mon,  6 Jul 2026 21:22:26 +0200
Message-ID: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117015-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[catcrafts.net,kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,catcrafts.net:mid,catcrafts.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35FB47155F7

This series adds bindings and a codec driver for the Qualcomm WCD9378,
found on SM7635 boards such as the Fairphone 6. The chip pairs a
WCD937x-compatible analog core with SDCA-style function blocks whose
built-in sequencers handle the analog power-up/down; all control
registers, analog core included, sit in a 32-bit paged SDCA control
address space behind the TX SoundWire slave.

The driver implements the TX/capture paths (three ADCs fed from four
analog microphone inputs, three mic bias supplies) and is modeled on
wcd937x, reusing the wcd-common helpers. RX/playback, MBHC and the
SmartAMP function are follow-up work. Register sequences come from the
GPL downstream wcd9378 driver in Qualcomm's audio-kernel-ar tree; the
chip has no public datasheet.

One dependency outside this series: the paged register map needs the
Qualcomm SoundWire controller to implement SCP address paging, posted
separately to the soundwire tree as
"soundwire: qcom: add SCP address paging support". Without it the
codec enumerates but every paged register access silently reads zero.
There is no compile-time dependency, so the two can go through their
respective trees in any order; capture just needs both to land.

Patch 1 moves the qcom,micbias4-microvolt requirement out of
qcom,wcd93xx-common.yaml into the codecs that have four mic bias
supplies, so the three-bias WCD9378 binding in patch 2 can reference
the common schema. Patch 3 is the driver itself.

Tested on the Fairphone 6 (SM7635): handset mic capture through the
LPASS TX macro at 48 kHz across reboots, including UCM-driven use by
PipeWire in a Plasma Mobile session. The board DTS follows once these
bindings are accepted.

Jorijn van der Graaf (3):
  ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
  ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
  ASoC: codecs: wcd9378: add TX/capture codec driver

 .../bindings/sound/qcom,wcd9378-codec.yaml    |   76 +
 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  122 ++
 .../bindings/sound/qcom,wcd937x.yaml          |    1 +
 .../bindings/sound/qcom,wcd938x.yaml          |    1 +
 .../bindings/sound/qcom,wcd939x.yaml          |    1 +
 .../bindings/sound/qcom,wcd93xx-common.yaml   |    1 -
 sound/soc/codecs/Kconfig                      |   19 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd9378-sdw.c                |  495 ++++++
 sound/soc/codecs/wcd9378.c                    | 1382 +++++++++++++++++
 sound/soc/codecs/wcd9378.h                    |  246 +++
 11 files changed, 2350 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 create mode 100644 sound/soc/codecs/wcd9378.c
 create mode 100644 sound/soc/codecs/wcd9378.h

-- 
2.55.0


