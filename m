Return-Path: <linux-arm-msm+bounces-32897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51198C318
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 18:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90F71C2408C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6689E1CC8A4;
	Tue,  1 Oct 2024 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juGhOWK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1A1CB50B;
	Tue,  1 Oct 2024 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798986; cv=none; b=bGShrwuPWPIGRnk7GC1zymDqMgyubmORAk6vvzhwDl9gAwo7/veBW8jYtgAXtOxltMeW8nES8uUCG9Ar3RqbJ/jlxjoB0OVafqyLkX11Gh5QP4DwWUjaiHxpQac8qsfH6rDiWlS9NpALaEQ5jDdU+fHNz0yw0q6YUCJknfi8jMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798986; c=relaxed/simple;
	bh=/xhvVi3O2tv73wsUJpvuw3HB+1g3wSwu0W3VTWqI57I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQwmbAmkgo0FU/wwS+NxAbAZ7fX+YtLmnoXvdY4Ls1S+uphl5zqXknXimFVDnhMim6maOc4z9R+6Znrct7NSvkkkTDTKpsxVcf/zw1uLNg4AhJHXSiwfWLu9JBV17lDrwPIHdO8Xh9/WiwRtBDTn30DbuSzm54gzv9FB5t069A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juGhOWK5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb2191107so47053195e9.1;
        Tue, 01 Oct 2024 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727798982; x=1728403782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC/1q5xdZ0b/1oijr0jgFmhyROwDx/Sm7FY9KvMaMXE=;
        b=juGhOWK5+8IATwc0cHXlYt3U4Lb08tsqohgVhh7Q2+/Z14MOeNVFVmPEhx22+D71cP
         cSKqqOzAURiFSJv+ibTTukw2IdTOTgwxWGlD5j/DO+u6aRD7nqLg+g2YaP7mgfMlTFEN
         NOBlOs2Enuy86lPnQqycCqVJbM5wA6jXidLh9lHeVB+EZy/AoV6DXkwFROhndoDN1L3H
         CMPfOWJ9TiHPQUYNF8CWpTYq3JpeAOi/6vQgafYDaaubaA9opjFilfBBSQ9ZUTAdTfzp
         /eFPmangieXZMnLJyLucwGd6HFTjXqLDwoqf8LwLtxQMV06/WXkUSlyzN4cu5WCk9Kha
         5QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798982; x=1728403782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jC/1q5xdZ0b/1oijr0jgFmhyROwDx/Sm7FY9KvMaMXE=;
        b=AeexSDD/aH5AfqUB3q/KRH8yOzJ8CIHVElZUgQDhNVSA/Q/p3XIJLxPEQQcNqoN+dS
         /6b60mW+40kGr/Kx8q6DVyLwokAqfUoFlbCs06GktOvnZbon2EcRSr/zPVJjl9Z22SCI
         Ik+1onOFr/nJ7hhC9bEa193T07MDpdwka+XCd0UmKFYBB5qCsQsT5AosDclbs5USP/Ik
         hsUKu6E5VGsp2r1AxoVo1C+VpAW7+ia0DpNW77RytOUk/E8HVzDlrB9mU7i48jutSLLt
         UdRinJL1wIRiL2ZedD/6O0GhZc9qy7ws/VGafwCVS/AALi4wBJdMhVsBk5NR8GEbMUDE
         eEYg==
X-Forwarded-Encrypted: i=1; AJvYcCVIQZngm/QxkV3oBXpejaX0VWq+0F3qcKSWyh3TZICBriu1b+88Woyi1rv2MOnLlriSQWwddOmcfsiKWhGdsA==@vger.kernel.org, AJvYcCW5TuHUbYajJfbjwsH+STRYUt4M6jeTKvGEStfITMxIzv03oJHW+D0W4pCBEvM5p/dx1oNcmNUKlACHHgOF@vger.kernel.org, AJvYcCWT/pftV6Xrgzsm23d53ioGvirR19qLiVsbtwNMAYaAAwZAVCDE7uYRLHhdJl4wqWXW5lbWtKDM/m8b@vger.kernel.org
X-Gm-Message-State: AOJu0YxswJAs9AQTxVJD4h96FFCnZsjildh556d2Vl8On1sh7IQHkPpE
	tvymiE4KhqS1N9z/zODNEy25vdkeydtgr2iVBbk+/iC8WB14LPd2L0mcpuGxnZdswvaJPG+NR6o
	8EvjYtQnFfcihHJ0T6Wef0dMT4w==
