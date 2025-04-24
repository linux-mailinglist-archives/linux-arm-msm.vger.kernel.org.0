Return-Path: <linux-arm-msm+bounces-55521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB43A9B982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B326C5A80A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 21:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F6E223DD9;
	Thu, 24 Apr 2025 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8HHOcgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3114E2E2;
	Thu, 24 Apr 2025 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745528956; cv=none; b=fOEsdDXQPMA4aub7F2qCaY9PtZVDMFn4d/LMQrEwOjdOJ0ozhygWekNzlnQjSzkvEJcH1VDOXDSvXE0JpgUK/amMdRAvhJ0giiShA1M3nB5KDgCs/pEsD56v7inpC7kwMmTLY1RJCznmc5FMmnnio9ndksUZBxn4T3YlVy3kjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745528956; c=relaxed/simple;
	bh=yTs9czbi5781gRsJeYKT6c8s8wJlYPKBa5CmMgkukQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+wCSemjUpcK0Sv3OmaAzAbHI+QU/E/M+pVVkSjoeKjjy0jwmXBJ0HDxQ0Gt87wDiChD5tkiH0BL1lwvE9XQXRO+ebWMKMWXic70E+s2rVbNY7n+EaSy4AkDTguDxlE+MiJj6tKiWInGyyaTEzWO3LRSV1ww8LDgbMBMNTeuOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8HHOcgE; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d81ca1d436so12271785ab.2;
        Thu, 24 Apr 2025 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745528954; x=1746133754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9qaVc1eG5dlfukfGDdqiWAo/FFK3kQPEPGI0xpFs4M=;
        b=W8HHOcgELvQSzPJVO+fDdfPqtbTNdUvisMFjNXn58+LLgDYqowYsNUCAXZPk+H8tg/
         0fLH7tkoBLPmHa9AENUBb13SIWo+DmNeCDmWrMORgH/GF1grScw/9A0sg2fcMDBvI4D+
         3xeWfRVPbVhgFTgAPqJYj3PLNUiAOIeNSaXoYMFiIQaPduDcvnhGQm0GVf91qNZPR3Zs
         QdThd38hUk9F8Z5gJsO5rgx47KKjJhb813Xv4VbcqN61Husjh913qdygjfpOsN1czZdD
         mdXyz2LwZUB4TU/LR6WUJsyTadMo3BYsLe4MHxEdZwTlmYrpvEOuOfBs73rQQ+6v1ExH
         rAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745528954; x=1746133754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9qaVc1eG5dlfukfGDdqiWAo/FFK3kQPEPGI0xpFs4M=;
        b=QkJdbYFS+taA/NuSvdk67xvr8ixvAJtRsfYjasXHmP2QHeTy++AvgyfilwjpedXOnD
         d/osFmEUNK1jOOQ/L9eX2YD3VmpzVLYTrzdzqNySkyV/u0tgTEq2onJXFlDVh3BoXA5W
         0orZYw4wRJhqAsAcE9DJqV6jLBla9GTu5h7Q/qW312i4BQDk9jgVT0LufO7WW3z/hN1M
         ry+SaNijneQPXZFxTmA5u4PbDtDWbzJdXsr8YOaMIPO3e5P5Vaj8H4TC82av6QtqiVVu
         peta7HrrVfKM+Qbq8J8tqu0Ag1TA9pmKfmbwkDyR8Hx4AFuL/VbSk4pcI+7+niowwQxG
         dVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0IzC1gBMzd2knrnBDjjKt+wj2Fu1ik1RnCTRer4fhXI/knHKHoBZcMkTSCbOdk7EOSjjBu44s+CWI@vger.kernel.org, AJvYcCWlpy8qTgDHSQzbYkDZ4N/6nG7q+t6sVp7S423U5LY90byrOEvTXLdJe4U53VDZiUxGuohP+ERrHtigzds/rA==@vger.kernel.org, AJvYcCWpzJQr/OptYq0q3Sp0ySjGxfc8Y3g5/ktmD/oXV+NsM86NdVbpHj4kip4lN3x2Jbhqrp0PUJqlkabCaDnU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRBrsW1JIoKFg3Q20w+1S65HHdOqMjhu4R8T1+F8RByWGDUgOA
	aMmQFLxxjfsjnyRalSkQm4hlgNmxOUZ1qX/NMYEFb55d4nnc5hmk8e1xTuPSyoF2onb4DXVKNu1
	Q8zvLuuhRHu8/4R4lz+r44Dw+RaM=
