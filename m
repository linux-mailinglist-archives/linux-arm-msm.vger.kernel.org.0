Return-Path: <linux-arm-msm+bounces-101205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHp/FUCPzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:21:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365A37438F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AC803087ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFF8382384;
	Wed,  1 Apr 2026 03:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IVFwWAcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4EB38229A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013371; cv=none; b=QvgLs4SRDWBVIrWtYVrMgqoWdmqlqEgP23mN385O681fpnbcPHd/U4RD/w3mu++jo8cKmWQtG4tzxkL4Fl5nR3rMHRRYDgVPlpyaanhXbzUybCVHzg970mxfMvDxYDZ9vJ1IwApUUK1vZDQb0Pq7pr5Mw3hNTmI0hAz9PiwGklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013371; c=relaxed/simple;
	bh=u5nVouTJ0w385F2XNsIikPqhP9osK2MLTB4BRp4Z7i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAde4GPkfz18EzAcTvUcNpEA0f1XuNGOYOkVw8X6GHssq/i9gYba9EyZxzxzU7xj6pgGPaHHW0HJ5SO1rPKVEHQtRNPhLLToAXu4zzy8fO1iiMnvdOmpHXoyVZ30t72MuTjlY8XAxsw0MTNAZDv4UzR1gogBwvu10I+EB91JmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IVFwWAcr; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5bT51AXEU41SgrYgdUegMfpFGq26JQyeTEpJxxtiuY=;
	b=IVFwWAcrmLnMCNPf6RHA/Y2eehTjRs7O1cKTNP8sii40Cjvh7WVm/UtdSLaNQQ8bx5yRD6
	SqsnKRAZNH0Pm5T+7foj1NVwotFpZZp0E7vldMuYv0CbpzX7jBkEjiBn5hVma+cAp2Kdpt
	s6LcLl9bYy05NLqyv/t0wl5y7kKFcIkpk4h4AjS7YGFdrvA6jBied/C+5feEkpYj67MVNZ
	ufiIsAPzi1nu9O+I1w93iNRx4Uxv5/wMKHfrLSTBsQEAMsNNUUS6eW5ulZuen7cu8GxTVI
	DmIpracPtSC+nITDKd3v2YcgbzhOmIdem1ce/GM/+TlHh6cHuhG53cDU5a7QOQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:10 -0700
Subject: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=907;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=u5nVouTJ0w385F2XNsIikPqhP9osK2MLTB4BRp4Z7i0=;
 b=CmS+iXgzLGtEVLpdPjrtMCuPDjLMsv711cTotURsMfg4kKoIPfqSF7D9HgiLvU3AJGzPj3iZE
 pEGxyae5PAoBLjowUcyurJLIu8sDZLjPgfeLpoWtV8UcQPLoPdB9gK4
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101205-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: 0365A37438F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm serial communicators required for i2c, serial, and spi

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 87ac41ec2e46..8b7a271b7568 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -454,6 +454,14 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };
@@ -482,6 +490,14 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 

-- 
2.53.0


