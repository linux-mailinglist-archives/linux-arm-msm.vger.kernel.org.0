Return-Path: <linux-arm-msm+bounces-110965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AS5zJ/QhIGpjwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D5637AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:45:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=KhY1rIh+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E386301FC2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3F047DF9A;
	Wed,  3 Jun 2026 12:41:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551647DD6A;
	Wed,  3 Jun 2026 12:41:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490511; cv=none; b=h7wm2CxDr8cIRF6qUvIXD+bijJR5N9+h5jGYPpchD3FHHapjpfPTsVCvPdPdsTRXU1NEMxTzA00P3IbriifpRoBWjaVnzXn7ctukVB/iVxsh8k0jjePOuw9F34szUqKbFGlOAw7c3zknUvTdyNbpfFUiCGdQYFtwWd0fYJOb6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490511; c=relaxed/simple;
	bh=vTQ6t7Bi9M/jHIuXZprXAHvUQWNB8MBtsgUbdu/Voo0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CdACnmmLOqAXdbZb1J1IQ8qpwGrJsPKxF3+8qvrWr2G1dfR/cji0AE0gvGvWrxwtNqqddHpwSkR+8RrgAw1JkYio1/YYSKB50MCKiV8AWQX/+8FWYmPmeENp0QKCMyIuwemd5yxMaEIdf/0dnh3KcImyZnMVXvFAGazOiDr7TKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KhY1rIh+; arc=none smtp.client-ip=185.70.43.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780490500; x=1780749700;
	bh=Hk4fuqM5mScxQ0UbnoPFK1HpCnJG0QG1ybteQ8gemiM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KhY1rIh+P4U9ZVGTX845e0hoVNRqP/loXaApd4ncRLI6ajSb4lmiFljub235IstSa
	 4gGay8VoAqvPQ6T9SZzGBBpFETUjPqhBxsu6cqeZYtA+yTyoQqKOv6Dm710DAiQdGW
	 P/JaKws6yVSR0qbI14h0z2x0spSwhP32Bcyi0xS2Q0rtgdOj/0yS8CL3xwR4uJmkCn
	 6+3lmEE9J8pHPGV3XYclCoNWTe6CFKv35+W2FRUlMuRZJPO4Nt2kjcsvmwrhjhWEvp
	 Oe8Tn2ghiKs4lRpR3LtU1Nwc3Nr8OWAWyMm76fWM99wk9v82NMsJixAqU/OMQXeTeM
	 hMyPEcg1R4xXw==
Date: Wed, 03 Jun 2026 12:41:34 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 630ff1533b26874fe3b7e28459ce01d5c08c748c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:mid,pm.me:dkim,pm.me:from_mime,pm.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89D5637AA7

The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
and gives a warning. The 'interconnects' property is also missing from
the binding.

Dropping the nodes here and will just submit panel binding & driver for
use with MSM DRM.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 ------------------=
----
 1 file changed, 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 7393978926e4..787acef4a4c8 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -25,31 +25,7 @@ aliases {
 =09};
=20
 =09chosen {
-=09=09#address-cells =3D <2>;
-=09=09#size-cells =3D <2>;
-=09=09ranges;
-
 =09=09stdout-path =3D "serial0:115200n8";
-
-=09=09framebuffer0: framebuffer@e3940000 {
-=09=09=09compatible =3D "simple-framebuffer";
-=09=09=09reg =3D <0x0 0xe3940000 0x0 (2392 * 1080 * 4)>;
-=09=09=09width =3D <1080>;
-=09=09=09height =3D <2392>;
-=09=09=09stride =3D <(1080 * 4)>;
-=09=09=09format =3D "a8r8g8b8";
-=09=09=09panel =3D <&panel>;
-=09=09=09interconnects =3D <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-=09=09=09clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
-
-=09=09=09/* Dummy panel for simple-framebuffer dimension info */
-=09=09=09panel: dummy-panel {
-=09=09=09=09compatible =3D "boe,bf068mwm-td0";
-=09=09=09=09height-mm =3D <157>;
-=09=09=09=09width-mm =3D <71>;
-=09=09=09};
-=09=09};
 =09};
=20
 =09gpio-keys {
@@ -131,15 +107,6 @@ ramoops@81f20000 {
 =09=09=09mem-type =3D <2>;
 =09=09=09pmsg-size =3D <0x200000>;
 =09=09};
-
-=09=09/*
-=09=09 * ABL is powering down display and controller if this node is
-=09=09 * not named exactly "splash_region".
-=09=09 */
-=09=09splash_region@e3940000 {
-=09=09=09reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
-=09=09=09no-map;
-=09=09};
 =09};
 };
=20
@@ -507,11 +474,6 @@ vreg_l12f: ldo12 {
 =09};
 };
=20
-&dispcc {
-=09/* Disable for now so simple-framebuffer continues working */
-=09status =3D "disabled";
-};
-
 &gcc {
 =09protected-clocks =3D <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 =09=09=09   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,

---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-asteroids-drop-simplefb-0aeb1d1bbadb

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