X-Google-Smtp-Source: AGHT+IGOYyiecvHMCr2Gp1ex/be2gx76wLItJxt+Ekk7pIqTr6fCxHUqYhsvfGB8Z+MeqTWR5gWrZxagp9+Gv9/wNJc=
X-Received: by 2002:a05:600c:1c98:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42f777b72cbmr189765e9.13.1727798981159; Tue, 01 Oct 2024
 09:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com> <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
 <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com> <PH8PR19MB7071756BFAFA1BA3E92AF3C09E772@PH8PR19MB7071.namprd19.prod.outlook.com>
In-Reply-To: <PH8PR19MB7071756BFAFA1BA3E92AF3C09E772@PH8PR19MB7071.namprd19.prod.outlook.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 1 Oct 2024 18:09:42 +0200
Message-ID: <CAMcHhXo7PNxoOs3BEhbS7v-hDqEZQSyQJnzHbpTMoRbeaunp3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: "Kemp, Bryan" <Bryan.Kemp@dell.com>
Cc: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Peter de Kraker <peterdekraker@umito.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Oct 2024 at 02:47, Kemp, Bryan <Bryan.Kemp@dell.com> wrote:
>
> Fascinating topic. First of all, thank you Alex for the explanation of yo=
ur logic, and thank you as well for the work on the device tree for the XPS=
 13. I understand completely how the Dell naming/numbering scheme is confus=
ing. The shortened version down to just the model number could also be conf=
using. For example, there is an XPS 9520 as well as a Latitude 9520. The 9 =
basically translates to "premium" not a specific line of business. For what=
 it is worth, I would prefer the dell-xps13-9345 naming and I think we can =
have to be mindful to avoid a naming collision in a decade.
>

Hi,

Thanks for the input, it's really nice to have Dell's perspective as well.
That's a good point with latitude, I was only aware of 5XXX/7XXX
naming for that one... which I guess further highlights the confusing
naming scheme.

I will re-spin with `dell-xps13-9345` and `dell,xps13-9345`
respectively as proposed then, unless there will be any other feedback
on the V3 series before tomorrow.

Thanks,
Alex

>
> Thanks again for the support.
>
> Bryan Kemp
> Architect - Linux OS Engineering
>
>
> Internal Use - Confidential
> -----Original Message-----
> From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Sent: Monday, September 30, 2024 2:24 PM
> To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Krzysztof Kozlowski <krzyszto=
f.kozlowski@linaro.org>; Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; li=
nux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.=
kernel.org; Tudor, Laurentiu <Laurentiu.Tudor1@dell.com>; Konrad Dybcio <ko=
nradybcio@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <=
krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Rob Clark <robdcla=
rk@gmail.com>; Peter de Kraker <peterdekraker@umito.nl>; Kemp, Bryan <Bryan=
_Kemp@Dell.com>
> Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based De=
ll XPS 13 9345
>
>
> [EXTERNAL EMAIL]
>
> On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor <tudor.laurentiu.oss@gmail=
.com> wrote:
> >
> > Hi Alex,
> >
> > Thanks for this! Comment inline.
> >
> > On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
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
> > > * Touchscreen
> > >
> > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >   .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 +++++++++++++++=
+++
> >
> >
> > Could you please use the marketing name for the device tree file name
> > & machine compatible, e.g. "x1e80100-dell-xps13-9345.dts" for the dts
> > file and "dell,xps13-9345" for the compat? I'm thinking that this will
> > help people to identify it more easily.
>
> Hi,
>
> Even though I agree that it may be easier to identify for a non-developer=
, I am a bit skeptical as Dell has a pretty weird naming convention which s=
ometimes results in the name being non-unique.
> In particular case - 9345 - 9 stands for XPS series, 3 stands for 13", an=
d 45 would typically be the last digit of year + 0 (so 40), but with the in=
troduction of last year's ''13 Plus"series they added a 5. At present, this=
 is unique, however in 10 years it may not be.
>
> I have recently hit this issue when working on Dell XPS 15" 2024 (9530), =
which has the same model number as Dell XPS 15" 2013 and led to huge confus=
ions. Only way to distinguish them is by codename ('fiorano' for the newer =
one), or using a complete name including the year... The codename on the ot=
her hand is easily searchable both in the source code and online.
>
> I tried to browse the source code for existing notation, but didn't find =
anything strongly supporting one or another way, so decided to follow Micro=
soft Surface's example with codenames ('romulus').
> Codenaming is also imperfect though, as in Dell's case it typically refer=
s to chassis, rather than _the_ particular device, which typically lasts se=
veral years. Typically throughout chassis generation internals stay +/- the=
 same, but we can't know if any of the changes would be breaking. Perhaps t=
