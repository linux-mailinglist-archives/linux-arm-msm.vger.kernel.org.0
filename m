Return-Path: <linux-arm-msm+bounces-92108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ3rAxnshmnDRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 08:39:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833EB105238
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 08:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 780D23007483
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 07:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877252F744A;
	Sat,  7 Feb 2026 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="No0SgX4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m21467.qiye.163.com (mail-m21467.qiye.163.com [117.135.214.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580842857C7;
	Sat,  7 Feb 2026 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449939; cv=none; b=LJ1jgzIN33S7d4Sfshy8mXo0jr1oWtbQ2E69/+C5LbuoQcZJuDO6kE63dsISkONLE3ymN5bVNGCDpkD3klZYF17MI97/t5omehHkF92ei6Ja8ZO72HfeZhFb8ggOfZIHymgGed1FkHiH56HXxvCdvZf9R14w1JRHdvX6gffEAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449939; c=relaxed/simple;
	bh=bDP3hx0259pprjh+K2o5PYpEoQCe2saFDVKumA7/C9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T7ejv8c/dv+tPbYpo3pDsBNjXML7U0EHuTrQy39NC1ZxJ8RL4MCeXRMmhfCtXgVleydK5od6MKgkFCfzP+dqfo+RTJAmzmEoCdGAG6BGs+kIyh1YWiF2GTeLDrU7R6JHtxaHjreTH6H6xFybLjkES3I9OTgoTlerwiKu6gOqm5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=No0SgX4S; arc=none smtp.client-ip=117.135.214.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [113.235.123.225])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf65d;
	Sat, 7 Feb 2026 15:33:36 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v3 0/3] Add DSI Port B input support for LT9611 HDMI bridge
Date: Sat, 07 Feb 2026 15:32:53 +0800
Message-Id: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKXqhmkC/4XNTQ7CIBCG4as0rMXAKP1x5T2MiwJTS4zQACU1T
 e8urRsTY1y+XzLPzCSgNxjIqZiJx2SCcTbHYVcQ1bf2htTo3AQYlIxDRf0ozX0w1OIU6XvlJW0
 axbXEVjA8knw7eOzMtLmXa+7ehOj8c3uT+Lr+ExOnjDKoS1UJLpgS59iPVqMProt75R5kdRN8W
 vUvC7IlW8EV1hqkhm9rWZYX8790qQwBAAA=
X-Change-ID: 20260127-rubikpi-next-20260116-99c1dbea50e4
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=1956;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=bDP3hx0259pprjh+K2o5PYpEoQCe2saFDVKumA7/C9A=;
 b=eetxF5m3iGkUNwCp/TkyTHsix9a8PMxhFPpOO5nYZ6xEAGzyAZ4KwkCh1z7NA1joPPXGOWPPZ
 HyS9SwA32JqCMiP3Y7cLkfzAf0l57CaxawWkh3qz7rGxUBty/oSjdnQ
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c37053cb009d5kunm3723250e7f3055
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh1OVhpNQhlMGUNOGhkaGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=No0SgX4SD3TvjSIs1OmDLkBosQ9BsOhjElWSp1RpBWyjnaP7DswSaACfl0Vcevl28l9hzAXIiAbPCxnrNpHP5VmHwj5vfHEmuuXJDjIhqzRtHn8v459jU7/Dtsv0D0PABoGzFWE5whYGYyJ+UCWxXIOgqB5/dvjKOTd5jkt9lNM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=/A8bo6qfto91b4n9cieuLRsSkhHM9gJRuxTe8hTLdC8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid]
X-Rspamd-Queue-Id: 833EB105238
X-Rspamd-Action: no action

The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
The current driver only supports Port A or dual-port (A+B) mode, but
some boards like RubikPi3 connect DSI to Port B only.

This series adds support for using DSI Port B as the input source by
utilizing the existing ports mechanism in devicetree:

- port@0 corresponds to LT9611 DSI Port A input
- port@1 corresponds to LT9611 DSI Port B input

The driver detects which ports are populated and configures the hardware
accordingly. When only port@1 is present, it configures port swap
(register 0x8303 bit 6) and byte_clk source (register 0x8250 bit 3:2)
for Port B operation.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v3:
- v2 incorporates significant changes based on Neil's review of v1,
  so remove Roger’s Reviewed-by tag from the v2 commit message.
- Link to v2: https://patch.msgid.link/20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com

Changes in v2:
- Use ports mechanism instead of boolean property
- port@0 corresponds to LT9611 Port A, port@1 to Port B
- Driver detects which port is populated and configures accordingly
- Link to v1: https://lore.kernel.org/r/20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com

---
Hongyang Zhao (3):
      dt-bindings: display: lt9611: Support single Port B input
      drm/bridge: lt9611: Add support for single Port B input
      arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B

 .../bindings/display/bridge/lontium,lt9611.yaml    | 15 +++++--
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 46 +++++++++++++++-------
 3 files changed, 47 insertions(+), 22 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260127-rubikpi-next-20260116-99c1dbea50e4

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


