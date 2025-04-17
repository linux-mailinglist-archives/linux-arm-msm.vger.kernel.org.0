Return-Path: <linux-arm-msm+bounces-54670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21159A922AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 18:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30906174F13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8656B254876;
	Thu, 17 Apr 2025 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfSm7kEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B013253B59;
	Thu, 17 Apr 2025 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907357; cv=none; b=hONSZbHKtoZc56mSmDl3WGTlRB87Z15cGMfN30SUj43BZjZlh8qYhTAFLksH63txDR2SO14DZjYJeMskeJtWoOapgrVpMCfi5d3yRVjxjITkdQJGZt0iui30xQjI/4MtDjN/PhSh8U7cSlUcOBppIqj3MYg9TjWSE3rYCWZPDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907357; c=relaxed/simple;
	bh=KAgpM2OaaW2bGCyXSjZKZf0/+A7uNCS5XH1/pIPqgFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9Ge/952/QAAkiLl9+MwGhij+Un9qb1U6z2GWVeDbe6AuFqUQjHF1bDqXUlhusYYnWx57vrlj9mchUtlj7BzCKfr/UXX7sgz1kHGZ6cuWi7+uS3xzHnsY2v9O0NpLTb3AdPOtIzbrkm8W4AFyHxfL4uMdmxiWD4v+1s1CTX5J6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfSm7kEl; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d7f11295f6so3227175ab.3;
        Thu, 17 Apr 2025 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744907354; x=1745512154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LmmrlTJn2e90QL7/1/Qd2Kcr+WfNQFvylwDn0lwegU=;
        b=BfSm7kElQBiniOUxe3C7PJrOIRG/XyEvGcDenre44xJku+MF9axkRhbOr8+gg48dWc
         kcGvb/B/p3i8M8KQ3uy7/aMUq+vXnM8I8aq81nF4+8yGs5fh1Ytr0IYoVFViSeol0HX+
         +nNtJwYJFaDSAT4WSPYJ7stkHPSr5KHR7efZpQTqtaKzG762Smawd6cdl7wGAZqWv8uZ
         L2jaDK1dPE4kDu2qZnJTkqjOyyKV956vKxr6W3mhr4dJ+ilkAZopSfEZ10eot0s+NTgx
         rxudUc3vrQZjvB4vwXh6AE4QXeb8cRt5gckrkyGfQUAH3LeeURF0cxNuUD4/9RwuOpCP
         WlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907354; x=1745512154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LmmrlTJn2e90QL7/1/Qd2Kcr+WfNQFvylwDn0lwegU=;
        b=nvWpgyqUPQXw6PDJWOKk+78mGIIkEXIeKsCV/3FXguOoH71+4ey3tV5xDmYzcs2B41
         ib6RKAWOh8aK9nfpcBsutLYMxDdmMGJTE8A7AXlP9/rPcPyFo4M4eJbExugqkrU7flIy
         4BTnRqD9z+Avh5dPiZURtmErf41ekJaNop4Q8RR1KpFFy7DZe0OnUCnJRXKcOpcP+aL2
         W/8hZQUmvTGwUIHwnuA2vrnpTUzWNnuBmA90WeAf2K5LLZbhBN173vmbcEQblje24GKS
         BJ3G5juu1KRqxlBxsCGqalz+NosOoUrsH32Qx0an/zLIW4/2TtguTdLp8C50fT1qYRRq
         /UAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4rvxQ0+dbpEC9mLqbANeslKvmdqYRy0tbW+ycefp7ytvUzEJzOvxqth/k8iIOnUhMKLzd8KQ2M01FTECn@vger.kernel.org, AJvYcCWRvo083JFmbN6W8Zr7kug/UgEoCnqifpMA4ZOoKsM50XFsDlkxPDiPx4szYD8H9rDIJFUUiHFytGirIBE1hg==@vger.kernel.org, AJvYcCWUsVasrnuXaI8fD4frr7KTYqhHzj8A2fUjNe4sHnChvuDpCZst5YmE2vfGLVYkKTT8MOl0xJBpGfM1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyi8EKnJRyQn5luxh+pJDV8kB6DY2t5Edbzjr92ye6Gmui3mjr
	bhNtujY4BbZVRbmvm7TwsTscwWFoF5aFBqQH+XIA6hmXM+AKIyMXk3s8Z85hWJFMrXnDvvif3vy
	FFHi+ugGZS+VhZfFN4rM3swEv388=
