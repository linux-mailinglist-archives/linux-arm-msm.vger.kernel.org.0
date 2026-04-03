Return-Path: <linux-arm-msm+bounces-101708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ0YNyL0z2lS2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE51396CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D31153012B78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7357C3D5662;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw0HBVkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D73D5247;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236118; cv=none; b=NelvwY5j4VhTRdVUWJN98007LlXvl+SNiTUEtKocw01/n119j1+QCZ5NRpJ6RHoCMkmQ2f+OM4UMDMceajiIftd7GG8bQICMSqCPZYFEY/qIwUvfz1NYStc9yvJ8uzaDI+rtnH4pWfsB6uHt6nA3+5IRkOtHd4bwblnP5RmfMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236118; c=relaxed/simple;
	bh=htLSa/pFYIGLX2V/bgi6ZPOMIyGWL50VFCX7LC8EdCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRQJ6E3m/K9frZwYTKeis4GDLySHjkHqdn/jNo1ilsyfNx+me4FTiKKyrYoIxZ5JoSXj88rPkMASKdUZ3ZJp6zs3Z+W+lM7EY80vJskBfagkCETOywQ+OW07/d0N50aQqsueSmtV7fj9ZHVmPGJox5nqsgMEEtWW9ZPWeIGXt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw0HBVkN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1DEC4AF15;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=htLSa/pFYIGLX2V/bgi6ZPOMIyGWL50VFCX7LC8EdCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kw0HBVkNvo1rL7xouYmn/pqJM1cbhU4yv7F+MEBUMa8wZrSmaUsGS5BIdUm61hq6E
	 KYIMnOJ+NnYa19XMIgLVsKKn3T60/cXp4EkPz7XIeqqH/SfDaRb+yOQDcZacEMhRiI
	 Bo3ospQVK+XF6YXuxG1EZPi2gMIQPINsY2DPcHanglZKUxAvC2j8ir6/81iHt9l//I
	 6qxsYGWS0QcRwSXBCerdKpH1KMY/7a0NbnZIFJoQ9GyZBkTqmM+WACq2mc62/RMamy
	 +/ZhmDyf8A4iIomcFiB+okvqPJfzehHbzzTPhYa1LB9IpBhrD/0QK3Vbs6FrjZkOU1
	 UPEOx6mIAhd3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C82E85389;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:38 +0200
Subject: [PATCH WIP v3 09/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-9-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ghceD3FEXE+XcrRARnEBBTznzq4UXU11eu6mo0R07f4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQhvsLT2ghVPtEcPOErYK1bc52pLTCthXwp
 ayNpsJ4oM2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cmWjD/41YbgUbGKSLEOxiv4PEGfIIQ4wktekQFoSv6iBkVkiPTHmNUqUjbL3wgSp1QZ7Z4ipdSY
 mrPrBwC4BKYZVtdpkhHIhYBLxTmTl70bVUKx9WUhKM+Fx9nDbtkRS0JErFzje16MgXsoWS7CYE3
 twq13rtFuLVjiTnTvq1wXh48nUjMq0ye3TMTGNhdJPXAYT5XlAWq3GaX1GRaEmqB1kgwRiquDhM
 BentjBlfrkUrLLi3gGy+dz4kZO5YlOQ3rE5kza9WQh8CMdiFv6bfjxvwHN1ox6760pWlY1yOPN7
 fHUIxflF5Szx6O+Lo2SrZx2oAgvn8CDIZSFNJRJhTTHuAvxpj48Vu7StI9g08XgGbQxRVhogeZK
 z5DO1v3hKn0EPl+Z0AHM8hTj/oDIvRKbNCFPp2wQvbUhIDmxAAGN48sj2ij6fdv/mPB9G7mWD3M
 lVODfOzLol/wxgiJ+s4KzHLIAOI4cQErRtA59LYQUBChNKuEIzmFguF0y7WAm/o+PfxWoMvQKVc
 416VuonE3Ex/+kqeBRoRW5ryV+5jpa14SwcbQLAsoIAG936TePuvV+A+yUCnZXHwOQP/N98wCtL
 9PRFpdi/vhSg2tVMftRkFJ7At5cisCuwspm1zc+XwjpEA3XLjrOOSsKQox9Qk0mhqGgcEdEMpp9
 vhKhmH8u+AqfWtw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101708-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: BEE51396CFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..441fc92b9a4ed 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -16,10 +16,19 @@ description:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      required:
+        - mode-switch-gpios
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -40,6 +49,10 @@ properties:
   vdd-supply:
     description: Power supply
 
+  mode-switch-gpios:
+    description: Switch between touchscreen SLPI and AP mode.
+    maxItems: 1
+
   reset-gpios:
     description: Reset GPIO (active-low)
     maxItems: 1

-- 
2.53.0



