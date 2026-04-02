Return-Path: <linux-arm-msm+bounces-101439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKRVMNMQzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:46:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3E384A8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAD0F315E241
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E92F374183;
	Thu,  2 Apr 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ykwwuway"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE836D9E8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111947; cv=none; b=RcsR9liePtJs3lyHhDffutAyJ8uY+WqHq/ZYeYy0/tZea+fs40/UHyC2tup8sApGSAw8hSaxg1QoNaWMr4lVeDmi15LxOf1IYReSwkrmJGlQp73xmvZHjj42wCdox10m0NtOwhi4hiHOOWJQxsgYSPlbZaZX1ZmsIcRdlSLrJIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111947; c=relaxed/simple;
	bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+cCLiV0b/ynRdJRw2+p8MComSexod5MbsMDAxqvL/bjgEjmD7HchDzD0zYXG12W0ZNz4bQbZxxAYSzg0zep+AGKJx3kh/WmUifEZDNT838xfU/WdbcgQOOcPp84KZNZeUE6bTVmFMTnmAH9GAqhy/6lY60deYD+4hTAICxCNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ykwwuway; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dwwoVBr8g+kp2SFK4hR6HBFGHkUWgDGC6Y8GBbVGEE=;
	b=YkwwuwayWfMvSDi6VgSVc20qB5XKroqt4KP6aqfvYTPyR2G1cMlFXwqG7Kdb/4HgaFIK78
	BgNpg4p0X0OpHHMcHpMScmFHtJvTE288qzVUEoeAOGBFP6jM1NuPZKk2ZnGt55Dbc/oyOU
	C7qwbyy6EXsbWkBwvkU749pgJckmzI1/lJXUR5/eNHTKRQJy2c9MBl+xymvZf/QgpBH+hl
	2jhv59exoIWIat/PwwVTSOFLlw3TKgpGs0ceEPQ9AUv7AJ8KUa2CHcKBIq9y3sKElv0lCT
	o5MVTCIdGcvSd4YuOJB0nnYWPfzOIHFg8CMbEvWf4yCjWxmX2ooBe2wKhVgDXQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:30 -0700
Subject: [PATCH v8 03/15] arm64: dts: qcom: sdm845-lg-judyp: Define
 firmware paths for judyp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-3-7677cfafbc78@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1276;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=zApbbXYni1gzGOLyTeTNtvriZHhep2sMKCAUx/mHuqw=;
 b=wRGUvsjjQbVpSLVAT/dj5IALn75zYjMRdDHAlrQfk8RrACkKwnIR/3/Jr/+GHRwSot0YcnH5e
 uCy8Sf1nv4mDYjF/yvpfvGFCMIip7dIDKGZE+GYznJTOi8P+7NO/gk9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101439-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9d400000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: 37B3E384A8E
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


