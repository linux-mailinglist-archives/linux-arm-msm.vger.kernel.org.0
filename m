Return-Path: <linux-arm-msm+bounces-103720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI+RIw/15Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36360428F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E13D300E176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E91C3921F0;
	Mon, 20 Apr 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZYpYPIov";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VI4Tbrh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CF3890EC;
	Mon, 20 Apr 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678153; cv=none; b=HRaRmjz/4RDhVjFvAGIfpvJ4XsMTmPoA99Z4vFmqxaCFBL9vZH7lT4sXezjgxDrr/PJhanfqxk6jxbkxivhWYIHYFGc4YeAbll3msYt/eDO3mY1PDmuOeYGarhDdp3czcW4cdycbSMdxhiwSUBcBiO0ynDaeH0dEJGZl9S5m3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678153; c=relaxed/simple;
	bh=j9Iaradu9f7Uj6GWtFE67RMfGF73XNfKU1Zijvw60jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3CoVrPy+QANj3l9zyZSMkznkwX/7szfM8TpIPf6NSkwH77PlGFohiHUFnADoagMKpb19UjHUXF3qEK0MBw6ygs1qof+Yo6+sUF0H564K6SeF63+m1j94VzTC1lQi8rPxApvRp3ZG6IjSaVNcLim6Lx+3Y8f67pwaQz5r9pQX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZYpYPIov; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VI4Tbrh8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678138; bh=8LJQdDGetAif89cFb6L2HOr
	Ce4sRU6mhBzVzXVj1ewo=; b=ZYpYPIovzwatVFiwmySJaaDv9Pju5bHDiv1Jklifa/9XFf73rc
	wQvAJVcLrqq+x05pNsn9SUoyt4AiJvDJfwZpgcGB+VM+iPIaiodm4vFLUU8cykx0R99kx6VggxR
	EoZIoKlWoHmGL2mWmTRwK0N6HoHAKAtzYMUKGpoN8NY8zVs4YMUN2F265vRqJVyKZaHiuHo+XdL
	wkMpNbo+8hB15MbKV4K+ngbMN+8qn+e8zbIIhzi7/24NcEqcVL6VP2vYaeNUvoNh1WUk9ak1USH
	qQv4+bTrnMUMivWFU6lF0YvlGoJb20jQU+9GZymmWpTDnGS8hOrpqeq1RHt25Mh9eTw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678138; bh=8LJQdDGetAif89cFb6L2HOr
	Ce4sRU6mhBzVzXVj1ewo=; b=VI4Tbrh8Lj+k5WQ6uY2hiReLLMtTQCdEL2nQo9idr6Uwt3vBdi
	zogYtv7X1IMe/sZVQiuUFNwyxSC9/s8TulBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 20 Apr 2026 12:42:10 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm630: set adsp compute-cbs'
 regs properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-2-f6c7ab3c889a@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776678136; l=1610;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=j9Iaradu9f7Uj6GWtFE67RMfGF73XNfKU1Zijvw60jI=;
 b=E7UY8ORZiuLdQUXhmiTnJ6tpjvbsGrz64WygTHKiXckwTQYtkjmrMWQgyx31vZEbWIlEpbup0
 bMkTMCA+tQOAcuEAwiC1Du9KM+qGK5qeB7CuCY4jf+mPB9FrKwVcoUJ
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103720-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.8:email,0.0.0.7:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,0.0.0.9:email,0.0.0.3:email,qualcomm.com:email,0.0.0.2:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 36360428F4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on ADSP
so change FastRPC compute-cbs' reg values that way

Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index bef3213165d6..4b47efdb57b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2459,27 +2459,27 @@ fastrpc {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					compute-cb@1 {
+					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <3>;
 						iommus = <&lpass_smmu 3>;
 					};
 
-					compute-cb@2 {
+					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <7>;
 						iommus = <&lpass_smmu 7>;
 					};
 
-					compute-cb@3 {
+					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <8>;
 						iommus = <&lpass_smmu 8>;
 					};
 
-					compute-cb@4 {
+					compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <9>;
 						iommus = <&lpass_smmu 9>;
 					};
 				};

-- 
2.53.0


