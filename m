Return-Path: <linux-arm-msm+bounces-92111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEOcHKH8hmnhSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 09:49:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD10105430
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 09:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 818B2301FA5C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 08:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC592F1FEF;
	Sat,  7 Feb 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="LGCz9P7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069212CD8B;
	Sat,  7 Feb 2026 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770454172; cv=none; b=cci5yUVw/01KRusrtg7kpE3fe0f5z/SFVo/uz6gXGKYw4lpr6gllOaOjvUEXyfUR8rqZPH9FINwjZWWWuSFpku9WSzhjosahT1s+HQAg8Gw2w83s+LRetMm1ZnUvNer38/2mJtTE19QVLiUk0YZRihPI1Sj3yGreQJkrd9jE1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770454172; c=relaxed/simple;
	bh=EGlbJt4UoSLkYy09+Ujv17dM+4JZjbWnbz1SJ8A7TVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ff6EMsb1oNQZFrVBycinFtZ5VxJoBO+IIGH2Dv99ZN7+aI+DaCgvTR+iIppwStOEXl2i25BRQuOcJPGqTlAI6wN6qBJE/+UvJ/+QgdWxM61uKK+bBA823oUjYweVXBX7Em7lCb82aGkIrv+GdWmfI9AQpqpgXges1yOFMLEL5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=LGCz9P7g; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [113.235.123.225])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf66b;
	Sat, 7 Feb 2026 15:33:38 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sat, 07 Feb 2026 15:32:54 +0800
Subject: [PATCH v3 1/3] dt-bindings: display: lt9611: Support single Port B
 input
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
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
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=2074;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=EGlbJt4UoSLkYy09+Ujv17dM+4JZjbWnbz1SJ8A7TVQ=;
 b=VabQBDcaR19gGUsPqBfUFW5+ApjQtXi/6JPTGqKx+qQymjWtrf7Qsp7roy3l9QqMS7y/SlqK6
 8hEmEyAng0wAkYlnZQpWK/ajm0VhFF5+Vowt2ko4gZU0Lylro/7lyXJ
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c370545c509d5kunm3723250e7f3075
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0JCVkpDT0NPSkMfHh5JQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LGCz9P7gcDxPocmLXLstQ5nLO+UPYcIl+LO3yYZXUsj35hK0bCDm0SvEG59RAzORhN3dwivCxKLjF5EF3L4a2ExmLqjBBBE418m7dv4GNQIxbvz/5h/ka8qzSXHW3Oqvw+5lN7ZEpAV1ez50yX6xvByrgasoZZ/jevWItPAFo5c=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=W01jkYSpWbsH8AaTOMMLWBvhB2MlFfUuXRlmTq4crEU=;
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
	TAGGED_FROM(0.00)[bounces-92111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,linaro.org:email]
X-Rspamd-Queue-Id: BDD10105430
X-Rspamd-Action: no action

The LT9611 has two DSI input ports (Port A and Port B). Update the
binding to clearly document the port mapping and allow using Port B
alone when DSI is physically connected to Port B only.

Changes:
- Clarify port@0 corresponds to DSI Port A input
- Clarify port@1 corresponds to DSI Port B input
- Change port requirement from mandatory port@0 to anyOf port@0/port@1,
  allowing either port to be used independently

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
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


