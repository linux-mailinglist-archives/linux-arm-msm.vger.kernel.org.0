Return-Path: <linux-arm-msm+bounces-99288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GXYITJJwWlbSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:07:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB12F3DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16011310F146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26833AE18C;
	Mon, 23 Mar 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="foC1RS1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D63A9D9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274109; cv=none; b=cT1IcsTguGyAfR1phqxX+ok0ZlDwYSBnoKWLlHm8iW1uDWWk/nTEAhIijOObPqez3Jv9jOBMjvcnER4KNxAjLA6BNJNJ3c3Gr/LpsOztUP6OETua6Yuodfa9OpL4E615J356lW0C9jFaQZSJKPcAWEh9vz6O2N8yTVGmViX68lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274109; c=relaxed/simple;
	bh=UEreFWWLBJFmuAItGcpZ6+qXRrOzHIy6NJZREzOyEiE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3Uqm+rb9borjKsha1aKUDmhulm7oEEqQaoFMDoAfOdeDgc3VUeH2t2nM1TkeEjdWHjnUbyigUPnY00VS3zhKabHWUusGAmz7QmFjdbKZ+IOw2PPKiMPuL+Z6Udcur77jQ5Nt3Hk644UXL4LxhX9qP6OmSy7+lnAVLgtKA1gR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=foC1RS1p; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774274100; x=1774533300;
	bh=+ZWa3YsogKXIEf9nJdsmauSQWEO86dinJQD1mqooGYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=foC1RS1pbyuBdbxaP4H8ElDqck8m5msmyx4ZqTKCNYWrOQuNBtmnk3XRIyMmHXEK7
	 54uizq8yomxzPbag18+1GkBcBhtKTJe0mAlRaFJoQY3b78eTV7cAklUl40cSp5R4Yi
	 QQmbnZ1c5f14yF60R9Dogzboew4bF6VpXodL0Q6LClxNU8NgxD331sE/iQeZQ/NySI
	 XOcfIkkntShYI5jhAmxWjo6AYlVOh5foVKbEcV22OV8mw9zmMznpjXpM1ItTsYyZ8U
	 qGGKG3rgeJjkZY2B2lNDqCkk43MbUAW0unC2S2EvXtzaUMVsv9d4YmDq9Pxv3mzUQy
	 lrIN8LWV9V/eA==
Date: Mon, 23 Mar 2026 13:54:53 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
Message-ID: <20260323-asteroids-v2-2-1a35fa9e178a@pm.me>
In-Reply-To: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d7eb4e224a96784ac3c4ac5098eba0780e4f4fb9
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99288-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6BB12F3DD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Milos-based Nothing Phone (3a) smartphone.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