X-Gm-Gg: ASbGncvvMqm1Cml1qp+6DTQtnBK47TYl/v9wn2/yz5zmEyKYx/5tl91HRh0WoxIoQQC
	TM9f7VxD1Isl6/6xV+bfuCK1Hk3IVEDxpXZr5wKpkU8JtzwdUyNsT5HMttPhjjRnn7zydEqFS6w
	mKj/gamDtA71XPapft9xud8bgVxk2Bumz/miZlJ500zz5qiQV3TVDw
X-Google-Smtp-Source: AGHT+IHKUj+2dmd/w+Ui/12iN7A0zLyj0eqcT1Wgbp60FbobAg6doRop3rFHBMmgWYwesBsjIDdEf+k+S48Ps9kpBg8=
X-Received: by 2002:a05:6e02:3712:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d815b71410mr76207455ab.22.1744907354050; Thu, 17 Apr 2025
 09:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>
In-Reply-To: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Apr 2025 09:29:02 -0700
X-Gm-Features: ATxdqUGbHiRwM6mnbpnSpZPG47ilQLpY5_ZhlXEsWa25azb7ARqYB-z6krY5j9M
Message-ID: <CAF6AEGufHavA7523MfgNmquzso0Em+eNJn7LC9QHWDTb5zZ1Vw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 4:39=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> comparing with CRD and other dts for a more complete support of the 7X
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The two left ports work for me.  The right port does not, although
sometimes it at least manages to detect the display and read EDID.
Others on #aarch64-laptops have seen the right side port work.  Same
behavior with both an 27" HP (2560x1440, dp) and 27" lenovo
(2560x1440, usb-c) displays.

So, at least the two left ports are:

Tested-by: Rob Clark <robdclark@gmail.com>

