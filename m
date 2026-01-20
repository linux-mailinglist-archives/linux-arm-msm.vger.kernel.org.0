Return-Path: <linux-arm-msm+bounces-89920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBtsMxcTcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:43:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF74E018
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87A566638C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBF44218A4;
	Tue, 20 Jan 2026 23:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="sd09dGBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748B41C31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952575; cv=none; b=Q1y9liJtiziMZHT1Zbk/Fug0pDpIfTX4Jna/NMim1bIGyL+UjLHDCwZYJctxLldDU2Eo1LTiKAm09z9TsgwVRJC8x19t69TFFT8OzFBE1ifab3rS/+7Hoaam24WOLcgOqrZsm6p1QfqxFvpQME+xBRyq0aXXhqt+8ax/BCvOzig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952575; c=relaxed/simple;
	bh=cuzQ/VJ11x9mx+dZr8E0wYk9mtz2jv1x6nXlTxRohbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ke3+2X9EbLulhF0YcSt8NeCJhow9jRuURnPlyJ3rVyGJb+SFDguVJ1B/qAhYS9ipluHOoAtCTJk8b2gMTW208Sfo2XhjeVeJazgqE0xxp1HZiNAw/6uKfpJynkS/wmU4tBud5RQACFJXERUkpcFBMrC96RLplKwDIxkXY6oUAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=sd09dGBq; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768952570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4m3R3R1tQvj38BC18do3It7eWweMrzyOaw1P/rQkxo0=;
	b=sd09dGBqcg7xd0i6Ou0qNMyUZFs5epo3kcVYsM4RIioUcA2/AU/m/Ae03w3jsUfAmLQFbb
	oG2jopDfZhy/bXFO9mcXqerZg/3pt+YK3za0ncLpBB6SSW3YM1GkUjGFf605zoQdXpqvOf
	qf/OZkeda23MkUyQvY7u26jKP5PZn6M2bp8Nd1dIwlIPQ3JBUHsboLFyjK6PgafqVNYiZC
	iw0O8hIUK5bVVvTatFIrMG55S2OWutQdiMDvR0naEjjWHKMJBvAvy7bzJ9W5iJVKBnPOQS
	iX9/N70BlAB0lFeOb2yxjeGrDJD92RXKwy8Yssf59LAcz9ahFwo4u2OXcwWxgg==
From: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ECS (Elitegroup Computer Systems)
Date: Tue, 20 Jan 2026 20:30:05 -0300
Message-ID: <20260120234029.419825-3-val@packett.cool>
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
	TAGGED_FROM(0.00)[bounces-89920-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: B6BF74E018
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ECS is a Taiwanese manufacturer of mainboards and mini-PCs.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eee160de6dc5..63730f75a578 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -469,6 +469,8 @@ patternProperties:
     description: Eckelmann AG
   "^econet,.*":
     description: EcoNet (HK) Limited
+  "^ecs,.*":
+    description: Elitegroup Computer Systems Co., Ltd.
   "^edgeble,.*":
     description: Edgeble AI Technologies Pvt. Ltd.
   "^edimax,.*":
-- 
2.51.2


