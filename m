Return-Path: <linux-arm-msm+bounces-99514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIfyCE/0wWmmYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:17:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD83010F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2998311E827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AE1386438;
	Tue, 24 Mar 2026 02:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="g3Rv1Ll3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1C383C93
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318107; cv=none; b=pQPjlYXApbt+bt1HlTnQuk74VlZvXLDkvFM+9nxB9vpqA/XH2st/RMnh1C0ndJ0aNorBUhr9OJhPxFiENWChmNdWVjXXMQlywe4f9d3HRxsTJwyBjF2bh18rkYE6xQo7cTfn4jLYv5I0jWoTA3FRRKc3sNfayhTABK36F3Ypmko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318107; c=relaxed/simple;
	bh=RtO76bLqR3KvoL+vzb9hOdekFgXJte3oepaYg1d9P5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcjrwwwC1QBHQcYMzaRHv72JaYK0YfDH7DoAhguwrxVj7hgBK7MBxVcRSUrukf7JoStk5CD2HYeE1MFTi02wdHShsMXtzQMRqGwbw10tk06A2/Sr2CANjtCGRrAWf7qWiBmIhas0WFpM3xGhJBUol7V0ALSSn2sjWGH4U5QlD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=g3Rv1Ll3; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tee/LaQAr8k+6jbnlvZuBhYjwZFcj/ilcVGFXycsJe0=;
	b=g3Rv1Ll3J4cUbECWvoeJvMBphYotrx5IYDRCAUwxPkHOXaD4vYviTqrpP6CtSYRx507Ub6
	DufEVcd0Uns/i2P97Je422/afkU8KAbzX2ClcWD3b0u8hmP5qF+RbN2R3COwsqvoLKbplB
	hnXowOl8JWXMwAj9OeKZYSPHAqniATMXxei0kezVXCcRJ6nY1h0GUrbAzXqDpPzir4eivi
	ApmXIwi5F2lxuktZhSwBxxBTzvw+XP8veY0p88LQP1IvsOkKn+A1lGzNmIlmMwxYRlW+0Z
	dSEKHeFCta11eCK7/BzRE5cCzGe7dZt1HpSpI+p0WitY62ya/VEVbYMYzmRLqw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:42 -0700
Subject: [PATCH v6 12/15] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-12-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=955;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RtO76bLqR3KvoL+vzb9hOdekFgXJte3oepaYg1d9P5A=;
 b=QnUfRvXbwgK70LSc2+R6dSA2e3YQm4O66M+0wqEU07sW4g0jLMDEwqZU7cSZqykY1y6d9XRSr
 hyHKxskglU+AycgGKL/o23sb7GqOCNIV0de0lxq8FQuXFZu4XNJ00Bt
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99514-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AFD83010F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Camera doesn't work yet (imx351), but we can use the flash as a flashlight.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index fab5ffb3404f..7e803886ca8f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -490,6 +490,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <500000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.53.0