> ---
> This patch adds the required nodes to support DP Altmode on all three typ=
e-c
> ports. The definition is derived from the CRD. Since they are all marked =
40Gbps,
> I assume there are 3 PS8830 retimers.
> This modification is now for ~8 weeks in my tree with little to no compla=
ints. I
> don't have access to a Yoga Slim 7X, however many people on #aarch64-lapt=
ops do
> and some are using this patch.
> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 491 +++++++++++++++=
+++++-
>  1 file changed, 485 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index 445d97d67d325853b7dcd2060523e7469ed4e6ea..129ab64c0f915e8f361a9300c=
2919cf69bbfda29 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,8 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>
>  #include "x1e80100.dtsi"
> @@ -72,7 +74,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss0_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss0_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss0_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss0_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss0_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -101,7 +111,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss1_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss1_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss1_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss1_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss1_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -130,7 +148,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss2_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss2_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss2_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss2_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss2_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -226,6 +252,150 @@ vreg_nvme: regulator-nvme {
>                 regulator-boot-on;
>         };
>
> +       vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P15";
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_pwr_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_1P15";
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&tlmm 188 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb1_pwr_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_1P8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&tlmm 175 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb1_pwr_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 186 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb1_pwr_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_1P15";
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&tlmm 189 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb2_pwr_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_1P8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&tlmm 126 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb2_pwr_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 187 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb2_pwr_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
>         vph_pwr: regulator-vph-pwr {
>                 compatible =3D "regulator-fixed";
>
> @@ -567,6 +737,178 @@ keyboard@3a {
>         };
>  };
>
> +&i2c1 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       typec-mux@8 {
> +               compatible =3D "parade,ps8830";
> +               reg =3D <0x08>;
> +
> +               clocks =3D <&rpmhcc RPMH_RF_CLK5>;
> +
> +               vdd-supply =3D <&vreg_rtmr2_1p15>;
> +               vdd33-supply =3D <&vreg_rtmr2_3p3>;
> +               vdd33-cap-supply =3D <&vreg_rtmr2_3p3>;
> +               vddar-supply =3D <&vreg_rtmr2_1p15>;
> +               vddat-supply =3D <&vreg_rtmr2_1p15>;
> +               vddio-supply =3D <&vreg_rtmr2_1p8>;
> +
> +               reset-gpios =3D <&tlmm 185 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 =3D <&rtmr2_default>;
> +               pinctrl-names =3D "default";
> +
> +               orientation-switch;
> +               retimer-switch;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               retimer_ss2_ss_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss2_ss_in>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               retimer_ss2_ss_in: endpoint {
> +                                       remote-endpoint =3D <&usb_1_ss2_q=
mpphy_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg =3D <2>;
> +
> +                               retimer_ss2_con_sbu_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss2_con_sbu_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c3 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       typec-mux@8 {
> +               compatible =3D "parade,ps8830";
> +               reg =3D <0x08>;
> +
> +               clocks =3D <&rpmhcc RPMH_RF_CLK3>;
> +
> +               vdd-supply =3D <&vreg_rtmr0_1p15>;
> +               vdd33-supply =3D <&vreg_rtmr0_3p3>;
> +               vdd33-cap-supply =3D <&vreg_rtmr0_3p3>;
> +               vddar-supply =3D <&vreg_rtmr0_1p15>;
> +               vddat-supply =3D <&vreg_rtmr0_1p15>;
> +               vddio-supply =3D <&vreg_rtmr0_1p8>;
> +
> +               reset-gpios =3D <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 =3D <&rtmr0_default>;
> +               pinctrl-names =3D "default";
> +
> +               retimer-switch;
> +               orientation-switch;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               retimer_ss0_ss_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss0_ss_in>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               retimer_ss0_ss_in: endpoint {
> +                                       remote-endpoint =3D <&usb_1_ss0_q=
mpphy_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg =3D <2>;
> +
> +                               retimer_ss0_con_sbu_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss0_con_sbu_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       typec-mux@8 {
> +               compatible =3D "parade,ps8830";
> +               reg =3D <0x8>;
> +
> +               clocks =3D <&rpmhcc RPMH_RF_CLK4>;
> +
> +               vdd-supply =3D <&vreg_rtmr1_1p15>;
> +               vdd33-supply =3D <&vreg_rtmr1_3p3>;
> +               vdd33-cap-supply =3D <&vreg_rtmr1_3p3>;
> +               vddar-supply =3D <&vreg_rtmr1_1p15>;
> +               vddat-supply =3D <&vreg_rtmr1_1p15>;
> +               vddio-supply =3D <&vreg_rtmr1_1p8>;
> +
> +               reset-gpios =3D <&tlmm 176 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 =3D <&rtmr1_default>;
> +               pinctrl-names =3D "default";
> +
> +               retimer-switch;
> +               orientation-switch;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               retimer_ss1_ss_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss1_ss_in>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +
> +                               retimer_ss1_ss_in: endpoint {
> +                                       remote-endpoint =3D <&usb_1_ss1_q=
mpphy_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg =3D <2>;
> +
> +                               retimer_ss1_con_sbu_out: endpoint {
> +                                       remote-endpoint =3D <&pmic_glink_=
ss1_con_sbu_in>;
> +                               };
> +                       };
> +
> +               };
> +       };
> +};
> +
>  &i2c8 {
>         clock-frequency =3D <400000>;
>
> @@ -614,6 +956,33 @@ &mdss {
>         status =3D "okay";
>  };
>
> +&mdss_dp0 {
> +       status =3D "okay";
> +};
> +
> +&mdss_dp0_out {
> +       data-lanes =3D <0 1>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +};
> +
> +&mdss_dp1 {
> +       status =3D "okay";
> +};
> +
> +&mdss_dp1_out {
> +       data-lanes =3D <0 1>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +};
> +
> +&mdss_dp2 {
> +       status =3D "okay";
> +};
> +
> +&mdss_dp2_out {
> +       data-lanes =3D <0 1>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +};
> +
>  &mdss_dp3 {
>         compatible =3D "qcom,x1e80100-dp";
>         /delete-property/ #sound-dai-cells;
> @@ -701,6 +1070,50 @@ &pcie6a_phy {
>         status =3D "okay";
>  };
>
> +&pm8550_gpios {
> +       rtmr0_default: rtmr0-reset-n-active-state {
> +               pins =3D "gpio10";
> +               function =3D "normal";
> +               power-source =3D <1>; /* 1.8V */
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +       };
> +
> +       usb0_3p3_reg_en: usb0-3p3-reg-en-state {
> +               pins =3D "gpio11";
> +               function =3D "normal";
> +               power-source =3D <1>; /* 1.8V */
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +       };
> +};
> +
> +&pm8550ve_8_gpios {
> +       misc_3p3_reg_en: misc-3p3-reg-en-state {
> +               pins =3D "gpio6";
> +               function =3D "normal";
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +               drive-push-pull;
> +               power-source =3D <1>; /* 1.8 V */
> +               qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +};
> +
> +&pm8550ve_9_gpios {
> +       usb0_1p8_reg_en: usb0-1p8-reg-en-state {
> +               pins =3D "gpio8";
> +               function =3D "normal";
> +               power-source =3D <1>; /* 1.8V */
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +       };
> +};
> +
>  &pmc8380_3_gpios {
>         edp_bl_en: edp-bl-en-state {
>                 pins =3D "gpio4";
> @@ -711,6 +1124,17 @@ edp_bl_en: edp-bl-en-state {
>         };
>  };
>
> +&pmc8380_5_gpios {
> +       usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> +               pins =3D "gpio8";
> +               function =3D "normal";
> +               power-source =3D <1>; /* 1.8V */
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +       };
> +};
> +
>  &qupv3_0 {
>         status =3D "okay";
>  };
> @@ -919,6 +1343,20 @@ wake-n-pins {
>                 };
>         };
>
> +       rtmr1_default: rtmr1-reset-n-active-state {
> +               pins =3D "gpio176";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       rtmr2_default: rtmr2-reset-n-active-state {
> +               pins =3D "gpio185";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
>         tpad_default: tpad-default-state {
>                 pins =3D "gpio3";
>                 function =3D "gpio";
> @@ -940,6 +1378,47 @@ reset-n-pins {
>                 };
>         };
>
> +       usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
> +               pins =3D "gpio188";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
> +               pins =3D "gpio175";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
> +               pins =3D "gpio186";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       usb2_pwr_1p15_reg_en: usb2-pwr-1p15-reg-en-state {
> +               pins =3D "gpio189";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       usb2_pwr_1p8_reg_en: usb2-pwr-1p8-reg-en-state {
> +               pins =3D "gpio126";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
> +               pins =3D "gpio187";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
>  };
>
>  &uart21 {
> @@ -976,7 +1455,7 @@ &usb_1_ss0_dwc3_hs {
>  };
>
>  &usb_1_ss0_qmpphy_out {
> -       remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> +       remote-endpoint =3D <&retimer_ss0_ss_in>;
>  };
>
>  &usb_1_ss1_hsphy {
> @@ -1008,7 +1487,7 @@ &usb_1_ss1_dwc3_hs {
>  };
>
>  &usb_1_ss1_qmpphy_out {
> -       remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> +       remote-endpoint =3D <&retimer_ss1_ss_in>;
>  };
>
>  &usb_1_ss2_hsphy {
> @@ -1040,5 +1519,5 @@ &usb_1_ss2_dwc3_hs {
>  };
>
>  &usb_1_ss2_qmpphy_out {
> -       remote-endpoint =3D <&pmic_glink_ss2_ss_in>;
> +       remote-endpoint =3D <&retimer_ss2_ss_in>;
>  };
>
> ---
> base-commit: f660850bc246fef15ba78c81f686860324396628
> change-id: 20250416-slim7x-retimer-70b1e67b1d42
>
> Best regards,
> --
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
>
>

