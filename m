Return-Path: <linux-arm-msm+bounces-96819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJfcBunWsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62325B165
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC1893094609
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53594346777;
	Wed, 11 Mar 2026 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YpPc7P0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1FF33E368;
	Wed, 11 Mar 2026 02:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196998; cv=none; b=JQDEsWgeOh3NIZhWSoQHNUn1kUFr/5RRn+wOy8zObIG6B5zWjkf7XtD3iljxZ890q4uXQOYnumysz0691g61Z917LMrPHUmVkr0FLVSMwt6HprXBkrvnkPgZzz/GiByIsxSCzN82h6Isk1pX3GFgH0G6fnJPfnbDiGHe6Rvek1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196998; c=relaxed/simple;
	bh=bVGpXn+ZgXNzH29Fkhvwsy1LuzF8NaqAwQ7MyPWgenE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elqTm1DnD8fpeUxvucugR/Reg9FS6ryCemSK5LJar+i0ltU06rvBPExUEu1rC1DVXWaiLIa+z2SP4AryL6HIFexBNuXHtZjfV5JlqivP7SLIBQBaWdv9Ts4glkL4tYWko4OmZwClhQE+1UIb2T0UnfAYdtI9+p1a2FyfzUbV6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YpPc7P0l; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773196995; x=1773456195;
	bh=I9Iv7CGNOaaXVx5yEHSx42l6OlZyyzLak3JX3j4oK9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YpPc7P0l+Apkz+KpZS/amD2AyqZHpuj5wjZaD7zVgr5ERPUSIvK/W+SdXWTi+U76n
	 4lr2lmMXPclnq6ZaZoPLWIn0y/0gr7pjtHmEXiclc7pcXbG8FLFuyFHIsFcFonMHyB
	 OQpJ6xT5627Wb8XRgUshbPDndku06iiKXSRqLZbZoCeJbnl8SWTtchpy9LXeNn5j9v
	 nIV0JoERDTcIJnNYymTo0FJbSkrnrBlyhbDUPtMmbVAqJIN7Iew5DT+J3onNN9HL02
	 FqgH2RbXKvh8gY+zjVXhuM/FAavkB13Je6RONw8ewVjY2uhq3dSwZsNfK8mhYxHd2D
	 He6sffEX81t3Q==
Date: Wed, 11 Mar 2026 02:43:09 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <20260310-sm8250-asus-obiwan-v3-1-9ed8f0e71e19@pm.me>
In-Reply-To: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4f0ccadab099be48158b44c4cdc4482d40579fb1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6E62325B165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96819-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Add compatible string for the ASUS ROG Phone 3 (SM8250).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..81677c0c5d47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1010,6 +1010,7 @@ properties:
=20
       - items:
           - enum:
+              - asus,obiwan
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

--=20
2.53.0



