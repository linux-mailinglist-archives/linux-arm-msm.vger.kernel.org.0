Return-Path: <linux-arm-msm+bounces-101223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCUgOaSQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5443745CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18E1D3113D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5931F3806B4;
	Wed,  1 Apr 2026 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RVJkSS5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC843803EF;
	Wed,  1 Apr 2026 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013804; cv=none; b=rMrZwH88w+tjs9FLRNWxC8gnX7tweyBgcERjDoJRc6o6wWI1qkTZy49rJ117/v3q9PYTt4Mq7HLbORRa29mawfEFXXVBGmETFY/wFQbwUI78RQUGNUyCZBqWl96I8daoOfZdAAW2uYGxsPvXmcYQi+ibfa4HN/UcXrIQPo2dC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013804; c=relaxed/simple;
	bh=NBEN5Fp8oA9zh6cl4CSFlQc6fI6G/g2fGa68y/VBlHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgIdHx5eftmNvzAaaB5xkhg9+7ffB/EOjrTgISYm6xVniX28gDuUeDV5HQ7LJFxu4fyvLQYhvn8qYcpMgsmw5WaiTcFyoCfIhcp4TgZSA6ekfoBDIrOFVJUnwEq2mF5m90czjvhFNX4nds0Y336/6q1fRINcQ97UHmPB6PmOgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RVJkSS5e; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJm1ozEkeqtRtb+iNWaGVl+0P2d5K7qsItmvKMseT8k=;
	b=RVJkSS5eLdWUDXBzEjWp9OZ+0WGegs3czDFw2FQSpuTZMlp4k1CGYqsjniuWNjOjLHUQvP
	gNVU+c4eBe7StNsKHclJ9imMHSsnVIh2soLcP312674M8RDffvEOhZkZboSSz5gXI0B1CB
	8z6ugFGjPxuJWqF48POUGukOudwI0POFchxeS+NhqaYgHJRrBW/eeCDqZAAMKxedgifaa4
	4U55nES+fyNEb2hvzIxuNNk2+uZ1RTBysrobJD7pZcSrHqeuWXsNrPhz6bl2qBCjaInci8
	xwjimlpNOdQSAGBXWlPQ0f5Yj78XZutk1u/UIEm7MrHXnPoFSYdfsz+FRgTSxg==
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
Subject: [PATCH v7 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
Date: Tue, 31 Mar 2026 20:23:13 -0700
Message-ID: <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013472; l=1970; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=NBEN5Fp8oA9zh6cl4CSFlQc6fI6G/g2fGa68y/VBlHM=; b=DB1I77V/lVN9MPaUm+ClHozuN7Vs4Wf+rB+UdrnCn//RlzE0z8fWMpB2xeExx9WW6XORIViHo NIv+1llCEd5BKF8gO8mdm6DqH3FyRVzCKua0+6SoqDxFxTOG+12v68/
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101223-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9d400000:email,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C5443745CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To prevent duplicating the framebuffer address and size point out the
existing framebuffer memory region instead of specifying the address
manually.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

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
index adf41aa0146a..83e392907244 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -16,7 +16,7 @@ / {
 	chosen {
 		framebuffer@9d400000 {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <3120>;
 			stride = <(1440 * 4)>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d244ebdd17be..5f7ddb2c4076 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -16,7 +16,7 @@ / {
 	chosen {
 		framebuffer@9d400000 {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2880>;
 			stride = <(1440 * 4)>;

-- 
2.53.0


