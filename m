Return-Path: <linux-arm-msm+bounces-113889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XbdSDJTTNmpEFQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 798986A96B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=bW+uo7i5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B6630131FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F07D3B7A8;
	Sat, 20 Jun 2026 17:53:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host7-snip4-7.eps.apple.com [57.103.76.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0442E7382
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 17:53:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977989; cv=none; b=RBcKIV23eVMbJyeGl3zj9iZ1s5pxnCnVOSGMHRyOOqFdcz7efYqNdhHy9J+LFqcLPR/CZ38NxfAoJi22vSv+ZBdMTJJRQe6QaMJ7gZrMetbtIi+RlxwGH933GDiQZqtYiq8Ei+AE4qBXFviK6PErZ5KqDR6bQp2oqZp7P4EWrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977989; c=relaxed/simple;
	bh=UyWb6pnTNSl7FtIUcW9vT2lCEhe5v39Zkl1Oa7kB4ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0RyPiHOe4wwF17QmX0U3woGlfapt4EL9pHdHD4d1KjU6vubUJ6JYpU7lzlJifE7RFc6Lzu+xQLUWVBOmX5Xtfgp0h4gJmSweDqE2ebQuVvCacZRahkF/97F2LJHQeRxzLzm9KuCuwVdkuSfGMP4wGS+l3xeaEZAlMjDl8UPj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=bW+uo7i5; arc=none smtp.client-ip=57.103.76.70
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 2CAED18000A2;
	Sat, 20 Jun 2026 17:53:06 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVFC0kDQwZSB0YKVQFAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977987; x=1784569987; bh=TGsVl2Kgw+QBA+rKXrQefJZSk37XNV5EiJDh4rNKHe4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=bW+uo7i5aGNOrJYajkGHInjbj3628KP4vVbqxMDolvRkdikgua5lxNIC+AssCXo9YmotMJheGknKFBcObAbfQ+arCLOATPHSDH1yexEvomNDTNnUEubUoSlfbMtUJUxThhqUB0ovmxjUr2efmZiG2RKd61qbG62EvhwjHCs7NbH+uoVYFt7QfOpkxSOtd/kR5hEfujR3Wy3cY1ktgMc+Z5byG+igoyDbTSCzmqR0M5pNoOeWcLdOAvEcCVIPoDhe97g/Xpb56L8ORMYM07z3Sc+Zva/z9O42wEocg9l7TMMdRC7KAGMMA6G5FM3d3ovCYciLtMW2CLpJ2P9mG2PggA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 678E418002BC;
	Sat, 20 Jun 2026 17:53:05 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Sun, 21 Jun 2026 00:51:55 +0700
Message-ID: <20260620175210.19563-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620175210.19563-1-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QI44P62JVbJ2rAId6x0V1eR9mI7fVp_M
X-Proofpoint-ORIG-GUID: QI44P62JVbJ2rAId6x0V1eR9mI7fVp_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX8QtlHVnAKH9T
 /7iviqIT7V1561xsjuRW8jwBkWNdGOGv/7gjb5OhFCfF2WIxZNPqxHfCoYkPM48MnnQGu0dlfTC
 uRYKo6Ia6t0EQ828PwpjwZ39oASMk5zIjkZQs0rBNqEfsN30ySCiAzfbqS7M1cqyFJA1xnVL67C
 vTKG2+QZTShUPVQqeHASuJxAcHSqpMVXpkLoQXhpWd+8upkurh5i4YJvq13sBehgMhLXIx0+qG6
 7RrgZi8i9GYmxGveMpwrUw2lWsZC9SCC+ghhGNxwcLNSRLzxH25xPlAHxmBP27jhkiIr1XrEO99
 Vsw8SYjCR53G9TjMQ/o
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113889-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[etehtsea.me];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 798986A96B9

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6b9fb6a6bf0b..293cbc26deac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -733,6 +733,8 @@ patternProperties:
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


