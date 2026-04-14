Return-Path: <linux-arm-msm+bounces-103212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKwMB/OL3mnZFgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:48:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA523FDC9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E17BB30B691A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C713203A0;
	Tue, 14 Apr 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fSgYten4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98024A078
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192303; cv=none; b=S06DQZlaqBgX211fkn7dvvljMD54+IUBn0w7CURIyLivRFyYJwFR2dIwUHCPn0JOS8vAmpMen+WGNqQ85+7MO3SjY20okJ72HED6Ds9eDhh3De64SCoHSLMZ7gq4LcOPejQAgPMy3B6wDZk2NrNl8QJ+gBLaNI+x0eBnmg5IboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192303; c=relaxed/simple;
	bh=sWII8cr0IDrUaVYwsXqXw7SpXWjWkLWEAJ4fRFkC4ro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfT0mSk6rHBTREiO1hy7LsU1xhyB++kt6FdWX2yCCVMwuGjdlXZE1xXbedAhrW9BOzJgkpumlEPzrAxiRidK9xXwCV2Hgy2R/LHY5c4D7Y5wLVGt2dbZZkg2RYO44t8lmclmVdJ5WR/LgNpdge4Ohy5mIb9pMbhFFyhihEBg2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fSgYten4; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776192293; x=1776451493;
	bh=RPv01d6C/MbKERrOROHXkW+VpTGkkwfcaIq5UB65JK4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fSgYten4taoVD46RbSoytWXilBnCPMyj60TeXCPipvztllt9AG46CsWhmRfveYsLw
	 ASCJ0cTflERzKSMefY5kZHpIufmfYbjxFd40Aq22RFcDo9l00DTAb9rQ5yH2v6SiIW
	 zBhuvLPAcRjPCncRSErgzLipcWGY0LNDOnjvUpNKhfw0mNY2a/Pv80p8HaxxQMPrOn
	 dfThnbslnKsSxkyoqc3msyO7g56sYlnvNFiRVDRWcIcRIBnaHqeuKVQPAX+G7o0Yg8
	 9jYNI6jhS/ZQj0pS7o+VWl7+p5Lj11CdmCT2DCai/NQ8GfoiCd0EgYwwfPhBDcD594
	 KnwMWTJpuDg6g==
Date: Tue, 14 Apr 2026 18:44:48 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Lin, Meng-Bo" <linmengbo06890@proton.me>
Subject: [PATCH 1/2] dt-bindings: qcom: Document panasonic,eluga-u2
Message-ID: <20260414184429.168612-2-linmengbo06890@proton.me>
In-Reply-To: <20260414184429.168612-1-linmengbo06890@proton.me>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 844101344c4a9a4f6f333ccb3284edadcab56712
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103212-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmengbo06890@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: AEA523FDC9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new panasonic,eluga-u2 device tree bindings used in
msm8916-panasonic-eluga-u2.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 1335a7bee397..5b60145c80e7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -183,6 +183,7 @@ properties:
               - motorola,harpia
               - motorola,osprey
               - motorola,surnia
+              - panasonic,eluga-u2
               - qcom,msm8916-mtp
               - samsung,a3u-eur
               - samsung,a5u-eur
--=20
2.47.3



