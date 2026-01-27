Return-Path: <linux-arm-msm+bounces-90653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLMhNWljeGmrpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:04:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F271A9093E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 434A53008CBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FC325CC6C;
	Tue, 27 Jan 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="hWA0CbzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com [220.197.32.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB13EBF05;
	Tue, 27 Jan 2026 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497442; cv=none; b=S/Ms6pirofDfODDAsmQ102yZqRRiby+WVJ0DAXfTTSg7Mfdm6GzM7T3tFBK8PuppUAq6aMk4bU1899m7OtWiMINHr9719QxC5sWnqAhwebPba0ifQKMD0G/U1010CM9/Xx2E8XtXqCYl690IPWBPycw9EvNSiI9WFv5LNdVjMKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497442; c=relaxed/simple;
	bh=+Pv6gcNjmGIsB6pG7/SZQq9lEGv2XyzQQDiyl47U7YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrckQ+LEf3P9IncGqWwDHu4tvugnrpivIYsxq95tWm9q/0yrVcVij/Uhil8Z8ir8NujWfcTvgrGY4Y7G5J1MuzznmgFK3U9Ie+yrynJQEZHKOcieLMCgpbxPKgxfw5ezB1RH0NtbiNwe/Tp1gj1Fz/b14NIZF02QEQqhZBQ36SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=hWA0CbzP; arc=none smtp.client-ip=220.197.32.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3219cb6a0;
	Tue, 27 Jan 2026 14:58:45 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 27 Jan 2026 14:58:12 +0800
Subject: [PATCH 2/3] drm/bridge: lt9611: Add support for DSI port B input
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rubikpi-next-20260116-v1-2-0286c75150c5@thundersoft.com>
References: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
In-Reply-To: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769497120; l=1976;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=+Pv6gcNjmGIsB6pG7/SZQq9lEGv2XyzQQDiyl47U7YQ=;
 b=KaMXFEbci4e/zyISqD5Glu84hQkseH0YbpTh/7ZkN5AWKyanSlY5IbCu0W9gYufHNmsPgL2Y0
 POHr1XXEBc1AJgfGom4DDlIgetFaIMqJZi7OL8xehbMD1M59fui1m32
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe3f61ff09d5kunm45ebbc0d8408c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSRlIVk8YGUtISRhPSkxPSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hWA0CbzP3LLCRucKmdVAue4mfZralg9tbQM7S87YCsuSBcwAZ8SvaZEfsLGySC+ylM39H1kgDxiLNDsqJdPNiRj1CAB1oDh4znaPZgwLTS1G1bYJpvAk3xKA399J2fVfcMSYLByH4dQj7epLIjogjT/tw3ZTQwt4it/oPdPiAlk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Gn8WftofV/WUtxSX1V56sQZANtqEqJ4TXz3vfEWBl+Q=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90653-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid]
X-Rspamd-Queue-Id: F271A9093E
X-Rspamd-Action: no action

The LT9611 has two DSI input ports. The driver currently hardcodes
Port A or Port A+B, but some boards connect DSI to Port B only.

Add device tree property "lontium,dsi-port-b" to select Port B as the
DSI input source. When set, configure port swap (0x8303 bit 6) and
byte_clk source (0x8250 bit 3:2) for Port B.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744..178f056c9e85 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -47,6 +47,7 @@ struct lt9611 {
 	struct mipi_dsi_device *dsi1;
 
 	bool ac_mode;
+	bool dsi_port_b;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -116,6 +117,7 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 		{ 0x830a, 0x00 },
 		{ 0x824f, 0x80 },
 		{ 0x8250, 0x10 },
+		{ 0x8303, 0x00 },
 		{ 0x8302, 0x0a },
 		{ 0x8306, 0x0a },
 	};
@@ -123,6 +125,16 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 	if (lt9611->dsi1_node)
 		reg_cfg[1].def = 0x03;
 
+	/*
+	 * Select DSI input port:
+	 * - 0x8303 bit 6: port swap (0=PortA, 1=PortB)
+	 * - 0x8250 bit 3:2: byte_clk source (00=PortA, 01=PortB)
+	 */
+	if (lt9611->dsi_port_b) {
+		reg_cfg[3].def = 0x14;
+		reg_cfg[4].def = 0x40;
+	}
+
 	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 }
 
@@ -1024,6 +1036,8 @@ static int lt9611_parse_dt(struct device *dev,
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
+	lt9611->dsi_port_b = of_property_read_bool(dev->of_node, "lontium,dsi-port-b");
+
 	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
 }
 

-- 
2.43.0


