Return-Path: <linux-arm-msm+bounces-115202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lc+OEIaVQmqc+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:55:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A96DCFF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:55:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=AEIRBiCI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 508A13146CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72C04418F2;
	Mon, 29 Jun 2026 15:48:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster4-host4-snip4-1.eps.apple.com [57.103.78.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7C43CECD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:48:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748120; cv=none; b=hsfbKgZZrJQGbxDbVL2OUTxc7/KRwO2AW98KNpQd2I5V2Pi/9tFsRCLt1v6EMtpUtwNtAKATPaB20RSYJn96OLaOfiSDhSw6aPRGxSDJ+SsNCCT4F9Fii2vfnHfLsY9dlCqHlSyookm3VWOIno6SgAcWS+aRbDQwmDk4sJaOb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748120; c=relaxed/simple;
	bh=Spdbueyfuz8uMNAHc3aXLkzTXslDIABc7BDDWY7Qdlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blVracg19eegsI3ElHDxJsS5NjHNIz65VAGGm0KNpdqpsjs4koEalThiVaRLRqOyc3qa1XUM2tITSQQOkWCOuvaeTr/XJohbqyGEEOqjaoz9eQC5NTQ/YjhQ/+T5OF8iQXCGNc0W91AcAVaB4kxeeXExs7PzT63ijNpHJowXwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=AEIRBiCI; arc=none smtp.client-ip=57.103.78.142
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPS id A4CCC18013CB;
	Mon, 29 Jun 2026 15:48:37 +0000 (UTC)
X-ICL-RepId: 019f1411-7a73-7825-b975-40d1db5a9aa0
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVABEZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748118; x=1785340118; bh=qXFGG5ROoxDwgg8Mh3+2KsIvg+hDI0p5sUvKNQ3jUYM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=AEIRBiCIrOrxnjzxmvFDIhi3T868IXV0rbhK4MjN3eonSfD22xGtinOIt2rAhqxv13n1lM5gIODv9Ij87ulneOXXDmmTqxO8qDkb0JGh+p0Odtflwwy3n1km12orrfyxPxIPgBCXgdcGnyi5ioORtMBjZWjBwhU898KoQeQ2y170zTIdh6yXAYg2Rxtud6SKDjfVrd4jCq2ZUJ6yYY7deTTUproo591BovjEsJU6ZuQxI1JpGJZQys7Q7XxmipnyHvc7BTxiRIYHOzFapY8UU2vNszTea14Nd6Xg8wAdKEQYPQX4oOGSvG+eIZk4ISnrB7GFLeAowHjqwIHiZZqBmA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPSA id 6FFB31800424;
	Mon, 29 Jun 2026 15:48:36 +0000 (UTC)
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
Subject: [PATCH v6 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Mon, 29 Jun 2026 22:48:10 +0700
Message-ID: <20260629154812.9066-3-mail@etehtsea.me>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX1hT9esYQwOaY
 y5GNpvwZtaV9vE3c/kewmZcNXNI/Bh+YQlp78s1S296O4VhsNAAiEw9HlqAXpc3MW5+sZzqUw9i
 hK3YWb14CU0Of7Gu3lsG+zkMG65CYq1BwLBSS5FEUvZF7TGGwrltuudf3yIvGeSTuqlu1w6LNnQ
 iOOL//OhWUD1BwkestVJTVXv4kdgfddc1j8vorYs8ardwujDpAxkseRHzXtR9cF8QjHRdb03DAk
 n/3BobZouOJmvGyAJyf81pgRYLrRHzhqHdRIHqpcSR5BRzn/AR7EI0yO4m1j3eLs2vtR99M70PI
 B3EOaHBLTl1vm9b6dFk
X-Proofpoint-ORIG-GUID: O-UOkT6A-i2HqiZETaShYSOlCN0eW0Of
X-Proofpoint-GUID: O-UOkT6A-i2HqiZETaShYSOlCN0eW0Of
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115202-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 510A96DCFF0

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..fd985f8adb0e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1160,6 +1160,7 @@ properties:
               - dell,inspiron-14-plus-7441
               - dell,latitude-7455
               - dell,xps13-9345
+              - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,ideacentre-mini-01q8x10
-- 
2.54.0


