Return-Path: <linux-arm-msm+bounces-93827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEDOCmnRnGmYKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:15:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B353F17E1A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E3373102C24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882A537997D;
	Mon, 23 Feb 2026 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Znp7YH7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F6F37E2F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884343; cv=none; b=H2sYIqs9O4z1qxhXtwoV9Sx915U8GwCrhJ+ohZZpcW5kGoJtB9fE1GGE+Xr4sW3D+kRMISTTPCQZmdBk0cK7Dt5IMfI8Z7B6Jq62qbFVsXpf0Vdm57kleaKGHnD/T9Zv+G2oEiA/AWTF9GaoMZXolHFKfN5MezMAMhZKtlJX3Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884343; c=relaxed/simple;
	bh=rVA5SoWALV6f1ESxH7ee7aG7QXL0O/G49eDbCuM1u78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPhJzi8o1/vslc6WuHWqjXMJVTDLI3uDSGbjGj0LxDpM43PEN2pLI6WLmti8SWMXs7zMwPGpBkIHHq6Gw8cUF6bNlOt66HGPMQeCcfPaRnaMl0yJSYGf+Dv3oZq2VIzbLeoLCmN2G+iC81a5SOz0jItTslXC1Q5q1XkoR9mUpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Znp7YH7T; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqARVC7xOknJeby1cQjtxcKWRPygW6+l5hx04Z3BJvM=;
	b=Znp7YH7TgDnz4vmTIdtVH1xYAIDBUgV0lUDrHkIzgXFFgYOGka8GsQBeF6DYQVGiof+0Nt
	HgvddfQ1XP9RDdJyB2K/0iqQ/LbzLsO29+17yMbloYc40bl7MH5tqiUJqeDtJ61f/BM9W+
	nxAAX5GDdaodkuH3Sje9ETmF0DKeLQfSLLpFwT28IPU48ku1ITdUDw4lyeqwpkypvK9dEB
	sM0+Pr2jwfJj793TFda0ftL0sVQ1lleDwTFrudgYM1miP1UGfMMmaC/YXlYIMm8f6C28c0
	hLI1LpZPYmCckOVOBR9WlMrkE0i5N/uUtvp2tuRTwa6pPqhxBD7Nix4AGaWyug==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 2/3] dt-bindings: qcom: Document samsung,coreprimeltevzw
Date: Mon, 23 Feb 2026 22:05:13 +0000
Message-ID: <20260223220514.2556033-3-wonderfulshrinemaidenofparadise@postmarketos.org>
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,proton.me,gerhold.net,trvn.ru,lists.sr.ht,protonmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wonderfulshrinemaidenofparadise@postmarketos.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:mid,postmarketos.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: B353F17E1A1
X-Rspamd-Action: no action

From: Raymond Hackley <raymondhackley@protonmail.com>

Document the new samsung,coreprimeltevzw device tree bindings used in
msm8916-samsung-coreprimeltevzw.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..58034056aaea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -171,6 +171,7 @@ properties:
               - qcom,msm8916-mtp
               - samsung,a3u-eur
               - samsung,a5u-eur
+              - samsung,coreprimeltevzw
               - samsung,e5
               - samsung,e7
               - samsung,fortuna3g
-- 
2.47.3


