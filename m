Return-Path: <linux-arm-msm+bounces-103717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGyyJAn15Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E9428F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 609783003999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B60638F643;
	Mon, 20 Apr 2026 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oX/v/5U9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9PIUVGYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A938F236;
	Mon, 20 Apr 2026 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678150; cv=none; b=o4vKDOit6MsRAz7M+hNuujl6kSBo0w8XiHf/9vNq21F+fYgNzevluK6vCstDT54PhgI5wSp4ex6IUYiYmcDWzFolPsamu6/m/JXCOtWPR+VTwCpgINjyhv7m8VvVMIZM4QTx2SV/+vU1Rj5XqFm8aGXy4erkvP0lRbspSyFLf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678150; c=relaxed/simple;
	bh=qnJOqg7gPa3TsorHUFESw9J+oibe+eLNIc9tZ4HLreo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaIVK5gI4DHLY5Y2KfSA2K7YrTV2jHyxIK9riOevx66n2RtMKAZuaxiSpa51L9yTZspGm6cigdNr908RSmQorkJ5IVMTvD+V4ZIaQl8e/J/FHhLl6mNyx2OJ0ZORIRuS0v7oY7XeIwsCm36//PWK1rU8io+rGhpFrrspWMuIcRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oX/v/5U9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9PIUVGYS; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678137; bh=3ujqzBWtRDWdp5zmmSaRRts
	8A0NFQcr0WTRYGteNTgc=; b=oX/v/5U9nTwTLhMpKPGQ7ioAqeULxkfAY22GR7jDOVBVLvOrLe
	hHxPY38yX/EPLHwbJZlsItP/EuKgwkFgZ3XShA+iywlVVF3BAM4yn4FyPgtu46xQjXYzb3z9bCF
	N2JXANW23xC+fnZg3dPwYP7HuO3FJce2ybbpMfB+i3j58PPEXqxnYFvhbEJiRTKEE8SPKAgQG//
	zi0yBAyIgIDs15yad2dyaiNhhcHBrCiqMT5oTNKCKGOKTlFVLLf82IDzOX1iqRpLZVvqlgJiJYu
	F1nK6yPh6PY9ZYG07iknv56Hi001P0VPDp+5A8Tugxy61Tm3nAlRs28dKjFnFL6Z8QQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678137; bh=3ujqzBWtRDWdp5zmmSaRRts
	8A0NFQcr0WTRYGteNTgc=; b=9PIUVGYS+gvjHHERJY0pxVzdAD4l90xqGi5el6g355hMhf3U+K
	WQuw4vU879whou9lJ2jAcgOac+TygtFB3KBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 20 Apr 2026 12:42:09 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776678136; l=2455;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=qnJOqg7gPa3TsorHUFESw9J+oibe+eLNIc9tZ4HLreo=;
 b=Hn/MGxneysV42Vb+q2z/rAVKnKxBI2dZ+K2tBVvcP6VHDg3/IADQtvHpBusdPtzoXT8ppSZH3
 mkyotWZ8hlPAW2o4vtKkfjiwFh1BrTLeibyZTeunR02GTVDQkkCdeuM
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103717-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.13:email,0.0.0.11:email,0.0.0.10:email,0.0.0.7:email,0.0.0.8:email,0.0.0.6:email,0.0.0.12:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,0.0.0.3:email,0.0.0.9:email,0.0.0.5:email]
X-Rspamd-Queue-Id: 3C9E9428F48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on CDSP
so change FastRPC compute-cbs' reg values that way

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


