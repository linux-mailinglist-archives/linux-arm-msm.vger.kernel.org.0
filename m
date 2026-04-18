Return-Path: <linux-arm-msm+bounces-103588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNOdCKxf42k7GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 12:40:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC96420B4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 12:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EA5301983F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 10:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9834FF7D;
	Sat, 18 Apr 2026 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JqRya2Zx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3892A3469FC
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508798; cv=none; b=fPCQmyn042FZDU8YMHFPUMyKjGAnmOOvOs2Uf3SQ3tCMbAWp8hlPoHW4bzktX2wGif+vLwI0jvQmXrg2P0yOgV/FBSg6s7du7E8IaSlvypYyXKlQQg0kScr0BNdHokNyFt9E/U1qHr5+CEyW9K7czzmEaEk4bwzp7nmrJ+By3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508798; c=relaxed/simple;
	bh=M6LVUW2n5KTuOAie1xrdlH+okKBQKa157KmIR2sGIcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EArd4BlbDqMZy7J1809rK7saob7aSK/Ep+NfTcLsuRANItmzK67cgUAVgeFRXN2Hk3/j97R7oyZy5E+r2JFem3N7m6J5Y+acrOnRbQU7lJ4H6yyKI89oBbUksu3x/bJTN7ZCTxU6QWDOZtpjVAIYwOof/sjipuJNCOCY4Jb3+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JqRya2Zx; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508789; x=1776767989;
	bh=M6LVUW2n5KTuOAie1xrdlH+okKBQKa157KmIR2sGIcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JqRya2Zx/oQnSQlTcr5K310KE6zsQp4M8enlSDvKcjbqzeOc2kDEuQvPovAQ/hD2V
	 /c5mf+KYR+sBA9+prNtb/cQbCQgOMzlsC2l3NauqkRm4CkIYTG3fZny8t4caU+a9uc
	 hHi9Q1bU3qOMfa/Eruc3gyHney97IeNtfGDF4zd5mAJRVH8e7UFJA3lEqJo+rslhl2
	 s08uZ1m50pp3f9CYW2Zgwg3L4hqK//+39GvjEhlGXBU/AbhNg+5mG88Rn0n6+72jS4
	 NNwAVGNaEXRdvDBbS8Eo1oyw41339shK6epMlSsyHsvXfvv1sIXBHO2hKx8a8w7WwE
	 r93o2TUGnXPTQ==
Date: Sat, 18 Apr 2026 10:39:45 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Sort nodes by unit address
Message-ID: <20260418-eliza-imem-v3-1-bfbd499b6e77@pm.me>
In-Reply-To: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e37f21b63d29cf2cb48c185dc974af6544101797
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103588-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[1.111.188.160:email,0.112.234.64:email,0.113.56.96:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.228.225.192:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,c432000:email,f100000:email,1fbf000:email,0.22.227.96:email,0.24.106.0:email]
X-Rspamd-Queue-Id: 6AC96420B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
few nodes in Eliza DTSI to fix that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 74 ++++++++++++++++++---------------=
----
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 4a7a0ac40ce6..6fa5679c1a62 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -662,16 +662,16 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 =09=09=09};
 =09=09};
