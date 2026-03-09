Return-Path: <linux-arm-msm+bounces-96385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJlmE7hAr2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:50:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55191241E18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27E5630300FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D681A368955;
	Mon,  9 Mar 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="X/UadPab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4436C9CF;
	Mon,  9 Mar 2026 21:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093039; cv=none; b=TWdetwjPJPmY78R2+JzQBiL92rMILS401cnD1CHXH2lv4zOHelAyC5m1fC7r0ZckTR1WgPGY7qsB89i4jdFUJzcDv/DVj3W5ra7259R4KoDAhuZ3taZfpWMMCrOxwXRm/A4jI9D3Qce1ghmxPsW18iYcq0hbr/rqN9mF5N8pYXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093039; c=relaxed/simple;
	bh=tisTtLGJmaOakmdvHaPq79g47Z/8EY66GLxvsnj2iAE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUduwhwPm4H4TvGkUqnHcasY8g3E+YzuEI15cd45mUfNGYOif/JyKAck1KqNW/ANelT67dJ5Zka2G6Hmw7rdZJaRn1GHhdgZUIH2BWB1xqbAf81wtKmdOHIt19wvGHn37ZTmliAlNQek6mgFGp2HyF6dhZdR9c3fLVlr+DHw3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=X/UadPab; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773093035; x=1773352235;
	bh=WTv0FfVezxnSMTKCIL0xb72uuwWAQ2fhL7TOd9c4MKA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X/UadPabJXuPqjxNc4C+D74fX8eljHkMiT0/rZ4/lOV7sQWg0hP9yov59cwZggcvi
	 +vx47WrOIbc9jwpJRmgJn4Azz7qvqhkQ5kHEgDfFHushxpKrIZQNo/LXSLmIiOaifG
	 SmR/iBRXnwknuIM8pBCvRyfnVxAaLC9l12I2q6GNyhdN87QcL1grdnydC/ciEj8JaF
	 X7W2+Tz9GW+Y6CtR5VcZD95QCVuI7CHqUPGpW2TeV7HAFe1jefBfRofk+AzZEqDnw6
	 SxIim4aMMp9n2NRw3loZvBTKsv9KpEcrp4j5AmPqIFTKT13kocGSWiTX//VWl7Pqo1
	 VltV1FXRZdr4g==
Date: Mon, 09 Mar 2026 21:50:31 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/2] dt-bindings: crypto: ice: Document sm8250 inline crypto engine
Message-ID: <20260309-sm8250-ice-v2-1-0c8c46ccc814@pm.me>
In-Reply-To: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
References: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 308e3c32cc31264936b92205df22e4119bc1d7c7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 55191241E18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96385-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
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



