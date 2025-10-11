Return-Path: <linux-arm-msm+bounces-76842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A09BCFB3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 20:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C3D74E866A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 18:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EAD283FD3;
	Sat, 11 Oct 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="r6xpKVio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9933283FFB;
	Sat, 11 Oct 2025 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760209105; cv=none; b=czxt/1rZjGVc7jBzb66AzbXsfmg2SBDrKm+I9lZNrpeOCdwRfkBWl+rCqS9zfq1WEs9727NZbFvXJaA/x47I3OLtAEM3ibsjjI9V0Kj7pQIsyAz66vTCdyjC09wcfC8p5tHTuUHZSQy26CybQ0FdQxRVWSf3rqaJFEWeGhmRPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760209105; c=relaxed/simple;
	bh=1v8nHY4EpqYJa5+tPbItKCvOHDogDdxlqBPb40TYXvI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U4cvBSywi4DvzaL8XNOT8vTuKvuhCqI7dqJls6OuiepmnbA3Xxm11eGQBnzcNYZ1gwmm6jMi3TuTVpbBNsqLl8e2BioAxCLFJDPtFy2a4i0h18BD47L5GteMXAfIJjy9w3EPitFBeJn1bnGQ+a0Ve0Bvsu0t50s0isHAE+/rxpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=r6xpKVio; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760209087; x=1760468287;
	bh=cnHuHQrVVXZKpXeZNEipH+LyE/5HXlwHBeSny7rKcS8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r6xpKVioJXUbvIl1i6WAq3wRqejMRWv1E5J3nSlAqgNUHjoIhn5dfQyAnOWIb/FjG
	 8UlvDnG3+C5GGJyDHzcau4UymBQe1L2+Vw56pOfngCEs5qxCcjr3Y1SPAZH6V6V29P
	 awxabGRdGXfh2RoJV6l9foia+PNb4W+iz3hoaUi57135lsgFPDu7/dMhniLfYOjMd6
	 lFRwtby3Kf0uH950Nbsgx4rcISoLKmPhY7KQUvHAl0hbDQW/lmeleyTT0WbPO7Sm8C
	 AU3GylGEkOIaLBSUevRMQooGO9SWrM95fQJQ+cFMt/wHlB4Fc9sIzUHDYqdZvTEH9S
	 qSVi7z6UpVk9Q==
Date: Sat, 11 Oct 2025 18:58:00 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH] ARM: dts: qcom: qcom-msm8226-samsung-ms013g: add simple-framebuffer
Message-ID: <20251011185750.743615-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: c3fd6412242376b6324f202df282fc65579a2ae6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add simple-framebuffer, necessary power-domains and clocks for ms013g.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../dts/qcom/qcom-msm8226-samsung-ms013g.dts  | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/=
arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
index 08b50dc63923..80fe2916501a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
@@ -13,13 +13,37 @@ / {
 =09chassis-type =3D "handset";
=20
 =09aliases {
+=09=09display0 =3D &framebuffer0;
 =09=09mmc0 =3D &sdhc_1; /* SDC1 eMMC slot */
 =09=09mmc1 =3D &sdhc_2; /* SDC2 SD card slot */
 =09=09serial0 =3D &blsp1_uart3;
 =09};
=20
 =09chosen {
-=09=09stdout-path =3D "serial0:115200n8";
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <1>;
+=09=09ranges;
+
+=09=09stdout-path =3D "display0";
+
+=09=09framebuffer0: framebuffer@3200000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09reg =3D <0x03200000 0x800000>;
+=09=09=09memory-region =3D <&cont_splash_region>;
+
+=09=09=09width =3D <720>;
+=09=09=09height =3D <1280>;
+=09=09=09stride =3D <(720 * 3)>;
+=09=09=09format =3D "r8g8b8";
+
+=09=09=09clocks =3D <&mmcc MDSS_AHB_CLK>,
+=09=09=09=09 <&mmcc MDSS_AXI_CLK>,
+=09=09=09=09 <&mmcc MDSS_BYTE0_CLK>,
+=09=09=09=09 <&mmcc MDSS_MDP_CLK>,
+=09=09=09=09 <&mmcc MDSS_PCLK0_CLK>,
+=09=09=09=09 <&mmcc MDSS_VSYNC_CLK>;
+=09=09=09power-domains =3D <&mmcc MDSS_GDSC>;
+=09=09};
 =09};
=20
 =09gpio-hall-sensor {
@@ -93,6 +117,11 @@ reg_vdd_tsp_a: regulator-vdd-tsp-a {
 =09};
=20
 =09reserved-memory {
+=09=09cont_splash_region: cont-splash@3200000 {
+=09=09=09reg =3D <0x03200000 0x800000>;
+=09=09=09no-map;
+=09=09};
+
 =09=09smem_region: smem@fa00000 {
 =09=09=09reg =3D <0x0fa00000 0x100000>;
 =09=09=09no-map;
--=20
2.47.3



