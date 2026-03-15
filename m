Return-Path: <linux-arm-msm+bounces-97737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB32IxcAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512D292141
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2977B3017BF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB7637C10B;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+C6b14D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846037BE88;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=EkIeBc9h6ewatJXwo6JGdknWPfIH67nlYL2X8pPz7HU3kLPtSeVHtOqFky5rjvdnBIiqA+4+4TEm5sNFe4IT1w8qmlo552tb/TKkdyDzf5EpZFByUfClEkt5mfoiRdZRrXz0NQcwXuwqzK6ixlwQgybZNyO6bS3cv+CRaW0uMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trJsplPyqiSi1fWntIvIwXfpkt1wIchUjnF0j4WOO8VZCY3ph0gc6snh1MB2OEnpTcHL+qio7Gu9WKRYtCDN2pDS+bgCBPfjaKrZj07WW7GzgfP6zjO/3cF6VXgz6vDKqnFDMvdWybaiJmALiBAkZH4hliTn5EYDbz3pG0BnACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+C6b14D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69180C4CEF7;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J+C6b14D1Z3IAY/ppctcf+zNpbkuFiZu3u6RdPlJGUHgLLDWIUCHYgI61FhkgxwE8
	 y3iuT/mPJ6fHjUwbQh1TgYSJ9eqZaIP7cn5/eUyJk7inRJzODUtVggfWyZghOi6AGr
	 SmqL/nEClcnDWnyy8tMRzhyBgy6g1OASGUG0VasUc1QvKiYa8rUEUyY3/KOfExOPgU
	 arDVifGSshCXMsID9sfO8EE+8A/sJIePSsjLK5AntOEmxKpX8wg5qssmWQMN5eXyWy
	 EiS6roiUxiOrQ7pk0+cwvFNZPmz/o1KS2hlDm9JeLL9k0R3AmT3IImyfKIe9nYf7LO
	 S34ObahG3mp8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE9EF3027F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:43 +0100
Subject: [PATCH WIP v2 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-7-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B9kCQKy2FHl0reom6sgNtirncPHLOm+2NoyBOxtDRYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5Hr4nIhYBYqKW3kJsb59+rMkofVULsqvjf
 LU/5n/61pOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ckS4EAC+Ji6pS/DWWfmBRQx00NgDnq8aSy4O9EO1aNKr9j6j4LGWZz0EV/y28xtEpYkh+19vigC
 gUa4/Uj8aTUL2sgZkqFdCxIh1Pb7UWz2W8p7Mwth1uya/z4Fv/yXmqYHNSyA9NHatV/+v7g8KdP
 6Kuftrph9RlYEDvTlzsKFIzWgnC2liyuTfgWXh6tVg3wOdw+XC9HfS3WZGknm3b6BeMd1D1Vee+
 tLToc3RcDqXjtWlEwOOHhy5N77rYg+eKp18TTQY+VqMYcBiIn4rjP3VsZvs+UHZkQ/k6yHKmiP8
 t/DR2EsM63FRh43Di+0d1zbIRt0MlVAp1o2JvaOwz0P7QV7n6zROLNXsHlV9pXUuNvw+1wSgXwG
 AEKYch9OrIUUFENKkugiH2xTcwIZ/ZIQDqrEeUL9MtUylwxHYKspRJUY8v6bfroQaH2SdxziB8n
 RP/Q4UK/EV4QyNZj1txoivWzdOleXtnz8X0TyfI9qZs0io12ske1tpKfbX5sUvpZi/0XX3JKdwr
 WsWn/qg1ksn7VVblBD4Z1uGbGZaHcdSvDhALmX8m/Y1JDtE+6wmki5owqzgzptKAyMFIS3fvVxJ
 Dw0b5X4lPkHJvvqNYXqaZCKUdRGAgv7k7BONEVfdrg7m+B0+k2+M7FFAozQfuxo4Yd9UlzYUI9c
 Ubbo/vB94zUL08A==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97737-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 4512D292141
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