=20
-=09=09config_noc: interconnect@1600000 {
-=09=09=09compatible =3D "qcom,eliza-cnoc-cfg";
-=09=09=09reg =3D <0x0 0x01600000 0x0 0x5200>;
+=09=09cnoc_main: interconnect@1500000 {
+=09=09=09compatible =3D "qcom,eliza-cnoc-main";
+=09=09=09reg =3D <0x0 0x01500000 0x0 0x16080>;
 =09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
=20
-=09=09cnoc_main: interconnect@1500000 {
-=09=09=09compatible =3D "qcom,eliza-cnoc-main";
-=09=09=09reg =3D <0x0 0x01500000 0x0 0x16080>;
+=09=09config_noc: interconnect@1600000 {
+=09=09=09compatible =3D "qcom,eliza-cnoc-cfg";
+=09=09=09reg =3D <0x0 0x01600000 0x0 0x5200>;
 =09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
@@ -862,13 +862,6 @@ tcsr: clock-controller@1fbf000 {
 =09=09=09#reset-cells =3D <1>;
 =09=09};
=20
-=09=09lpass_ag_noc: interconnect@7e40000 {
-=09=09=09compatible =3D "qcom,eliza-lpass-ag-noc";
-=09=09=09reg =3D <0x0 0x07e40000 0x0 0xe080>;
-=09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
-=09=09=09#interconnect-cells =3D <2>;
-=09=09};
-
 =09=09lpass_lpiaon_noc: interconnect@7400000 {
 =09=09=09compatible =3D "qcom,eliza-lpass-lpiaon-noc";
 =09=09=09reg =3D <0x0 0x07400000 0x0 0x19080>;
@@ -883,6 +876,13 @@ lpass_lpicx_noc: interconnect@7420000 {
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
=20
+=09=09lpass_ag_noc: interconnect@7e40000 {
+=09=09=09compatible =3D "qcom,eliza-lpass-ag-noc";
+=09=09=09reg =3D <0x0 0x07e40000 0x0 0xe080>;
+=09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
+=09=09=09#interconnect-cells =3D <2>;
+=09=09};
+
 =09=09pdc: interrupt-controller@b220000 {
 =09=09=09compatible =3D "qcom,eliza-pdc", "qcom,pdc";
 =09=09=09reg =3D <0x0 0x0b220000 0x0 0x40000>,
@@ -1005,6 +1005,30 @@ spmi_bus1: spmi@c432000 {
 =09=09=09};
 =09=09};
=20
+=09=09tlmm: pinctrl@f100000 {
+=09=09=09compatible =3D "qcom,eliza-tlmm";
+=09=09=09reg =3D <0x0 0x0f100000 0x0 0xf00000>;
+
+=09=09=09interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+=09=09=09gpio-controller;
+=09=09=09#gpio-cells =3D <2>;
+
+=09=09=09interrupt-controller;
+=09=09=09#interrupt-cells =3D <2>;
+
+=09=09=09gpio-ranges =3D <&tlmm 0 0 184>;
+=09=09=09wakeup-parent =3D <&pdc>;
+
+=09=09=09qup_uart14_default: qup-uart14-default-state {
+=09=09=09=09/* TX, RX */
+=09=09=09=09pins =3D "gpio18", "gpio19";
+=09=09=09=09function =3D "qup2_se5";
+=09=09=09=09drive-strength =3D <2>;
+=09=09=09=09bias-pull-up;
+=09=09=09};
+=09=09};
+
 =09=09apps_smmu: iommu@15000000 {
 =09=09=09compatible =3D "qcom,eliza-smmu-500", "qcom,smmu-500", "arm,mmu-5=
00";
 =09=09=09reg =3D <0x0 0x15000000 0x0 0x100000>;
@@ -1319,30 +1343,6 @@ cpufreq_hw: cpufreq@17d91000 {
 =09=09=09#clock-cells =3D <1>;
 =09=09};
=20
-=09=09tlmm: pinctrl@f100000 {
-=09=09=09compatible =3D "qcom,eliza-tlmm";
-=09=09=09reg =3D <0x0 0x0f100000 0x0 0xf00000>;
-
-=09=09=09interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-=09=09=09gpio-controller;
-=09=09=09#gpio-cells =3D <2>;
-
-=09=09=09interrupt-controller;
-=09=09=09#interrupt-cells =3D <2>;
-
-=09=09=09gpio-ranges =3D <&tlmm 0 0 184>;
-=09=09=09wakeup-parent =3D <&pdc>;
-
-=09=09=09qup_uart14_default: qup-uart14-default-state {
-=09=09=09=09/* TX, RX */
-=09=09=09=09pins =3D "gpio18", "gpio19";
-=09=09=09=09function =3D "qup2_se5";
-=09=09=09=09drive-strength =3D <2>;
-=09=09=09=09bias-pull-up;
-=09=09=09};
-=09=09};
-
 =09=09gem_noc: interconnect@24100000 {
 =09=09=09compatible =3D "qcom,eliza-gem-noc";
 =09=09=09reg =3D <0x0 0x24100000 0x0 0x163080>;

--=20
2.53.0



