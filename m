Return-Path: <linux-arm-msm+bounces-101189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCY6OAGDzGkFTgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6E373DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 04:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D40E30EC80B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 02:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21C0318B85;
	Wed,  1 Apr 2026 02:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F6QHDS+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C322C236B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 02:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010305; cv=none; b=byXqVzeYuTjuR4v7gVD6+i+KVc6S9K8Z1Sn6JGmh2uNg0daYv2v3OfttQqE8Sfc7gB2452JhU3HJlAXxX7tbFQofkHWqMOfOuDF1guTDwUC605ayM/8xDHzD++o8ADhQnHs5lOsZLj+OhwMMUOsV8Z1ZR5VJ5xF60/jwkYyBEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010305; c=relaxed/simple;
	bh=8POcrN5wnN5ByMKttfeFqnJNKqMVB9OcWP4HShvXOjU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXb4Hs1jwFwseJggd59fgsdbZ6yV7lzauUD9meYNRkNV7/N1iU5tNSJ6X7lWz/qT831r9vYTeHxff+WVaDjf4xM4F7SngY4vCf0RIqPffak7rP8bCJr5Z8YXzvbKAQGk7bn7AXJlfrP0q0D/aoC4U+spQpywwkYkXykD8jw8ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F6QHDS+g; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775010302; x=1775269502;
	bh=sEQuisTUh50Um6C7iNonScow2WxqVdrBoPWXCIZYEbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F6QHDS+gUu/AdJ+vwj8NQHL6yoi8BX59z047eE830al/a68xiXbHpKDrbwBX8OUiS
	 /A7sj5tzehE1g422wMNvhKxYHAE86CmhFbWjkcgye6Msx6o3Tx9HzQ60wkFzysQQz/
	 EJqNzsvKeF0gDsYaFNbGYMmQwhrD6UNzv6ayW6WjJ3fmbCXzosXBXyzYnXcVpsLnqL
	 gAbP7CIemVDHaKEBHjcjbWLEp8DGgYhBRPDkLgKvG/Dw2EQiOPPfIQ0KEw6o4uvvQ1
	 7bnoMRP9H54IqqnUkkBPJHWCjLCABlBlbXbiTDHuUFPT9+cNChvs7jgFlHFJvlG8NV
	 d4EECjMGJBe+A==
Date: Wed, 01 Apr 2026 02:24:57 +0000
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add Milos compatible
Message-ID: <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
In-Reply-To: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 24e40e4f8e8e8d0cf552c6cbc285bd4c7db75904
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101189-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 6BF6E373DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible string for the QFPROM on Milos platform.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Doc=
umentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 839513d4b499..936878e74895 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,milos-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom

--=20
2.53.0



