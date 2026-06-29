Return-Path: <linux-arm-msm+bounces-115201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id waADCQCXQmoH+QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:02:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 562146DD11F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=P9Q+fwpO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C529F3249CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E25441031;
	Mon, 29 Jun 2026 15:48:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster4-host12-snip4-5.eps.apple.com [57.103.78.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65B43C046
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748118; cv=none; b=IXi4q9AtL3tZptdpga+HHsSels6JPWRxuc8xGfZ+x9H8nvnpnpAtudlteN2jYj7bfIKu96cflVnDFrjjLWsOqBsYvFZbwD5QPHHFcEYE/EAcOUYejG/elUWIIkCdjNrncThMIswq+sGiEFvmKvyKIvsrStC8FD5g2oUwTGT/VlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748118; c=relaxed/simple;
	bh=l9QTiFilDIn7JPYkYIDGEiNlq34X6Ld96R9qDh1I9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mASSd0R3qet/6GyFrrqPnxc1bRbcPkGlbbfqVeYplhbANDz+uj0Mg2YPdKZBxdYUepuKXY538Zd35kDuYUBXfCPgeoy8ioVwM3TdsAOk5LPQDOg9luChReTZXDmtvPgFSA9DPs1G3/Z84SAM7COfj9+lCxvyLp93xaMSMmrVD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=P9Q+fwpO; arc=none smtp.client-ip=57.103.78.186
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPS id DF39418000AC;
	Mon, 29 Jun 2026 15:48:34 +0000 (UTC)
X-ICL-RepId: 019f1411-6f93-7a2f-b2f6-385039e01320
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVABUZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748116; x=1785340116; bh=8qhWEmWa9c5bN8gZc9nJPSieeNw3dWEH3UMfOnNnQEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=P9Q+fwpOc9TEgJOkX9bhqIxmp0pJYsMi4gcKFtOqSkTlg3bcDQVVqJHEqvx9425ttxAoJyxjwF/IfQ90jEXuHK8/y+FPIGUVDLkHx2rZn7lZ2c6Pt5L1awjEQAd35lLqM8yAK0BobFpqcTk+I4tE6hkDaxiWlrDDAVrulOq7V9twA9wIaDwsekajEjHB26WqD5iYYtYM8jXzvBFfnbtWKlbF3jpXx9F45CubQeWmeWmRlY4wnq998oX7vofvjwxN2JenBLLM/wBKHQxyAJ0kz7whrpCFKVr8jqJ3uycgMm+afHg01bEeXCllF5GwBs4gUFYDt9gJEXAvDWGUEBSYWQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPSA id 4D59418034D4;
	Mon, 29 Jun 2026 15:48:31 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v6 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Mon, 29 Jun 2026 22:48:09 +0700
Message-ID: <20260629154812.9066-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629154812.9066-1-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P8hjlmrN92YxqQmONsmQmXlHH9ddxb78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX4JBOMBpRnLi4
 jmFDPd+VoWNOaKq8mm3ss5SesE7/CgbJYHzvmvJbYogG2XnHpGOVQP9AH4qnWfSSO+0iEHqyBkc
 cucVHTv/QKoWlHpVf1Ll1Rm7NGAICm/s6N3/vFjYyQsk/gmhwQBU62oVV4td2zJlbLGsT9SHDQM
 e7tvPHR+3Kb6vt889M5M+M6jRlgUKtiexQIVqJB9Ea9ipWGjt14ebLz9d76qPBgVpxW92KLsQL9
 qY4QSC8HQesYxq6ZCuTlZvo89Nk9AMF38AJZPGkYrpNfaW6EYMP5DpOWa4s3iq7dUXT1QPLZzeo
 HLgpGA4igrnkG4NM0sK
X-Proofpoint-GUID: P8hjlmrN92YxqQmONsmQmXlHH9ddxb78
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115201-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 562146DD11F

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..9ca2508f531f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -735,6 +735,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.54.0