hen, `x1e80100-dell-tributo-9345` and `dell,tributo-9345` respectively, as =
this would be the shortest yet most complete description? 'Tributo' already=
 implies its XPS 13" and chassis variation (touchar, hidden trackpad etc et=
c), '9345' implies XPS 13" of 2024 (?) and in combination with chassis vari=
ant pinpoints the model.
> Otherwise, if it's strongly desired to use marketing names it can be redu=
ced down to `x1e80100-dell-9345.dts` and `dell,9345` altogether as
> 9345 implies it being both 'XPS' series and 13", and we can hope that by =
2034 Dell won't repeat the same mistake with naming. Curious to hear mainta=
iners' opinions as well.
>
> P.S. I've sent the V3 version of the series, it probably makes sense to m=
ove this conversation there for visibility.
>
> Alex
>
> >
> > ---
> > Thanks & Best Regards, Laurentiu
> >
> > >   2 files changed, 861 insertions(+)
> > >   create mode 100644
> > > arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> >
> >
> >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile
> > > b/arch/arm64/boot/dts/qcom/Makefile
> > > index ae002c7cf126..111c589d6bae 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-qrd.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e78100-lenovo-thinkpad-t14s.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-asus-vivobook-s15.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-crd.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e80100-dell-tributo-13.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-lenovo-yoga-slim7x.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-microsoft-romulus13.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-microsoft-romulus15.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > > b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > > new file mode 100644
> > > index 000000000000..ec04b64f9558
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> > > @@ -0,0 +1,860 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights re=
served.
> > > + * Copyright (c) 2024 Aleksandrs Vinarskis
> > > +<alex.vinarskis@gmail.com>  */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/gpio-keys.h> #include
> > > +<dt-bindings/input/input.h> #include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > +
> > > +#include "x1e80100.dtsi"
> > > +#include "x1e80100-pmics.dtsi"
> > > +
> > > +/ {
> > > +     model =3D "Dell XPS 13 9345";
> > > +     compatible =3D "dell,tributo-13", "qcom,x1e80100";
> > > +     chassis-type =3D "laptop";
> > > +
> > > +     gpio-keys {
> > > +             compatible =3D "gpio-keys";
> > > +
> > > +             pinctrl-0 =3D <&hall_int_n_default>;
> > > +             pinctrl-names =3D "default";
> > > +
> > > +             switch-lid {
> > > +                     gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > +                     linux,input-type =3D <EV_SW>;
> > > +                     linux,code =3D <SW_LID>;
> > > +                     wakeup-source;
> > > +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> > > +             };
> > > +     };
> > > +
> > > +     leds {
> > > +             compatible =3D "gpio-leds";
> > > +
> > > +             pinctrl-names =3D "default";
> > > +             pinctrl-0 =3D <&cam_indicator_en>;
> > > +
> > > +             led-camera-indicator {
> > > +                     label =3D "white:camera-indicator";
> > > +                     function =3D LED_FUNCTION_INDICATOR;
> > > +                     color =3D <LED_COLOR_ID_WHITE>;
> > > +                     gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > > +                     linux,default-trigger =3D "none";
> > > +                     default-state =3D "off";
> > > +                     /* Reuse as a panic indicator until we get a "c=
amera on" trigger */
> > > +                     panic-indicator;
> > > +             };
> > > +     };
> > > +
> > > +     pmic-glink {
> > > +             compatible =3D "qcom,x1e80100-pmic-glink",
> > > +                          "qcom,sm8550-pmic-glink",
> > > +                          "qcom,pmic-glink";
> > > +             orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>;
> > > +             #address-cells =3D <1>;
> > > +             #size-cells =3D <0>;
> > > +
> > > +             /* Right-side USB Type-C port */
> > > +             connector@0 {
> > > +                     compatible =3D "usb-c-connector";
> > > +                     reg =3D <0>;
> > > +                     power-role =3D "dual";
> > > +                     data-role =3D "dual";
> > > +
> > > +                     ports {
> > > +                             #address-cells =3D <1>;
> > > +                             #size-cells =3D <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg =3D <0>;
> > > +
> > > +                                     pmic_glink_ss0_hs_in: endpoint =
{
> > > +                                             remote-endpoint =3D <&u=
sb_1_ss0_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg =3D <1>;
> > > +
> > > +                                     pmic_glink_ss0_ss_in: endpoint =
{
> > > +                                             remote-endpoint =3D <&u=
sb_1_ss0_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             /* Left-side USB Type-C port */
> > > +             connector@1 {
> > > +                     compatible =3D "usb-c-connector";
> > > +                     reg =3D <1>;
> > > +                     power-role =3D "dual";
> > > +                     data-role =3D "dual";
> > > +
> > > +                     ports {
> > > +                             #address-cells =3D <1>;
> > > +                             #size-cells =3D <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg =3D <0>;
> > > +
> > > +                                     pmic_glink_ss1_hs_in: endpoint =
{
> > > +                                             remote-endpoint =3D <&u=
sb_1_ss1_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg =3D <1>;
> > > +
> > > +                                     pmic_glink_ss1_ss_in: endpoint =
{
> > > +                                             remote-endpoint =3D <&u=
sb_1_ss1_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     reserved-memory {
> > > +             linux,cma {
> > > +                     compatible =3D "shared-dma-pool";
> > > +                     size =3D <0x0 0x8000000>;
> > > +                     reusable;
> > > +                     linux,cma-default;
> > > +             };
> > > +     };
> > > +
> > > +     vreg_edp_3p3: regulator-edp-3p3 {
> > > +             compatible =3D "regulator-fixed";
> > > +
> > > +             regulator-name =3D "VREG_EDP_3P3";
> > > +             regulator-min-microvolt =3D <3300000>;
> > > +             regulator-max-microvolt =3D <3300000>;
> > > +
> > > +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +
> > > +             pinctrl-0 =3D <&edp_reg_en>;
> > > +             pinctrl-names =3D "default";
> > > +
> > > +             regulator-boot-on;
> > > +     };
> > > +
> > > +     vreg_nvme: regulator-nvme {
> > > +             compatible =3D "regulator-fixed";
> > > +
> > > +             regulator-name =3D "VREG_NVME_3P3";
> > > +             regulator-min-microvolt =3D <3300000>;
> > > +             regulator-max-microvolt =3D <3300000>;
> > > +
> > > +             gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +
> > > +             pinctrl-0 =3D <&nvme_reg_en>;
> > > +             pinctrl-names =3D "default";
> > > +     };
> > > +
> > > +     vreg_vph_pwr: regulator-vph-pwr {
> > > +             compatible =3D "regulator-fixed";
> > > +
> > > +             regulator-name =3D "vph_pwr";
> > > +             regulator-min-microvolt =3D <3700000>;
> > > +             regulator-max-microvolt =3D <3700000>;
> > > +
> > > +             regulator-always-on;
> > > +             regulator-boot-on;
> > > +     };
> > > +};
> > > +
> > > +&apps_rsc {
> > > +     regulators-0 {
> > > +             compatible =3D "qcom,pm8550-rpmh-regulators";
> > > +             qcom,pmic-id =3D "b";
> > > +             vdd-bob1-supply =3D <&vreg_vph_pwr>;
> > > +             vdd-bob2-supply =3D <&vreg_vph_pwr>;
> > > +             vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
> > > +             vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
> > > +             vdd-l5-l16-supply =3D <&vreg_bob1>;
> > > +             vdd-l6-l7-supply =3D <&vreg_bob2>;
> > > +             vdd-l8-l9-supply =3D <&vreg_bob1>;
> > > +             vdd-l12-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l15-supply =3D <&vreg_s4c_1p8>;
> > > +             vdd-l17-supply =3D <&vreg_bob2>;
> > > +
> > > +             vreg_bob1: bob1 {
> > > +                     regulator-name =3D "vreg_bob1";
> > > +                     regulator-min-microvolt =3D <3008000>;
> > > +                     regulator-max-microvolt =3D <3960000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_bob2: bob2 {
> > > +                     regulator-name =3D "vreg_bob2";
> > > +                     regulator-min-microvolt =3D <2504000>;
> > > +                     regulator-max-microvolt =3D <3008000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l2b_3p0: ldo2 {
> > > +                     regulator-name =3D "vreg_l2b_3p0";
> > > +                     regulator-min-microvolt =3D <3072000>;
> > > +                     regulator-max-microvolt =3D <3072000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l4b_1p8: ldo4 {
> > > +                     regulator-name =3D "vreg_l4b_1p8";
> > > +                     regulator-min-microvolt =3D <1800000>;
> > > +                     regulator-max-microvolt =3D <1800000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l6b_1p8: ldo6 {
> > > +                     regulator-name =3D "vreg_l6b_1p8";
> > > +                     regulator-min-microvolt =3D <1800000>;
> > > +                     regulator-max-microvolt =3D <2960000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l8b_3p0: ldo8 {
> > > +                     regulator-name =3D "vreg_l8b_3p0";
> > > +                     regulator-min-microvolt =3D <3072000>;
> > > +                     regulator-max-microvolt =3D <3072000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l9b_2p9: ldo9 {
> > > +                     regulator-name =3D "vreg_l9b_2p9";
> > > +                     regulator-min-microvolt =3D <2960000>;
> > > +                     regulator-max-microvolt =3D <2960000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l12b_1p2: ldo12 {
> > > +                     regulator-name =3D "vreg_l12b_1p2";
> > > +                     regulator-min-microvolt =3D <1200000>;
> > > +                     regulator-max-microvolt =3D <1200000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l13b_3p0: ldo13 {
> > > +                     regulator-name =3D "vreg_l13b_3p0";
> > > +                     regulator-min-microvolt =3D <3072000>;
> > > +                     regulator-max-microvolt =3D <3072000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l14b_3p0: ldo14 {
> > > +                     regulator-name =3D "vreg_l14b_3p0";
> > > +                     regulator-min-microvolt =3D <3072000>;
> > > +                     regulator-max-microvolt =3D <3072000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l15b_1p8: ldo15 {
> > > +                     regulator-name =3D "vreg_l15b_1p8";
> > > +                     regulator-min-microvolt =3D <1800000>;
> > > +                     regulator-max-microvolt =3D <1800000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l17b_2p5: ldo17 {
> > > +                     regulator-name =3D "vreg_l17b_2p5";
> > > +                     regulator-min-microvolt =3D <2504000>;
> > > +                     regulator-max-microvolt =3D <2504000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-1 {
> > > +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +             qcom,pmic-id =3D "c";
> > > +             vdd-l1-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +
> > > +             vreg_s4c_1p8: smps4 {
> > > +                     regulator-name =3D "vreg_s4c_1p8";
> > > +                     regulator-min-microvolt =3D <1856000>;
> > > +                     regulator-max-microvolt =3D <2000000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l1c_1p2: ldo1 {
> > > +                     regulator-name =3D "vreg_l1c_1p2";
> > > +                     regulator-min-microvolt =3D <1200000>;
> > > +                     regulator-max-microvolt =3D <1200000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l2c_0p8: ldo2 {
> > > +                     regulator-name =3D "vreg_l2c_0p8";
> > > +                     regulator-min-microvolt =3D <880000>;
> > > +                     regulator-max-microvolt =3D <880000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l3c_0p9: ldo3 {
> > > +                     regulator-name =3D "vreg_l3c_0p9";
> > > +                     regulator-min-microvolt =3D <920000>;
> > > +                     regulator-max-microvolt =3D <920000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-2 {
> > > +             compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +             qcom,pmic-id =3D "d";
> > > +             vdd-l1-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-l3-supply =3D <&vreg_s4c_1p8>;
> > > +             vdd-s1-supply =3D <&vreg_vph_pwr>;
> > > +
> > > +             vreg_l1d_0p8: ldo1 {
> > > +                     regulator-name =3D "vreg_l1d_0p8";
> > > +                     regulator-min-microvolt =3D <880000>;
> > > +                     regulator-max-microvolt =3D <880000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l2d_0p9: ldo2 {
> > > +                     regulator-name =3D "vreg_l2d_0p9";
> > > +                     regulator-min-microvolt =3D <912000>;
> > > +                     regulator-max-microvolt =3D <912000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l3d_1p8: ldo3 {
> > > +                     regulator-name =3D "vreg_l3d_1p8";
> > > +                     regulator-min-microvolt =3D <1800000>;
> > > +                     regulator-max-microvolt =3D <1800000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-3 {
> > > +             compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +             qcom,pmic-id =3D "e";
> > > +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-l3-supply =3D <&vreg_s5j_1p2>;
> > > +
> > > +             vreg_l2e_0p8: ldo2 {
> > > +                     regulator-name =3D "vreg_l2e_0p8";
> > > +                     regulator-min-microvolt =3D <880000>;
> > > +                     regulator-max-microvolt =3D <880000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l3e_1p2: ldo3 {
> > > +                     regulator-name =3D "vreg_l3e_1p2";
> > > +                     regulator-min-microvolt =3D <1200000>;
> > > +                     regulator-max-microvolt =3D <1200000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-4 {
> > > +             compatible =3D "qcom,pmc8380-rpmh-regulators";
> > > +             qcom,pmic-id =3D "f";
> > > +             vdd-l1-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l3-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-s1-supply =3D <&vreg_vph_pwr>;
> > > +
> > > +             vreg_s1f_0p7: smps1 {
> > > +                     regulator-name =3D "vreg_s1f_0p7";
> > > +                     regulator-min-microvolt =3D <700000>;
> > > +                     regulator-max-microvolt =3D <1100000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-6 {
> > > +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +             qcom,pmic-id =3D "i";
> > > +             vdd-l1-supply =3D <&vreg_s4c_1p8>;
> > > +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-s1-supply =3D <&vreg_vph_pwr>;
> > > +             vdd-s2-supply =3D <&vreg_vph_pwr>;
> > > +
> > > +             vreg_s1i_0p9: smps1 {
> > > +                     regulator-name =3D "vreg_s1i_0p9";
> > > +                     regulator-min-microvolt =3D <900000>;
> > > +                     regulator-max-microvolt =3D <920000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_s2i_1p0: smps2 {
> > > +                     regulator-name =3D "vreg_s2i_1p0";
> > > +                     regulator-min-microvolt =3D <1000000>;
> > > +                     regulator-max-microvolt =3D <1100000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l1i_1p8: ldo1 {
> > > +                     regulator-name =3D "vreg_l1i_1p8";
> > > +                     regulator-min-microvolt =3D <1800000>;
> > > +                     regulator-max-microvolt =3D <1800000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l2i_1p2: ldo2 {
> > > +                     regulator-name =3D "vreg_l2i_1p2";
> > > +                     regulator-min-microvolt =3D <1200000>;
> > > +                     regulator-max-microvolt =3D <1200000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l3i_0p8: ldo3 {
> > > +                     regulator-name =3D "vreg_l3i_0p8";
> > > +                     regulator-min-microvolt =3D <880000>;
> > > +                     regulator-max-microvolt =3D <880000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +
> > > +     regulators-7 {
> > > +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
> > > +             qcom,pmic-id =3D "j";
> > > +             vdd-l1-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
> > > +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
> > > +             vdd-s5-supply =3D <&vreg_vph_pwr>;
> > > +
> > > +             vreg_s5j_1p2: smps5 {
> > > +                     regulator-name =3D "vreg_s5j_1p2";
> > > +                     regulator-min-microvolt =3D <1256000>;
> > > +                     regulator-max-microvolt =3D <1304000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l1j_0p9: ldo1 {
> > > +                     regulator-name =3D "vreg_l1j_0p9";
> > > +                     regulator-min-microvolt =3D <912000>;
> > > +                     regulator-max-microvolt =3D <912000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l2j_1p2: ldo2 {
> > > +                     regulator-name =3D "vreg_l2j_1p2";
> > > +                     regulator-min-microvolt =3D <1256000>;
> > > +                     regulator-max-microvolt =3D <1256000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +
> > > +             vreg_l3j_0p8: ldo3 {
> > > +                     regulator-name =3D "vreg_l3j_0p8";
> > > +                     regulator-min-microvolt =3D <880000>;
> > > +                     regulator-max-microvolt =3D <880000>;
> > > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE=
_HPM>;
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&gpu {
> > > +     status =3D "okay";
> > > +
> > > +     zap-shader {
> > > +             firmware-name =3D "qcom/x1e80100/dell/tributo/qcdxkmsuc=
8380.mbn";
> > > +     };
> > > +};
> > > +
> > > +&i2c0 {
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "okay";
> > > +
> > > +     keyboard@5 {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x5>;
> > > +
> > > +             hid-descr-addr =3D <0x20>;
> > > +             interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             pinctrl-0 =3D <&kybd_default>;
> > > +             pinctrl-names =3D "default";
> > > +
> > > +             wakeup-source;
> > > +     };
> > > +};
> > > +
> > > +&i2c3 {
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "disabled";
> > > +     /* PS8830 Retimer @0x8 */
> > > +     /* Unknown device @0x9 */
> > > +};
> > > +
> > > +&i2c5 {
> > > +     clock-frequency =3D <100000>;
> > > +     status =3D "disabled";
> > > +     /* Unknown device @0x3b */
> > > +};
> > > +
> > > +&i2c7 {
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "disabled";
> > > +     /* PS8830 Retimer @0x8 */
> > > +     /* Unknown device @0x9 */
> > > +};
> > > +
> > > +&i2c8 {
> > > +     clock-frequency =3D <400000>;
> > > +
> > > +     status =3D "okay";
> > > +
> > > +     touchscreen@0 {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x0>;
> > > +
> > > +             hid-descr-addr =3D <0x1>;
> > > +             interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             pinctrl-0 =3D <&ts0_default>;
> > > +             pinctrl-names =3D "default";
> > > +     };
> > > +};
> > > +
> > > +&i2c9 {
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "disabled";
> > > +     /* USB3 retimer device @0x4f */ };
> > > +
> > > +&i2c17 {
> > > +     clock-frequency =3D <400000>;
> > > +     status =3D "okay";
> > > +
> > > +     touchpad@2c {
> > > +             compatible =3D "hid-over-i2c";
> > > +             reg =3D <0x2c>;
> > > +
> > > +             hid-descr-addr =3D <0x20>;
> > > +             interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             pinctrl-0 =3D <&tpad_default>;
> > > +             pinctrl-names =3D "default";
> > > +
> > > +             wakeup-source;
> > > +     };
> > > +};
> > > +
> > > +&mdss {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&mdss_dp3 {
> > > +     compatible =3D "qcom,x1e80100-dp";
> > > +     /delete-property/ #sound-dai-cells;
> > > +
> > > +     status =3D "okay";
> > > +
> > > +     aux-bus {
> > > +             panel {
> > > +                     /* 1920x1200 IPS panel is SHP1593, PNP09FF comp=
atible */
> > > +                     compatible =3D "edp-panel";
> > > +                     power-supply =3D <&vreg_edp_3p3>;
> > > +
> > > +                     port {
> > > +                             edp_panel_in: endpoint {
> > > +                                     remote-endpoint =3D <&mdss_dp3_=
out>;
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     ports {
> > > +             port@1 {
> > > +                     reg =3D <1>;
> > > +
> > > +                     mdss_dp3_out: endpoint {
> > > +                             data-lanes =3D <0 1 2 3>;
> > > +                             link-frequencies =3D /bits/ 64
> > > + <1620000000 2700000000 5400000000 8100000000>;
> > > +
> > > +                             remote-endpoint =3D <&edp_panel_in>;
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&mdss_dp3_phy {
> > > +     vdda-phy-supply =3D <&vreg_l3j_0p8>;
> > > +     vdda-pll-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&pcie4 {
> > > +     perst-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
> > > +     wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
> > > +
> > > +     pinctrl-0 =3D <&pcie4_default>;
> > > +     pinctrl-names =3D "default";
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&pcie4_phy {
> > > +     vdda-phy-supply =3D <&vreg_l3i_0p8>;
> > > +     vdda-pll-supply =3D <&vreg_l3e_1p2>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&pcie6a {
> > > +     perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
> > > +     wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
> > > +
> > > +     vddpe-3v3-supply =3D <&vreg_nvme>;
> > > +
> > > +     pinctrl-0 =3D <&pcie6a_default>;
> > > +     pinctrl-names =3D "default";
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&pcie6a_phy {
> > > +     vdda-phy-supply =3D <&vreg_l1d_0p8>;
> > > +     vdda-pll-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_1 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&qupv3_2 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&remoteproc_adsp {
> > > +     firmware-name =3D "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
> > > +                     "qcom/x1e80100/dell/tributo/adsp_dtbs.elf";
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&remoteproc_cdsp {
> > > +     firmware-name =3D "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
> > > +                     "qcom/x1e80100/dell/tributo/cdsp_dtbs.elf";
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&smb2360_0_eusb2_repeater {
> > > +     vdd18-supply =3D <&vreg_l3d_1p8>;
> > > +     vdd3-supply =3D <&vreg_l2b_3p0>; };
> > > +
> > > +&smb2360_1_eusb2_repeater {
> > > +     vdd18-supply =3D <&vreg_l3d_1p8>;
> > > +     vdd3-supply =3D <&vreg_l14b_3p0>; };
> > > +
> > > +&tlmm {
> > > +     gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
> > > +                            <76 4>,  /* SPI19 (TZ Protected) */
> > > +                            <238 1>; /* UFS Reset */
> > > +
> > > +     cam_indicator_en: cam-indicator-en-state {
> > > +             pins =3D "gpio110";
> > > +             function =3D "gpio";
> > > +             drive-strength =3D <2>;
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     edp_reg_en: edp-reg-en-state {
> > > +             pins =3D "gpio70";
> > > +             function =3D "gpio";
> > > +             drive-strength =3D <16>;
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     hall_int_n_default: hall-int-n-state {
> > > +             pins =3D "gpio92";
> > > +             function =3D "gpio";
> > > +
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     kybd_default: kybd-default-state {
> > > +             pins =3D "gpio67";
> > > +             function =3D "gpio";
> > > +             bias-pull-up;
> > > +     };
> > > +
> > > +     nvme_reg_en: nvme-reg-en-state {
> > > +             pins =3D "gpio18";
> > > +             function =3D "gpio";
> > > +             drive-strength =3D <2>;
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     pcie4_default: pcie4-default-state {
> > > +             clkreq-n-pins {
> > > +                     pins =3D "gpio147";
> > > +                     function =3D "pcie4_clk";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-pull-up;
> > > +             };
> > > +
> > > +             perst-n-pins {
> > > +                     pins =3D "gpio146";
> > > +                     function =3D "gpio";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-disable;
> > > +             };
> > > +
> > > +             wake-n-pins {
> > > +                     pins =3D "gpio148";
> > > +                     function =3D "gpio";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-pull-up;
> > > +             };
> > > +     };
> > > +
> > > +     pcie6a_default: pcie6a-default-state {
> > > +             clkreq-n-pins {
> > > +                     pins =3D "gpio153";
> > > +                     function =3D "pcie6a_clk";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-pull-up;
> > > +             };
> > > +
> > > +             perst-n-pins {
> > > +                     pins =3D "gpio152";
> > > +                     function =3D "gpio";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-disable;
> > > +             };
> > > +
> > > +             wake-n-pins {
> > > +                     pins =3D "gpio154";
> > > +                     function =3D "gpio";
> > > +                     drive-strength =3D <2>;
> > > +                     bias-pull-up;
> > > +             };
> > > +     };
> > > +
> > > +     tpad_default: tpad-default-state {
> > > +             disable-pins {
> > > +                     pins =3D "gpio38";
> > > +                     function =3D "gpio";
> > > +                     output-high;
> > > +             };
> > > +
> > > +             int-n-pins {
> > > +                     pins =3D "gpio3";
> > > +                     function =3D "gpio";
> > > +                     bias-pull-up;
> > > +             };
> > > +
> > > +             reset-n-pins {
> > > +                     pins =3D "gpio52";
> > > +                     function =3D "gpio";
> > > +                     bias-disable;
> > > +             };
> > > +     };
> > > +
> > > +     ts0_default: ts0-default-state {
> > > +             disable-pins {
> > > +                     pins =3D "gpio75";
> > > +                     function =3D "gpio";
> > > +                     output-high;
> > > +             };
> > > +
> > > +             int-n-pins {
> > > +                     pins =3D "gpio51";
> > > +                     function =3D "gpio";
> > > +                     bias-pull-up;
> > > +             };
> > > +
> > > +             reset-n-pins {
> > > +                     /* Technically should be High-Z input */
> > > +                     pins =3D "gpio48";
> > > +                     function =3D "gpio";
> > > +                     output-low;
> > > +                     drive-strength =3D <2>;
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&uart21 {
> > > +     compatible =3D "qcom,geni-debug-uart";
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_hsphy {
> > > +     vdd-supply =3D <&vreg_l3j_0p8>;
> > > +     vdda12-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +     phys =3D <&smb2360_0_eusb2_repeater>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_qmpphy {
> > > +     vdda-phy-supply =3D <&vreg_l3e_1p2>;
> > > +     vdda-pll-supply =3D <&vreg_l1j_0p9>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss0_dwc3 {
> > > +     dr_mode =3D "host";
> > > +};
> > > +
> > > +&usb_1_ss0_dwc3_hs {
> > > +     remote-endpoint =3D <&pmic_glink_ss0_hs_in>; };
> > > +
> > > +&usb_1_ss0_qmpphy_out {
> > > +     remote-endpoint =3D <&pmic_glink_ss0_ss_in>; };
> > > +
> > > +&usb_1_ss1_hsphy {
> > > +     vdd-supply =3D <&vreg_l3j_0p8>;
> > > +     vdda12-supply =3D <&vreg_l2j_1p2>;
> > > +
> > > +     phys =3D <&smb2360_1_eusb2_repeater>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1_qmpphy {
> > > +     vdda-phy-supply =3D <&vreg_l3e_1p2>;
> > > +     vdda-pll-supply =3D <&vreg_l2d_0p9>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_ss1_dwc3 {
> > > +     dr_mode =3D "host";
> > > +};
> > > +
> > > +&usb_1_ss1_dwc3_hs {
> > > +     remote-endpoint =3D <&pmic_glink_ss1_hs_in>; };
> > > +
> > > +&usb_1_ss1_qmpphy_out {
> > > +     remote-endpoint =3D <&pmic_glink_ss1_ss_in>; };
> >

