Return-Path: <linux-arm-msm+bounces-101706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNw7BD30z2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA367396D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC5D73016266
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454613D5237;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1g+Qbf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC13D47AC;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236118; cv=none; b=TyPOUhRq9PPowWmIurbKPNRc9Wh6xRsFupWogA2woNnhDdhrVwcknwoB8jhc5wwBpuZ8fND/d4w2XSZhui5zIWerUpMS4NVYcNkOSI4h9fReP5YxdvIIo8Ql7Sgcq7prVBJbMwl4gOEDDBE2jTON76jVaQRe/vUuZblc+0lTRmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236118; c=relaxed/simple;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK+U2sX4MbGKW8FAW3hc+IunGFk6eFeWJIj/SlKvXsWRXY9ZbQFgtImiQltVodv3IiJNKv0jk01pYP7HuW/Wbhld+U2oG4qQiYxi62HpEMsRB5JHCfS+F4Z+NcjmwBm3qobyjO5o0Z9D838MAczjneIMckrx0s/hfe+3TUPMRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1g+Qbf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1002C19421;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=mWau+z9gzfl+tuHR+lGcgDHqPCc2l27GPvMVfJPudmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y1g+Qbf1ch4N+koDB2V+S7QVEOzgVfy1Pf+jHl8igUoVTRUlGfDAcPISTYrFZeWZy
	 Ks7Nb5os+jpxx026l/8BycWzDQClDMkvO+TdB8FxQqVuihR7o2OXiX8GH7yx5mzBjA
	 WtZcjbDFjkwqiRkMN6CX6FKLkx5dl0Re0XpN7GcH3a7tayomG2rHJ9ys03/CzPcIAq
	 P3EBFnZWtDmuTgP7rCSYEPxg9WzToortNZmQq2xVA9GBYsnKUvnJb9w/+XuH47FP+h
	 BXPMYfkkSksRijxEqJEKKL1WQCqftX4oIIVMRvgEqH4BCQ71N4aALqiQkUfkFaBGwI
	 /HAQ4Be1v+c6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD802E85388;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:36 +0200
Subject: [PATCH WIP v3 07/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-7-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B9kCQKy2FHl0reom6sgNtirncPHLOm+2NoyBOxtDRYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQMAdMMa8inZgJe5N3QgZUxLL3HOo56OBBV
 XKlIO3YWsiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cg7TEAC3dCICaldvFwpJ1VhQ2F9/wtFtgSr6tcnU9h5ePpTcqk3blelW2AxD5fL6BY0hcVpQEgn
 zq3/mw0I3NfpVAcW2vXZ+x6Qxx0HtKM4ELLb6UPsUcXjw78ldYN9k/0kpljwWv2VYIEzBBtlcn9
 l1iYGkQp0CtnjfbvvBHrzaxvmDoC1cplh3FSzRVVujsHuF8ORmmedS58dQWI+ExwxsGwlYGSOCh
 UvruzaqrNWzvB/ap5xEQu75gTaQIYZTDa1bOJqXF0ff+ThmY9rLX7gT6R8dbbTACweYig+pxaD4
 wUTMvI0ZcJSNLq9/oi8WZLUZQf+5OoJN/+Ja8sYAWdEsxzENW/H/UbxAtqPv6Zz3fpu7BF8hAle
 sT18KpLuSlHJeQhY1HfDX16SAF/mz4qWqJ5F5Ek/bynAIIumhsztLdBbtgO7BbHmM6pZgAKPw+b
 jTDDG4E2UyXR/uOxRzMOcOr36/tFR/fEjRPkTgGG4WWq/8YmzvvLfKO7jMyoSiYZRS2VLAC9Jyt
 fUIyWmyDNXtV6qrkqtBfy77RubF+suBnVzxKzL4u3wrc9A4QWZkU7c6jaroY+dWE7mIkGpMPDUW
 +TyIggaw8QNegCIaKgyswUoTP//mwWMxNii9dqcAMhIamKx+pjghlnWQLh0pHCy8io+jiJ44KCW
 AY8mUjTNBEZLkbg==
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
	TAGGED_FROM(0.00)[bounces-101706-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA367396D24
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



