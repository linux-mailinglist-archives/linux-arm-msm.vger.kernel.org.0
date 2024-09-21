Return-Path: <linux-arm-msm+bounces-32138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6F97DD7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 17:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC0F281E9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 15:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7007170A3E;
	Sat, 21 Sep 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb+7zMN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE341C60;
	Sat, 21 Sep 2024 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726931236; cv=none; b=uv+tezmIKCuSXC2vCDFhqROBHTfPh/nxOyl9bjF0m3QCmysWqboioaRdvTEqT88diFS4OPTi5U13f82tdP05BxezoGIZLGDAyLr2sGYocAoDuehCZHw6rFYjWV8hFeIC1WJ9qEM0QvVFMyI+hOPKraV7m9uc1eK5V/P2G2ldau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726931236; c=relaxed/simple;
	bh=b0V355g3vvypVolgzAAkL/PRIXRCQ4Inm/x0nIiHnCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4peRwLKverxpbQqdv1JLig5Vl3xHqesQk8O7XtxZv+83dMlHfQ2vJ7iz5xGHxJrkyTOVqoTvsElwj8JjI5+VjxYLtvQ/dhLT9Xf8/tGfmvW/YU8wPLQNo47+2qSGaJ9L97zIt8MayFVJglnOyMtIlhxPapZO0BAPl8GzHrv4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb+7zMN9; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-39f54ab8e69so13597455ab.1;
        Sat, 21 Sep 2024 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726931233; x=1727536033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxKEBvasTNgTb9x73XTZlwxqaxEb3pMKI5hxbwM6Q5g=;
        b=Sb+7zMN91QMd9ZCHWEYNUXYlae2afgckoVNsF4+4m8RqySA0JP8Dpnk3zgrA9I/RmL
         FXDxJ+RFaZGp8qFJaSt/J+PY3v1z+zXWTZPc4xliizD8rcUgRtS5UsJ0JAAv0taR1vYB
         tMRGnEwuJsYiH0zRaZ1gAJhzwHqlIbYPPOMjesO5kIqBvVRhU44zbjyRWkkgd+8CBtTe
         gEEKgoryXac17cpDefySZUQFD81kgytq1E034jByUwRrHcdXWx/NyS3JE3Y4vhoiwhUp
         ZBHEyEL+7PMcw7BbVfVYqjNFdAwv704ucdqVbVrOKRkfjduGfJnGMl45GZ1ae78oXrOs
         FzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726931233; x=1727536033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxKEBvasTNgTb9x73XTZlwxqaxEb3pMKI5hxbwM6Q5g=;
        b=rTx5Dfm3QmrA/F/C1WOS7J/NtfyXIUuBQmTOw7MER5Qn93BBCgKwLTyR222DgsEbqR
         rjyLUMjvMq9PxNuY/mPcnGAemR8tWPOCvm3rBE3cLQkvnfkLsLDPYHUZrqrvXpsQIr/n
         MGR3MOC9H3N8t7yZ+CCWYyzQaQXjTsNTs63jyA8e2wtIyvzq6l8mX5KJXQ7S9nC1DnyV
         RiBZ4KI/inhXxyTPHX8WY/Zi7NX0To5d9QC7BcY/1ODovvE499YR2/RtOlFX6b7SJQvm
         Naa4akKLIT4k5eJwnFbDV/ZmZdYW5WbRf401yfF7J2YPnIHrOFG4FocmGZTeCBihUhV3
         7fuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvFoo7YeYuoxwz/6XbNWo7O3Ojp5KFo0lZDAGSwrrS8CzxK2BPWm2Zt4J8d3yKaUpFK5CUQ0GG5Hox@vger.kernel.org, AJvYcCW3K9ETIl5auzVmby+ipmLxdNIRBfipdhFjgzzlCf71tyfMxFvM1XC2IBCe2tjFolDs3TpAoH3ielizbjvP@vger.kernel.org, AJvYcCXdZo0+0SuRqhE2PBIAn4REc8gr+qkbAyRxRgoWGgRcr7NBVHCJC4qyHQTXI+/+Dj0asUXCgcNkYEhEic2phw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmlR8G4wL35cETFEaRgTy05De9ikSMJB/3YJJ1DDNJ5DjtpRD3
	pzGcfjWIG8od4MnPzRcCZoSywpJpEwhrTNAzoirJGC6Q3P+b6l25EENAZkTr57oWjnRQdDgs7m/
	ubL4mcufvGL8AotGzgZ3NuARpwPQ=
