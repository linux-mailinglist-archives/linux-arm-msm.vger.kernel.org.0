Return-Path: <linux-arm-msm+bounces-105519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKGSAnPQ9GkYFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11D4ADF37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34434301F6B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C220D3D3329;
	Fri,  1 May 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="RE9h976h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2004h-snip4-3.eps.apple.com [57.103.65.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC03D75C5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651014; cv=none; b=f6v3lYaX2yM0beSfvaXpQ6e2szBDCBNat9S+zMAQlXUp1UY2XCk4zyM8hFscEbNu6wWET/tbXK5vdPt3rpWneD5dGqWDyYG+fHZHubZtJuYCxXzso2L10fTWhvafw2jrdPv6XmpJDY+b3iAOwIFYH1Hv7UTbQm5ZA3uhY0Zij5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651014; c=relaxed/simple;
	bh=pA9M264KJvikrbQ0B5GjiPnbjelLVui2Dv54HXOm0mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gV/2R6E/bbN07tXDlim9nw99YJlsYmVVZFmObo/MELxL3eYvH8ZI9mFJJjow7TR0CowAldC14kZjPSr5PLjK3M0eZ5G5XVhjxeMCnYQb4Ec/OOperF4ifAx4EqKxsQB2h1s8A37SCqRbhzuOVXX1NBqpDLFxZhTgcYeNoqVvGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=RE9h976h; arc=none smtp.client-ip=57.103.65.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPS id E06CD180058E;
	Fri, 01 May 2026 15:56:50 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YAXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651013; x=1780243013; bh=r9GhNNjKrh3kE8tXZsShquWSmGSQDibNkvQ9kPBCX1U=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RE9h976hOKtZ/6DRQbmY10lu6+wPWrKLHK0UGfdhP6rXsr02a8xgXFHUjuoheH/WXTzthpgCySYrSINymXcVjSjCDTGc8H0EtMCRcWhtZTRZOZx7oVlxXGPZkcyGied29hif/904FHQSiIfMhp/DyJjs8EW9YnGT2XakNG8siu/gWOomh5FmAIvw8Y1fce4GBN22YZnVO1Vo3bpYLxzxzMuwdAhkFOM0xqw+F2UE3swve1porUStpdswfpYUEv5CPVsK5tPBIu4V4LPmpRJBIvvhA+djfWHjb8ZwSIBTe3b95N7g30gFrJLdIBs9cRFZ1BxCfQ1Sy59cYAuQbk/0VQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPSA id D96331800189;
	Fri, 01 May 2026 15:56:49 +0000 (UTC)
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
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Fri,  1 May 2026 22:56:09 +0700
Message-ID: <20260501155612.5490-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501155612.5490-1-mail@etehtsea.me>
References: <20260501155612.5490-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _3U34nBfFCCRBphocQzuTygXm_a2SIeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfXyKtMQRo2n+8c
 m15AIhXvlS9HgbmsTyntzCdRhQp743HZdXmN3Q8NIIurzWBBTZS9eejDOFYszJH7Ytit+PHLGjv
 /DNjrFdh6p+pgqNymIZRez8kKRHqmHx3qGfCA982e8PqjcHen3X5u/JxaQPFw1dGziGdyxNYdsM
 aLl0g5RJjrGDNwqJ9l3KSmX8QA4FqDzsL7ycQJ8HQj1HvktoI8Oqm69c54RDCAOCPiFF7oQkmz2
 Fqy07YfKsU27n6RTp4beblElVRkOuz/VFdQ9OtNl+1+77SGvWi44R6ho+RUJO2/XoXGDHE7z/Ap
 vrDgnCnFvaYKG4T/8biinIJBmww2sHZDEnGjsYOHp7SJiIfWXcW18IDZTu+UHE=
X-Authority-Info-Out: v=2.4 cv=TuTrRTXh c=1 sm=1 tr=0 ts=69f4cd43
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CvlTB2HrAAAA:8
 a=L4MHaItcyTsGJ2lxC4sA:9 a=67QrwF-mucXG56UA-v15:22
X-Proofpoint-GUID: _3U34nBfFCCRBphocQzuTygXm_a2SIeY
X-Rspamd-Queue-Id: 0B11D4ADF37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105519-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[honor.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,etehtsea.me:email,etehtsea.me:dkim,etehtsea.me:mid]

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
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


