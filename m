Return-Path: <linux-arm-msm+bounces-103326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCphOBgs4GmldAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 02:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 875084093A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 02:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7871F305CEC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 00:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718DD1A6837;
	Thu, 16 Apr 2026 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KLsepi0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0C1A76BB;
	Thu, 16 Apr 2026 00:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299029; cv=none; b=aym8xxfxO/fgPOcBvWKVY+Ux3VaTUsMrcJBuz84i0hkugRc2wdV55a1F9wTqMmKf4m3+Zot98I8x5S3FhXKP2f6majsat0bTHSww+SK6AotWbP9r3iYqJjOBxXnGutv7W4rn7J38OVe9T2GLWmd3GY3XRZGSVJfk7GcD7ErrUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299029; c=relaxed/simple;
	bh=L+WoxkoOlxIRT/pd59o1iSW+ntv+TbCUXUSPbLwoXT0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivTUiXCWQJQ8/Kw6NF0tZHc6cD5eWT8qwFT4WTID9LWsK69qvs2JocW87DyAksX9bGi29YnYhcPiWWCgspl9AvNC4ONmmPnCe+Xq13TdUOohhHuAOoir7KebJcqFloG/p1Ji0Ebv5uALGqVkRCnvR39Y7Wij8yU553Xcs1+d2Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KLsepi0Q; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776299019; x=1776558219;
	bh=Ry+SyEti2UqT5WVYvlvsiyP6Yf3JAHi5YvU/FmfqzNo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KLsepi0Qx6Nw/gTgfHTOmMdwMUvGMWqXcLMSnVBym/lti9Qv8PdfnkJh+ks16B2hc
	 qsILUECbx0JD7I7Wmz8TCMR3YlLiNmbhD66K0bpXmYymBF0CVPyVf3FDKmUR0IO1Ak
	 1ovc2yTEuMvI+m/CkxjOkqYNNwp8TNKIZdaxMW5bCeo9oK6iB/lgO6KfDoqFZ3hp/Y
	 afQhZhVh4dZWWh4+LFXSIcTLHp3Fi3ByPzgmgy+kLjF2ItuT6XQLVavFeTAPy20yvu
	 gaQuIVDGC4IDszklWYW1K30XHCvwXNrFkv1dHXmCZ/VJNeFSiDQ/altTW45tdoVtw4
	 QqhkGb2Dq3SZQ==
Date: Thu, 16 Apr 2026 00:23:35 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: sram: Document qcom,eliza-imem
Message-ID: <20260415-eliza-imem-v1-1-4a90e8683799@pm.me>
In-Reply-To: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
References: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6f8518ef6f93a130d4eb84c6feb5926cec2b59e8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.232.135.74:from];
	DKIM_TRACE(0.00)[pm.me:+];
	TAGGED_FROM(0.00)[bounces-103326-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,109.224.244.123:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 875084093A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Eliza SoC IMEM.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentati=
on/devicetree/bindings/sram/sram.yaml
index 8985f89170be..27e5e274c3cb 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,eliza-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem

--=20
2.53.0