X-Gm-Gg: ASbGncto9soEJRgpQ5p95jY44o5UacIW2dhch4M36kK2Ph5rAsoPnxEGYxRQp5YVLGb
	cm/CYZDaikSuzoueyxtQXZOQeDhwjiKkLvkWe21euNX1sIUIyQoPRFuZJWPSz7h9ypL7NsSOROO
	Y8iK1zn0AxzetUrvsEMaCGjKaV50A+iimg8qg3SLhPBZJc0Ql8SsJrNRm/
X-Google-Smtp-Source: AGHT+IGCR5YmM6xOepvcmFWrQMVQUxPBIG7LIjXqo38A3z3nwgDpetWGI6ODvE37tZKiKGTwrmh3xBJSGjjiZIsK/Sc=
X-Received: by 2002:a05:6e02:4509:20b0:3d9:36a8:3d98 with SMTP id
 e9e14a558f8ab-3d936a83e72mr22647525ab.2.1745528953569; Thu, 24 Apr 2025
 14:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz> <CAF6AEGufHavA7523MfgNmquzso0Em+eNJn7LC9QHWDTb5zZ1Vw@mail.gmail.com>
In-Reply-To: <CAF6AEGufHavA7523MfgNmquzso0Em+eNJn7LC9QHWDTb5zZ1Vw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 24 Apr 2025 14:09:00 -0700
X-Gm-Features: ATxdqUEpyk4yMG4qA-HEFCksqV66gTiqtUKQNJ7tuK51dw6tHtH6BeRKwQP-S_8
Message-ID: <CAF6AEGtsLB0PXEqus7e04uDisqQSvCJwFcChzwsmmWz7msSpWQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:29=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Apr 17, 2025 at 4:39=E2=80=AFAM Jens Glathe via B4 Relay
> <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
> >
> > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >
> > comparing with CRD and other dts for a more complete support of the 7X
> >
> > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> The two left ports work for me.  The right port does not, although
> sometimes it at least manages to detect the display and read EDID.
> Others on #aarch64-laptops have seen the right side port work.  Same
> behavior with both an 27" HP (2560x1440, dp) and 27" lenovo
> (2560x1440, usb-c) displays.
>
> So, at least the two left ports are:
>
> Tested-by: Rob Clark <robdclark@gmail.com>

To follow-up, with the addition of
https://lore.kernel.org/all/20250417021349.148911-1-alex.vinarskis@gmail.co=
m/#r
all three usb-c ports are working (in either orientation)

BR,
-R

