Return-Path: <linux-arm-msm+bounces-107958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDJBBo9YB2oozgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:31:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 546605552C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A320E3032D26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFEF3DB649;
	Fri, 15 May 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="BId4OdJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2007e-snip4-11.eps.apple.com [57.103.88.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455003DA7E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866191; cv=none; b=My2qbb/5zMoBqWUMmhcGu0LXmWSF9e2PYAocka5+7koPc41rn8JEJqpKRnKJjM8ByYRnd3pkWLadAkmFFp2useAkZmxBYwrdV1OsXllBcjL4ipOYwYxxLJptbkv/BEn87ZzWF4nZOZDBTazBNbVyV3rCKJU3LCytHHc+AZoZjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866191; c=relaxed/simple;
	bh=MBOOylIfFmDEp2aGSPjKRoaPo5Q0N/azvthLRwsibTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoqjXR0gaAKdzXCozykcZFBfIzw+jPsHOqon5ABZNNN6I1yejozbQo0667QaSXx/3H5ovubS3Uf9UWuNHYuHkb05M5gNppujSGGx0/xtDsXJvHKlWmWDq9VqDtuB8l58Cg2sCqdyAI3b12iKNmZjcfWpTqK5CEceezyTH0Aha8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=BId4OdJD; arc=none smtp.client-ip=57.103.88.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-4 (Postfix) with ESMTPS id ADD8E180014E;
	Fri, 15 May 2026 17:29:48 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXloRHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCE0CWgVSAEYXSQVYDlwfQhQVUgRbK1cEXBBHHlIKHB1cRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1778866189; x=1781458189; bh=1ysBsNg7EPBupuwb4b5ZlGnN+li9sAL2j2/RNBGUZYc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=BId4OdJD70ZS6MntSn0kf7wFv1v6lXK/XEOCbKp5Dx+ZWQbJz/Nuo9IX4c/4UnywvS8M+UREUB9Ae5JckXFnYAhHnjMneGuVbRJOnHqV+aHiB1gYJi+J7rSMSGIwsXX4YO9v9mnatrdojxQULH+dH4cXb3YrjGryQJMBRdTnEE7sJdjxlpgDrAiBUZ3FY8GsuuUucEftT1UcShkTUt0SJUpHmd8ARVt2BoYdgK6Ul1vbrNM3NL3b8qzb1M1IGsnFl7Ob6YLYfpGxEDFXJfZSTfyLUyCAM7tpi2WeCXJml2lhvjp571uMvCmUtQpdV1LYf7bXuLlnFT1kg2cezqXoxA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-4 (Postfix) with ESMTPSA id F09F01800159;
	Fri, 15 May 2026 17:29:47 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Sat, 16 May 2026 00:29:23 +0700
Message-ID: <20260515172926.16597-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515172926.16597-1-mail@etehtsea.me>
References: <20260515172926.16597-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PPeM0fKvGkL_QSzLR3yTKcmpiNz4DlKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3OSBTYWx0ZWRfX2wZuR7hVxRai
 70S4WK1jicZ5tNsOPvJzzKJ0iyUZ7JXTEGTv3Qb6GHPGoNg7Ak1/eH3nvejpMoTabAwX6c4Vy08
 sdP6CzKQBD36a9f3T0eRrCVLZ30lLMtkx/malYhDzum70cmEdM1K84WveZOgLPc93jkoZQHIfOb
 3uCxbSFzNNRM6fCYYNMxXdxRxWLkbQ1hRu9WRwsx+5waEOaAppRw1gD9dHXN1UWEpcniyUJTzM7
 heHhioQUPP4dxALwVVwajgwIfBM2dhFVNwEGJcYmCX2eh2a4v5N1D4dGs/QtdwIEhWnrwXwmMQD
 Os0ugF7c7Ndgy7Rph5BpAd3EUF0McuyemdevwigaCtn6qf7tXbwREWwmtSY8Co=
X-Proofpoint-GUID: PPeM0fKvGkL_QSzLR3yTKcmpiNz4DlKG
X-Authority-Info-Out: v=2.4 cv=J46nLQnS c=1 sm=1 tr=0 ts=6a07580c
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CvlTB2HrAAAA:8 a=VwQbUJbxAAAA:8
 a=L4MHaItcyTsGJ2lxC4sA:9 a=67QrwF-mucXG56UA-v15:22
X-Rspamd-Queue-Id: 546605552C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107958-lists,linux-arm-msm=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,honor.com:url,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:dkim]
X-Rspamd-Action: no action

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..b27b8f7b1c5d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -729,6 +729,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.53.0


