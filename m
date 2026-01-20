Return-Path: <linux-arm-msm+bounces-89921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Fz7NjgTcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:43:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C577F4E052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12A7B4E9291
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E57C41C2F4;
	Tue, 20 Jan 2026 23:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="HihHo1u9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12184426D35
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952580; cv=none; b=FJLHXFk+yPwO7Wbh34XxhcBzgti9ePW2pKGUUsD8QEkNwqvzmk0UntXOKNtpj3W/dPM6jVZsXcxAKE7Yf85W1krgw4JJm/axG3z+WIGKibhkp3YW0rtGigtx4RJYgzZwCQ2ZrNaqldqlK/OTJ7iZ+n82rHJCduNBLLgNg3S/E9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952580; c=relaxed/simple;
	bh=FWdeJKUv/fYFKdRQlU0VNWwzUWboFav8rUDLSRTuA4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fS5XHLQWBfCxKZf8FBtZSOO1d8aVINZlUqEV7M3mvft9JDJ/1nKvHuOi41wI/ibsMz0hFy/N+sv/CFrPpaWoOiDYtEvp/bvidf4qetQ55qJ7z+WLdknhfDpjqwuE0V6ALZyuJtfrLMqqtVYuA+661LgQ6ElxnwtdjwhBWDkZUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=HihHo1u9; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768952576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65ADG6XaQSxj/DaXiJl8JTUtYPqEhEexhu3hSLeqk0k=;
	b=HihHo1u9u0/HtHsslDufJTSO8tOh5oGCPpKwzJkOu2q5t5UCwHgcsQO+Jb/amQl/3ZanOv
	G31XRzt0CK0FYTlH6v3pE1/8LehmQK9lh3AvJT9bWS5RgDbYlrtGOTfq9R62qsHOYOiKuM
	BvcRm+ZA1F23rS/v5RNIqokqYYssVJpB/OnV9MOcKv/c1RHOhNdCcsKyM6jW5vh/5TOZNS
	DcMdN608dbu5RyI0/Nh6aO1F0EAZR7jW9Ht0jjcfDj3RBmW9Kd0oVIRJEgAIdNcBSZT2bw
	0i/3Wn9+Tt+ViaorJlWDDPwwTzMo58BZyrYYqfV2zli+gcWkqrqDjauid4owLA==
From: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: vendor-prefixes: Add AlgolTek
Date: Tue, 20 Jan 2026 20:30:06 -0300
Message-ID: <20260120234029.419825-4-val@packett.cool>
In-Reply-To: <20260120234029.419825-2-val@packett.cool>
References: <20260120234029.419825-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[packett.cool,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89921-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,packett.cool:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: C577F4E052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AlgolTek is a Taiwanese chip manufacturer specialized in high-speed
signal and power transmission and conversion.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 63730f75a578..f2bd32fbb717 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -86,6 +86,8 @@ patternProperties:
     description: Aldec, Inc.
   "^alfa-network,.*":
     description: ALFA Network Inc.
+  "^algoltek,.*":
+    description: AlgolTek, Inc.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.51.2


