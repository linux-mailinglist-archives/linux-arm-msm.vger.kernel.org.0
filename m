Return-Path: <linux-arm-msm+bounces-105574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPWcFR/09WnwQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 14:54:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EE4B20E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 14:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9D413004623
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 12:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C8937FF5F;
	Sat,  2 May 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYWQL83L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D892F290B
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777726146; cv=pass; b=U9SH1pF44ksgLS7JQpKhy58NsyAbZny6gcDuxAXfrSYUYX4Fd0qy//ltrn2kFVi7bEfNF5rYdVefNNNrt8zaLXVusJvl8iQ/5kjKwdEmjuwda3we6X8MlWdGB2C79e0yWeAxhWl9n9EzIWeasOx0lCwKtHF1CExSPz6sGyDMxoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777726146; c=relaxed/simple;
	bh=YqkIYV8cNWNmgCtYbJHQsgHrfW9WsU5mBWE9NnUagG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfoEDBH4TEm4/wlYSdKF5XCxx3eXjbvlu6hH73UqlyzUeHC08cNXeaumVJTSRO74ZAB0ep6EwVq0HFhg838p8EJgpxcW6tTWJ6pJ8P+YE7zrWS6IAd+lHirAHvS9lQ+3weWfrOZTmJkJc45dbM994sfSvSI1hU66c9GrQj5gs2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYWQL83L; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso1969829e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 05:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777726143; cv=none;
        d=google.com; s=arc-20240605;
        b=BcocfSPG9uIT8CUbjaBJ3cxbL5Q3oGWo4Famt7FQRzniFH31AbItcoGxdWa61kqMsI
         Yeki6+iVq9V6T+udSW1e9LHdcUCwPzSikUPadCmhx/8K2aEJ2DT9RbhqQpBzR1Urcyil
         Xe+qmP7/oESH+DKtEvqOdT1Dk1KNnZJq7oGfQTlYrBcVzdZHqINlqQjDA4aRwKBWyOWU
         8Hx1lkJXx4dAUgG7AE1fae5WyxCtw36NaMEFxJZNCkLEET0jOk+UUvDaT3KnUiB2S5qu
         3AOaJiAvPnab98+cqAvXCaWz2O9y00O71NGnETlkjqN3uypUObQcHuPZsspteYBE183f
         JkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R7OUMLqe1F0hQew+1PgjE381683yz3ZbZVDG8z/RRHs=;
        fh=IVVKb9MwuAaof8ORonFMKJwAfe7YkzjOtm9Q00Nq88w=;
        b=gmQeRhYEFTOrgjiRuvHHn2HLwOIyzS41keapZESa17vWtbNz0Vrg/KobCn1tXB+2cA
         /j6eLtYNGMiJP41RgwtaDHvOEs7hz/HLSP6S2upwetXVKmZva1DAJDzGJqtDLBfeaJZR
         ai2HN7gCl3YWg0ABxkB3uaKFKrqQqHHNo/SA9wl5aRAXEyDoiCfOML9+y+lX6Oo3Dt8c
         FSpnJdcLJqd3nFhxNqAjvp29CQsrGDsG/XEKmv3bZqM7A82sT9a7q+4oqwqN8+s51Fd0
         AuvEDX0FriLA4y13C4L1zwEMaQ95Vv7j1aCbmESg+o8LtK33rwlrVzifZWTTlAoOLhGs
         Okcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777726143; x=1778330943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7OUMLqe1F0hQew+1PgjE381683yz3ZbZVDG8z/RRHs=;
        b=dYWQL83L083zXeZFangrho/fE5Q1p2HB8UA7Tm1vJn6qBpoNy2fOXDqghn/DfoBKUb
         lZHA2ZTCkdGeJqmIJHZyC3yCkC4N5W4BUueBR/Qgo/tuJrXTPeUfvL1OHMDBhCMfh6D7
         pLZpDJzifdakop7xJ7aPOKbFbWIidQQn7oNSGspJ7EQJssQOYVOmuUpPCxuz39ZjzuME
         IbTTLoItpjNvfWaSWU2ZGyxiE61h93TccZGk3YV0efwvBPt1CIS1aQbDTp3mtKaAburp
         4IgNIu12fY9KCEqUpJ/sX0hY9nkSRFcZe8dp53tsadkNt7k62a4zwE36zuC+lPne+iIg
         /t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777726143; x=1778330943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7OUMLqe1F0hQew+1PgjE381683yz3ZbZVDG8z/RRHs=;
        b=htsaHX9VFvYNnZKzNyGnfrP4Z7Vgp6DZyUDckoEA9SsEexw2mZ/cEgHGSXqprg62nq
         eoWrg1eCdR9B2oim3PkITd8voMeRT8CZng0PO0tRIWfSs/wkd8a6zB8do9Kk0CBSk8MW
         OsAqWTiTm6LtM8HBxmdTc42KxZyJm6uXag9y9dOtPuK4tgFASBmXdqjg9PhQW06b21I7
         VuTh7K+ZYf1GxiNCLUZvMQAde9IoCf7GoCmDLGdagku+QYC3Fg+c9RIZhmcDR9JWrQZI
         a2EgvuZocAOY9/vpAMq++SMMX+E99jZqyPnrMf04MwH81uaDATMFzkFYYvgDhwISKrSB
         Nbyg==
