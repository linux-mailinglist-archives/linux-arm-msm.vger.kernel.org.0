Return-Path: <linux-arm-msm+bounces-97739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKeFKWUAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:54:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93E2921F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE1D13055963
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1507337C912;
	Sun, 15 Mar 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZWrgbzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37937C0F8;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=mGmdVpzZw4fD2F+9pUsrTh1R256wZVL5EMrnuCPXEpTuh3mb8Prn1ZrovnIssJobknvGWHn7M2VdxgRDuHOZG+bgMcHu9P9qYJihfHbjQOxzi14kykKF/F2eMqic1U98ZcZX5l66WUgdc8CVUcreGJFfq4LvK7Aepbz9QDpjk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=6HW5C0SfqEBAxDJ9xWy7Rnz4x8QeHdPYr0Wv2/Kj0hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UG3cmFgomkYVyibPFMGigfcTdJcRqrZLsrPiB9xpk8q5omhwvDGoK6TsatuMpSDyPTUQWBhxWeX9ATDbKIFxbFeAxgwNvqgzVpy7Pb/IC7qOWt0FxzpGmqlSe2zt6Ia5pxJ/yJUrvbsXZmV7jD2I+KOWhOVbXBA1+P0LnRRc2mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZWrgbzx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A998C2BCC4;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=6HW5C0SfqEBAxDJ9xWy7Rnz4x8QeHdPYr0Wv2/Kj0hE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZZWrgbzxJFKKYMi4JI1C/slZsljv3rdIuPa88CSrA+9wkYKUBRJ03CAdE26ve0i/I
	 xx8eZhZ8pqaMeiSCJIC1CVfNvnJC57N4b1ixfseUoIOUOAP/Eq43myk6be24uI+XGA
	 CKhB/RrX1zO02jvpA1wRO9xeVHRd9UXNhgBoJFXA054BjZL57xNGQZotANPO2bUuUX
	 gd6gJ6q4AcReYCBosG5iD/5Ov+NrGiZnFhCAZTphr1S8CgoqmBB5sNhYLHk+IVsPl7
	 ccEHn1ffIBI+aaXvN7KK13kXHCFshRoeOmTmroOEAZGYobFgJ24p+1OppYld0DA070
	 F4THZ27BgUhQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F399F30282;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:45 +0100
Subject: [PATCH WIP v2 09/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-9-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=h9cECjq5ixf532xdPZjxPL80kJ11WrP4Xf5V/9RKA7Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6lnDIMavIrwcYtj0lh0pCOWzu3RevBl4UZ
 /fzW91xkmuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cvsJD/0Qp9xOpywUTHGKd9kmlHiS+une24wyAVlUwl4wIPH99T9Kz0GpdLiNi5iLoXZ+IVDMn55
 3EgVHXRuT0jTAb9x1gavYNq7Y6xjMhL1Nwy/kW4ihm8F6n60RjJUWlHCUK5hjtUgk3zdIcoO2Zi
 2uA09vJvOAyTyKLYUO6TwSab9cwEm3R5VqtJ1JMGCFMtUKGYY6QoThCx+B1Y0DnDE65L8WrsG+R
 nhmbFZFT/J6hOz/e4K4hkwA2ZjCp2t/2UrwTBwEXH09LT/KUV/uoWdRoC4dxgFZVsi57+i+ogRf
 Wknku5jEaEjXRJxk0EwP5rHkfmcdE0wbIQV1LUnlafnGEAEt2JW9aacE1mT7qBfdjCECl8xYPxZ
 V4nBwCsNrJEiOj8ouYuWEFcnJ3pZU10+SUWn7I5eudR18D8RUgC0QhzR5p/ufmOBtz5jLja3xbL
 ie1Hkv59fizlA3mST2/S2O3THCSS9NiIXznmHNeYhoIyHaz9Pz4Ufo0Bio3OM0tWs7d5rMIwUrr
 YvbspcwL2xe4Cun+3BAXEy/CnVbKDt4aawnEsp7AN6BItGL7e99k7t0tX9KoJVMsynqt2tResa7
 NP3lxa1bLZ2sRhDT0S/ipLJEnWvWf8pfTug4OXPzyNR5XELfhfgXemKqHiy/vjM0hxflN6DFsCw
 NiiShg53lFQ9MXQ==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97739-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 4C93E2921F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..66255893a99fb 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -16,10 +16,23 @@ description:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      properties:
+        switch-gpios:
+          description: Switch between SLPI and AP mode.
+
+      required:
+        - switch-gpios
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1

-- 
2.53.0



