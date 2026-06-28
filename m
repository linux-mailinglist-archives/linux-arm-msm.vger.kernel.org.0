Return-Path: <linux-arm-msm+bounces-114789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SkOOOORbQWqHoAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375A6D490A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=XbbmkPwF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07BC3027B73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEDA2D97A6;
	Sun, 28 Jun 2026 17:36:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2002b-snip4-11.eps.apple.com [57.103.87.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F832BDC0B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:36:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668205; cv=none; b=KSNJpjsSamd6YcfxLBNTMvwdndZFEYSdgyOdTJm7Ndesy7wWAESXfAY3Z4mNl/1yRpJKsSIEOUmb+gLexWY3WHeHaRfj2nBgYKVOXMGL+mMr1Z34uwPi3srB1uUY7jxnG+DU1QsSbrqkVSG+O3wOyECECOzmQ5EoWmXwyuzEbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668205; c=relaxed/simple;
	bh=Spdbueyfuz8uMNAHc3aXLkzTXslDIABc7BDDWY7Qdlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vr7z33srEvSmVYQDY38Dn/wA/kiD7ouOSL01rHxi5mY57aampsx8RkOz/YCojhBJVqGQ734yqd728G9IoWGrFom2vEVXlh3n0WDfYpqjyYjLW9Kht+I0ovmuTYp0pNhu4PLY2csG3xMIQNfQXQlvqwfp06obOBxI2T6IeOEwpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=XbbmkPwF; arc=none smtp.client-ip=57.103.87.151
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPS id F07A11800109;
	Sun, 28 Jun 2026 17:36:42 +0000 (UTC)
X-ICL-RepId: 019f0f4e-13a7-7fe8-8905-993a54b1a779
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGlgfHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668203; x=1785260203; bh=qXFGG5ROoxDwgg8Mh3+2KsIvg+hDI0p5sUvKNQ3jUYM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=XbbmkPwFu8Rl+cMaTUxKcxh9Crf09G9FQT6P/D4yo7T7iZJL/TSOJ8Nl6Ao6qCmw4sjx52akooapCgKyT8rDcHKUP4t6/JcF2lERizXMYCgPz2oWUcBXzJgkykY6Nly5jf2E6f9lsl0r8v+n0D7oZkKq9kghTd6S9Q7wmjUuAbjzpEue0gEMK5Z6shRvxmrsSqI/rTVLtWRpKJyR1dEQIArKcnJH5Qk3FmCciwL2fD2qwLtz4TuBWbfrSRlm4xuj5ZYpH3Q73pq1n36K0IP/rqGrXQVlnc3+gJwkK7UWzzvJ/Chix/QPraw/Pw6i4UnRKOisszRjE2hj417fBlln2Q==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-9 (Postfix) with ESMTPSA id 076CC18000B3;
	Sun, 28 Jun 2026 17:36:41 +0000 (UTC)
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
Subject: [PATCH v5 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Mon, 29 Jun 2026 00:26:38 +0700
Message-ID: <20260628172640.23167-3-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172640.23167-1-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1OCBTYWx0ZWRfX6nP4L7IDV3Ma
 OEo3B3LMxC+P2ZNke+5ztNtIkcP16K3R0Et4n2EKNP6Febzkck5GjzUKhyj8HgkOZAdeqmdOn97
 H2zK3HzuwuT5DMxr7WxmCc2xRJcTTQNckq9bLl2mHhiA1vNW689bNn6PVkLvwjgVND/y6aw6Piz
 MFwKhtAXoHjbE+zhaW69P6l+iB7dL2dcuQKqwxcRDI9iE6sIEIjRiTN41MrfCwtD/4i7L9X/IW7
 4Yy+2W70SvMWEISA9egKKyIQxVr+mo8jAeJ9HzGO3XE/F6yLLFZWvPrdNzp/VsXQcJakHMmOvjB
 M0oo9SvYykN9VDLzTLS
X-Proofpoint-GUID: Rj5jdt2-ZPooI4nBRdqFhtSrExsKHcCf
X-Proofpoint-ORIG-GUID: Rj5jdt2-ZPooI4nBRdqFhtSrExsKHcCf
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
	TAGGED_FROM(0.00)[bounces-114789-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8375A6D490A

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