X-Forwarded-Encrypted: i=1; AFNElJ+ILk5K0xPg4EHT2wmYzjldZ+aXemDlvAz6OQ4x/kx60AA42KU53TRIyU+w9U4Q92faQFcMpgeR4qyrfCEj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7yytV1i3/YvJs7y5Co9X2ebDXoGPp1sXC7+biU7Q9WBk510i
	QOBe40LuqnbYztXze4awda3ApzLt9t4L3SUvs/+C5so0oUQb7vvqxZwC+iNholXBdk8V9dEfqd2
	lC8ubj7YV7RIoeJ+axMxR39nzgcL6xRY=
X-Gm-Gg: AeBDievavow9FvkOXSXE2WFKe7tBaFjdAubV9Ogpi57wKEe/B+zG5m//+AA9Z7Vttea
	2U7SV2Lh6JKesjY9X/kUyeDFDYKpxxem+O5PYF3sg72z+4N4B43xYBeadnEqIc9r1TgFsSahcYM
	vtu73GcjCdXyBL+yUq8clMKmp8Rnoppis5REft5iW3dXmbsYYmz+UBjo5LPvwB9pPqAlwsliFQn
	5t0gnoVk6eBMoPYilwVaVeGk6DIZn6c3X6LfN/tajt+QonaRI0c4lFyirRgfmGiPx8B2KJyVK1S
	WvQEhta2h6ErkAZo2g==
X-Received: by 2002:a05:6122:230:b0:56b:579c:82e with SMTP id
 71dfb90a1353d-5750c55253cmr1356656e0c.5.1777726142894; Sat, 02 May 2026
 05:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
In-Reply-To: <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 2 May 2026 20:48:06 +0800
X-Gm-Features: AVHnY4K16i5cKZ_0rbW-GAXuM8aAKgyRuR3CHBayAt2hHZFEeoyWFZSvSMYLo7M
Message-ID: <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4C6EE4B20E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105574-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	NEURAL_HAM(-0.00)[-0.477];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.50:email,0.0.0.0:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,c6200000:email]

On Thu, Apr 30, 2026 at 6:49=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 4/25/26 13:52, Pengyu Luo wrote:
> > Hi846 is found on my Gaokun3, descripting it.
>
> To the best of my knowledege there is no 'descripting' word.
>
> Say it simpler like
>
>         Describe Hi846 camera sensor found on Gaokun3.
>

Ack

