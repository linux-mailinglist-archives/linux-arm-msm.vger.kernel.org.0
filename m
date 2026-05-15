Return-Path: <linux-arm-msm+bounces-107959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBkPLKJYB2pmzgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:32:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BB55531F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1940C304119B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B603DB646;
	Fri, 15 May 2026 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="H+3RXrSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2002c-snip4-1.eps.apple.com [57.103.88.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715B3DA7E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866195; cv=none; b=H+cvafLNu8DEhVYDxwDK9RT/87DStmAydefIH8D69dpOU2zSkoCvz2I+FrtHRqrSibBuiJ87pXuvh9KqPd/shiZAt7tmlkUYr3FpYl/4nXHJJLYNcR7fxJNGAvUSW2ZYMZH9ZVT8i4KZ1Z+jkTmffdzfuX9HSf36iKcYp2e5vFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866195; c=relaxed/simple;
	bh=0QEqawd09RXvtfmG3vcIfclUrjWUtcwJShjQ4lJWvNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXA+inIOXEfYeJnmmg0lSwgfVCqjLhHwzSjATEEv8RQzLdKi2hpJMMLgNDWK2uKis1+H3sPLIYQu1p5gKdnkq9nPdCmRW1OGHHVSU5WfQoBZ88yt694hTf7RXuWjrmVipNTONxE3Dqya3mO0rvKJGtILF/NTiAszTs1h2lYbUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=H+3RXrSZ; arc=none smtp.client-ip=57.103.88.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPS id C73A41800106;
	Fri, 15 May 2026 17:29:52 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXloRHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCE0CWgVSAEYXSQVYDlwfQxQVUgRbK1cEXBBHHlIKHB1cRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1778866193; x=1781458193; bh=8oilIf+xvY77DztX+9ofc5yN0AnE5auoy4tkBhmgFAg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=H+3RXrSZZFn17mt1KivwXirjpN1BJj4ACme3U4Ap3A9AHySwNIvhsby5XDax8s0hJhZZ1bIQeoNESvvJGQwIZ1PIXRYTAj6aEmoNQCErDP9E23kjYuLwG6pvHsJIonLx0fpH7cmYA77UL4Hid2p3cUdgjf7zG4N131mXoQGGYZa6epGkO3dYmmjR5eicJjxKrcFmLZwH7cPCAtG+12xsj4ImF/QBKLPngxQ9YuuXCJ+mnlHl/v6QTRrCWH8rji1FKuoolkZ3/dkP5/a0Z+KdMEgnx8LI25M5siFBe1Pt27foJEISUf4vAEfUYvVxUevA6phxO1fam8yCGz+pHjngFw==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPSA id D619F1800206;
	Fri, 15 May 2026 17:29:51 +0000 (UTC)
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
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Sat, 16 May 2026 00:29:24 +0700
Message-ID: <20260515172926.16597-3-mail@etehtsea.me>
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
X-Authority-Info-Out: v=2.4 cv=Uf1ciaSN c=1 sm=1 tr=0 ts=6a075811
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=igXnTUiGw3FbgO4kU4gA:9
X-Proofpoint-ORIG-GUID: VMb6T2NJ8RtHvrtoAIwJXSCcf-smkM8w
X-Proofpoint-GUID: VMb6T2NJ8RtHvrtoAIwJXSCcf-smkM8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3OSBTYWx0ZWRfX4X+aE2o+1dwS
 8n0SLW85upNHKT+uVpKAkxjlLYw5CDnYqWvpZjJMWciOdjn0dXBYab7EOHdFY9ABEou0WDc5THD
 fqgJhEY2hxSYpA4HfQ9l+ecgxHKYTJho5NBVJ2G1ES2CdItemeclanSH7LqmMNXunB8wRph+XVW
 chA0a7yRsevH2Jdn9QjONysA/RT5tNVHJYjcuBj8myAi/uLYUxInPZVcgTE0MDrtXep+3f3OQ0K
 5HdUBOINxSznshVqHXOmh8rJC1eZHtMn3c/Vs6u2Eq3IQmp0/Q3sGsfbCUf6bfeuY8czmddb2N9
 +GVwZ1ySUBFghjLGKKp4xk2yw1h9eEiI7SFOGi6rrkjPg5Mj+UAjuXFLEc2zXA=
X-Rspamd-Queue-Id: 5C7BB55531F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:dkim]
X-Rspamd-Action: no action

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..f5401c9c4775 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1147,6 +1147,7 @@ properties:
               - dell,inspiron-14-plus-7441
               - dell,latitude-7455
               - dell,xps13-9345
+              - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,ideacentre-mini-01q8x10
-- 
2.53.0


