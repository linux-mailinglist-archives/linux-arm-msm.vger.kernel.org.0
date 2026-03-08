Return-Path: <linux-arm-msm+bounces-96004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLnkFNL/rGktxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:49:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3F22E803
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9CC33010B61
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 04:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C1A286D4B;
	Sun,  8 Mar 2026 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="AUUdIg7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB12D47FF;
	Sun,  8 Mar 2026 04:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945357; cv=none; b=QlHIefFSUr4FfL8NUmlPEhZp+gpgeavqvUMryyzaHStSf9gLK59a7eT/4LAx9ypY7cEO2X81FYrXT0F1Y3zVoVOULL77o0Hi1m7l3KBS0+BvMNr6g/+v53w94jJi8jpCnDVGogdg8P3Y9FrcJZUYOrQm3A9sidsuiHEiBcVtH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945357; c=relaxed/simple;
	bh=tisTtLGJmaOakmdvHaPq79g47Z/8EY66GLxvsnj2iAE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3wOhc7wF4VW6U0DNTMe6+a78zpIZNiy3fsNeYBcHXo8OgVCRniE2FJpMNUS33n291MrcqYw1uF9jhVYOomsMut0GBzEgdc8kUgpvG3jxWqrEmuCGds58ykht9kxEYNxrFRHOd1ksz8USZoxVQPI7SorTsY5gGqVtmgjQyuU7kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=AUUdIg7i; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772945348; x=1773204548;
	bh=WTv0FfVezxnSMTKCIL0xb72uuwWAQ2fhL7TOd9c4MKA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AUUdIg7itPYx4ksS40l+zQSRQp47fXdA6J+HMpPkePAWD6dYwylAxgQ3DzVZQtzDG
	 N6Ntk8faqdptNOwfyFwvFpQncw4vQEF2ERIXv/FqhiYv16or9lxtlAQQnxRCfPnBsi
	 kmpFGtl7KaSUTTG2/Plu8W9OYThZfNWRjLPCFO9W7SOClSNphZcWfhjtQyNS6/NKOc
	 0bcyXkB6XtRbR+Tdp21z/VsETJuMVH8WWd2XwZBhlMgQ/DFm9u2CqctGzBbISRwLl/
	 B0Mewi/WoDMYkYBJogCIv3JyIUeAB9tyGGL5XD07/DFJBEHc5K/L0oMDrhEQTWrW18
	 m4xSt/3wp2G+w==
Date: Sun, 08 Mar 2026 04:49:00 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: crypto: ice: Document sm8250 inline crypto engine
Message-ID: <20260307-sm8250-ice-v1-1-a0c987371c62@pm.me>
In-Reply-To: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
References: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: db4d331b3a505f453c9c69d7c20f8d98bb2f4bc5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E7F3F22E803
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96004-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Document the compatible used for the inline crypto engine found on
SM8250.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | =
1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-en=
gine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-eng=
ine.yaml
index 061ff718b23d..ccb74ea14ce8 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.ya=
ml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.ya=
ml
@@ -19,6 +19,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,sm8250-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

--=20
2.53.0