> >
> > Note that it seems that only Goakun3(3.0GHz) version is equipped with
> > Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >   .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 128 +++++++++++++++++=
+
> >   1 file changed, 128 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > index 9819454abe13..39e559e91289 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > @@ -15,6 +15,7 @@
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/input/gpio-keys.h>
> >   #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> >   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >   #include <dt-bindings/phy/phy.h>
> >
> > @@ -27,6 +28,7 @@ / {
> >       compatible =3D "huawei,gaokun3", "qcom,sc8280xp";
> >
> >       aliases {
> > +             i2c2 =3D &cci2_i2c1;
>
> I don't think that it makes big sense to add this I2C alias, please
> consider to remove it.
>

Ack

> >               i2c4 =3D &i2c4;
> >               i2c15 =3D &i2c15;
> >               serial1 =3D &uart2;
> > @@ -47,6 +49,21 @@ framebuffer0: framebuffer@c6200000 {
> >               };
> >       };
> >
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             pinctrl-0 =3D <&cam_indicator_en>;
> > +             pinctrl-names =3D "default";
> > +
> > +             privacy_led: privacy-led {
> > +                     function =3D LED_FUNCTION_INDICATOR;
> > +                     color =3D <LED_COLOR_ID_WHITE>;
> > +                     gpios =3D <&tlmm 34 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +                     panic-indicator;
> > +             };
> > +     };
> > +
> >       wcd938x: audio-codec {
> >               compatible =3D "qcom,wcd9380-codec";
> >
> > @@ -98,6 +115,20 @@ switch-mode {
> >               };
> >       };
> >
> > +     vreg_camf_1p2: regulator-camf-1p2 {
> > +             compatible =3D "regulator-fixed";
> > +
> > +             regulator-name =3D "vreg_camf_1p2";
> > +             regulator-min-microvolt =3D <1200000>;
> > +             regulator-max-microvolt =3D <1200000>;
> > +
> > +             gpio =3D <&tlmm 44 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-0 =3D <&camf_1p2_reg_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> >       vreg_misc_3p3: regulator-misc-3p3 {
> >               compatible =3D "regulator-fixed";
> >
> > @@ -462,6 +493,13 @@ vreg_l8c: ldo8 {
> >                                                  RPMH_REGULATOR_MODE_HP=
M>;
> >               };
> >
> > +             vreg_l11c: ldo11 {
> > +                     regulator-name =3D "vreg_l11c";
> > +                     regulator-min-microvolt =3D <2800000>;
> > +                     regulator-max-microvolt =3D <2800000>;
> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> > +             };
> > +
> >               vreg_l12c: ldo12 {
> >                       regulator-name =3D "vreg_l12c";
> >                       regulator-min-microvolt =3D <1800000>;
> > @@ -577,6 +615,66 @@ vreg_l10d: ldo10 {
> >       };
> >   };
> >
> > +&camss {
> > +     vdda-phy-supply =3D <&vreg_l6b>;
> > +     vdda-pll-supply =3D <&vreg_l3b>;
> > +
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@3 {
> > +                     csiphy3_ep: endpoint@0 {
> > +                             reg =3D <0>;
> > +
> > +                             clock-lanes =3D <7>;
>
> Please remove 'clock-lanes' property from above.
>

Is it unused? I saw it on some devices and v4l2 related source file.

> > +                             data-lanes =3D <0 1 2 3>;
> > +                             remote-endpoint =3D <&hi846_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci2_i2c1 {
> > +     /* On Goakun3(2.69GHz), S5K4H7@2d, image quality is better than h=
i846 */
> > +     camera_front: camera@20 {
>
> 'camera_front' label is unused and should be removed.
>

Ack

> > +             compatible =3D "hynix,hi846";
> > +             reg =3D <0x20>;
> > +
> > +             pinctrl-0 =3D <&camf_rgb_default>;
> > +             pinctrl-names =3D "default";
> > +
> > +             clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> > +
> > +             assigned-clocks =3D <&camcc CAMCC_MCLK3_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +
> > +             reset-gpios =3D <&tlmm 15 GPIO_ACTIVE_LOW>;
> > +             vddio-supply =3D <&vreg_l2c>;
> > +             vdda-supply =3D <&vreg_l11c>;
> > +             vddd-supply =3D <&vreg_camf_1p2>;
> > +
> > +             leds =3D <&privacy_led>;
> > +             led-names =3D "privacy";
> > +
> > +             orientation =3D <0>;      /* Front facing */
> > +             rotation =3D <0>;
>
> Both properties above can be removed as the default ones.
>

Ack

> > +
> > +             port {
> > +                     hi846_ep: endpoint {
> > +                             data-lanes =3D <1 2 3 4>;
> > +                             link-frequencies =3D /bits/ 64 <80000000 =
144000000 200000000 288000000>;
> > +                             remote-endpoint =3D <&csiphy3_ep>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     /* actuator???@58, Goakun3(2.69GHz) only, eeprom@50 */
> > +};
> > +
> >   &dispcc0 {
> >       status =3D "okay";
> >   };
> > @@ -1318,6 +1416,36 @@ hstp-sw-ctrl-pins {
> >               };
> >       };
> >
> > +     cam_indicator_en: cam-indicator-en-state {
> > +             pins =3D "gpio34";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     camf_1p2_reg_en: camf-1p2-reg-en-state {
> > +             pins =3D "gpio44";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     camf_rgb_default: camf-rgb-default-state {
> > +             mclk-pins {
> > +                     pins =3D "gpio17";
> > +                     function =3D "cam_mclk";
> > +                     drive-strength =3D <6>;
> > +                     bias-disable;
> > +             };
>
> cam_mclk pad function descriptions on all 8 pads supporting this function
> shall be added to the platform in a separate commit to sc8280xp.dtsi
>

Ack

Best wishes,
Pengyu

> > +
> > +             sc-rgb-xshut-n-pins {
> > +                     pins =3D "gpio15";
> > +                     function =3D "gpio";
> > +                     drive-strength =3D <2>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       i2c4_default: i2c4-default-state {
> >               pins =3D "gpio171", "gpio172";
> >               function =3D "qup4";
>
> --
> Best wishes,
> Vladimir

