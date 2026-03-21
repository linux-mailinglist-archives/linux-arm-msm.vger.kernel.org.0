Return-Path: <linux-arm-msm+bounces-99028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NiBIs/OvmmLdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310A2E66E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D48DA3014850
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC572512DE;
	Sat, 21 Mar 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GKluxcCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD41DDE5
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112449; cv=none; b=VxUbYgWEGI7rKRRrFqMNaWV8hVaWy9sGUCcHa+r762yhngz1jJGuKOiuhtBHx8Bw8cV5fxq4riqTCd+varngBgApwrJKa7ICbKzizUB1ddlwK7icFvTIPiDIZbejEWbYEJEq4BRGtHpZOL4ZU9qrQnF1jFvRwmBFZ8cDl4xofAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112449; c=relaxed/simple;
	bh=hobaOBjZr7ejNOP/cYwFs9u2HqHg2t/KRRJWgbUGqcM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrls9gkWNt3ZsuTV/uXkDoKw5Xqkzv+XjJv5kHXZbMXBCGv4mL2hD/tplklr7/R9foXam1sx5huKKmbNuUbULSQgvZeZLmsUSIYgnjWs6JA6hozH+jaF/lJ8k7Ksc90Fqoi2JUc+8HxhATmDUCnVoPAL+Sye8vZH4/N8lLMmmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GKluxcCd; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112446; x=1774371646;
	bh=cN0oaw2LZhH/2rsJo+CiYENhJZm5c0pRbOxhybO6ecM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GKluxcCd8cScMOF7muat5K5JwyTS2vAyooM89ygKbiGYWJ21vOZbk4TMEwgQmTXJf
	 rK80431qLMWA7MTSNyrB3++ve8Aavbpt21p5Y4vqvUIQJC2X+i/OJTO4K6ktK2ZxL0
	 Lepy1mgUuF8FuL/40GihXSwSwQEE1LrsUFtusRQh1YVEAGbi1+dM6up9KiawFLp0rB
	 I1PKiNAgiGX6rSCkbBbpyfkX4rOYnhrCWgMa93tnpaevOCsRH6V8paAy0UXCcZJbAD
	 C7OUMB0f4UIDPTEragT+zxKgvXc40/aQ8aFgoL1XYVeyVhT9d8fvKFMkvO5WgvKBfx
	 +voilTeFuj8Fw==
Date: Sat, 21 Mar 2026 17:00:40 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
Message-ID: <20260321-asteroids-v1-2-4b902901cb49@pm.me>
In-Reply-To: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0e9812adad25ac0896d2fd15e10f2fb80d2ee38d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99028-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 7310A2E66E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Milos-based Nothing Phone (3a) smartphone.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..63b55a7fbdae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -64,6 +64,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp6
+              - nothing,asteroids
           - const: qcom,milos
=20
       - items:

--=20
2.53.0



