Return-Path: <linux-arm-msm+bounces-104441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGyIFGdQ62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEEA45D8B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 896493011A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2923A6EEC;
	Fri, 24 Apr 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Y+QaCCt2";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ce1R084U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CC3A6B9D;
	Fri, 24 Apr 2026 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029209; cv=none; b=ayEP7JBcJk6nZEcTWR1SA9T/yAojagty+xwb2LqDFIq6COIiCh+AiENAWTZ//WpE35IU5sYlKvILLHh5xbDckcYtDrPi20LNRFRIssFl/aGhv+lGPlLojxkBB31vv5jA4rKR2T1CspGuNlNWvVbwUKCENooUZUkujOc8ylr3M9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029209; c=relaxed/simple;
	bh=jZCwJSESH/k8ItOfmVpqN4zlJ+dQKz1rTENKr2XJc6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z50zAEgQKUcL8Wt/HnBx9Vswrzu1dXVgWfWEYf1WqKZfbeaqxkBy528lSz2q3CC3Tc2h8D1yYkH8sUDxlwBXwlLm5EAZbpokOJSGJYizFNloBRzvg2y4DYAJceAm1OBi5K3wo24qgv+fU5W0K2o7e0ydLB4E2+WzSW5Vh7sRurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Y+QaCCt2; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ce1R084U; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029189; bh=3nDB8p7DxiNRBN7uYUgeihk
	xae6jmrhd1AaSCdVKFcY=; b=Y+QaCCt2VGwbEVgf1iR7M+dJHcFz58I2SZcK+riJdVdOWCCL0E
	b2CetA9LjCf1RERh3mosNfPqB6svEVrBH8NjBJCjwqk8wnTQyjL6M8MlW2xqPCWVDNrd1BimnHE
	aHAfCvETj4drNUtmRQoax3qz2oRY6A7ANgNRJUXp0iKJK890BbCs9Yiv1b4isABjPQNwAEboTor
	lBve2/xbnBBybEKsfU2bW+oWmRUQK3WPfNJCrNW04NS921LVnYJNKwoFJe49i51fVJQXGs85uRd
	RIInl2LWj+W2fOoZPCGRPolZiFxT1Wn7VOrBqwTJD4VzRDStvMJvMiEdMfoq+8OM10Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029189; bh=3nDB8p7DxiNRBN7uYUgeihk
	xae6jmrhd1AaSCdVKFcY=; b=ce1R084UCrVhT7atKYvct9o00ZniHnLHboydmRtwZFo+qA5lGF
	Oo/jMAG40jBCcXZ5cnAU/mHrgMm/ypTy2HBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 24 Apr 2026 14:13:05 +0300
Subject: [PATCH v4 3/5] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-3-ee5257646472@mainlining.org>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777029186; l=1261;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=jZCwJSESH/k8ItOfmVpqN4zlJ+dQKz1rTENKr2XJc6s=;
 b=n8aDt/lkalzPX79a2wN4GSodJFyIzvnI9KnlhuGW73x846KIOGYJFcu7EWhFj2w1wLpzsdlB2
 fLBrhMbFFOhBlESroz8ReA9dN3fXUejEV0aJ7SjTxEsDzmmlWt3UVyd
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: DEEEA45D8B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-104441-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]

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
index 4b47efdb57b2..36b419dea153 100644
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
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+			reusable;
 		};
 
 		qseecom_mem: qseecom-region@f6800000 {

-- 
2.54.0


