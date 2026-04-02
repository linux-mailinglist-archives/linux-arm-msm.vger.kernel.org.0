Return-Path: <linux-arm-msm+bounces-101444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCiNADwSzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:52:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C7384BCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED2B13146131
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DDD382289;
	Thu,  2 Apr 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="NImyyrBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD263845BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111960; cv=none; b=WYtz9W5BZpwcpdnAHs1r1kx0A2ZdydK4xdthmA9cxQQWDzAXkU5W0oHJDHklESHQfX/Hz97REgAIm5AIkyirm5DU2ITk9XrXPBJB5T3VZ3iFcy6yG96THoSt93es1/jKSY2/0/7nE795Q5EmjR6sMWRHSUwYXM+PQjR7PV/E0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111960; c=relaxed/simple;
	bh=vHcmJbJnFiriXlFNhyWcvijfXUxqMdaq/h0SYf7nGzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csXXaS3JBdUGwpk9kfezDuur/rGD+36sjAmBCiOPjCW1v/0pI6EMLwMK/WPlwk9FiaPyle8yORG9Y7XM11GLJ40Hax/EQKxvQyKuS7DjVJIXCi4GLt+vU8uWjBkQayblrO2WwZqVk4wx4NVrOzcFng7OeuGeZwpkaPG7t1fEnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=NImyyrBI; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXAlRMGR7jghkP+lnXdIYmzb8QsrY+DHKf9ZcHe2wtQ=;
	b=NImyyrBIih/Q880zbpCCpOHgZmDcfdq4XQmT2dTH+TGToupalDJ7idpZK3K+xrU+GR/pzA
	a1pOm2JoU3xgXPaCIQN61EoVglKYBO0eC6va6ntOk3rntXrXfpnT69mhOn3Uw18ipXXT5B
	wa4I+1cxYOSTfJ/FkzxSLj5PeQz2gOidnZzJEDS5Pyrjv6ERuG+15REbcPZm7UNF4j12Jt
	xynR0Mga8QTO3bo3xm7ySHU03AG2w4GzmRsTa11pE55bX/Q7xrPRS51mEfWC1fmYtNz53M
	VqkzCcRDZNrJsUR7LRBHFRUNhRiY9DCJdDrwJRdRxaIWEHdzxNZ5VSk018zuVQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:34 -0700
Subject: [PATCH v8 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-7-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1347;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Ei6IXsIEZhjjI+rjDZqYmLKiYsgQWaTi16fUGmKfGLE=;
 b=NFzGzlcDSqeBTekqjE5xZI+cdFAcvRNClVqG6ASBsk10aU3EAIe1/vL2CjTIxJ1PKUPoms8rK
 lRQ7KWrXy0iC5aB/xdMYPKdMdnfVPCMrgueRvpcfDmmp2o1h79+7Fsw
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101444-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 537C7384BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 90dd5a2a6f30..6b837da4ef21 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,14 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -67,6 +75,12 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.53.0


