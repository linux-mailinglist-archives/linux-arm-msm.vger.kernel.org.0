Return-Path: <linux-arm-msm+bounces-90656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLa6MdRleGnTpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:14:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589E90A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69AE1302C6EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9287D32D0DD;
	Tue, 27 Jan 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="g58yIFcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15597.qiye.163.com (mail-m15597.qiye.163.com [101.71.155.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D3B2DECBA;
	Tue, 27 Jan 2026 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498048; cv=none; b=nDiilvSXeL3WsUmYDuzuoRujVmpa+KzG1X+YmHpM4P1I0my0sYm6jQrWOPTeu0m7KPuew6Y+bv6xzEKok/upSAzJn5d6lP8Zh/fKiFJiev9BF1KTP8W55V7QIQr/nJzAM4Aq5QLXqV1xLtsyQvKuOglVuAYk2OCyJp9+gKn6/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498048; c=relaxed/simple;
	bh=2vu6ZFO+CX8C3vopB76JeanQts7QnYT9zPo+t0pS3PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrvdYYopQrsoI/wpMYmbuKQ9ZI0uLNzmuf9x9nRqw0ZI591+RWO2RDysQxnmw9CpF/DUbruGbmP9R9lTZryCglfkzezDzgtaUGv7LHIKQG+oZONdI1yxTDjzS0B4Wt6kk8UxkrM8oRHCwAFgNhuKwTaUTeq19hYnlK4c7U/5BYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=g58yIFcn; arc=none smtp.client-ip=101.71.155.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3219cb695;
	Tue, 27 Jan 2026 14:58:43 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 27 Jan 2026 14:58:11 +0800
Subject: [PATCH 1/3] dt-bindings: display: lt9611: Add dsi-port-b property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rubikpi-next-20260116-v1-1-0286c75150c5@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769497120; l=1083;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=2vu6ZFO+CX8C3vopB76JeanQts7QnYT9zPo+t0pS3PI=;
 b=tlNCXCFqGaMsqukRImie/3e60sTpAfhEc/Y+q8ZhehB2swUHM8MgwfhoCLJV5Q+ozci7XFjwN
 Y6O/5pvnwdjBSqHlZEuAjXedrr96iYWdsF4UwQNN+STdHYGhQ/kfA52
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe3f58cf09d5kunm45ebbc0d84073
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh1IVk4YGk9PGk4dGElKGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=g58yIFcn4KsawEFa6Fw3F3uS2JMhJN/22/PXbt2zvCRJ235ja/rwUjEZKmc3WyTi84wSFt/k7rwgqdfs4kwRtUPGSI5EmPDxZz8zo6gWOImMfSsWYwvPlfL/G1kEG3OVu3VHR16OmhIHMMUmjZR/MRioF4Gm5My8ferXtxbJrPo=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=1AzD05LlyucnHCtML03muleaJJ2bhZ3eb9/KPPjkgRg=;
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
	TAGGED_FROM(0.00)[bounces-90656-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2589E90A4B
X-Rspamd-Action: no action

Document the lontium,dsi-port-b property for selecting DSI Port B as
the input source instead of the default Port A.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 655db8cfdc25..9b7dba4e114c 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -37,6 +37,12 @@ properties:
   vcc-supply:
     description: Regulator for 3.3V IO power.
 
+  lontium,dsi-port-b:
+    type: boolean
+    description:
+      Use DSI Port B as the input source instead of Port A or Port A + B.
+      Required when the DSI is physically connected to Port B.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.43.0


