Return-Path: <linux-arm-msm+bounces-101202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNaiD1qOzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD33742B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0C5130200F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16B925FA29;
	Wed,  1 Apr 2026 03:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="n03VcRRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC637F8DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013364; cv=none; b=b3b5lzLWW9IlVauCpQCi013hjfYMykznRuxIkOhzS2hFr4GPeSCmucll+CANAI+qrl7pmYoympx7ZtAKydkZbQzjd06ShXzISEXDU7SjZ4xzMwbHIgTPdwr9U6RB9brk3knvsahl44nGRM4U/LZ+MnphRvLjsBPAiqr1GNlLbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013364; c=relaxed/simple;
	bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mORhKoy57PYOGXJR4Fcs6Eudc2MMFZ8bnv4XCqGHNG7vGJUlDxBKMUi0ZTnn0EDXUapMhXfBxDcV5TJvE8y4KkEToHjEhYjHjFP5qDSFMleENEf/3JAlzfvfbKqs7du2cCt16Ik/2AqElk3Ss5xau0Uew7twWSD9aujEZ7d+Viw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=n03VcRRq; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dwwoVBr8g+kp2SFK4hR6HBFGHkUWgDGC6Y8GBbVGEE=;
	b=n03VcRRq3lzW9wIfIkEbt7h+i2kEHE2sOpqa5DFwD2pbQpLnlv9iPpwXFYv/ngG9ZyoXEO
	58+4QchToD3Nw671YpXWzmFyfYenP+uT63J8r1Xz5+/uVI3JHvM1BQkmqpj9zijdgSLsDm
	BlvfJfkJRRqCd0SlPWSeDB8iMnoDTrUQuFd/RXzSnfPk1EL1XBFuNH9mJI82hal/YTq9l+
	oZd96BkASt5O70YwVD6EAbMuZer8eMYRsut1WSF5FTg0+YllSstKAuO+/EJlnT4DZ4AZ2q
	JIEawvAsU41knhoLmQxHZJmAFy9LzYj6aMesgBeVzrLvXUGadF7WaEdWHUhfpA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:08 -0700
Subject: [PATCH v7 03/15] arm64: dts: qcom: sdm845-lg-judyp: Define
 firmware paths for judyp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-3-87217b15fefb@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=1276;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
 b=Pe5D3s3c6qX0jBZdElA29lJ2noiKA7qpGonyymG8Of6zabPQVWYL7u1vBnb4Uhrd+b45WXz5Y
 ST5/nPv9XmLBmjT8n0V33jBt/yi2l011UqpRFshWzUwZ3D+q+G9hOVX
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101202-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08AD33742B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For consistency with judyln and new naming scheme for firmware

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index ffe1da2227f0..fd62abbb7128 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -26,17 +26,25 @@ framebuffer@9d400000 {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyp/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/adsp.mbn";
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyp/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/cdsp.mbn";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyp/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyp/ipa_fws.mbn";
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyp/mba.mbn", "qcom/sdm845/judyp/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyp/mba.mbn", "qcom/sdm845/LG/judyp/modem.mbn";
+};
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyp/venus.mbn";
 };

-- 
2.53.0


