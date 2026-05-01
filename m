Return-Path: <linux-arm-msm+bounces-105520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAWqB/LP9Gk8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:08:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C482B4ADEEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 714B73043AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A47B3D88E9;
	Fri,  1 May 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="Bsc9V4SQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2002i-snip4-5.eps.apple.com [57.103.64.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08C3D7D64
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651017; cv=none; b=P9W7FONdk3fLsWw5bLihbgDm12vcMqTWpS4U26ZYmFJJ+SafPaaZsev7M5wCPBFJ8E0W4xarE1QRJftUkdz6E2NWl8Wi3aCfE2n8PaaP4NXyn0JwajxLiQQWq8e14muZ6ufdVuwQP//hrg5j0/U0sjLk2u+moPjHGuZ80NKbfSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651017; c=relaxed/simple;
	bh=qZO++AW+SjOK5e+Ph98lgPCghawvUhDVv9lAanS78rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNYXPOwooapj5Ww6OkN7t2a0RWrzNFM5oh5xI76p0wETvvGUwMwtg0KTQrDiUG6WLv3omuV4nLQAPLeOfTGOxUPD3EpLMj/aaXl1yRF7hv62E24Gz9e7i4UEzNDOovmIWZQurTEibnP+rYJjjmcRnmxCIQvFYptwfToXGRgby/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=Bsc9V4SQ; arc=none smtp.client-ip=57.103.64.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPS id A16B5180036C;
	Fri, 01 May 2026 15:56:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YBXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651015; x=1780243015; bh=dntdEFDWxjXy/LmalH3hxVPeMgYpq5DiHci9+hlv5EQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Bsc9V4SQMDpDQeJzFPGU20vcjQUoz0p3E3KdtaSXsnLIaWjwLui3oK6sInO+UJrT60ZX2X+cyMBj0JNCVYczYRd+I0DgqxC4Kh89QoZongXaEb2XohbK4YQiIA0eWmNOnSvsbPb+muzxeM3a2A6rlFADzqXU63RtmFpZNEUyx9cUFhv+Q0S32hWeeRdzgc3FtmX7kcbRQ59nqgXEqucWWMo92n0HeeMtRM4ZZZmLK7lLzqQuehRpA2Ei+h+3r8EeYXeFcqtRk0OxYaf5B7o0/K5vBksPyP13EfSJ/OfHAxi8LVhAH3OZOfRNIJ0LCU1jcIu+Ji5rPSVJxXmNgShSbg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPSA id AA93E18000BA;
	Fri, 01 May 2026 15:56:53 +0000 (UTC)
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
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Fri,  1 May 2026 22:56:10 +0700
Message-ID: <20260501155612.5490-3-mail@etehtsea.me>
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
X-Proofpoint-GUID: KjQpAZI8koi2in5Qt-rFxbA_ijLgK4gm
X-Proofpoint-ORIG-GUID: KjQpAZI8koi2in5Qt-rFxbA_ijLgK4gm
X-Authority-Info-Out: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69f4cd46
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=XA9NUab8Z8PrMTk6cLIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfXwm0ZIpR1mPWa
 sBJwshIHS/C7lqB9nCEVs2t6BQRMY90o7wrVfUpCMdlmmEb6F8X9zjmPk5jzHwGGG3TBYx3RFRP
 pXlEjJ4oXeHlu8Qw52D6zcTsAgo9/tPzOBza9/62W8X5U2HMk8MuTQoZwxNixppYL/0LuvUjaAX
 Oo2EuLfbmpKhVgVGg8Ks/zSM7HSx0lwCMFmDpWa8GkikLbdV2fyrGta8rQNEqlNPDxfKTWqGi0D
 4mMK9f+pY/yAB3KjjCHNziom3vBBL0zArDaO0nax9eh5MHoJd0YpLaevTdbHgiWMVarmqXhGqXx
 H0UDhS/MG99w3QEt4igkTiSLYNEVvmVwpAlPzsOcTcaCgLBa5V9hd0Iz5kgtR0=
X-Rspamd-Queue-Id: C482B4ADEEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:email,etehtsea.me:dkim,etehtsea.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
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


