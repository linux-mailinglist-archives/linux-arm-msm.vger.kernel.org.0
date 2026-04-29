Return-Path: <linux-arm-msm+bounces-105164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PHqEZ/Q8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:34:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD1491FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F05D30CBC8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADF43C3432;
	Wed, 29 Apr 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mpzEcNT9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Grkt1nl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446123C3443;
	Wed, 29 Apr 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455028; cv=none; b=pU3l16P3moVzfPCyqW9Al7bt2H/6ToNnfQW/jrJdlj+NhANV80wzOJu9wmKpia67Sk8RVJ5pxLCF9LupHIpQLTnBHnXXXATiaaO3sAaFnKZ+V2sVSFTIIe2tL2+6kiSbYRdQNBlHXgPeFPobNKLXBOCVJ9I2eAT2oG1l89ZBr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455028; c=relaxed/simple;
	bh=xwJB9Mm8Ik60R6SKqMeflag5cfC/gceafZM2DWPmVNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7ILRkbMEeGT4jhI8Qks6PAnQiBBkg+5LaJ/1NH7+ryqZlYToxuYLYvyu/3USKv5XMMoLS54LX/pR6iqWWteqiuAqLiZTdOaSyr69q1zrZ6++dUnIW31yw5OqFMTMWvX4Uf14lwgaehCg0ia0uJ9zCQV6NY38h+xpBIGzV7eRxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mpzEcNT9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Grkt1nl0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455015; bh=dWWiNGzw96/EMO37l37XAm9
	FMJiTx5xT5xpTA7EGXyc=; b=mpzEcNT9vlar+5jHh485yyJ6CBUTxm8IpdIeQQOl8w1esKjyQb
	JZ/G8ykE6FN100f1KIh74/W0+seOemV6nFNL3BYaLEN0wSM2kSl5G1N6OcHAI7F6z8no6ZdCyiC
	58JKV+IQ/NK5i/CmzPJcjfdig5XVoL5DApf3RMXf2FNq/koaV0C51iNoN6KII7QH7RjqxJjPKtc
	kdBbkTP7mBCIdsixk2uYMP4N1XqIacYu+F9ogMB5a/BWvWvyFvaRjXCTcKyDCtcyBAQt6y3/jhy
	vH0ZRdzuykUcnKDvOPykOs7KNto8n+mxHyHbmocjv7QycusfvqKBRaBFGjOw5XoaN+w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455015; bh=dWWiNGzw96/EMO37l37XAm9
	FMJiTx5xT5xpTA7EGXyc=; b=Grkt1nl0RUHdJtwbvEhI24PHMb6R2+vvMtfp/4k6OHxeQSgJGL
	mZYrgT183dYSn1Kj4r1slaUzMHCwrch2dHBQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 29 Apr 2026 12:30:11 +0300
Subject: [PATCH v5 4/5] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-4-16bc82e622ad@mainlining.org>
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
 Konrad Dybcio <konradybcio@gmail.com>, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=1261;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=xwJB9Mm8Ik60R6SKqMeflag5cfC/gceafZM2DWPmVNo=;
 b=wsd4p7vLN/JzD0IXnl5mY35uyLy+deCjKm+Te4aS8Uatc8c4sbnttqgG04j/+xCTzugxUuaA6
 8hqeMucj5RUBjJuoqlG7m5MMuEiBIFg9hlIR6Pf72v0+rCBY3KhN5tU
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: A6FD1491FA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105164-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9f800000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f6800000:email,f6000000:email,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]

Downstream [1] this region is marked as shared, reusable and dynamic so
describe it that way.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Cc: stable@vger.kernel.org
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 4b47efdb57b2..252c301f0156 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
 			no-map;
 		};
 
-		adsp_mem: adsp-region@f6000000 {
-			reg = <0x0 0xf6000000 0x0 0x800000>;
-			no-map;
+		adsp_mem: adsp-region {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+			reusable;
 		};
 
 		qseecom_mem: qseecom-region@f6800000 {

-- 
2.54.0