X-Google-Smtp-Source: AGHT+IHWKhok3Zc/9nOsQ5JUcp1cccm3/UFLsl7fjYPMpFhBkEB8IZStW4DOfRCUT3M7FO/+ChThH97QdSUsjCdu1oQ=
X-Received: by 2002:a05:6e02:1e09:b0:3a0:9238:d3c with SMTP id
 e9e14a558f8ab-3a0c8982e7amr44854175ab.3.1726931233010; Sat, 21 Sep 2024
 08:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919170018.13672-1-alex.vinarskis@gmail.com>
 <20240919170018.13672-4-alex.vinarskis@gmail.com> <CAF6AEGsqWLvQy9FP48as4u_70xkXpd2G8tRm9H1Cc850fcMQGg@mail.gmail.com>
 <CAMcHhXqNKyDx7UbvzGOe-TjudfQubFCgTbYQvA4JoB300mt5Ew@mail.gmail.com>
In-Reply-To: <CAMcHhXqNKyDx7UbvzGOe-TjudfQubFCgTbYQvA4JoB300mt5Ew@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 21 Sep 2024 08:07:00 -0700
Message-ID: <CAF6AEGtrQzcMFsWCd-JzVFmF1sRk3vgy=L1q4Lzp+K1a4fuRnw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: alex vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@chromium.org>, Peter de Kraker <peterdekraker@umito.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 5:16=E2=80=AFAM alex vinarskis <alex.vinarskis@gmai=
l.com> wrote:
>
> On Sat, 21 Sept 2024 at 00:25, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Sep 19, 2024 at 10:01=E2=80=AFAM Aleksandrs Vinarskis
> > <alex.vinarskis@gmail.com> wrote:
> > >
> > > Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E8010=
0.
> > >
> > > Working:
> > > * Touchpad
> > > * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> > > * eDP, with brightness control
> > > * NVME
> > > * USB Type-C ports in USB2/USB3 (one orientation)
> > > * WiFi
> > > * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> > > * Lid switch
> > > * Sleep/suspend, nothing visibly broken on resume
> > >
> > > Not working:
> > > * Speakers (WIP, pin guessing, x4 WSA8845)
> > > * Microphones (WIP, pin guessing)
> > > * Fingerprint Reader (WIP, USB MP with ptn3222)
> > > * USB as DP/USB3 (WIP, PS8830 based)
> > > * Camera
> > > * Battery Info
> > >
> > > Should be working, but cannot be tested due to lack of hw:
> > > * Higher res OLED, higher res IPS panels
> >
> > My suspicion is that OLED vs IPS will require different dtb.  I'm
> > expecting the OLED to use samsung,atna33xc20 panel driver (see "arm64:
> > dts: qcom: x1e80100-yoga: Update panel bindings"), but IPS can
> > probably use edp-panel.  I'm not sure if anyone has gotten both panels
> > working on any other device that has both IPS and OLED variants, so
> > this remains a theory.  The t14s, which also has both IPS and OLED,
> > has different DMI/CHID values for the different SKUs, so DtbLoader
> > should be able to pick the correct dtb, once it exists.
>
> Thanks for the input.
>
> Will take a look at that driver. I have briefly looked into .inf from
> Dell's Windows driver trying to identify them - all three panels have
> dell-specific model naming, which unfortunately does not help much. As
> far as I found from unofficial sources (1), the particular OLED is LG
> made, not Samsung.

Ok, if it is not a samsung panel, then maybe panel-edp will work.  So
far all the OLEDs I've seen are samsung, and they have a different
power sequence (hence needing different panel driver)

> Luckily, Peter de Kraker (CCed) has reached out to me yesterday as he
> got an OLED variant - will test on his machine in the following weeks,
> as well as record CHIDs once he is able to boot with a working
> display. Sounds rather unscalable though if each variant of laptop
> would need a separate dtb? Eg. Dell's Inspiron model supports both
> x1e80 and x1e78 (luckily no OLEDs though). If some OEM would release a
> model with both displays and SoCs customizable, the number of variants
> would grow pretty fast...

So far, it is just the samsung panel vs everyone else, where we would
need different dtb.  Maybe we come up with other variants, we'll see
as time goes on, but it shouldn't need to be for _every_ variant.

For the panel, edid-decode will tell us the panel name/vendor, ie.
something like:

cat /sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-c=
ontroller/drm/card0/card0-eDP-1/edid
| edid-decode

BR,
-R

> [1] https://www.thelec.net/news/articleView.html?idxno=3D4858
>
> Alex
>
> >
> > BR,
> > -R
> >
> > > * Touchscreen
> > >
> > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >  .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++=
++
> > >  2 files changed, 861 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13=
.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/=
qcom/Makefile
> > > index ae002c7cf126..111c589d6bae 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D sm8650-qrd.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e78100-lenovo-thinkpad-t14s.dt=
b
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-asus-vivobook-s15.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-crd.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-dell-tributo-13.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-lenovo-yoga-slim7x.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-microsoft-romulus13.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-microsoft-romulus15.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/=
arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > > new file mode 100644
> > > index 000000000000..d387f133c398
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > > @@ -0,0 +1,860 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights re=
served.
> > > + * Copyright (c) 2024 Aleksandrs Vinarskis <alex.vinarskis@gmail.com=
>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/gpio-keys.h>
> > > +#include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > +
> > > +#include "x1e80100.dtsi"
> > > +#include "x1e80100-pmics.dtsi"
> > > +
> > > +/ {
> > > +       model =3D "Dell XPS 13 9345";
> > > +       compatible =3D "dell,tributo-13", "qcom,x1e80100";
> > > +       chassis-type =3D "laptop";
> > > +
> > > +       gpio-keys {
> > > +               compatible =3D "gpio-keys";
> > > +
> > > +               pinctrl-0 =3D <&hall_int_n_default>;
> > > +               pinctrl-names =3D "default";
> > > +
> > > +               switch-lid {
> > > +                       gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > +                       linux,input-type =3D <EV_SW>;
> > > +                       linux,code =3D <SW_LID>;
> > > +                       wakeup-source;
> > > +                       wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> > > +               };
> > > +       };
> > > +
> > > +       leds {
> > > +               compatible =3D "gpio-leds";
> > > +
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&cam_indicator_en>;
> > > +
> > > +               led-camera-indicator {
> > > +                       label =3D "white:camera-indicator";
> > > +                       function =3D LED_FUNCTION_INDICATOR;
> > > +                       color =3D <LED_COLOR_ID_WHITE>;
> > > +                       gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > > +                       linux,default-trigger =3D "none";
> > > +                       default-state =3D "off";
> > > +                       /* Reuse as a panic indicator until we get a =
"camera on" trigger */
> > > +                       panic-indicator;
> > > +               };
> > > +       };
> > > +
> > > +       pmic-glink {
> > > +               compatible =3D "qcom,x1e80100-pmic-glink",
> > > +                                        "qcom,sm8550-pmic-glink",
> > > +                                        "qcom,pmic-glink";
> > > +               orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > +                                                       <&tlmm 123 GP=
IO_ACTIVE_HIGH>;
> > > +               #address-cells =3D <1>;
> > > +               #size-cells =3D <0>;
> > > +
> > > +               /* Right-side USB Type-C port */
> > > +               connector@0 {
> > > +                       compatible =3D "usb-c-connector";
> > > +                       reg =3D <0>;
> > > +                       power-role =3D "dual";
> > > +                       data-role =3D "dual";
> > > +
> > > +                       ports {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +
> > > +                               port@0 {
> > > +                                       reg =3D <0>;
> > > +
> > > +                                       pmic_glink_ss0_hs_in: endpoin=
t {
> > > +                                               remote-endpoint =3D <=
&usb_1_ss0_dwc3_hs>;
> > > +                                       };
> > > +                               };
> > > +
> > > +                               port@1 {
> > > +                                       reg =3D <1>;
> > > +
> > > +                                       pmic_glink_ss0_ss_in: endpoin=
t {
> > > +                                               remote-endpoint =3D <=
&usb_1_ss0_qmpphy_out>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +               };
> > > +
> > > +               /* Left-side USB Type-C port */
> > > +               connector@1 {
> > > +                       compatible =3D "usb-c-connector";
> > > +                       reg =3D <1>;
> > > +                       power-role =3D "dual";
> > > +                       data-role =3D "dual";
> > > +
> > > +                       ports {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +
> > > +                               port@0 {
> > > +                                       reg =3D <0>;
> > > +
> > > +                                       pmic_glink_ss1_hs_in: endpoin=
t {
> > > +                                               remote-endpoint =3D <=
&usb_1_ss1_dwc3_hs>;
> > > +                                       };
> > > +                               };
> > > +
> > > +                               port@1 {
> > > +                                       reg =3D <1>;
> > > +
> > > +                                       pmic_glink_ss1_ss_in: endpoin=
t {
> > > +                                               remote-endpoint =3D <=
&usb_1_ss1_qmpphy_out>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +
> > > +       reserved-memory {
> > > +               linux,cma {
> > > +                       compatible =3D "shared-dma-pool";
> > > +                       size =3D <0x0 0x8000000>;
> > > +                       reusable;
> > > +                       linux,cma-default;
> > > +               };
> > > +       };
> > > +
> > > +       vph_pwr: vph-pwr-regulator {
> > > +               compatible =3D "regulator-fixed";
> > > +
> > > +               regulator-name =3D "vph_pwr";
> > > +               regulator-min-microvolt =3D <3700000>;
> > > +               regulator-max-microvolt =3D <3700000>;
> > > +
> > > +               regulator-always-on;
> > > +               regulator-boot-on;
> > > +       };
> > > +
> > > +       vreg_edp_3p3: regulator-edp-3p3 {
> > > +               compatible =3D "regulator-fixed";
> > > +
> > > +               regulator-name =3D "VREG_EDP_3P3";
> > > +               regulator-min-microvolt =3D <3300000>;
> > > +               regulator-max-microvolt =3D <3300000>;
> > > +
> > > +               gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > +               enable-active-high;
> > > +
> > > +               pinctrl-0 =3D <&edp_reg_en>;
> > > +               pinctrl-names =3D "default";
> > > +
> > > +               regulator-boot-on;
> > > +       };
> > > +
> > > +       vreg_nvme: regulator-nvme {
> > > +               compatible =3D "regulator-fixed";
> > > +
> > > +               regulator-name =3D "VREG_NVME_3P3";
> > > +               regulator-min-microvolt =3D <3300000>;
> > > +               regulator-max-microvolt =3D <3300000>;
> > > +
> > > +               gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> > > +               enable-active-high;
> > > +
> > > +               pinctrl-0 =3D <&nvme_reg_en>;
> > > +               pinctrl-names =3D "default";
> > > +       };
> > > +};
> > > +
> > > +&apps_rsc {
> > > +       regulators-0 {
> > > +               compatible =3D "qcom,pm8550-rpmh-regulators";
> > > +               qcom,pmic-id =3D "b";
> > > +               vdd-bob1-supply =3D <&vph_pwr>;
> > > +               vdd-bob2-supply =3D <&vph_pwr>;
> > > +               vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
> > > +               vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
> > > +               vdd-l5-l16-supply =3D <&vreg_bob1>;
> > > +               vdd-l6-l7-supply =3D <&vreg_bob2>;
> > > +               vdd-l8-l9-supply =3D <&vreg_bob1>;
> > > +               vdd-l12-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l15-supply =3D <&vreg_s4c_1p8>;
> > > +               vdd-l17-supply =3D <&vreg_bob2>;
> > > +
> > > +               vreg_bob1: bob1 {
> > > +                       regulator-name =3D "vreg_bob1";
> > > +                       regulator-min-microvolt =3D <3008000>;
> > > +                       regulator-max-microvolt =3D <3960000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_bob2: bob2 {
> > > +                       regulator-name =3D "vreg_bob2";
> > > +                       regulator-min-microvolt =3D <2504000>;
> > > +                       regulator-max-microvolt =3D <3008000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l2b_3p0: ldo2 {
> > > +                       regulator-name =3D "vreg_l2b_3p0";
> > > +                       regulator-min-microvolt =3D <3072000>;
> > > +                       regulator-max-microvolt =3D <3072000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l4b_1p8: ldo4 {
> > > +                       regulator-name =3D "vreg_l4b_1p8";
> > > +                       regulator-min-microvolt =3D <1800000>;
> > > +                       regulator-max-microvolt =3D <1800000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l6b_1p8: ldo6 {
> > > +                       regulator-name =3D "vreg_l6b_1p8";
> > > +                       regulator-min-microvolt =3D <1800000>;
> > > +                       regulator-max-microvolt =3D <2960000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l8b_3p0: ldo8 {
> > > +                       regulator-name =3D "vreg_l8b_3p0";
> > > +                       regulator-min-microvolt =3D <3072000>;
> > > +                       regulator-max-microvolt =3D <3072000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l9b_2p9: ldo9 {
> > > +                       regulator-name =3D "vreg_l9b_2p9";
> > > +                       regulator-min-microvolt =3D <2960000>;
> > > +                       regulator-max-microvolt =3D <2960000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l12b_1p2: ldo12 {
> > > +                       regulator-name =3D "vreg_l12b_1p2";
> > > +                       regulator-min-microvolt =3D <1200000>;
> > > +                       regulator-max-microvolt =3D <1200000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l13b_3p0: ldo13 {
> > > +                       regulator-name =3D "vreg_l13b_3p0";
> > > +                       regulator-min-microvolt =3D <3072000>;
> > > +                       regulator-max-microvolt =3D <3072000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l14b_3p0: ldo14 {
> > > +                       regulator-name =3D "vreg_l14b_3p0";
> > > +                       regulator-min-microvolt =3D <3072000>;
> > > +                       regulator-max-microvolt =3D <3072000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l15b_1p8: ldo15 {
> > > +                       regulator-name =3D "vreg_l15b_1p8";
> > > +                       regulator-min-microvolt =3D <1800000>;
> > > +                       regulator-max-microvolt =3D <1800000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l17b_2p5: ldo17 {
> > > +                       regulator-name =3D "vreg_l17b_2p5";
> > > +                       regulator-min-microvolt =3D <2504000>;
> > > +                       regulator-max-microvolt =3D <2504000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-1 {
> > > +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +               qcom,pmic-id =3D "c";
> > > +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +
> > > +               vreg_s4c_1p8: smps4 {
> > > +                       regulator-name =3D "vreg_s4c_1p8";
> > > +                       regulator-min-microvolt =3D <1856000>;
> > > +                       regulator-max-microvolt =3D <2000000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l1c_1p2: ldo1 {
> > > +                       regulator-name =3D "vreg_l1c_1p2";
> > > +                       regulator-min-microvolt =3D <1200000>;
> > > +                       regulator-max-microvolt =3D <1200000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l2c_0p8: ldo2 {
> > > +                       regulator-name =3D "vreg_l2c_0p8";
> > > +                       regulator-min-microvolt =3D <880000>;
> > > +                       regulator-max-microvolt =3D <880000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l3c_0p9: ldo3 {
> > > +                       regulator-name =3D "vreg_l3c_0p9";
> > > +                       regulator-min-microvolt =3D <920000>;
> > > +                       regulator-max-microvolt =3D <920000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-2 {
> > > +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +               qcom,pmic-id =3D "d";
> > > +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-l3-supply =3D <&vreg_s4c_1p8>;
> > > +               vdd-s1-supply =3D <&vph_pwr>;
> > > +
> > > +               vreg_l1d_0p8: ldo1 {
> > > +                       regulator-name =3D "vreg_l1d_0p8";
> > > +                       regulator-min-microvolt =3D <880000>;
> > > +                       regulator-max-microvolt =3D <880000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l2d_0p9: ldo2 {
> > > +                       regulator-name =3D "vreg_l2d_0p9";
> > > +                       regulator-min-microvolt =3D <912000>;
> > > +                       regulator-max-microvolt =3D <912000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l3d_1p8: ldo3 {
> > > +                       regulator-name =3D "vreg_l3d_1p8";
> > > +                       regulator-min-microvolt =3D <1800000>;
> > > +                       regulator-max-microvolt =3D <1800000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-3 {
> > > +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +               qcom,pmic-id =3D "e";
> > > +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> > > +
> > > +               vreg_l2e_0p8: ldo2 {
> > > +                       regulator-name =3D "vreg_l2e_0p8";
> > > +                       regulator-min-microvolt =3D <880000>;
> > > +                       regulator-max-microvolt =3D <880000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l3e_1p2: ldo3 {
> > > +                       regulator-name =3D "vreg_l3e_1p2";
> > > +                       regulator-min-microvolt =3D <1200000>;
> > > +                       regulator-max-microvolt =3D <1200000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-4 {
> > > +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +               qcom,pmic-id =3D "f";
> > > +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-s1-supply =3D <&vph_pwr>;
> > > +
> > > +               vreg_s1f_0p7: smps1 {
> > > +                       regulator-name =3D "vreg_s1f_0p7";
> > > +                       regulator-min-microvolt =3D <700000>;
> > > +                       regulator-max-microvolt =3D <1100000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-6 {
> > > +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +               qcom,pmic-id =3D "i";
> > > +               vdd-l1-supply =3D <&vreg_s4c_1p8>;
> > > +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-s1-supply =3D <&vph_pwr>;
> > > +               vdd-s2-supply =3D <&vph_pwr>;
> > > +
> > > +               vreg_s1i_0p9: smps1 {
> > > +                       regulator-name =3D "vreg_s1i_0p9";
> > > +                       regulator-min-microvolt =3D <900000>;
> > > +                       regulator-max-microvolt =3D <920000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_s2i_1p0: smps2 {
> > > +                       regulator-name =3D "vreg_s2i_1p0";
> > > +                       regulator-min-microvolt =3D <1000000>;
> > > +                       regulator-max-microvolt =3D <1100000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l1i_1p8: ldo1 {
> > > +                       regulator-name =3D "vreg_l1i_1p8";
> > > +                       regulator-min-microvolt =3D <1800000>;
> > > +                       regulator-max-microvolt =3D <1800000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l2i_1p2: ldo2 {
> > > +                       regulator-name =3D "vreg_l2i_1p2";
> > > +                       regulator-min-microvolt =3D <1200000>;
> > > +                       regulator-max-microvolt =3D <1200000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l3i_0p8: ldo3 {
> > > +                       regulator-name =3D "vreg_l3i_0p8";
> > > +                       regulator-min-microvolt =3D <880000>;
> > > +                       regulator-max-microvolt =3D <880000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +
> > > +       regulators-7 {
> > > +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +               qcom,pmic-id =3D "j";
> > > +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +               vdd-s5-supply =3D <&vph_pwr>;
> > > +
> > > +               vreg_s5j_1p2: smps5 {
> > > +                       regulator-name =3D "vreg_s5j_1p2";
> > > +                       regulator-min-microvolt =3D <1256000>;
> > > +                       regulator-max-microvolt =3D <1304000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l1j_0p9: ldo1 {
> > > +                       regulator-name =3D "vreg_l1j_0p9";
> > > +                       regulator-min-microvolt =3D <912000>;
> > > +                       regulator-max-microvolt =3D <912000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l2j_1p2: ldo2 {
> > > +                       regulator-name =3D "vreg_l2j_1p2";
> > > +                       regulator-min-microvolt =3D <1256000>;
> > > +                       regulator-max-microvolt =3D <1256000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +
> > > +               vreg_l3j_0p8: ldo3 {
> > > +                       regulator-name =3D "vreg_l3j_0p8";
> > > +                       regulator-min-microvolt =3D <880000>;
> > > +                       regulator-max-microvolt =3D <880000>;
> > > +                       regulator-initial-mode =3D <RPMH_REGULATOR_MO=
DE_HPM>;
> > > +               };
> > > +       };
> > > +};
> > > +
> > > +&pcie4 {
> > > +       perst-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
> > > +       wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
> > > +
> > > +       pinctrl-0 =3D <&pcie4_default>;
> > > +       pinctrl-names =3D "default";
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&pcie4_phy {
> > > +       vdda-phy-supply =3D <&vreg_l3i_0p8>;
> > > +       vdda-pll-supply =3D <&vreg_l3e_1p2>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&pcie6a {
> > > +       perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
> > > +       wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
> > > +
> > > +       vddpe-3v3-supply =3D <&vreg_nvme>;
> > > +
> > > +       pinctrl-0 =3D <&pcie6a_default>;
> > > +       pinctrl-names =3D "default";
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&pcie6a_phy {
> > > +       vdda-phy-supply =3D <&vreg_l1d_0p8>;
> > > +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_0 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_1 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_2 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&remoteproc_adsp {
> > > +       firmware-name =3D "qcom/x1e80100/dell/tributo/qcadsp8380.mbn"=
,
> > > +                                       "qcom/x1e80100/dell/tributo/a=
dsp_dtbs.elf";
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&remoteproc_cdsp {
> > > +       firmware-name =3D "qcom/x1e80100/dell/tributo/qccdsp8380.mbn"=
,
> > > +                                       "qcom/x1e80100/dell/tributo/c=
dsp_dtbs.elf";
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&gpu {
> > > +       status =3D "okay";
> > > +
> > > +       zap-shader {
> > > +               firmware-name =3D "qcom/x1e80100/dell/tributo/qcdxkms=
uc8380.mbn";
> > > +       };
> > > +};
> > > +
> > > +&mdss {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&mdss_dp3 {
> > > +       compatible =3D "qcom,x1e80100-dp";
> > > +       /delete-property/ #sound-dai-cells;
> > > +
> > > +       status =3D "okay";
> > > +
> > > +       aux-bus {
> > > +               panel {
> > > +                       /* 1920x1200 IPS panel is SHP1593, PNP09FF co=
mpatible */
> > > +                       compatible =3D "edp-panel";
> > > +                       power-supply =3D <&vreg_edp_3p3>;
> > > +
> > > +                       port {
> > > +                               edp_panel_in: endpoint {
> > > +                                       remote-endpoint =3D <&mdss_dp=
3_out>;
> > > +                               };
> > > +                       };
> > > +               };
> > > +       };
> > > +
> > > +       ports {
> > > +               port@1 {
> > > +                       reg =3D <1>;
> > > +
> > > +                       mdss_dp3_out: endpoint {
> > > +                               data-lanes =3D <0 1 2 3>;
> > > +                               link-frequencies =3D /bits/ 64 <16200=
00000 2700000000 5400000000 8100000000>;
> > > +
> > > +                               remote-endpoint =3D <&edp_panel_in>;
> > > +                       };
> > > +               };
> > > +       };
> > > +};
> > > +
> > > +&mdss_dp3_phy {
> > > +       vdda-phy-supply =3D <&vreg_l3j_0p8>;
> > > +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&i2c0 {
> > > +       clock-frequency =3D <400000>;
> > > +       status =3D "okay";
> > > +
> > > +       keyboard@5 {
> > > +               compatible =3D "hid-over-i2c";
> > > +               reg =3D <0x5>;
> > > +
> > > +               hid-descr-addr =3D <0x20>;
> > > +               interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>=
;
> > > +
> > > +               pinctrl-0 =3D <&kybd_default>;
> > > +               pinctrl-names =3D "default";
> > > +
> > > +               wakeup-source;
> > > +       };
> > > +};
> > > +
> > > +&i2c3 {
> > > +       clock-frequency =3D <400000>;
> > > +       status =3D "disabled";
> > > +       /* PS8830 Retimer @0x8 */
> > > +       /* Unknown device @0x9 */
> > > +};
> > > +
> > > +&i2c5 {
> > > +       clock-frequency =3D <100000>;
> > > +       status =3D "disabled";
> > > +       /* Unknown device @0x3b */
> > > +};
> > > +
> > > +&i2c7 {
> > > +       clock-frequency =3D <400000>;
> > > +       status =3D "disabled";
> > > +       /* PS8830 Retimer @0x8 */
> > > +       /* Unknown device @0x9 */
> > > +};
> > > +
> > > +&i2c8 {
> > > +       clock-frequency =3D <400000>;
> > > +
> > > +       status =3D "okay";
> > > +
> > > +       touchscreen@0 {
> > > +               compatible =3D "hid-over-i2c";
> > > +               reg =3D <0x0>;
> > > +
> > > +               hid-descr-addr =3D <0x1>;
> > > +               interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>=
;
> > > +
> > > +               pinctrl-0 =3D <&ts0_default>;
> > > +               pinctrl-names =3D "default";
> > > +       };
> > > +};
> > > +
> > > +&i2c9 {
> > > +       clock-frequency =3D <400000>;
> > > +       status =3D "disabled";
> > > +       /* USB3 retimer device @0x4f */
> > > +};
> > > +
> > > +&i2c17 {
> > > +       clock-frequency =3D <400000>;
> > > +       status =3D "okay";
> > > +
> > > +       touchpad@2c {
> > > +               compatible =3D "hid-over-i2c";
> > > +               reg =3D <0x2c>;
> > > +
> > > +               hid-descr-addr =3D <0x20>;
> > > +               interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +               pinctrl-0 =3D <&tpad_default>;
> > > +               pinctrl-names =3D "default";
> > > +
> > > +               wakeup-source;
> > > +       };
> > > +};
> > > +
> > > +&smb2360_0_eusb2_repeater {
> > > +       vdd18-supply =3D <&vreg_l3d_1p8>;
> > > +       vdd3-supply =3D <&vreg_l2b_3p0>;
> > > +};
> > > +
> > > +&smb2360_1_eusb2_repeater {
> > > +       vdd18-supply =3D <&vreg_l3d_1p8>;
> > > +       vdd3-supply =3D <&vreg_l14b_3p0>;
> > > +};
> > > +
> > > +&tlmm {
> > > +       gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
> > > +                                                       <76 4>,  /* S=
PI19 (TZ Protected) */
> > > +                                                       <238 1>; /* U=
FS Reset */
> > > +
> > > +       edp_reg_en: edp-reg-en-state {
> > > +               pins =3D "gpio70";
> > > +               function =3D "gpio";
> > > +               drive-strength =3D <16>;
> > > +               bias-disable;
> > > +       };
> > > +
> > > +       kybd_default: kybd-default-state {
> > > +               pins =3D "gpio67";
> > > +               function =3D "gpio";
> > > +               bias-pull-up;
> > > +       };
> > > +
> > > +       nvme_reg_en: nvme-reg-en-state {
> > > +               pins =3D "gpio18";
> > > +               function =3D "gpio";
> > > +               drive-strength =3D <2>;
> > > +               bias-disable;
> > > +       };
> > > +
> > > +       tpad_default: tpad-default-state {
> > > +               disable-pins {
> > > +                       pins =3D "gpio38";
> > > +                       function =3D "gpio";
> > > +                       output-high;
> > > +               };
> > > +
> > > +               int-n-pins {
> > > +                       pins =3D "gpio3";
> > > +                       function =3D "gpio";
> > > +                       bias-pull-up;
> > > +               };
> > > +
> > > +               reset-n-pins {
> > > +                       pins =3D "gpio52";
> > > +                       function =3D "gpio";
> > > +                       bias-disable;
> > > +               };
> > > +       };
> > > +
> > > +       ts0_default: ts0-default-state {
> > > +               disable-pins {
> > > +                       pins =3D "gpio75";
> > > +                       function =3D "gpio";
> > > +                       output-high;
> > > +               };
> > > +
> > > +               int-n-pins {
> > > +                       pins =3D "gpio51";
> > > +                       function =3D "gpio";
> > > +                       bias-pull-up;
> > > +               };
> > > +
> > > +               reset-n-pins {
> > > +                       /* Technically should be High-Z input */
> > > +                       pins =3D "gpio48";
> > > +                       function =3D "gpio";
> > > +                       output-low;
> > > +                       drive-strength =3D <2>;
> > > +               };
> > > +       };
> > > +
> > > +       hall_int_n_default: hall-int-n-state {
> > > +               pins =3D "gpio92";
> > > +               function =3D "gpio";
> > > +
> > > +               bias-disable;
> > > +       };
> > > +
> > > +       pcie4_default: pcie4-default-state {
> > > +               clkreq-n-pins {
> > > +                       pins =3D "gpio147";
> > > +                       function =3D "pcie4_clk";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-pull-up;
> > > +               };
> > > +
> > > +               perst-n-pins {
> > > +                       pins =3D "gpio146";
> > > +                       function =3D "gpio";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-disable;
> > > +               };
> > > +
> > > +               wake-n-pins {
> > > +                       pins =3D "gpio148";
> > > +                       function =3D "gpio";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-pull-up;
> > > +               };
> > > +       };
> > > +
> > > +       pcie6a_default: pcie6a-default-state {
> > > +               clkreq-n-pins {
> > > +                       pins =3D "gpio153";
> > > +                       function =3D "pcie6a_clk";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-pull-up;
> > > +               };
> > > +
> > > +               perst-n-pins {
> > > +                       pins =3D "gpio152";
> > > +                       function =3D "gpio";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-disable;
> > > +               };
> > > +
> > > +               wake-n-pins {
> > > +                       pins =3D "gpio154";
> > > +                       function =3D "gpio";
> > > +                       drive-strength =3D <2>;
> > > +                       bias-pull-up;
> > > +               };
> > > +       };
> > > +
> > > +       cam_indicator_en: cam-indicator-en-state {
> > > +               pins =3D "gpio110";
> > > +               function =3D "gpio";
> > > +               drive-strength =3D <2>;
> > > +               bias-disable;
> > > +       };
> > > +};
> > > +
> > > +&uart21 {
> > > +       compatible =3D "qcom,geni-debug-uart";
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_hsphy {
> > > +       vdd-supply =3D <&vreg_l3j_0p8>;
> > > +       vdda12-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +       phys =3D <&smb2360_0_eusb2_repeater>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_qmpphy {
> > > +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> > > +       vdda-pll-supply =3D <&vreg_l1j_0p9>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_dwc3 {
> > > +       dr_mode =3D "host";
> > > +};
> > > +
> > > +&usb_1_ss0_dwc3_hs {
> > > +       remote-endpoint =3D <&pmic_glink_ss0_hs_in>;
> > > +};
> > > +
> > > +&usb_1_ss0_qmpphy_out {
> > > +       remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> > > +};
> > > +
> > > +&usb_1_ss1_hsphy {
> > > +       vdd-supply =3D <&vreg_l3j_0p8>;
> > > +       vdda12-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +       phys =3D <&smb2360_1_eusb2_repeater>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1_qmpphy {
> > > +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> > > +       vdda-pll-supply =3D <&vreg_l2d_0p9>;
> > > +
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1_dwc3 {
> > > +       dr_mode =3D "host";
> > > +};
> > > +
> > > +&usb_1_ss1_dwc3_hs {
> > > +       remote-endpoint =3D <&pmic_glink_ss1_hs_in>;
> > > +};
> > > +
> > > +&usb_1_ss1_qmpphy_out {
> > > +       remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> > > +};
> > > --
> > > 2.43.0
> > >
> > >

