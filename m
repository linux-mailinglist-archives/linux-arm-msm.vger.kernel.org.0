Return-Path: <linux-arm-msm+bounces-16397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A82898722
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 14:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CCCD2979FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 12:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA4612AAF2;
	Thu,  4 Apr 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="tYHl59K8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777712BEA4;
	Thu,  4 Apr 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233087; cv=none; b=bA3RfERFMOIYX2S/ggbaTRPup0Y5VrFytbNLWoTSGQzwcpVEz7+CFfHmsFbYCxHD/tlZMkV3drqhSg9KekqwXTE2LLa5TWrrkAdnWRMonvPEASnJcz8fZuVGFKNjU86akvqC2FiVbu0d3qqz/GuLISHmsj2tpo2ZOEHMRnt6FfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233087; c=relaxed/simple;
	bh=GVxSMuaMMwDtSmPLzrzidTFjSfDHe8yr66fS7IQWKuY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGIXJnfyXt/YDN59MdRDCoYNSbgP4XHmVHWUuhBWvS3YfqOaLh5zTBTQpaAe/Fr5RuZeiRUSeBVyN56AuzJWx2wfxtqY38TLRaVsc1F1CCs+cKMc18A5aRpvZZrKSUvNFC6H3nVfLYKX3rlEi8gqjrBkRvhYnyHLGU/MoZ5lpiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=tYHl59K8; arc=none smtp.client-ip=185.70.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712233083; x=1712492283;
	bh=SseXJJNHa/F6U0kOq29Q+JI+GmFAZYvDtNaSxxH9FJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tYHl59K8FpvqoZ6F0UJJ1w7NHzL439qWNSxc/q78GtQtnU0/TWNQpDMbI/KgrTgfc
	 SGt6jqT5cp5hX4vnUtLAMoVNo/kxmTecDaN6ysxvY0XVsObq1tts6+Y/0VwuPbfq3+
	 UlJG4YUuzqsAugGLipyyDyDWuYKGYtYSZQWmgJCFMNDaDXdBRX+doZnLgxXnUQ4hHg
	 xFLSA4/3YYdFsUdLzF6pMaIZCPdnwdwZ1Yi5x/gHnIiyeT/81OGzhPtpCz3zG3pcrK
	 i2clQiUVnVIZOU1BfuSYLzst3/+hi7tYSeofzjdLWWTVSsE04xODK9h+MOO5ZsYI71
	 4ioPWxz2bmDvQ==
Date: Thu, 04 Apr 2024 12:17:57 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Siddharth Manthan <siddharth.manthan@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: msm8916-samsung-fortuna: Add PWM backlight
Message-ID: <20240404121703.17086-3-raymondhackley@protonmail.com>
In-Reply-To: <20240404121703.17086-1-raymondhackley@protonmail.com>
References: <20240404121703.17086-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Siddharth Manthan <siddharth.manthan@gmail.com>

Most of the Galaxy Grand Prime use backlight drivers controlled with PWM
signal.
To simplify the description, add the backlight with the necessary clk-pwm
to the common dtsi.

Signed-off-by: Siddharth Manthan <siddharth.manthan@gmail.com>
[Stephan: Move to fortuna-common and disable on rossa-common]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Raymond: Add the commit message]
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 36 +++++++++++++++++++
 .../qcom/msm8916-samsung-rossa-common.dtsi    |  9 +++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 6c66a24ef1af..5e933fb8b363 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -26,6 +26,30 @@ tz-apps@85a00000 {
 =09=09};
 =09};
=20
+=09clk_pwm_backlight: backlight {
+=09=09compatible =3D "pwm-backlight";
+=09=09pwms =3D <&clk_pwm 0 100000>;
+
+=09=09enable-gpios =3D <&tlmm 98 GPIO_ACTIVE_HIGH>;
+
+=09=09brightness-levels =3D <0 255>;
+=09=09num-interpolated-steps =3D <255>;
+=09=09default-brightness-level =3D <128>;
+
+=09=09pinctrl-0 =3D <&backlight_en_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+
+=09clk_pwm: pwm {
+=09=09compatible =3D "clk-pwm";
+=09=09#pwm-cells =3D <2>;
+
+=09=09clocks =3D <&gcc GCC_GP2_CLK>;
+
+=09=09pinctrl-0 =3D <&backlight_pwm_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+
 =09gpio-keys {
 =09=09compatible =3D "gpio-keys";
=20
@@ -199,6 +223,18 @@ &wcnss_mem {
 };
=20
 &tlmm {
+=09backlight_en_default: backlight-en-default-state {
+=09=09pins =3D "gpio98";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09backlight_pwm_default: backlight-pwm-default-state {
+=09=09pins =3D "gpio50";
+=09=09function =3D "gcc_gp2_clk_a";
+=09};
+
 =09fg_alert_default: fg-alert-default-state {
 =09=09pins =3D "gpio121";
 =09=09function =3D "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index 4048b72efcdc..b438fa81886c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -17,3 +17,12 @@ muic: extcon@14 {
 =09=09pinctrl-names =3D "default";
 =09};
 };
+
+/* On rossa backlight is controlled with MIPI DCS commands */
+&clk_pwm {
+=09status =3D "disabled";
+};
+
+&clk_pwm_backlight {
+=09status =3D "disabled";
+};
--=20
2.39.2



