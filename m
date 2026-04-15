Return-Path: <linux-arm-msm+bounces-103261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM2FNG9f32m5SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D993B402DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4173D30C26FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1833F595;
	Wed, 15 Apr 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="D1uK8XSp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="1+mnxa+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482F33C1B7;
	Wed, 15 Apr 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246041; cv=none; b=OqE2hC84tRjmiE69xuDSKhaTmhTVAg5xpFcLoFMrtD9lAsCxN02SkAeXR3Zp/WM+x5HCXqUHzpDiTjwWc7wEIR949opYlgYzvWlc+9CkmCfxRh0DoJd2+42nw7l5l8944lbkdDJwguUpKwVg8AVeheOBYHWyx/elQmmgdUtCnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246041; c=relaxed/simple;
	bh=xZ+8ndPkHpZPxjnqIqz7WNOISp1+GNT2KC/B8gL6l7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5UJ3oSg99Rr7d9KuTaQSDM0J6UdjbzzGQUQ1CFCOdAG8dfdYCIXRk85lOczlAfgNE3b3OevO2QO4YGVTfc+QGq22HA1l/x08LAButjrozkTZwijncQk97du0bjB8I7rJy97TL8wdFs78BvWYg/smCcsCMRB+oyp8uQ2X3takHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=D1uK8XSp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=1+mnxa+K; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246025; bh=BXYcB5Y4G/Y/a83AbXhX5R6
	wD/Ds2q9K6BqBKVQVkcw=; b=D1uK8XSpDIcxsngr5/GaoC1XGTwB3VIWze/6BVYffFOMGlpNPg
	0Q10/KFwFjj/f1G7RltwF8cU5YPa2G3fse1T2PgxPkAPCiIyFo+AYUTc+8pwG6KEcs4EZzggAEW
	cAVpFqBcm6Xdp98H/ms/UY/uOvnZY13OwbsiXFCYYeZXJvTuW0w40VaneJKjVjXSs2lTpNGMSvO
	/pzh/U6b3voq7SUeAeKAzcsAxRI9ZFJvk4QufiICGWS7r1DVPYsXxy/RBbF9cTpcE5x/rPLJafS
	qqsXSxVgOyy8wigOV/51leIiO/VT3QwDo690LvepG8BN7Z+gJBiM8eqjdZTquyYnung==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246025; bh=BXYcB5Y4G/Y/a83AbXhX5R6
	wD/Ds2q9K6BqBKVQVkcw=; b=1+mnxa+K8UGqIynrviccosPu5Os0SDP33Z13J52ELxKloVRLFM
	BhJUnq5C7Xz0Yhy+3LtMTHqrYoD0D1Ns6sBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 15 Apr 2026 12:40:25 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=864;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=xZ+8ndPkHpZPxjnqIqz7WNOISp1+GNT2KC/B8gL6l7I=;
 b=hAYwcyWWU63IiYRLmLmNo6K0gbzJQQXBlgz2Bl1SW5atPd0fGXhseNAA7PRTvzCYzpPSdEQX6
 6HE5iNPt7g/Af3Hi8kP12i5sPbuR9x9SE4v6IQNFc1fRLZgLT9COfuI
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103261-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f6800000:email,9f800000:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,f6000000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D993B402DD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream [1] this region is marked as shared and reusable so
describe it that way.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 4b47efdb57b2..13094b5e9339 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
 		};
 
 		adsp_mem: adsp-region@f6000000 {
+			compatible = "shared-dma-pool";
 			reg = <0x0 0xf6000000 0x0 0x800000>;
-			no-map;
+			reusable;
 		};
 
 		qseecom_mem: qseecom-region@f6800000 {

-- 
2.53.0