> > ---
> > This patch adds the required nodes to support DP Altmode on all three t=
ype-c
> > ports. The definition is derived from the CRD. Since they are all marke=
d 40Gbps,
> > I assume there are 3 PS8830 retimers.
> > This modification is now for ~8 weeks in my tree with little to no comp=
laints. I
> > don't have access to a Yoga Slim 7X, however many people on #aarch64-la=
ptops do
> > and some are using this patch.
> > ---
> >  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 491 +++++++++++++=
+++++++-
> >  1 file changed, 485 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b=
/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > index 445d97d67d325853b7dcd2060523e7469ed4e6ea..129ab64c0f915e8f361a930=
0c2919cf69bbfda29 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > @@ -7,6 +7,8 @@
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/input/gpio-keys.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >
> >  #include "x1e80100.dtsi"
> > @@ -72,7 +74,15 @@ port@1 {
> >                                         reg =3D <1>;
> >
> >                                         pmic_glink_ss0_ss_in: endpoint =
{
> > -                                               remote-endpoint =3D <&u=
sb_1_ss0_qmpphy_out>;
> > +                                               remote-endpoint =3D <&r=
etimer_ss0_ss_out>;
> > +                                       };
> > +                               };
> > +
> > +                               port@2 {
> > +                                       reg =3D <2>;
> > +
> > +                                       pmic_glink_ss0_con_sbu_in: endp=
oint {
> > +                                               remote-endpoint =3D <&r=
etimer_ss0_con_sbu_out>;
> >                                         };
> >                                 };
> >                         };
> > @@ -101,7 +111,15 @@ port@1 {
> >                                         reg =3D <1>;
> >
> >                                         pmic_glink_ss1_ss_in: endpoint =
{
> > -                                               remote-endpoint =3D <&u=
sb_1_ss1_qmpphy_out>;
> > +                                               remote-endpoint =3D <&r=
etimer_ss1_ss_out>;
> > +                                       };
> > +                               };
> > +
> > +                               port@2 {
> > +                                       reg =3D <2>;
> > +
> > +                                       pmic_glink_ss1_con_sbu_in: endp=
oint {
> > +                                               remote-endpoint =3D <&r=
etimer_ss1_con_sbu_out>;
> >                                         };
> >                                 };
> >                         };
> > @@ -130,7 +148,15 @@ port@1 {
> >                                         reg =3D <1>;
> >
> >                                         pmic_glink_ss2_ss_in: endpoint =
{
> > -                                               remote-endpoint =3D <&u=
sb_1_ss2_qmpphy_out>;
> > +                                               remote-endpoint =3D <&r=
etimer_ss2_ss_out>;
> > +                                       };
> > +                               };
> > +
> > +                               port@2 {
> > +                                       reg =3D <2>;
> > +
> > +                                       pmic_glink_ss2_con_sbu_in: endp=
oint {
> > +                                               remote-endpoint =3D <&r=
etimer_ss2_con_sbu_out>;
> >                                         };
> >                                 };
> >                         };
> > @@ -226,6 +252,150 @@ vreg_nvme: regulator-nvme {
> >                 regulator-boot-on;
> >         };
> >
> > +       vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR0_1P15";
> > +               regulator-min-microvolt =3D <1150000>;
> > +               regulator-max-microvolt =3D <1150000>;
> > +
> > +               gpio =3D <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb0_pwr_1p15_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR0_1P8";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +
> > +               gpio =3D <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb0_1p8_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR0_3P3";
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +
> > +               gpio =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb0_3p3_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR1_1P15";
> > +               regulator-min-microvolt =3D <1150000>;
> > +               regulator-max-microvolt =3D <1150000>;
> > +
> > +               gpio =3D <&tlmm 188 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb1_pwr_1p15_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR1_1P8";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +
> > +               gpio =3D <&tlmm 175 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb1_pwr_1p8_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR1_3P3";
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +
> > +               gpio =3D <&tlmm 186 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb1_pwr_3p3_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR2_1P15";
> > +               regulator-min-microvolt =3D <1150000>;
> > +               regulator-max-microvolt =3D <1150000>;
> > +
> > +               gpio =3D <&tlmm 189 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb2_pwr_1p15_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR2_1P8";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +
> > +               gpio =3D <&tlmm 126 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb2_pwr_1p8_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> > +       vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> > +               compatible =3D "regulator-fixed";
> > +
> > +               regulator-name =3D "VREG_RTMR2_3P3";
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +
> > +               gpio =3D <&tlmm 187 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +
> > +               pinctrl-0 =3D <&usb2_pwr_3p3_reg_en>;
> > +               pinctrl-names =3D "default";
> > +
> > +               regulator-boot-on;
> > +       };
> > +
> >         vph_pwr: regulator-vph-pwr {
> >                 compatible =3D "regulator-fixed";
> >
> > @@ -567,6 +737,178 @@ keyboard@3a {
> >         };
> >  };
> >
> > +&i2c1 {
> > +       clock-frequency =3D <400000>;
> > +
> > +       status =3D "okay";
> > +
> > +       typec-mux@8 {
> > +               compatible =3D "parade,ps8830";
> > +               reg =3D <0x08>;
> > +
> > +               clocks =3D <&rpmhcc RPMH_RF_CLK5>;
> > +
> > +               vdd-supply =3D <&vreg_rtmr2_1p15>;
> > +               vdd33-supply =3D <&vreg_rtmr2_3p3>;
> > +               vdd33-cap-supply =3D <&vreg_rtmr2_3p3>;
> > +               vddar-supply =3D <&vreg_rtmr2_1p15>;
> > +               vddat-supply =3D <&vreg_rtmr2_1p15>;
> > +               vddio-supply =3D <&vreg_rtmr2_1p8>;
> > +
> > +               reset-gpios =3D <&tlmm 185 GPIO_ACTIVE_LOW>;
> > +
> > +               pinctrl-0 =3D <&rtmr2_default>;
> > +               pinctrl-names =3D "default";
> > +
> > +               orientation-switch;
> > +               retimer-switch;
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +                       port@0 {
> > +                               reg =3D <0>;
> > +
> > +                               retimer_ss2_ss_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss2_ss_in>;
> > +                               };
> > +                       };
> > +
> > +                       port@1 {
> > +                               reg =3D <1>;
> > +
> > +                               retimer_ss2_ss_in: endpoint {
> > +                                       remote-endpoint =3D <&usb_1_ss2=
_qmpphy_out>;
> > +                               };
> > +                       };
> > +
> > +                       port@2 {
> > +                               reg =3D <2>;
> > +
> > +                               retimer_ss2_con_sbu_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss2_con_sbu_in>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&i2c3 {
> > +       clock-frequency =3D <400000>;
> > +
> > +       status =3D "okay";
> > +
> > +       typec-mux@8 {
> > +               compatible =3D "parade,ps8830";
> > +               reg =3D <0x08>;
> > +
> > +               clocks =3D <&rpmhcc RPMH_RF_CLK3>;
> > +
> > +               vdd-supply =3D <&vreg_rtmr0_1p15>;
> > +               vdd33-supply =3D <&vreg_rtmr0_3p3>;
> > +               vdd33-cap-supply =3D <&vreg_rtmr0_3p3>;
> > +               vddar-supply =3D <&vreg_rtmr0_1p15>;
> > +               vddat-supply =3D <&vreg_rtmr0_1p15>;
> > +               vddio-supply =3D <&vreg_rtmr0_1p8>;
> > +
> > +               reset-gpios =3D <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
> > +
> > +               pinctrl-0 =3D <&rtmr0_default>;
> > +               pinctrl-names =3D "default";
> > +
> > +               retimer-switch;
> > +               orientation-switch;
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +                       port@0 {
> > +                               reg =3D <0>;
> > +
> > +                               retimer_ss0_ss_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss0_ss_in>;
> > +                               };
> > +                       };
> > +
> > +                       port@1 {
> > +                               reg =3D <1>;
> > +
> > +                               retimer_ss0_ss_in: endpoint {
> > +                                       remote-endpoint =3D <&usb_1_ss0=
_qmpphy_out>;
> > +                               };
> > +                       };
> > +
> > +                       port@2 {
> > +                               reg =3D <2>;
> > +
> > +                               retimer_ss0_con_sbu_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss0_con_sbu_in>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&i2c7 {
> > +       clock-frequency =3D <400000>;
> > +
> > +       status =3D "okay";
> > +
> > +       typec-mux@8 {
> > +               compatible =3D "parade,ps8830";
> > +               reg =3D <0x8>;
> > +
> > +               clocks =3D <&rpmhcc RPMH_RF_CLK4>;
> > +
> > +               vdd-supply =3D <&vreg_rtmr1_1p15>;
> > +               vdd33-supply =3D <&vreg_rtmr1_3p3>;
> > +               vdd33-cap-supply =3D <&vreg_rtmr1_3p3>;
> > +               vddar-supply =3D <&vreg_rtmr1_1p15>;
> > +               vddat-supply =3D <&vreg_rtmr1_1p15>;
> > +               vddio-supply =3D <&vreg_rtmr1_1p8>;
> > +
> > +               reset-gpios =3D <&tlmm 176 GPIO_ACTIVE_LOW>;
> > +
> > +               pinctrl-0 =3D <&rtmr1_default>;
> > +               pinctrl-names =3D "default";
> > +
> > +               retimer-switch;
> > +               orientation-switch;
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +                       port@0 {
> > +                               reg =3D <0>;
> > +
> > +                               retimer_ss1_ss_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss1_ss_in>;
> > +                               };
> > +                       };
> > +
> > +                       port@1 {
> > +                               reg =3D <1>;
> > +
> > +                               retimer_ss1_ss_in: endpoint {
> > +                                       remote-endpoint =3D <&usb_1_ss1=
_qmpphy_out>;
> > +                               };
> > +                       };
> > +
> > +                       port@2 {
> > +                               reg =3D <2>;
> > +
> > +                               retimer_ss1_con_sbu_out: endpoint {
> > +                                       remote-endpoint =3D <&pmic_glin=
k_ss1_con_sbu_in>;
> > +                               };
> > +                       };
> > +
> > +               };
> > +       };
> > +};
> > +
> >  &i2c8 {
> >         clock-frequency =3D <400000>;
> >
> > @@ -614,6 +956,33 @@ &mdss {
> >         status =3D "okay";
> >  };
> >
> > +&mdss_dp0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +       data-lanes =3D <0 1>;
> > +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 540000000=
0 8100000000>;
> > +};
> > +
> > +&mdss_dp1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&mdss_dp1_out {
> > +       data-lanes =3D <0 1>;
> > +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 540000000=
0 8100000000>;
> > +};
> > +
> > +&mdss_dp2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&mdss_dp2_out {
> > +       data-lanes =3D <0 1>;
> > +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 540000000=
0 8100000000>;
> > +};
> > +
> >  &mdss_dp3 {
> >         compatible =3D "qcom,x1e80100-dp";
> >         /delete-property/ #sound-dai-cells;
> > @@ -701,6 +1070,50 @@ &pcie6a_phy {
> >         status =3D "okay";
> >  };
> >
> > +&pm8550_gpios {
> > +       rtmr0_default: rtmr0-reset-n-active-state {
> > +               pins =3D "gpio10";
> > +               function =3D "normal";
> > +               power-source =3D <1>; /* 1.8V */
> > +               bias-disable;
> > +               input-disable;
> > +               output-enable;
> > +       };
> > +
> > +       usb0_3p3_reg_en: usb0-3p3-reg-en-state {
> > +               pins =3D "gpio11";
> > +               function =3D "normal";
> > +               power-source =3D <1>; /* 1.8V */
> > +               bias-disable;
> > +               input-disable;
> > +               output-enable;
> > +       };
> > +};
> > +
> > +&pm8550ve_8_gpios {
> > +       misc_3p3_reg_en: misc-3p3-reg-en-state {
> > +               pins =3D "gpio6";
> > +               function =3D "normal";
> > +               bias-disable;
> > +               input-disable;
> > +               output-enable;
> > +               drive-push-pull;
> > +               power-source =3D <1>; /* 1.8 V */
> > +               qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
> > +       };
> > +};
> > +
> > +&pm8550ve_9_gpios {
> > +       usb0_1p8_reg_en: usb0-1p8-reg-en-state {
> > +               pins =3D "gpio8";
> > +               function =3D "normal";
> > +               power-source =3D <1>; /* 1.8V */
> > +               bias-disable;
> > +               input-disable;
> > +               output-enable;
> > +       };
> > +};
> > +
> >  &pmc8380_3_gpios {
> >         edp_bl_en: edp-bl-en-state {
> >                 pins =3D "gpio4";
> > @@ -711,6 +1124,17 @@ edp_bl_en: edp-bl-en-state {
> >         };
> >  };
> >
> > +&pmc8380_5_gpios {
> > +       usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> > +               pins =3D "gpio8";
> > +               function =3D "normal";
> > +               power-source =3D <1>; /* 1.8V */
> > +               bias-disable;
> > +               input-disable;
> > +               output-enable;
> > +       };
> > +};
> > +
> >  &qupv3_0 {
> >         status =3D "okay";
> >  };
> > @@ -919,6 +1343,20 @@ wake-n-pins {
> >                 };
> >         };
> >
> > +       rtmr1_default: rtmr1-reset-n-active-state {
> > +               pins =3D "gpio176";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       rtmr2_default: rtmr2-reset-n-active-state {
> > +               pins =3D "gpio185";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> >         tpad_default: tpad-default-state {
> >                 pins =3D "gpio3";
> >                 function =3D "gpio";
> > @@ -940,6 +1378,47 @@ reset-n-pins {
> >                 };
> >         };
> >
> > +       usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
> > +               pins =3D "gpio188";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
> > +               pins =3D "gpio175";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
> > +               pins =3D "gpio186";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       usb2_pwr_1p15_reg_en: usb2-pwr-1p15-reg-en-state {
> > +               pins =3D "gpio189";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       usb2_pwr_1p8_reg_en: usb2-pwr-1p8-reg-en-state {
> > +               pins =3D "gpio126";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> > +
> > +       usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
> > +               pins =3D "gpio187";
> > +               function =3D "gpio";
> > +               drive-strength =3D <2>;
> > +               bias-disable;
> > +       };
> >  };
> >
> >  &uart21 {
> > @@ -976,7 +1455,7 @@ &usb_1_ss0_dwc3_hs {
> >  };
> >
> >  &usb_1_ss0_qmpphy_out {
> > -       remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> > +       remote-endpoint =3D <&retimer_ss0_ss_in>;
> >  };
> >
> >  &usb_1_ss1_hsphy {
> > @@ -1008,7 +1487,7 @@ &usb_1_ss1_dwc3_hs {
> >  };
> >
> >  &usb_1_ss1_qmpphy_out {
> > -       remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> > +       remote-endpoint =3D <&retimer_ss1_ss_in>;
> >  };
> >
> >  &usb_1_ss2_hsphy {
> > @@ -1040,5 +1519,5 @@ &usb_1_ss2_dwc3_hs {
> >  };
> >
> >  &usb_1_ss2_qmpphy_out {
> > -       remote-endpoint =3D <&pmic_glink_ss2_ss_in>;
> > +       remote-endpoint =3D <&retimer_ss2_ss_in>;
> >  };
> >
> > ---
> > base-commit: f660850bc246fef15ba78c81f686860324396628
> > change-id: 20250416-slim7x-retimer-70b1e67b1d42
> >
> > Best regards,
> > --
> > Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >
> >
> >

