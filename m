Return-Path: <linux-arm-msm+bounces-94758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ATtH+t8pGl5iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89581D0F76
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DD29302BA45
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D21B33D6F7;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JScHEKDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D833C53A;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387480; cv=none; b=okxon3oJGdEL0JZ8KU40aUjK37AWTLUZx0hvYCJmf8l9q544aKMk01mlizbecM5DtLym1DqrcXnQoqCy4gjDt4Uf/Fkj0KCvLSWYI2no2FqV9GaNwPevjy0TUhow8vaBgesI4Z/cSLWyxKqqY+A9INSMH97TjtY4m4uEGk0eJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387480; c=relaxed/simple;
	bh=53WHfGqqSMrj0Jn3TMtTuxOcR8r6avGv76zZSnG4JUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jyo9KEmIlNVVT6kHH/GW7eMR4vtpXub9pgRHpQe2xJjxO88kJqaK3YCDwJq1BgggHF9zTXkoQ1y2WZ8M2Jz66RRsoEeRinGkuls4ilQn4bfGXm/X+e3x2rRQC8gH5cs7Ea5kH0WqgDZW4SfFJzjMs71ps6SgavQWt2POkO797rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JScHEKDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA744C2BC86;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387480;
	bh=53WHfGqqSMrj0Jn3TMtTuxOcR8r6avGv76zZSnG4JUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JScHEKDeJnP87v0I/Jqc035udD/zNgdpn7XvcSUKDkHOnLnqofkWFC6vklzq7tO3j
	 iYgqv8gJO5Yyi4nJfUKzdpNeSmxQAcXgowRgeFS2cs7rfH9gUj2/vzCh+LtnH3tBS3
	 39d9lJ4gr7LtS8oicga7xrfijSFb5VnqpPWuQ9NtCCLizhdnvpqTjFSc5UkJhY6BpA
	 sMxuhnyFMCh+xgEzNOHTRDw5Q29nYlobfR5xn26XgjGWOVe/7Yk2lkH2ktx4r29/Qp
	 KZwxY1mFX3RZHFocQkDssXoJiKakZC+W8Cp7zi5pmNgthkDpbn42KoF/0dTZe5yn73
	 ojcMtijYE5LUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C1FD0075;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:22 +0100
Subject: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hq9RJ0MPDH3qjbBs4V4v4YyIoe73PSNk1u1yb638HiY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVCoxRU7IViUqu//ep20pNs3plY0LsjQwgQ
 lDE67NHdlWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 co93D/9PCMgQHcgoRm260zPygFP00u9m2DCOEZSMzuD4dRL4nBeebVnK7tWlZOCUgc1Tk0pyxf0
 QvYfnMkKFpTQwqj+S+Tje/BEeqI2XP77/OW8qTx4pVab7h88y1lo1z1G/T1nGqfnedrn3iQFpG3
 7Unluofdg94QhqjPVx18olmR6T3OuY467B6j2fK5UjZMkv84ndIJF5AUFRiZgNPffoWAWO8v77F
 foYfGO4Biy1VtPIkyozYea9ZDTsO5z2j8Y3x52Eet3bUITLySIvC15ocbPaxT6qroGf9JICPAz6
 NxlnqhAKnBNK9V4sGzHQ/o8aRPoIs2P8svd4WjJyA3eu+CEy1ILbJQ5RTc9Qu2HULTDdtr8wMKo
 3OmhYBpX0bqHjb2HRN3wX7bFVwENH46wM+hAPmhzQUcY0nAywkME7d9GvdcH7SYt/Dd0G5vUz5c
 6XtPfKED2ok1y4wvFZJ9BdnxrK48bXVqUBAp9L4CpwjKtaDu4uRRBtyVZXNUjATH1+W/qmrkjYT
 8K35YL7wyplFX369igIdXYxrGAiEGJhOhE2BQgYikAw/xj1G9D2yixFq+NhH++Ypke1yixmXVVf
 dcvXvW8T3dq8/TUlD8FqLdqHLxOgceK/qlcIqz68odYJdJCKkTjSgpoTp+AbVMDmrHnQZfqQKFA
 hgcL0puDUAOlU4w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94758-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E89581D0F76
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..329d89977bdbc 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -53,6 +55,19 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      properties:
+        switch-gpio:
+          description: Switch between SLPI and AP mode.
+
+      required:
+        - switch-gpio
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.51.0



