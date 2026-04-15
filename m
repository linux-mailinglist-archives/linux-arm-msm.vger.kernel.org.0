Return-Path: <linux-arm-msm+bounces-103264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFdHLSxe32n+SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:45:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94E402C8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C60A030EDC34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7433EB01;
	Wed, 15 Apr 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eWpgd0yd";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="A6NpIhYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB01EB5E3;
	Wed, 15 Apr 2026 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246162; cv=none; b=Zmd5a+aDhUam7fos965EW+do4rBs7M5bEAzZ+jPI1No1TIrPUqFutYFNTacQoALrqP89eYHskAlSdC7r6G+yrtqbBwJFGJEiz5qSKxbbrbQMr72bMse5CCYZghsHiDjHEmblmHY/CQi5b5ILMBL48dPQ57e5HExY6pVxhUlbfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246162; c=relaxed/simple;
	bh=4j2ZogsOOHoBtk/jE2BeQiV4/qH2Y3yTurZ7Yqx6V3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbIsuqaZrwOuAprHu3bC6LpNjz43Eu4bi55MejZ04mhd7IgcUx4EyCxoQvjZF3mJuCA6AagrvxXrS+9TI07MlrJOogq5wMSXmnEZ6cxQMIxM/KRKO4z4bMp9gBz7plypwhkOQpB1E9uO3WdYHiEB0zEtXjd2kdUOS/C24ygVqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eWpgd0yd; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=A6NpIhYx; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246025; bh=ZGucYuZNovWXlK/4weCW01J
	gbMeF/xybjfNwv0uZ6rE=; b=eWpgd0ydqc1tU4OGDqW052/nZ6m4yOU82KzhkJukC2wuhZTA9P
	U0BLW1FV6tDmpxDBfLgFYdbcF2Q7QF/ADVG75C4iF1OWpWuW7Z7o2ycjXsMldvslkch0wH4Nz7r
	jQG22sMyRg7VrAu/66b5FCMrPUmaapN+kSmaCpfHyJUovutL1tvrs9XWkDc50XSTD2D2g44NdnC
	fLZ4p55o7Z3UDvEH6vqbOC7x3ld+vL+aDj2UzfIQ+xzQOYYDaeq1COKndIBOEptLG5Ru/1KNDM3
	hhPEMsu3/C2B1SrtDGuB0Rh/LA8ShPAYu2qQKniVHgxXXjDCky94WIO5XzRU5Ja2eBQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246025; bh=ZGucYuZNovWXlK/4weCW01J
	gbMeF/xybjfNwv0uZ6rE=; b=A6NpIhYx2Nubcu1RuVJXIgbWCMgVffHXIhoLFYnizL9z2Cvj1V
	yTwylOJ53PWx64Kyz9/3VlQdLCn8HkvH+sDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 15 Apr 2026 12:40:24 +0300
Subject: [PATCH 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=1405;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=4j2ZogsOOHoBtk/jE2BeQiV4/qH2Y3yTurZ7Yqx6V3M=;
 b=kbSgN104+nmN+nLpHaUpxAiqHhpyc6SSBJnywA92i7VOied0g6RsuYJgPdjZCHuNY3zmOYXa0
 BYSCw9W2ALhAcv/j0UyfZObR+7bCh5oQnIpsozljuArTxWqcue4kSfx
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[mainlining.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.7:email,0.0.0.1:email,0.0.0.3:email,0.0.0.9:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,0.0.0.4:email,0.0.0.8:email]
X-Rspamd-Queue-Id: 1F94E402C8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changing FastRPC compute-cbs' reg values to matching iommu streams
solves SMMU translation errors when trying to use FastRPC on ADSP
so change FastRPC compute-cbs' reg values that way

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


