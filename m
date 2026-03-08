Return-Path: <linux-arm-msm+bounces-96003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF+6Ddr/rGktxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:49:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4822E821
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 05:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16A513014118
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 04:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7792D7DF2;
	Sun,  8 Mar 2026 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JmtxhbXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78813959D
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 04:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945357; cv=none; b=rpgAdjc4/dT7CFDqLdfY1wHANd+5aWaYErxJTVhtjMQZcTcZjzRh+wfCCa3YOt9Hh4lXsTPV2y0+eL+Xc0WKPlxP7va+dYWmTBp5pMh0kFTQ/zVWKPtL6PV/j5WahU7EdH4KXFKJus8No3fhrtbP7Gjvi0L/JU8nLdPUyCJytJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945357; c=relaxed/simple;
	bh=8WnFsfPFD5fbvOYn9KlfgheFOUjRaRNY4DFf8Ml4u9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiIyScXpNjTrKOZINnQGMQ1vP4hvOAaNTNSXIS+zVJbguM9fCKlCtkJXS8lpVXfmx4ACbPZ8EpNiGmFc49xnVkpWUm5ez7d0UNWMdem1GPRm1GMOuF5LzN/qfr8NagZ+HyRRdkqOPfoKrPlDCGk6FFh4DkdmJyj3E9Y9JL00epM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JmtxhbXP; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772945349; x=1773204549;
	bh=xJYM5Xqc2HUuSnrE+9bwPQ3CpzITCkMo2ABcsTbZWUk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JmtxhbXPS52RV+XAH9iWxcs/ctAF9UFVhNFmkDTfGki7nWZ8eHOzL/m+PHrIQp+A9
	 lYdYxYB6V6LvtkC/ZY818qOhr739MKis4MlNrsSFa2v0JClRbkAe+2ysDprIZtZsYK
	 FoPYftaqGvdzbEwVtbqsmcv7ffBdkGbfUGlPCSXxByJYTANfERILkG+LK2ey1uJIXe
	 v0q+FxXS3bf5oq29xfERONqrJh6jJCT8hDlHRncYODXK4RHHadsIgVyTRJ7f25iICi
	 8XU8d5YSna9DPIs/P/Ykd7xxIxmKXeyO4yGbttoSfM58u0KbuiXvEK3s4zsgxLjBom
	 j6lVZppI1JE2A==
Date: Sun, 08 Mar 2026 04:49:05 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
Message-ID: <20260307-sm8250-ice-v1-2-a0c987371c62@pm.me>
In-Reply-To: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
References: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f81b93a106e3390ea71d675c1bb1909f246291f5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BFF4822E821
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96003-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Add the ICE found on sm8250 and link it to the UFS node.

qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qco=
m/sm8250.dtsi
index c7dffa440074..4e8a960acc5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2513,6 +2513,8 @@ ufs_mem_hc: ufshc@1d84000 {
=20
 =09=09=09power-domains =3D <&gcc UFS_PHY_GDSC>;
=20
+=09=09=09qcom,ice =3D <&ice>;
+
 =09=09=09iommus =3D <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
=20
 =09=09=09clock-names =3D
@@ -2592,6 +2594,13 @@ ufs_mem_phy: phy@1d87000 {
 =09=09=09status =3D "disabled";
 =09=09};
=20
+=09=09ice: crypto@1d90000 {
+=09=09=09compatible =3D "qcom,sm8250-inline-crypto-engine",
+=09=09=09=09     "qcom,inline-crypto-engine";
+=09=09=09reg =3D <0 0x01d90000 0 0x8000>;
+=09=09=09clocks =3D <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+=09=09};
+
 =09=09cryptobam: dma-controller@1dc4000 {
 =09=09=09compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 =09=09=09reg =3D <0 0x01dc4000 0 0x24000>;

--=20
2.53.0



