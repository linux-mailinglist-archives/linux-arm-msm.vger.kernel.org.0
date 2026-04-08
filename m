Return-Path: <linux-arm-msm+bounces-102372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF1+I+DT1mkoJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AAF3C463E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59312307922C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D33A6B78;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvVPmU0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81B3A383F;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=PYSTjFv3stmp97EkcdhVzq+J6SOss+iHscZpLYUqGvnzVNNhUI+72Br3+REYulzFc8udwYwQYqfGHDpnj0XrBOZo6t8M/kWy+FDJUJcH57/qVyduEyM+VVoo6Q8I1cwiqKvq0GQnHP0WDHid90aQZSGOxzHQyH4f8BPooD3qzwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQQIcm9jyWmnLYMPF6OoGdHgoJYQ28bUkm32cFua866pe+YsOtA/UwX9GeYcOd9h6wlbzFCFhoPFhO3dQ0pdYFkF5tBS33fZS/mVPeXjs9xqTr1mB73JkY3nG8tfzHaaFOI6QThafMpA4X79sX0ag5feo0LNk2grJA5nzhwEIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvVPmU0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09F50C19424;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OvVPmU0sOx9UheEeMlhva0qkdxI4ZiTjaSG9XNByx3cr3yZnZLrqyCRbnsWH6EM1q
	 Iv8iT7gfPpVFZVAsKRv3d6SoXRQAcvjQiLeD/867RNqUhf6L6QORbflBqA7WOZwyJN
	 vCXjAlQvr53AfqjM4VV2x6Exh5DO+EjW9nuBra/kcM6DjGD2IE5+L+n6qTMR4gs5qj
	 IKgwDQKTJETdOb4HsjEFLbmUIK8G0Lnag+fi8qMdnTFNQraE/1SQmOqb1TzBoDl+GV
	 ZaikM9VNne7gjBsu+f6bbg0OIhrJmecEB/pkneJ5Eu2Dz5wK8/jrXFSq+/Nbyb04pf
	 2F4vtKJM7N9uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0107810FC45C;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:50 +0200
Subject: [PATCH v4 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-7-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B9kCQKy2FHl0reom6sgNtirncPHLOm+2NoyBOxtDRYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSJUHdlj3O0LPhM1jaiJv/ALPX+SD6InEhO
 o/IffCvj2GJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 csyXD/9/mTo3zD8m6fYZQtO0bvVO2xJ+E9/paboBT2bTq30RkJAtPxJMH+l5LwJAAMOz+RlfBDs
 a9GEsQj0fEeU33q4F7tDgH2l1jX7wvOzes41WGBRRTThMvbrpq5/UfNcqGtoHrLG5pQQ85keYID
 YtbgeV1EyDkV6h6oGWHNduo2e7IOsX8PMjXcgkWGniJTjeuMM/t1VlBsb02WDj5vCnnBnzLJzWk
 Q2YO4Jr024nHqEQ8OeRXu4RZrrbGLyzHvMK+6Zaz06VndUFlKelFCb0H2nxBJr38simrrDsn+AZ
 TduQwSLEtpXvnGmLr35o112ZfG45NyHteCGGvmrVnEfWdOJZk+3J8DTnJaaYMWhAiU37NfflkhR
 Bdbwxt2jwx0twBZ15uVW9C8tDJM39mDXiEEWjXOB+31qJ5LJ9bRSI5dEaPalnfk+qJvAiojLPQa
 rQJkoysMbAyJqiYgJaOkFoHG6K3eFSkla9+K1DC+JQSkQnqGl20Xc9CgPFJbioU8lNfm2nFsmYO
 RTLoXFzxS9S83/AYR22zQI1GjnTsqslGGVzzSv0Ybe4MMOFIKkqZMcR6HpkFQv4TuGbE8jAt01/
 HKdGaSAZrw8vEyoMRqcSW2wQyt9k2Lnyn+F+fvFGV6Rn+cHhfGmng6sbgVbXrUsyG7/oAOYLOd2
 AatmeUfB27sCQyg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102372-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 14AAF3C463E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

FTS has associated reset GPIO, document it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 12256ae7df90d..64c4f24ea3dd0 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -40,6 +40,10 @@ properties:
   vdd-supply:
     description: Power supply
 
+  reset-gpios:
+    description: Reset GPIO (active-low)
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.53.0



