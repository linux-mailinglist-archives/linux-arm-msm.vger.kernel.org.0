Return-Path: <linux-arm-msm+bounces-101452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKd/IS4QzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:43:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 722723849F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 757053075861
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4431378D64;
	Thu,  2 Apr 2026 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="h9W1ehdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15718366075
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112218; cv=none; b=j2dzkeP+YLnMr/L4dmEDBuMjElh9oPYRmksjqyD6+fyvJGTxYN3nZXvVv/jI07gLMz617bIiT7xP1IDnbvqSfg6X2Sr0eQ01x+bKNZNp3Vvdv78lBM5Dvek7S2BJ3IW2p/7w9/iKvfd/5rZPJirXVYMnjOcQAps9X8PgwCn05II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112218; c=relaxed/simple;
	bh=YL8boRi58Fb9HIAjBmQGYG/fPyUD+EmvR+sjd2urFWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0ShKnMhD9RvWWE05kuILx3dUGQZxki/iDrs0rupktEDs6EFTTc9/NoCvIYTo6n9KpX+rZMVT1l+a1dpZbHhp+uVjC10UopiltJ2ICobDXGhZW1EwTZpCed5XkreyxsZURejgzHRKWN3KtpyjH1gRVk3w6iWAHszMaXvGfBhpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=h9W1ehdU; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775112215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dN6n7q9aSz+JAAiiGw5b3hzH3XbhBiH8W3rSEv/bZPw=;
	b=h9W1ehdUXuViIQE9bKvqB393DInO896IswAxVFNKb4NDayFU0Haz3kTOdLn0f+/diNxq5L
	wrScnM8xumsWy5owqF9ISGAn7+HO1NS1mFcrDniGl0G/JIn3UH33Q85oGPlQTcGgPJJkTW
	TpNjbXdtEmc1+PvNcgt0Gg8iKbPcOZDeCxQyLOU1J7MEPpj9zm8Jib1DqqTGaTZPjgOEYS
	6eBWsC49i01qt7b6UXwLqxsJqMveaeKSgicppj7fj0ainos7cnNMPheiySK5Kf43DWXpv4
	y6yXtVfyhnj4vix1c8sMO2Tx3bFc96oEI4PI841ketexSLGYs6Pq4k07lCYw0A==
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
	Christopher Brown <crispybrown@gmail.com>
Subject: [PATCH v8 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
Date: Wed,  1 Apr 2026 23:43:04 -0700
Message-ID: <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775112053; l=2103; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=YL8boRi58Fb9HIAjBmQGYG/fPyUD+EmvR+sjd2urFWo=; b=6IbjJKoo3wZPGYtTsR4lTfSkowsGV2h2BAtMhGEmb3RKwtanprYFJVF4MWDnyAggU1fvvi2sV 6mUPomKyNaLBndw29Tp84fuROJ0M80y7uwQSBpQ9LK7Kq7XtAQf9i5s
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101452-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[postmarketos.org,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[5.230.158.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: 722723849F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To prevent duplicating the framebuffer address and size point out the
existing framebuffer memory region instead of specifying the address
manually.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 85dc4468b6c4..86cf4eb44084 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x2400000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index adf41aa0146a..349faa123ff1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyln", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <3120>;
 			stride = <(1440 * 4)>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d244ebdd17be..44e762f78e95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyp", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2880>;
 			stride = <(1440 * 4)>;

-- 
2.53.0


