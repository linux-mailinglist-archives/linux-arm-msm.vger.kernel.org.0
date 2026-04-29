Return-Path: <linux-arm-msm+bounces-105162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II91Ay3Q8WmjkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:32:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67254491F32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 585CF3065187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C12BE7DD;
	Wed, 29 Apr 2026 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="egH18FGp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IymlmvDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489073C2792;
	Wed, 29 Apr 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455026; cv=none; b=NLvHt5u7hDOyDM9rLUMjuhIB+2Zdx8yZGi3AY1vXaE+xa+U015mKxgwkremB/CF23sJYSlF7Yl3X3atE18RZZ+h1QTljjF2pccPVzMYVVtf1ZqK+r6w4JVED3eVOxc2DM7S1DnEmPaN8RL4sQ2mpFgUiy1PKIHeycnEkJAv1WG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455026; c=relaxed/simple;
	bh=fFc+ks/fhFMVcUXciNTDaM9xhx0ui+E2LIol8KwmBWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHJrKiLNT8BSIUNbgbpLxPECOtxBj4X1GoFd4f5fo2NHBVHz5zVIeHJd3SGed6WB0SMLzPPJiCEo44oAgZ7ntpRIM30XuiMMMZuYjYpddacvSb7sdtrT4jOOE9lua7nMvi8ehGv12SROpAIXQ7pjxjng4IqS+9sUhDqOdFbvc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=egH18FGp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IymlmvDo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455014; bh=Frjjk/YjfGcE2eAnwcc/WBQ
	vWEsPQ7ulWqCq9RkplYg=; b=egH18FGp7l6XVKbLMV4Fiv0LLJ6tqVtbDoHLKz43f0uNbkdKVg
	/OYMmCBzlIRdgTtVGuwqSCkjxVNBQbw5k/qD1eftJZhHYTYePQT1QcXNFp57VrVoQzOblfBawPH
	qqGNbrBhGsfr5jN7OvUYi11vgGMJEqwUBYAn9Tr2xNeObMOgifSd8F8YrjKsfO+9xb9zXLTPOjp
	c18bz2SVYJXA1MO9pw5KQUxD21QfJM0KW+BInmFevb2OkonASxbtcg8Zx0nGqzoODrJa/yf84LU
	KRNOHljJpso3iW532pGtiOjycwVQ6pC1W+R2gGPvLkk0o2bsYSUIMVnxf0sTn7/ln2w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455014; bh=Frjjk/YjfGcE2eAnwcc/WBQ
	vWEsPQ7ulWqCq9RkplYg=; b=IymlmvDoKrGLB/5YsKkVGQfApJOgzjo+DheaaMx1NspAbyiwOM
	ojfnT6WMt9aZGYZfN6pxAjhjv24SfnqhNEDQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 29 Apr 2026 12:30:09 +0300
Subject: [PATCH v5 2/5] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-2-16bc82e622ad@mainlining.org>
References: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
In-Reply-To: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=2514;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=fFc+ks/fhFMVcUXciNTDaM9xhx0ui+E2LIol8KwmBWc=;
 b=DiqMyJeW4QpM2mSvEQ/v4+g8LqA6qyq5QUV5pX82RCfMMIoUPP50aMZ4uIMq6RQbV5xdlC9Ex
 mVrcz0YMfvrAql/0f7LRf5TPmxw13CcTbQLXGQ9+GH83SLI2d00EO+7
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: 67254491F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105162-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on CDSP
so change FastRPC compute-cbs' reg values that way

Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
2.54.0


