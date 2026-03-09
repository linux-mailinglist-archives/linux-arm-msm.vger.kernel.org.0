Return-Path: <linux-arm-msm+bounces-96387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA5aE0FBr2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:53:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A1241E94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB46931724C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A6635839D;
	Mon,  9 Mar 2026 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="W5AGlw8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18536C5B0;
	Mon,  9 Mar 2026 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093042; cv=none; b=ZTDqfg1WIJW/VXCsNHNijRqOKcq/T23SApD3IXotOXdSNR4H4t8IFeKtPgg9mdUiKxjekuG1waKYN6Zh7/WmU1K9Rj3oekcJ157IhVSyegk4PxhsaWUGdreyb4+k9Nq4wa0noSH2jqfnAJgZZD3zRmZl2pojwVNg6s8HvVJDmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093042; c=relaxed/simple;
	bh=BLwnTN/doYiYLxs22kfN13qTi3yC74+KoLLulJju9ds=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4FpMHKR3in1ODgBHM9aLD2HR7HXld7p34Sj+A4DPx7GutiHrxxWAToUYl5z2THodDKgDiZrxjIfPP3W/4Juoa1gOe1CJY/CnJtxHzqZFe4QJdxhesP/03DDk8AhigrtKQ4kJYWYt6HdUnp4fscmJoJKeAoibxPCUjej1uIsSDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=W5AGlw8G; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773093038; x=1773352238;
	bh=MkcSEbNEv29g++i8rrpw/o3gQ1osp7RMsH/LfjL+u+0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W5AGlw8GOGMExHKxvQJNHxCDG3fHftNNREzuspXorr97btTIz91KrskmmHIgm7T3f
	 VZx2FEHoFYqDH/B7Uw1ph3neErnKuJ9rK8sOXgF92v1FMhIu2V/fI8kBkgaxnpNACl
	 8JNYNBuck+U7jS8AbNtPfkwjt1SZ6J1SR6fm66IrLFa5Z0DdqFNBZkwHmuTaGQ8dh4
	 TSemmq3sNOwICgjTD1j/+R0OPWECZdRLdMim/2eZ/PZfIqdIOoBRaoFrUAXzI0VmZE
	 WdSS9G5hCaSUe7aB1ttik+yGa8LPAf0XYMsDEjaDFipTqfmELHu1L6n5YtL/0W2yfC
	 65Aw1Xf64XfGA==
Date: Mon, 09 Mar 2026 21:50:35 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
Message-ID: <20260309-sm8250-ice-v2-2-0c8c46ccc814@pm.me>
In-Reply-To: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
References: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9418723da742b04029968d9c7aaf5a51e9c8dbdf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 981A1241E94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96387-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid,1d87000:email]
X-Rspamd-Action: no action

Add the ICE found on sm8250 and link it to the UFS node.

qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qco=
m/sm8250.dtsi
index c7dffa440074..b49007934278 100644
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
@@ -2592,6 +2594,17 @@ ufs_mem_phy: phy@1d87000 {
 =09=09=09status =3D "disabled";
 =09=09};
=20
+=09=09ice: crypto@1d90000 {
+=09=09=09compatible =3D "qcom,sm8250-inline-crypto-engine",
+=09=09=09=09     "qcom,inline-crypto-engine";
+=09=09=09reg =3D <0 0x01d90000 0 0x8000>;
+=09=09=09clocks =3D <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+=09=09=09=09 <&gcc GCC_UFS_PHY_AHB_CLK>;
+=09=09=09clock-names =3D "ice_core_clk",
+=09=09=09=09      "iface_clk";
+=09=09=09power-domains =3D <&gcc UFS_PHY_GDSC>;
+=09=09};
+
 =09=09cryptobam: dma-controller@1dc4000 {
 =09=09=09compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 =09=09=09reg =3D <0 0x01dc4000 0 0x24000>;

--=20
2.53.0



