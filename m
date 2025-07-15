Return-Path: <linux-arm-msm+bounces-65087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2DB06691
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607C44A5484
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F07729C33D;
	Tue, 15 Jul 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfjjRWej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509423CEF8;
	Tue, 15 Jul 2025 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752606700; cv=none; b=ksZndqtzh+VYfbonAKVi+RdNZKyQ/ZaGokzZEsM78QuV73+qeghIxlvg++gNYXUqnJGMFCSRQdPEExxvjcoAVMEQ9NqTiwEdzg/m6BgtscflzjXrF9Mv2uj9yOKtwUPigLvHqOFFQTCSwy4sjy8o2smIFzEcAsDp4A5304ww/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752606700; c=relaxed/simple;
	bh=XI5xpPGglXhMr902qd36Jrl+GZMQWzyr9/fxOK1wbKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFu1Qb+AUY0vKOwu3SE29YNNmDROVt9Jny6YGO3d6WGAYW/cgIi8nSLmOQE+WJDOqTFgIxLchS3i6FszTFp63J1zVZcq8sZkbIeYRH1bUH9fc3f0WqoRqvFtOoG7Cfjs0zop+m0NtofAOgJUWU+IPyXpu+IBYeXGPGQyNAXeAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfjjRWej; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e82278e3889so4428841276.2;
        Tue, 15 Jul 2025 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752606696; x=1753211496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2UmhCN1wKq7qPiM82CdVGcCOdWxK/9Xfu8BiSPLWas=;
        b=DfjjRWejn5Np48ilo9gsYCsNK42POJcwd1Kgr11MxKsQgNXyUrfa1KRsbQfSFmLgB4
         nQ4gpvVW0wHmaaJrkLyVU0dKGxR95XP+GZti8ug3hgK2Xij7wm9d7OyOA/Di4UZZJSxA
         G28xGs7PpjNwyTw3EOt0Gq0PgIqS2p7MHXJG4Wl11v1ufnr3uEsqQutbTlOZ1W4fDZQO
         Hfq4G83BX6PPBMucpth675gkbNsZVB5vBn0llC1SJC2U2RKQsYBPUwQRp8K82kQWelke
         fwg5nS+L2+Q+r5UHI4qt3N0R77gOXdEb1DrC8xY/0ujhNQx55X/5sBJv72LAkHsXczG4
         1+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606696; x=1753211496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2UmhCN1wKq7qPiM82CdVGcCOdWxK/9Xfu8BiSPLWas=;
        b=xE+g5jgjhRNP6L4R5APuuPFtTSlc70OoQoroApYX3t/oP/P0MA7eC62RKtyuzubFfD
         rZzcjI7c0wr9sO8a/NHCPsd/B79zKVAzZ2+3c+8UkS6ms4pvtGTtK9NXVDI2L7BgeYvG
         e9INCAIoG5Q52sMmJ7WjHIKqBgBHzy5ZGXdVxVAzsJYobA7shBTwDSdIcR8xmCqTdvLT
         OVISmtXHIh/a45oNQ4Tv5qXia8qQILSn/dUOrnQ+O7gCgjUtccMBok5hWR1IpF15K8LC
         Y+Io3bblcTSxNlfUgq/UAwv0ItQz3+s07TpoUB/3o+w0/38/zK2bZm2018dCKHdagnH9
         7s6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU//WZkLQLESTHoMiA11wSYoAfH2oaoPNo2dwe3sYiGW3sIw7mupj/CZA7bmgxfIKNRlSXLzCnzZo72jEpGRw==@vger.kernel.org, AJvYcCVArlSwpOnLVXDYihq2iV6CBDFTS+vcHQua5C+ZUfIuewvG2XofYSnUDbG0kaF+pFVVw7sJ25cDolv6@vger.kernel.org, AJvYcCXEvkZAeUa/MzpByzf2WPw0LmeINFLrF11+gAZ9HwsKM/qmCY/VgNGiu3A5G+6K2ZOMIk9gCKNZU9y4GWrb@vger.kernel.org
X-Gm-Message-State: AOJu0YyzaY/PjlTrYw3RXRslAk187k0nUdSw4PGSPr2xitx55EWDdsOO
	QevoWv1Ucbb8+ahrCnAFKOpp4FJrKnXsqtURpmcasC0exYt6womxjhDI14wmuFYJ/eDXCRujZdA
	eMrAYESB9goB3iK8TyksqSwp6pXpodnk=
X-Gm-Gg: ASbGncsMYvlaa3HsxrHGtevr+hCff5fuEju57EoOGkhauZpjTZ32O7azid5vhb83cxi
	NeiH+N8CFKPp68gm9DGH0aZsBWcxpazqhDKpKyIITdwJqO8DvzqFFJ+HCW3vjkfHGCcvXJ+GxHy
	OgC2vp2smO8w1uPYUPjN/ftll1dQznn7Ld1oEEuAkrPTeMY+yh0t7zmV9EyKww1CVNeOu108Fi+
	jpEYjjO
X-Google-Smtp-Source: AGHT+IEmRbP5plw2JDZuT8QhpPEHx+ilC143a5wCn95870ZBEW4VPQeDKcfi15deTxRuznWqb8pD1AxALKEWGplBKow=
X-Received: by 2002:a05:6902:1b0e:b0:e85:bf11:4992 with SMTP id
 3f1490d57ef6-e8bc2484cc3mr68128276.31.1752606696400; Tue, 15 Jul 2025
 12:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715185636.21758-1-me@adomerle.pw>
