Return-Path: <linux-arm-msm+bounces-103259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFRjGWtd32ndSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:42:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E6402BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98B15304FEFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9471333C198;
	Wed, 15 Apr 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="j/aToUR6";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wshcEBcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1833ADA0;
	Wed, 15 Apr 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246039; cv=none; b=OLvIVUYWWgmke7nqbHEgI2JLCyA9NXylFYmCMcGPSIFEK8pw3UROvkF7B7Itn5S4/MVGZwSvcpz2kscrkozzzm2SxJR30A10/FwzOztyUVINSlVSgxCqJf+R1UvV5EwDjTM2JAB9ebWDR6G5yZaDGKpVZf4XZlCtrCiu4A/C6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246039; c=relaxed/simple;
	bh=/qD4V4y2YF8vpwM2TnbxwODWrQ3HXA6nwIwvS3BV0es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qh/+u+locPZ+yonDuyc/QPTmndaF5rxxf/jxgvA1J8YY9fR94WBwz3h6igtOtKgTQD/ZSqvKtjEmBFP5oIVhRWpZDsG+iLM4IK1fZWpwEZ3rWSeJjJY9mFU5IgsHridU5v3fmfO2Yz8np+vHjBC6jnj/WTQGJRkDt/+yMxQbxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=j/aToUR6; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wshcEBcc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246024; bh=cKh6WLhQ5ebcUnoQyws173s
	uSrlatUJVw0vKRHy+eyk=; b=j/aToUR6oM1V2Sx7pu6idx5NoMK+ybtCtzgVINkHioRgz0w4Mv
	RfUdj+A/NjcfMHaoCT6ci04+4uPk6YVEKLYItk9ZSLmaK+nQqQKen/NkCtGky6ZHAWaI2zjYElK
	4lWpUjTcbnzaRpT9UsJiIHF+2qanIo/RBP0AKQsaTQGMMCiM2kDkSDQkfBSsVXxuIvJnWkIcXT7
	uzUwJJz3vo2OvfoOpHCHacf4yNOU8YWqofctBu/G3GkFiTTofz9MGgQA80pqqueALVYq+BFay6v
	PlK42y0tZq3Mqjv/Ea0i5F81dR00OzmOGDTyIw1qZJaq6I8dbuKBPz2vjRCO5cR3z3A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246024; bh=cKh6WLhQ5ebcUnoQyws173s
	uSrlatUJVw0vKRHy+eyk=; b=wshcEBccs83810wH786aMYR1H+kYU11eMhq1MVgrVqG/4UmmyI
	st4H2tLvidKEr4VDiDFF7kYarLsNlBy4tbCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 15 Apr 2026 12:40:23 +0300
Subject: [PATCH 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=2249;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=/qD4V4y2YF8vpwM2TnbxwODWrQ3HXA6nwIwvS3BV0es=;
 b=fohAKPwVLy5Zb4WQ9pLiwZf6zIiYtNaiMeIlKoy70wXwDm4Dk5gZCmcfdvLNplDGUTx+dqMD0
 wtl2y62HvBWBvcR17MKgryuAgP97IYLGtFeQyMCVcQlxapy6bWLc92A
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103259-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mainlining.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.8:email,0.0.0.7:email,0.0.0.13:email,0.0.0.12:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.3:email,0.0.0.6:email,0.0.0.5:email,0.0.0.11:email,0.0.0.10:email,0.0.0.9:email,0.0.0.4:email]
X-Rspamd-Queue-Id: 115E6402BBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on CDSP
so change FastRPC compute-cbs' reg values that way

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 3fd6dd82a992..0fca9662c64a 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -350,57 +350,57 @@ fastrpc {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				compute-cb@5 {
+				compute-cb@3 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <5>;
+					reg = <3>;
 					iommus = <&cdsp_smmu 3>;
 				};
 
-				compute-cb@6 {
+				compute-cb@4 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <6>;
+					reg = <4>;
 					iommus = <&cdsp_smmu 4>;
 				};
 
-				compute-cb@7 {
+				compute-cb@5 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <7>;
+					reg = <5>;
 					iommus = <&cdsp_smmu 5>;
 				};
 
-				compute-cb@8 {
+				compute-cb@6 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <8>;
+					reg = <6>;
 					iommus = <&cdsp_smmu 6>;
 				};
 
-				compute-cb@9 {
+				compute-cb@7 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <9>;
+					reg = <7>;
 					iommus = <&cdsp_smmu 7>;
 				};
 
-				compute-cb@10 {
+				compute-cb@8 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <10>;
+					reg = <8>;
 					iommus = <&cdsp_smmu 8>;
 				};
 
-				compute-cb@11 {
+				compute-cb@9 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <11>;
+					reg = <9>;
 					iommus = <&cdsp_smmu 9>;
 				};
 
-				compute-cb@12 {
+				compute-cb@10 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <12>;
+					reg = <10>;
 					iommus = <&cdsp_smmu 10>;
 				};
 
-				compute-cb@13 {
+				compute-cb@11 {
 					compatible = "qcom,fastrpc-compute-cb";
-					reg = <13>;
+					reg = <11>;
 					iommus = <&cdsp_smmu 11>;
 				};
 			};

-- 
2.53.0


