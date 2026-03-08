Return-Path: <linux-arm-msm+bounces-96082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO2rFc/erWnM8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:40:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0523227A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CFAB3015E29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 20:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8BC34EEED;
	Sun,  8 Mar 2026 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="eg/ZIajQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241042F1FE4;
	Sun,  8 Mar 2026 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773002442; cv=none; b=ebf6eMcJNbzNe6A7pJj7RQwcwecXJb/0P3/Llozjp0XKaQhKwblftEmkOQdNs+fZf+2uquHL0x27Ayiq0cMQ9jFszJFsYmQOFmVZoBJsBXtRJdUKIVa5R6HEiJj9fjOnFArK4CqcdjO4KV5l9eqpParGFgfC5OfQt42LwU9uDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773002442; c=relaxed/simple;
	bh=GLXxvJBUOmZcMI24PdVrCvovG3deiXpnKgDXQMxFWi0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJA30qvcxk/NxspahSN//PaO+wLEwUrvNLI494S4/liRJn+uze1TFK4Xf5ZhjZBbE6YdT0JsbnxI58Cu2ElvtfE2ERslMqm8HWpUqeuyFQSAxmI9rYB2+N2gjWOm7COlT22O/sxQ5/vonLhJOUAYu7BgTLnFrFPsUoZEUEU2uO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=eg/ZIajQ; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773002439; x=1773261639;
	bh=EyP1ZljmqscKfHPF+UJaeqodgphbxOfsGR5LIy67Ab8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eg/ZIajQ5xLO3pdN/ACJ09nKnssS9VuWtW76Ed0NOtpoTh65V8cF5sifuoqMt7Icl
	 xQktCQOR4cU3CwA4/Q3PUtA7uR//9MYmtOPFvVFVBbjtu++iRd7mYtRzojGhRsXTOT
	 An2RGG0A3ISQIgFUss70gA7KiHbWGw6Ipk/c6G1aY7eVANXNkEpx+2+CSV1GUkTh6O
	 G8SBbW4xPq/tq54XqgUk1pY9ki+5dJJqWDVgAYgDRyofijKAQfmf49NX16Wly9of86
	 N8134KR7PmXqGdfwN+307kEtWTLk7dDx1+dGYbGDGmdr+I7SAFFOS54OC5T9F5Z//Y
	 DdzqzqSH7t6MQ==
Date: Sun, 08 Mar 2026 20:40:33 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <20260308-sm8250-asus-obiwan-v1-1-3c72941eb796@pm.me>
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: aa1101bb1d828150bfcb2da8a72db9b2a4e9a20e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DFC0523227A
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
	TAGGED_FROM(0.00)[bounces-96082-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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



