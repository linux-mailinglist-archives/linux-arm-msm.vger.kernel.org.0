Return-Path: <linux-arm-msm+bounces-22141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2935901573
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 12:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3026E1F2137C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F4D1D6A8;
	Sun,  9 Jun 2024 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ANWB1++k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A71CD11
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jun 2024 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717927388; cv=none; b=eiUv9Aqu43yE7FDia5jnN+qWAB6KQJLgMg7Lc5aBv63+cLFlo6PaCeVaaZfOSqZEnG21TwTJA9joaStGZCFtIgr9xoP4Z4HrwGHJ8PIU5IOBW+r6oHwlGW/dgKoYuImW7IOS4UyTNdMCJirbSRS8pp31zVxvOSBzjkwZdAbmgK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717927388; c=relaxed/simple;
	bh=Ht9bQOxIPW6HDnso8i0n0eRfSL1UuLnZowsqNSaw3gI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YR2QPqFzB64DlrEz3O+ROzWmUcSR92OoNsjUMmIOvlmj4hZS/n86il43+Ru/NeTz7ayidbtT3h6E9HRlESRBJsXE/3iqxNIfpZxjTeT0mrRvzZsHMiK6Espe4DOFcQKcbCEajFgOO4w6FOKga6ixgUdZe1G6b11o+btllcvOpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ANWB1++k; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717927370; x=1718186570;
	bh=VOk46FEwMPgWj8mRpQofHMOFAUKn4EKkVtGoj+1OqMY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ANWB1++kGN6S47Kl4YJf8kcOHa4K6Cd1oueLYXJJg4q791UEJCRYJ0oIOvOmdP6RS
	 MJ2ustHVTAeJ714xastCButVv31Aa479+GH1CwCu0tqoxcxTHLM2NV4RUfe6QXLdIk
	 nnGUq5UGDr+n/ZAL4FXFQp7bXODIJB60kFq/6kpKqEG5ja0AnZnCxs9PgsGJ9io3Y/
	 G/QBCw/L0mE27mblHZe85idkyw2EaVaP7z2B0fs8fxpnwMZ05W6NAB+0KDpdAX21rq
	 xj0Fej3GWmFKwzsn6Gja9Q4+FsHOtn9tGy8uf+jEY72GJ++26MCff3hTBazEVjKu6L
	 5kCVuqaC0RHWw==
Date: Sun, 09 Jun 2024 10:02:45 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-acer-a1-724: Add sound and modem
Message-ID: <20240609100243.834169-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: c62c1b1d3b5fdaab790a6848a374415dabc5c145
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable sound and modem for Acer Iconia Talk S A1-724.
The setup is similar to most MSM8916 devices, i.e.:

- QDSP6 audio
- Earpiece/headphones/microphones via digital/analog codec in
  MSM8916/PM8916
- WWAN Internet via BAM-DMUX

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../boot/dts/qcom/msm8916-acer-a1-724.dts     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/=
boot/dts/qcom/msm8916-acer-a1-724.dts
index b32c7a97394d..b4ce14a79370 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
=20
 #include "msm8916-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
=20
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -135,6 +136,17 @@ &blsp_uart2 {
 =09status =3D "okay";
 };
=20
+&mpss_mem {
+=09reg =3D <0x0 0x86800000 0x0 0x4500000>;
+};
+
+&pm8916_codec {
+=09qcom,micbias-lvl =3D <2800>;
+=09qcom,mbhc-vthreshold-low =3D <150 237 450 500 590>;
+=09qcom,mbhc-vthreshold-high =3D <150 237 450 500 590>;
+=09qcom,hphl-jack-type-normally-open;
+};
+
 &pm8916_resin {
 =09linux,code =3D <KEY_VOLUMEDOWN>;
 =09status =3D "okay";
@@ -170,6 +182,20 @@ &sdhc_2 {
 =09status =3D "okay";
 };
=20
+&sound {
+=09model =3D "acer-a1-724";
+=09audio-routing =3D
+=09=09"DMIC1", "MIC BIAS External1",
+=09=09"DMIC1", "Digital Mic1",
+=09=09"AMIC2", "MIC BIAS Internal2",
+=09=09"DMIC2", "MIC BIAS External1",
+=09=09"DMIC2", "Digital Mic2";
+
+=09pinctrl-0 =3D <&cdc_pdm_default &sec_mi2s_default &pri_mi2s_mclk_defaul=
t &cdc_dmic_default>;
+=09pinctrl-1 =3D <&cdc_pdm_sleep &sec_mi2s_sleep &pri_mi2s_mclk_sleep &cdc=
_dmic_sleep>;
+=09pinctrl-names =3D "default", "sleep";
+};
+
 &usb {
 =09extcon =3D <&usb_id>, <&usb_id>;
 =09status =3D "okay";
--=20
2.39.2



