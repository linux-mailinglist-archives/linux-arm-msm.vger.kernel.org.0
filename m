Return-Path: <linux-arm-msm+bounces-101222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGOXH+mQzGk7UAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:28:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28672374615
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5102308A801
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234CC37E308;
	Wed,  1 Apr 2026 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ahtprGhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC6382F2D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013781; cv=none; b=gnv6/Prm3qiKue62ogKu1P5I/m8BiLcvxExel4DlOAtH1JoWTNUYH+iPfkjWmqeM4J8nFIU+/B5l9ToFPOdFVn3KzqD6eyn5EQq5/AD1rutLQWyqoUDU9YdTbfEFeuaYIV1r246z2EEF6k5auxOuzrAxSVKr78Q95Avd4aNUf3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013781; c=relaxed/simple;
	bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQaehKxVId6LpJQSOtldNrO5Kg0DTB9PhnWOEqfNx9uaWHxqDC1oxM27fOonCyeHYdgaeTU+4q2rTx/7mPyk8RUrgnZFUCa9EgpWFUmlTQlgGJcQPceskgTb2EUZnmQdEhqYv2Nec34qCNApXzNHBVCngQ/LD1VFMHqa2BJfMKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ahtprGhB; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vft3JoOWNIiyb6XKVwI3B9R+MjrgmBnquYhO1fWhg=;
	b=ahtprGhBvX7Ga/7uIPN0MK0QL+s+gxTxCty2sMWO4g4o2p8XsBoGYkyZIoYXZL67rPXpMB
	xDII5Npb3hythdP0ziHNkAXlN9K8GOKtHfy/Y11pxIizxflNmdAgSgR1hI0sfNDfnjgYSX
	e3ZyBNpl4dk58uVwQE3YKp7wYVqFf7e1aVOYUnJzGdq1OSfxnglRN1HkeZ8HCG3/M5/9yM
	95EtpEEFo1dqb46nohVL5ZDShHYq7AYUuP/28vqTS+DpkugMaPI98m8DP0hhvZpNxFU5M2
	7gDbzAR5Yrdt53hK2GRsHmczo+LzQQYKgPDzUZeHnQKU2YVlgSQu9iIjl0PaNw==
From: Paul Sajna <sajattack@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 14/15] arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
Date: Tue, 31 Mar 2026 20:22:48 -0700
Message-ID: <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013472; l=1064; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=; b=xzJ6MPqVyGZqvTXrpJq6vi7OFA6m3O1bNd1VH4EYQGx+/M2i4FeSuQrmo1bz0wfZXkcEoizY0 puUz7pL5eZCCOZKf8rEp7cF6Yv+4GhbOzGf1NWwJszIlgfH59uqIBap
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-101222-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[postmarketos.org,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: 28672374615
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that.

Ensure the ipa uses the correct memory.

ipa 1e40000.ipa: channel 4 limited to 256 TREs
ipa 1e40000.ipa: IPA driver initialized
ipa 1e40000.ipa: received modem starting event
ipa 1e40000.ipa: received modem running event

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 9d82961d527e..85dc4468b6c4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -473,7 +473,9 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 

-- 
2.53.0


