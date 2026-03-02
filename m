Return-Path: <linux-arm-msm+bounces-94933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNK7EvuMpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:13:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1061D990C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A4C23058316
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FD23E5567;
	Mon,  2 Mar 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ry/LnNck";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LgvEukKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15753451A6;
	Mon,  2 Mar 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457072; cv=none; b=q3CiOPBGTuaGduDxGjFLho4gNO+yOFTQ9E2xKa/sQXi+uhj+vjBDVTouLxg+qtGF1UINv0ZaGzeUTB4eA3Kyrl6EtlLytjFWmg9bWXSjYlQsLCGPKPnI5+wqERcFN3r0K5XEXPWmM0TY085Em12mh4cEu6ArnAnvwjIM/K6MtDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457072; c=relaxed/simple;
	bh=4Dl7qNJkM6VRrzDadhWFsHW1BqH/tJy3BIL9B/FMWlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsvbBOIGmlwoRL24WsJsUQTQxgmtWDNKLO4E0AFAXtl9AQ3RWssyKGv6Vkft9kem9ZlGQL4tH/tOlF8EY9owtlC2VUWPaTaOn3flsnVfhbTEHiTCCap0pqdjNKkwMyPvqt0MHsZQlKDdapHRhaBUfvHNmO+CThHDQc7zCAFg2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ry/LnNck; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LgvEukKw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772457043; bh=PMmMDXkvatfQ72A8jZnSDmG
	G8kJMJVyQjVddP2Ub5Xc=; b=ry/LnNckQtCCcRDIXj7agYt6VkSCw9a5i7mMv037ClmYNFweik
	ySzHV/pHx3K7pAEel131vzPn7Vu83t9XoM1sOMB9UXQLHy8v/1NS9z7NmtitEFdUQD4Ad8/a0ES
	VPU2qyd9tL1JNWVRuowR3+yA+9eqHxZChVvW5pbFlTR97KhchMn9rrFijrBHtWueCvvA7rbxAOp
	40GvjkZNwNOnFJTdAuBvW8jz5KhAGrJi4A4CkdGqqURJKGe4GbA8XLeYT9SM5iVqkCHk28flIoA
	RURN3pjYUKujOxmhZUukqMGFcX5ypjc7EjGP+/4XfMvhTCLbW2q+VhJEtHVtxbaWiYg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772457043; bh=PMmMDXkvatfQ72A8jZnSDmG
	G8kJMJVyQjVddP2Ub5Xc=; b=LgvEukKwN/1q+PJ3Zk9FuANYnnLPatcw2RYIkbBx4V6hif4pnv
	pSA9sGJNbOW70rSDDF9IWgIo/RBuWTcyKOBw==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Mon, 02 Mar 2026 14:10:15 +0100
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC IDs for SM7450 and
 SM7450P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-fillmore-socids-v2-2-e6c5ad167ec4@mainlining.org>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
In-Reply-To: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94933-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:mid,mainlining.org:dkim,mainlining.org:email]
X-Rspamd-Queue-Id: BE1061D990C
X-Rspamd-Action: no action

SM7450 and SM7450P are two SoCs in the 'fillmore' family.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535c2655db566c644342dbc387e24a9..eddd149731645fa4a75e80968a7c495a508c1c30 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -473,6 +473,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5000) },
 	{ qcom_board_id(IPQ0509) },
 	{ qcom_board_id(IPQ0518) },
+	{ qcom_board_id(SM7450) },
 	{ qcom_board_id(SM6375) },
 	{ qcom_board_id(IPQ9514) },
 	{ qcom_board_id(IPQ9550) },
@@ -492,6 +493,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
 	{ qcom_board_id(QDU1000) },
+	{ qcom_board_id(SM7450P) },
 	{ qcom_board_id(X1E80100) },
 	{ qcom_board_id(SM8650) },
 	{ qcom_board_id(SM4450) },

-- 
2.53.0


