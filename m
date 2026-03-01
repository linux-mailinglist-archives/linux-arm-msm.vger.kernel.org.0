Return-Path: <linux-arm-msm+bounces-94767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM+ACwS+pGn1qQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E531D1DF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63038301680A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 22:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FA1376BC5;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt2aEYsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6E375AD5;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404211; cv=none; b=D8LDB/bmxqz/y45tiC+R+Ka6j3ktfF9JVzBQh5aa3k0JJT4l0EeQU+3fmL1flcjV45gdOCfZSYqlDYjqCoZh3To8ANXTza7PZDVCdLGMUpMz5BSgt6isFERtatotYvnOTwxToH4n22I9t1mVLes9NjvwrJeAKzuzpXk4kPRsnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404211; c=relaxed/simple;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QD3dXI+Aom5s11fXFIa/CxDXFCsmeMLUzhidI+UfVBrGWYun5mXm2vaDf/2YC8zZWq6nml9G3zt3jjJeNm6dYNd1N+ZeDHa64j3LCe1Xv8pT5ztwYia2eU+Xtp993rgcF+fU84COnOLdrmFOOKcO1c0XGGjvR1O13HavtXjKX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nt2aEYsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAC0FC2BCB3;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772404210;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nt2aEYsQNDMYdgrb5ZuHS23bUQyM/opF99p8RhsrrAjaLNXgGaPdC0dNqW63QuWL4
	 Kz94nEdFDoqSAjAWETtuhqib6PT66i10q68JLZamWjz5eJHNTaGkwQY4BLxUPW1NdE
	 6wFcam4SvgseKfNJ5jkQqQhhu0UcAdk23SwmRKTipeDdfUxqmYnfn7xYMhxUnWokUd
	 pa6jbci3JpqHLDiLPQKFQV4bOp6WMbz5bRT1GDGHCZLMmVtaJ8gfCAoTP39RniDd1m
	 5Ntrb+GKJSkCXjlYDsVAH5qeafjdfKXf+PuGulDjvMDZa34d73daKR1kPpJIoDFmst
	 WDiYxKd90+5KQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1893FD0078;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sun, 01 Mar 2026 23:29:17 +0100
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-wiko-chuppito-v3-1-9b36a2a7aed5@posteo.de>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
In-Reply-To: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772404208; l=846;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=p71bdLWPgJx8YbZwRJN3OjH5dKZ2Biw/XlIKc8Hj8V8=;
 b=1LHDjfbVlTUvyGfWI8i3GzuYp8uMOPpAK4SX6qW1yvLQ3/sMQml1QIe7Ze+hVljzuIs3+0tlv
 e7BQLcG68EKDEGdYMXdJVYVzKyBDLoicIdFw5QBJIet1c6h2g23Pq8q
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94767-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0E531D1DF7
X-Rspamd-Action: no action

From: Paul Adam <adamp@posteo.de>

Wiko is a french smartphone company: https://wiko.com

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Adam <adamp@posteo.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index edbce100cae4..187089eef983 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1819,6 +1819,8 @@ patternProperties:
     description: Wi2Wi, Inc.
   "^widora,.*":
     description: Beijing Widora Technology Co., Ltd.
+  "^wiko,.*":
+    description: Wiko SAS
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":

-- 
2.53.0



