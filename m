Return-Path: <linux-arm-msm+bounces-99511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAMXO8DywWlzYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:11:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BE300FF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DF9E304FCAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A493890F3;
	Tue, 24 Mar 2026 02:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="d8DlUwlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F20388E7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318094; cv=none; b=hbQ5OxbEJllgaf+IK5k5749WQLnNNtp0AuXRdBTTsQRSGprGpIBx0sqnQMhq1Do/alWCQqzB8U8CbMIjfdDkOnKoFcHiQnZ0Sa86X8CI90dRO2kNgu5ZIANpoMVLRrUmaoHuBzITSfNobANz4obpAxURacW3zGDyLq+NWYWpoaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318094; c=relaxed/simple;
	bh=AUbNt9bkdLSZ5QkK/hcA+7IkrHZ2PlNCqypxIYS8Qbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9Zido6teDUNjsxcv++s0GHWpPRm+Up7SufsfmZtURhUMuNHJ0SQlC3OSoU5tdT6/uK3lZWbVXin8GTDSYIFeZEFLzZqy9wn9OKkEERhVqV540/djqgixCeVZt4AUqzOjthOOXaAKComIYtqMZFbr2+O75U78XwpfyJob6WpkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=d8DlUwlx; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUnX8U0vGNYbiWJDSXf/rQHLWWU9UA2ht6+fCiuJYII=;
	b=d8DlUwlxZSJmrnPRe5RA4S2yhWWAwU73EvqEISM/aakZwU0WEyk4mP8DpChC/OtAVzHr9c
	rYxpc6mUPKAVE0CeJldfe78eGkcWo1m6E0FNfjS3mlyEqO9Xk3MfkLr8wBhOvndh62Y22A
	rybf8hLlYyuXeBGe6JuuMikQn512FxfyauWR3Teei90ul19OsqqQc6zE5YNISEtWGNu5FF
	IAGFP948YFgyvXOCX0Csmu8tgFjjQHVYdHwQSFM+OOfBFTqovERFbGRyDuMb7VuhXBcZtd
	WE9PY3MmxYMmWoh4rNEw/wDXTreIh0bHTYOmbDS2DcKJHxwXzQJlLVZ1e607+A==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:39 -0700
Subject: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=2213;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=AUbNt9bkdLSZ5QkK/hcA+7IkrHZ2PlNCqypxIYS8Qbg=;
 b=vSHapH9YDWnRkaN4wNWSEpOF0jmRuuMn2Kb8OF+et8rzRZ9ENwC+tmGduSsDbYwG/BMVN2UrR
 W4qrXGoO2lXA75wzeMKibLKWvrQkr6JdNuu7GZ05Pk5NFMEY3fdDQKF
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
	TAGGED_FROM(0.00)[bounces-99511-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 901BE300FF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add paths for Qualcomm firmware, including:
ipa, modem, venus, gpu

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index a5a04ec11eb7..dd42ed0bf63e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -464,6 +464,8 @@ &gpu {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 46119630d721..7948fe3dbaa2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -46,7 +46,7 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
 };
 
 &bluetooth {
@@ -58,11 +58,15 @@ &bluetooth {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
 &mdss {
@@ -128,7 +132,7 @@ &lab {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -167,3 +171,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		bias-pull-down;
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
+};

-- 
2.53.0


