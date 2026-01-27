Return-Path: <linux-arm-msm+bounces-90650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJBMJkJieGmrpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:59:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7EC908D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DED8302D977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4F932C92B;
	Tue, 27 Jan 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="lpQjEdfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731114.qiye.163.com (mail-m19731114.qiye.163.com [220.197.31.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D28F5B;
	Tue, 27 Jan 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497134; cv=none; b=rnrtRaIg54M+5OWaq98VA15hEuT88I1OmVodo4bWRRjQbDRTL0q1QytflLS56RS7375xJurdzTGLFumbkJQrNDRhkZZvgtzvprufT5OYD5foukVgTIDJcGZLK2OBTs5bLWQ+u1RR2lAz1XMTqiqYUyMjtWkF0rk25pvIjDXX1as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497134; c=relaxed/simple;
	bh=c9hkmzjpn7RK1Ul3AWKzr+TPa3hLT2pnUnGl1FTO25M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/eHYwHCH0t9cZou02aHe4iP4FwDy2FjboqsYfR/yO5W/kccKs+SOw0vGyyF7qpWxGAhMWxUUbotSV8AIEbSVmuXKF53f4Svznq0Z6bLEm5D9Pebsd1wdRLvHyI2Uexg7XOAgB+6QVwugg6Z0ElXxWTfYHwRZL2bgycJ+ABb3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=lpQjEdfq; arc=none smtp.client-ip=220.197.31.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3219cb68c;
	Tue, 27 Jan 2026 14:58:40 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/3] Add DSI Port B input support for LT9611 HDMI bridge
Date: Tue, 27 Jan 2026 14:58:10 +0800
Message-Id: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJieGkC/yWMWwqAIBAAryL73YJKD+oq0YfWVktgohWBdPekP
 mdgJkGkwBShEwkCXRx5dxlUIWBcjVsIecoMWupaKt1gOC1vntHRfeBvVY1tO6rJkqkklZBbH2j
 m+/v2w/O8pEGWRGcAAAA=
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769497120; l=1312;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=c9hkmzjpn7RK1Ul3AWKzr+TPa3hLT2pnUnGl1FTO25M=;
 b=F6d208P7g78vpxNOT1hhHiVXRRZblEWauhOicn4PPsxf9tQukwBJC/cAXGc1yhgwH4oB5Sn0e
 HNIXl7NQpKdBM32vwA1vYIiCCsTYSLT9z5kLVxsS7foKKgoGEYYeUe2
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe3f4fef09d5kunm45ebbc0d8405b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSRodVkpIGBgaS0tLTRhNH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=lpQjEdfqvfOgPvBhe1xcinH0pSi2Gng0f1ChZpbUlOnpgN1q5lifyv0AkxmOcmIhdy2NZC1fkEruxYFyO+5+mYdkNsnf/iDnLmcuNmpVbuU6CV8IbP8HPYQn+JJbe1fszKXgeT8dPxfG16j/X6xisMWwULxzD1Ej4BNuOJfL4pM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=uU1q0ThUTAQaIAAqXKQhLwthvHON05TegGAjtRva1qQ=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90650-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE7EC908D3
X-Rspamd-Action: no action

The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
The current driver only supports Port A or dual-port (A+B) mode, but
some boards like RubikPi3 connect DSI to Port B only.

This series adds support for selecting DSI Port B as the input source:

- Patch 1 adds the dt-bindings documentation for the new property
- Patch 2 implements the driver support for Port B input selection
- Patch 3 enables this feature on the RubikPi3 board

The implementation configures port swap (register 0x8303 bit 6) and
byte_clk source (register 0x8250 bit 3:2) when Port B is selected.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (3):
      dt-bindings: display: lt9611: Add dsi-port-b property
      drm/bridge: lt9611: Add support for DSI port B input
      arm64: dts: qcom: qcs6490-rubikpi3: Use DSI port B

 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml |  6 ++++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts  |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9611.c                    | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260127-rubikpi-next-20260116-99c1dbea50e4

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