In-Reply-To: <20250715185636.21758-1-me@adomerle.pw>
From: Luka Panio <lukapanio@gmail.com>
Date: Tue, 15 Jul 2025 21:11:25 +0200
X-Gm-Features: Ac12FXzZwP0wg2XOsca0tmzCY-hknndg42Bhiqc9GRR2wQ9DnbCUMkYInG0f-zU
Message-ID: <CACi=Ov7fe1WjzgWYeAZYGMfyOifVymdM6h+pHedLdbicsom9Xw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent hardware
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Luka Panio lukapanio@gmail.com

On Tue, Jul 15, 2025 at 9:02=E2=80=AFPM Arseniy Velikanov <me@adomerle.pw> =
wrote:
>
> PM8009 was erroneously added since this device doesn't actually have it.
> It triggers a big critical error at boot, so we're drop it.
>
> Also it looks like the fuel gauge is not connected to the battery,
> it reports nonsense info. Downstream kernel uses pmic fg.
>
> PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
> so I combined it into one.
>
> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial d=
evice tree")
>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
>  1 file changed, 5 insertions(+), 90 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64=
/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> index 668078ea4f04..b74c3c9b4076 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> @@ -50,18 +50,12 @@ framebuffer: framebuffer@9c000000 {
>                 };
>         };
>
> -       battery_l: battery-l {
> +       battery: battery {
>                 compatible =3D "simple-battery";
> -               voltage-min-design-microvolt =3D <3870000>;
> -               energy-full-design-microwatt-hours =3D <16700000>;
> -               charge-full-design-microamp-hours =3D <4420000>;
> -       };
> -
> -       battery_r: battery-r {
> -               compatible =3D "simple-battery";
> -               voltage-min-design-microvolt =3D <3870000>;
> -               energy-full-design-microwatt-hours =3D <16700000>;
> -               charge-full-design-microamp-hours =3D <4420000>;
> +               charge-full-design-microamp-hours =3D <8840000>;
> +               energy-full-design-microwatt-hours =3D <34300000>;
> +               voltage-min-design-microvolt =3D <3400000>;
> +               voltage-max-design-microvolt =3D <4370000>;
>         };
>
>         bl_vddpos_5p5: bl-vddpos-regulator {
> @@ -406,63 +400,6 @@ vreg_l11c_3p0: ldo11 {
>                         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
>                 };
>         };
> -
> -       regulators-2 {
> -               compatible =3D "qcom,pm8009-rpmh-regulators";
> -               qcom,pmic-id =3D "f";
> -
> -               vdd-s1-supply =3D <&vph_pwr>;
> -               vdd-s2-supply =3D <&vreg_bob>;
> -               vdd-l2-supply =3D <&vreg_s8c_1p35>;
> -               vdd-l5-l6-supply =3D <&vreg_bob>;
> -               vdd-l7-supply =3D <&vreg_s4a_1p8>;
> -
> -               vreg_s1f_1p2: smps1 {
> -                       regulator-name =3D "vreg_s1f_1p2";
> -                       regulator-min-microvolt =3D <1200000>;
> -                       regulator-max-microvolt =3D <1300000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -
> -               vreg_s2f_0p5: smps2 {
> -                       regulator-name =3D "vreg_s2f_0p5";
> -                       regulator-min-microvolt =3D <512000>;
> -                       regulator-max-microvolt =3D <1100000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -
> -               /* L1 is unused. */
> -
> -               vreg_l2f_1p3: ldo2 {
> -                       regulator-name =3D "vreg_l2f_1p3";
> -                       regulator-min-microvolt =3D <1056000>;
> -                       regulator-max-microvolt =3D <1200000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -
> -               /* L3 & L4 are unused. */
> -
> -               vreg_l5f_2p8: ldo5 {
> -                       regulator-name =3D "vreg_l5f_2p85";
> -                       regulator-min-microvolt =3D <2800000>;
> -                       regulator-max-microvolt =3D <3000000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -
> -               vreg_l6f_2p8: ldo6 {
> -                       regulator-name =3D "vreg_l6f_2p8";
> -                       regulator-min-microvolt =3D <2800000>;
> -                       regulator-max-microvolt =3D <3000000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -
> -               vreg_l7f_1p8: ldo7 {
> -                       regulator-name =3D "vreg_l7f_1p8";
> -                       regulator-min-microvolt =3D <1800000>;
> -                       regulator-max-microvolt =3D <1800000>;
> -                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> -               };
> -       };
>  };
>
>  &cdsp {
> @@ -495,17 +432,6 @@ zap-shader {
>         };
>  };
>
> -&i2c0 {
> -       clock-frequency =3D <400000>;
> -       status =3D "okay";
> -
> -       fuel-gauge@55 {
> -               compatible =3D "ti,bq27z561";
> -               reg =3D <0x55>;
> -               monitored-battery =3D <&battery_r>;
> -       };
> -};
> -
>  &i2c11 {
>         clock-frequency =3D <400000>;
>         status =3D "okay";
> @@ -523,17 +449,6 @@ backlight: backlight@11 {
>         };
>  };
>
> -&i2c13 {
> -       clock-frequency =3D <400000>;
> -       status =3D "okay";
> -
> -       fuel-gauge@55 {
> -               compatible =3D "ti,bq27z561";
> -               reg =3D <0x55>;
> -               monitored-battery =3D <&battery_l>;
> -       };
> -};
> -
>  &pcie0 {
>         status =3D "okay";
>  };
> --
> 2.50.0

