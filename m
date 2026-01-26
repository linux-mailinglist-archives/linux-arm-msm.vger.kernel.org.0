Return-Path: <linux-arm-msm+bounces-90595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKUyBFGYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905C8AC13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD6030347AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F1343D8F;
	Mon, 26 Jan 2026 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fue4GBnv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kyg0BMT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F023A58F;
	Mon, 26 Jan 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445415; cv=none; b=CbKWtzdoT2vbuIQVoL+K+ipPDmeVxwd3WSYfFfu55nFvMXcMi6kDyiwDkNrnE8xr1eK19+VzGEMTQXUKSmXfsxuDgXj0MSiqkTJ/Z7r3sdGZXK/TJ+oxQCro5gV67iONFphDDxaarrDOWNSqmgFWIc5CxyObl/EU7hhr3ICOnL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445415; c=relaxed/simple;
	bh=BGD37iXtuXVqveIhoKLUva+wDLcwjb4aEPD1NwPfpoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTGDkcfUaRpcAtnkbBjljwLm8XPhcZ5D7/TSq2DmhMF7bsSg56ny2YNX5QTEOGqYPlgAKLL9Agn5Cx8nezMXHoWH8sf3SjeyjmEx6pbjMzEn7O6eoZgGqtjFm9Ga0L2zu275x97e+KuniNDXsHUYXUOP1Pt1WK9rufkUKgnRBsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fue4GBnv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kyg0BMT9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445298; bh=tXubEZSnhpcufNXftqhqFFl
	cq77hv7GIVJJ3YGo5pfk=; b=fue4GBnv6KB383F5tumMY7RIkgCQjuEdW7l3yG+7OL1ublOae+
	zwFD+3U1ZRbg5yUvVGUR/uVvmESply4jkOkJoCOaNEezslYvZGIHaKd/tLD1DKCcS/n44LESFty
	KxAEnN4jRo99o4tGu3VDMgm3BgKT8MDdxHy6MLvbYIxCpiY7HVoSESCiArNsPl+yQb2SOiuiAEa
	yvkhbsTwOP4GH8sBYtC6HH/e3x5l+RBpj5HUPZ0htaLIYZ7X7iHFBwP2Uv7SeYLPajOr8HGuqKt
	ZLVZ6t9H+QisuE0Bg4nkKeyemveOM6Qt5y1HPDn8nfuM0UIm7LhiEVAknsHqwP2f1zg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445298; bh=tXubEZSnhpcufNXftqhqFFl
	cq77hv7GIVJJ3YGo5pfk=; b=kyg0BMT95z+DR7z9yvghk++3kerYfeoFmZpJRP1u8G6bFpdnmt
	I7BVGPgVvVGpJc3Je4c5ah+zwWWZKoqlCjDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:56 +0100
Subject: [PATCH v3 6/7] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-6-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=754;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=BGD37iXtuXVqveIhoKLUva+wDLcwjb4aEPD1NwPfpoQ=;
 b=7FfOMNs5lEv5/juxlPl36RfrtSr/qybQR6Rz8Zj07vousJjNPib5h0kvZ/dKWybAFFa8FX2Q7
 /s+AfL/m2b6Bf4bqIoFEA2nihT5tM3SXvZdjrk6+KSnNowvq31d2lQZ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90595-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 8905C8AC13
X-Rspamd-Action: no action

Document the Xiaomi Redmi Note 8 (willow).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..f76cc92d5530 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -966,6 +966,7 @@ properties:
               - sony,pdx201
               - xiaomi,ginkgo
               - xiaomi,laurel-sprout
+              - xiaomi,willow
           - const: qcom,sm6125
 
       - items:

-- 
2.52.0


