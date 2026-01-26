Return-Path: <linux-arm-msm+bounces-90598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFwoIGuYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:38:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FD8AC38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D55D3006146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADF533D4F9;
	Mon, 26 Jan 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rE2zOUt9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aqNjmx3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89676343D7B;
	Mon, 26 Jan 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445480; cv=none; b=QHoUicew+GPs44YVeIYAxGKH8u58G4C5pDNvBc39k3qbLnNFwCQkhYvO/lxGdBQfg+4D7eX4Ygw8bR88U6H+Gnb+wAS5Yo+aN3lrz6rBuI0QcqNNyC+1CMae1V1+fojAj/doTCdEUk4MSoaPJNaZw/9tMj8+ceIsmf/gHxNdYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445480; c=relaxed/simple;
	bh=D9ryeuRZr0MhL6fUTrHcnbiVBwra9ZAPtHXzOCIU2KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uN4SaRDkloYpG6n20LOlrmxpTBvL1mAMZ9A/UV6U2Ykul/wv/dcCJKPmgaktuei8B1g1aGsRS7DawObianSoV6qXcUUCgCGsrbsQ1tUYX+fKmf5jwfcMGuxxlORb1vG+bu1v/FVGVQhV4uK346Ab/Zyf7n8MIYo6KnJL/vmIYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rE2zOUt9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aqNjmx3O; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445295; bh=ubjYYTc4TEz/fEd+reZE53c
	vQyw9JCOP3AuwDCLc74I=; b=rE2zOUt9eeHmG32oDEp8sW6aR9csrmCtC7/8Vf3OBq8wEFZVRF
	bcXFLUb3szpbsL1S+WJk6NbF/sjdxiUgTulsMtCUUluTv0fDzQ60Ta9qKBSbxO2JIn7GTK1vQOV
	eTXFyVG0Cv0hOOQuEldROBEMttwro3G+xWLxf9jOMzPAgnGiaa2rTXtOrEpGooo/HtM45/Au5At
	P/PpaSgON/6HhsxYYGVJ+fPiOMzxELvPJnXQjNLYbFW1zyFoFvCnMvcXiso5/fANoRX6DKypmdd
	OSa5+hl6RlA5WtpUghtKmjVOdeoqb9irIsUmlnkkM/TlCN9gkrdk8SwypJb8xG/Mxiw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445295; bh=ubjYYTc4TEz/fEd+reZE53c
	vQyw9JCOP3AuwDCLc74I=; b=aqNjmx3OGFa/qeDm3RZgkMkKJRmg/dnxrfjCpigs1YxQ8JEcct
	k/7q+aMMwPoklSOuBwoyo1Jk6RXCcyuFIFDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:52 +0100
Subject: [PATCH v3 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-2-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=2540;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=D9ryeuRZr0MhL6fUTrHcnbiVBwra9ZAPtHXzOCIU2KQ=;
 b=PCcPD+2fSyXZBVdzEtfJfWcTqCZDJ5RGuIpKsg+E2VSKM5D4bArIbZddFDKkLcr5RqaK6wE8g
 4I91/55mL/HAJOW/9HRdGB2OP5oOE/0UrkDyfJFh+LcZ8rzMv3MiEft
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.22 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.88)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[3.109.136.112:email,3.109.97.96:email,3.171.241.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3.109.155.248:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,5c000000:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email,3.75.207.160:email,ffbc0000:email]
X-Rspamd-Queue-Id: 248FD8AC38
X-Rspamd-Action: no action

The device was crashing on high memory load because the reserved memory
ranges was wrongly defined. Correct the ranges for avoid the crashes.
Change the ramoops memory range to match with the values from the recovery
to be able to get the results from the device.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 41 ++++++++++++++++-------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index bf03226a6f85..d5e5abdb3b2f 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -13,6 +13,12 @@
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
 
+/delete-node/ &adsp_pil_mem;
+/delete-node/ &cont_splash_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+
 / {
 	model = "Xiaomi Redmi Note 8";
 	compatible = "xiaomi,ginkgo", "qcom,sm6125";
@@ -36,28 +42,39 @@ framebuffer0: framebuffer@5c000000 {
 	};
 
 	reserved-memory {
-		debug_mem: debug@ffb00000 {
-			reg = <0x0 0xffb00000 0x0 0xc0000>;
+		adsp_pil_mem: adsp_pil_mem@55300000 {
+			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		last_log_mem: lastlog@ffbc0000 {
-			reg = <0x0 0xffbc0000 0x0 0x80000>;
+		ipa_fw_mem: ipa_fw_mem@57500000 {
+			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		pstore_mem: ramoops@ffc00000 {
-			compatible = "ramoops";
-			reg = <0x0 0xffc40000 0x0 0xc0000>;
-			record-size = <0x1000>;
-			console-size = <0x40000>;
-			pmsg-size = <0x20000>;
+		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+			reg = <0x0 0x57510000 0x0 0x5000>;
+			no-map;
 		};
 
-		cmdline_mem: memory@ffd00000 {
-			reg = <0x0 0xffd40000 0x0 0x1000>;
+		gpu_mem: gpu_mem@57515000 {
+			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};
+
+		framebuffer@5c000000 {
+			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
+			no-map;
+		};
+
+		/* Matching with recovery values to be able to get the results. */
+		ramoops@61600000 {
+			compatible = "ramoops";
+			reg = <0x0 0x61600000 0x0 0x400000>;
+			record-size = <0x80000>;
+			pmsg-size = <0x200000>;
+			console-size = <0x100000>;
+		};
 	};
 
 	extcon_usb: extcon-usb {

-- 
2.52.0


