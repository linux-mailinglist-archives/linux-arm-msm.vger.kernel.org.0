Return-Path: <linux-arm-msm+bounces-96464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BaAB4+Mr2n4aQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:14:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC57244A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BCA83056150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D3D3B961A;
	Tue, 10 Mar 2026 03:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Lk+oJM+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5E3B95F0;
	Tue, 10 Mar 2026 03:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112387; cv=none; b=X6rQetApzqNBI5tc3bVNhnJY0CGt4lr2m3Jjes9lOZZhO55KomhAXEP5oe4o4LSsUv6i7zT3zrcbRm/Ubh9OVfL8pLzpEF5A3eyQ6tvzdTx4nzPrPMKljTwPvI/ha5TSEgsKfxervMd7fcOdLCx8uNp9KOtmLKeOfUeg965rhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112387; c=relaxed/simple;
	bh=9R4mzAkGVZjqkNwMRmQ5dTtBOqUrYpvHE9hkSl/bF/Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHw4YPEb9QJXHbwdQbxt2xI6WsfSedsu7Yl2Y7pU9+HP9Y9a5YMKikd82q6AvG2hX5/csOyldRUJU/V7zPZh5JmekNXwDJfB97DwiNP/iC5PB582+2LTfFqyGYV8j+TaCGz7HEm9polo2otAZfyOTifEV3Rhzz7wnyyIRWy6eWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Lk+oJM+j; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773112384; x=1773371584;
	bh=mZiE53pGJGZnWdl5qaKL3RdihsPysxn+L55SWbAMxwo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Lk+oJM+jos592okj8kLv3o8QoXdn50cuLuVBo2Mwb2TmkvzBHUTfRsDyvlqPZu7o8
	 9ul7jRaRp2m8rMy+EOSM1J0WadVvXt8NJDLUJERd8OafPazp/YEBnX4szNpM6aDwyZ
	 CvPEUuVzcU9LXwlrLz9SYh1d6vlDF4d5/TAKMO8vYe/HklGJCLCn1+Y46F4w5/BQZW
	 O4dVbCOz/PN2GvdSxmbkwCq+foXUmNxeyjXC1PFaRxsYTQNQPnUbp3SqaJhRlTPJ3Y
	 GwbTWpkH5U5S/CjIxNmEFXQ+hd+aEW4tPNsA0SgYWtOF7EY5RUd0Iu3TxSOrNgu2cp
	 yxv9jbxHkhDFw==
Date: Tue, 10 Mar 2026 03:12:58 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
Message-ID: <20260309-sm8250-ice-v3-2-418bf5c5c042@pm.me>
In-Reply-To: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
References: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fda5794667f1377a0d573b45493d671670a83348
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8AC57244A9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96464-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d84000:email,pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,1d87000:email,1d90000:email,qualcomm.com:email]
X-Rspamd-Action: no action

Add the ICE found on sm8250 and link it to the UFS node.

qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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



