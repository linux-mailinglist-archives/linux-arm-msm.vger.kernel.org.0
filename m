Return-Path: <linux-arm-msm+bounces-90962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABV0NTPweWnG1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:17:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245FA0292
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6ECEF300D0E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B1D33D4E4;
	Wed, 28 Jan 2026 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="bJZEvR9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15586.qiye.163.com (mail-m15586.qiye.163.com [101.71.155.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8F344DAA;
	Wed, 28 Jan 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598991; cv=none; b=obu3g2WWbVCjNH/iCeLeosO6XuPveVOWrvHb1jdS72EDWNnblY7oTyYlNUH8uA7phBWct/N8f0OCRu+FG03ubceZN2np6aG2WiitFbwdlNpHAYVEpznKlbihHtE7327x+ScbauQJTi8KH7Yd7XNTAS0oJ16nuVsztOsd46KVRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598991; c=relaxed/simple;
	bh=tUM2zRhk3tGjOWNoL9pr4hiIZD4Y3QnOEKMpju2f5T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYXZiBmw1JD4p3wstpOpAJerwaLTBliHqcZFO2M1iC+jBEiyi8IFaNEg4EsS2Y6lJsGMWxEw2jSF6V0/cpThK+6EaN2StR0H/TKd6yxn0dZ/5dhUPFMyF2AkcCc07RQT5hRBWkl0HDNVyMGjxN07KGsB8v6FV/GL1io29jCpVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=bJZEvR9Q; arc=none smtp.client-ip=101.71.155.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3248e5334;
	Wed, 28 Jan 2026 19:16:16 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 28 Jan 2026 19:15:45 +0800
Subject: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port B
 input
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769598974; l=2063;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=tUM2zRhk3tGjOWNoL9pr4hiIZD4Y3QnOEKMpju2f5T0=;
 b=zhOepmzkG/jf1+koNGRN3EtYjWQyYkfzrIpRwvDdRnDCkJw/OA/qr2xF216a3U8P+T9m1S7aw
 0XFy0GRUU4bA2+phvTBXC1qNUHEd9RD3ErLIsj3vWa6jRK6e+QVs6RE
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9c0451825009d5kunm18b1b2c5170b9b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR5DVksaH0NDTU4fQ0hLGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bJZEvR9Q6c4yRnm0JhQ72J7wVFo5/nEN9I3JU//CrD3K+8CE4kdnW+6EecMZBIFEky1I/3ZKTGk8fzqNl7jb8sIre+6yq8YcGZMSAMND6AkIjFv/YVQ1t7wDaINjLEm93D9GZzircmd0EGXVn0zYa1d6TjA01ZXh/LrBOHlPep8=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=MrdWylWfyr000+v/1my5reLHLYqfpjYw9XG/zLUhbzw=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1245FA0292
X-Rspamd-Action: no action

The LT9611 has two DSI input ports (Port A and Port B). Update the
binding to clearly document the port mapping and allow using Port B
alone when DSI is physically connected to Port B only.

Changes:
- Clarify port@0 corresponds to DSI Port A input
- Clarify port@1 corresponds to DSI Port B input
- Change port requirement from mandatory port@0 to anyOf port@0/port@1,
  allowing either port to be used independently

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 655db8cfdc25..429a06057ae8 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -44,21 +44,28 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Primary MIPI port-1 for MIPI input
+          DSI Port A input. directly drives the display, or works in
+          combination with Port B for higher resolution displays.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Additional MIPI port-2 for MIPI input, used in combination
-          with primary MIPI port-1 to drive higher resolution displays
+          DSI Port B input. Can be used alone if DSI is physically
+          connected to Port B, or in combination with Port A for higher
+          resolution displays.
 
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           HDMI port for HDMI output
 
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+
     required:
-      - port@0
       - port@2
 
 required:

-- 
2.43.0


