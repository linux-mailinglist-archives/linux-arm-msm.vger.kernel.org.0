Return-Path: <linux-arm-msm+bounces-114751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VSpcLl3sQGoDjgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 11:41:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFBB6D380A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 11:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=IFYEf1o7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114751-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114751-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2879B301AA4B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 09:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC92130C632;
	Sun, 28 Jun 2026 09:41:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2005i-snip4-11.eps.apple.com [57.103.89.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B10331EBA
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 09:41:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639678; cv=none; b=DT81xF/2APHDIFKZ9eOHPHqcl40I/IwFZ0Ei/5UyVg46GyIhTIuqAssv/dQYCebFte2AfN9pKT+YA1qUh9b2heaF+TIlhEoEafFD1aJ3rXMsiT/ll6YtIN6F7bfv4Q1r3AHCQAsTumb7EK2sOr2pkPznp+CloOUSSnvzvMqYxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639678; c=relaxed/simple;
	bh=l9QTiFilDIn7JPYkYIDGEiNlq34X6Ld96R9qDh1I9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbuIfLqur3bkbap4ZOgEToGKCIWNrxcQ0kVAbo64ecPxOR2cg1XcGh5o02WXFBN0qRfRzGlM5Hd+iVPzAfToWYBBDeCofgpIeNpa3qX4YjJB/ISzGvz16BflmQdOostqRky+R5p9gJEN+7Sda4sUoLMu13UI68jmlpwFGZ2RqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=IFYEf1o7; arc=none smtp.client-ip=57.103.89.221
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 7939B180015A;
	Sun, 28 Jun 2026 09:41:12 +0000 (UTC)
X-ICL-RepId: 019f0d9a-bc6f-7514-aea1-dcf2ef09c5e8
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VRGRcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICUEHXQRaHEUNTAZfGlkfHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782639673; x=1785231673; bh=8qhWEmWa9c5bN8gZc9nJPSieeNw3dWEH3UMfOnNnQEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IFYEf1o77uDAtNPaaxsTnNmGMnnq2KiiRLeZQYi0VfdH+R++bUM8byRWJDfmtOX8qLiSTupJdF9UM9yGsqb4UttIOT/cxEQbfmzwOWLpOIElCBgtWZPVThT6PUkpwF2+0Krjz4i4yDsBJ8wTZTM3dmroHQP4qedqNrBHr8qqni+b+aQDTtpJ721Ja28ms386w2YF+URP4b11xllxZkV7rGMKLI+bd2WGz5A9jNWTrhK1IW23d4g0Kv2j2X/bP0udmx+jWZlZLYX675+8lX362ltRWau/QDEZ3G2NvOMGwM6wo75D5YyWkwjow9IgE8nD5cLraFV7AiVsvcTAaU3I2Q==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 7D4E41800161;
	Sun, 28 Jun 2026 09:41:11 +0000 (UTC)
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
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Sun, 28 Jun 2026 16:40:28 +0700
Message-ID: <20260628094031.54452-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628094031.54452-1-mail@etehtsea.me>
References: <20260628094031.54452-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: INDOAom25ajsNpJTRY2fbBA8bG-BHvnV
X-Proofpoint-ORIG-GUID: INDOAom25ajsNpJTRY2fbBA8bG-BHvnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA4NCBTYWx0ZWRfX3x8iDoYlQzd1
 BGtkPenKRl0WK92olxfqTExMPtLAMlB/5Jd9d2F0+Opv0ueOjsXPlDZzeIfWuVQrj+ceuyoX4dE
 pjzVTHLrt0Y7UxPWMtA5APSEME1ds4ZcjzLi/iQBidyGOutOk5IQ+CDQiNbkHOhTvWwDodSc+Ma
 HUnh3jswTR4/ZZACPkUIeSBEBtlck1/NmXTl9xh1U35oK9fAUG6J5CVtGwTY+5LydifGpQIxRFM
 zZIZZCMjg1eTv8Ukr7kQOMloPEakCU1HMWkDjJAo0QDuFnpw6f0AxxmvYxKoOIicDZSiP6TkivF
 Ch2UOsMrcw9xdxCcRLk
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114751-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[honor.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BFBB6D380A

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


