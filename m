Return-Path: <linux-arm-msm+bounces-84122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBAC9CAFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 19:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51CD434A2CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 18:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283D62D321B;
	Tue,  2 Dec 2025 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMq5mjw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6E2D1911
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701479; cv=none; b=kL4wm0m3jTPdiG0ng77ynB0qThiRyiS1cYsQt5XsQbBLHj8z3vQyyMPWnZriI3Ike+bX+bjOvoTSfMZZmTuksqGGF9g0oZC2wkwbTHXVL7UZHwhLA9il+24CJ/QiIG8DXLa1+TgE0qY1rgRkdvVYZtvcgMm0FXPR5hZQ5MOeXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701479; c=relaxed/simple;
	bh=4XrTwBI6GfIcRlKGQ+9MIEdd1yoEj/TBavMaSsBEpoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIFyFKFro7XPgpn6YlErAGfhDbOvhS4qSF9dWcPW0kH2ryOD1TpLL0durzz0fkfD9XgX0HKpalKMfp7lZZ2EbwLM/HOM52oUPZjYl8hNPBTGJrZLCGGglZDdc32SSh45xINwpbbvBPFUINQ/2ghB+HFzJIPbIKWyoyj0AbZaPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMq5mjw1; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-882390f7952so63649486d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764701476; x=1765306276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rNbv3ufEFl8Ti5k9F3QiiXqTVEJUcfBjegrAmdC674=;
        b=BMq5mjw1WGkteKc19RRFE1eKia2GkfrqFgVe61wRHNy79OsUbksGrN/MFBG7eS1eJr
         mQbGHXLBA1XH9OY8lqybdcD0ITIyFN+I9Up+NzkyS0JCY5Ct/ev1j20GANb7VKaJ3OZE
         7zAzX1Qp1NdOlwcwbCmSmYDoDoHHXqSvnofi55dCeM3qzgTCIxyvH2EA+rOlqolCwMSJ
         jrA18o3pQTmSdji5F3CWHaYsvWxZ28zAmwqs2zeumKFpl7X33h8CLAB3psbgtHl768v4
         WmrVaOw6Ov9FRtBANH4xiBQX5Th/mrAZ+4NQ82of0pdehX9DjMPQjCLmJrP2vaZ5lQZ2
         B+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764701476; x=1765306276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rNbv3ufEFl8Ti5k9F3QiiXqTVEJUcfBjegrAmdC674=;
        b=EJwcFOIha7JPF/f/JsS+REZpJYZkb5l19aq3pO3K0QqJsO3S+evVpCdmkNtPBBgC1w
         a/EynIx64pyl4TW0+fs3IlHRo1MUyTFMoG5fodyLzrYOZT9b3yILVvFjiEjMU1IbC80g
         8mm0LoayuSFxtEJFAdtSa9wUxKLUDpMsU4WBCVDCz0P8v/15oiHXve8XiCTEHzon80wY
         uAvv6k3qwNALBI1yMyoSTOwFsycRHb+UFjz5xOjw/bH8hhq3WHg9HJy/hojnD6mnczV+
         zx+DgG0ykbvh4N9Eruh8VllTRK6F3plWCwzgjXbp/xXNS+qqnX8VgSnwq0LEp1w9ORDm
         01AA==
X-Forwarded-Encrypted: i=1; AJvYcCW8DrdmtzDnHkVDTDij6kEUXvr+opR3xHduFk9pSPs5PQgzY8xAMiQIMRAjPM2RfALqoQ93IY+EhCcAqzyf@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBbwE3/fqCcQt0OWvkFYlUwNJJk2NaAWsraf5uCZx7+aODBh4
	UgbPgE9LYwYYdeZf7dFmiHv8GwtEMWOnLiBHy+kjcqZnM63zTr8VZTrbA/nNz3RiMnesbsZN2Bp
	T1YbWq+/O2rBo9/lIw6Udz4M1GHytmg==
X-Gm-Gg: ASbGncsEIYfwgaUSpGPrSdFD3FtG7g5fOeU98e6uoQmHcG9DOblUCgwGKw5dq5kczg2
	96qWD+RBQEBON3VE0dE3lLDL+3qGzMbu2ZHf1kMOU4T0a/NB+QEbHxG9cHXUbwyQu6eQHiNmejc
	240R/MoszYM3HF3BZckk4TzNpsfFP64trvX9ppQjaXmYFcBLUk55pCIi3LaeMc35MyPjKC1GfSE
	15ybX3iiJ4jd+6zhSCBaQ05oYEkM+IFof5vHnv8zMsZnQXpOQb5r2jlPr3isfrapvhuQuu6Yo4c
	r+Wd09ApGDVjaCzvIRUzH0Z4Nfvs
X-Google-Smtp-Source: AGHT+IH9XUQWzaUoTFbHz+Zo6M5rwIC9ydzn79MfP9yr6jRoN2zs0jgMYMamuKCtU+ElHFaojqhePC+3e2tFDlU4OjQ=
X-Received: by 2002:a05:6214:e64:b0:880:4690:3bb8 with SMTP id
 6a1803df08f44-88817733618mr5732776d6.18.1764701476153; Tue, 02 Dec 2025
 10:51:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201011457.17422-1-daleyo@gmail.com> <20251201011457.17422-5-daleyo@gmail.com>
 <ae91cad5-5a0b-4c83-9eb0-6e7baf6a33d0@oss.qualcomm.com>
In-Reply-To: <ae91cad5-5a0b-4c83-9eb0-6e7baf6a33d0@oss.qualcomm.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 2 Dec 2025 19:50:39 +0100
X-Gm-Features: AWmQ_blh5y2GvhXqkrQ6R3Hgzm0jcCZOGyFUiFJ6is_KTAGGpRW-lBMZwLxab20
Message-ID: <CA+kEDGHyx7C7PNxQ8votwABiQpKhAAh126os3OLu-W0kDo2ySQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: Add support for Surface Pro 11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

As discussed with Dale, I will take over the v3 submission since we've
worked on this patchset together until now. Here is my feedback below.

Le lun. 1 d=C3=A9c. 2025 =C3=A0 16:35, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 12/1/25 2:14 AM, Dale Whinham wrote:
> > Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> > Pro 11 machines (codenamed 'Denali').
> >
> > This device is very similar to the Surface Laptop 7 ('Romulus').
> >
> > Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can creat=
e
> > x1e and x1p-specific flavors of the device tree without too much code
> > duplication.
>
> [...]
>
> > +             pinctrl-0 =3D <&hall_int_n_default>;
> > +             pinctrl-names =3D "default";in v3
> > +
> > +             switch-lid {
> > +                     gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +                     linux,input-type =3D <EV_SW>;
> > +                     linux,code =3D <SW_LID>;
>
> I.. don't think this device has a lid - what triggers this GPIO?

When a Surface tablet is connected to a Surface keyboard, opening/closing
the keyboard triggers a wakeup/suspend event. I will double-check if this
entry is involved and will remove/keep it in v3 based on this check.

> [...]
>
> > +     /*
> > +      * TODO: These two regulators are actually part of the removable =
M.2
> > +      * card and not the CRD mainboard. Need to describe this differen=
tly.
> > +      * Functionally it works correctly, because all we need to do is =
to
> > +      * turn on the actual 3.3V supply above.
>
> There's not a M.2 card, the WLAN chip is soldered on board
>
> https://www.ifixit.com/Guide/Microsoft+Surface+Pro+11+Chip+ID/174016#s370=
945

Indeed, I will remove this comment as it is not applicable to this model.

> > +     sound {
> > +             compatible =3D "qcom,x1e80100-sndcard";
> > +             model =3D "X1E80100-Microsoft-Surface-Pro-11";
> > +             audio-routing =3D "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> > +                             "SpkrRight IN", "WSA WSA_SPK2 OUT",
> > +                             "VA DMIC0", "vdd-micb",
> > +                             "VA DMIC1", "vdd-micb";
> > +
> > +             wsa-dai-link {
> > +                     link-name =3D "WSA Playback";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai WSA_CODEC_DMA_=
RX_0>;
> > +                     };
> > +
> > +                     codec {
>
> 'co'dec < 'cp'u
>
> please flip the order of the two

Sure, will do in v3. For info, this is also in the wrong order in *romulus.=
dtsi.

> [...]
>
> > +&i2c0 {
> > +     clock-frequency =3D <400000>;
> > +
> > +     status =3D "disabled";
>
> Is there anything connected to that controller?

Not clear yet, maybe for the touchscreen and pen, still to be investigated.

> If so, let's keep it enabled so that it's accessible through i2c-tools
> It'd be even better if you could document (in a comment, like in romulus.=
dtsi)
> what and at what address that is

I will enable it in v3, not sure if I'll find the right info to add a
useful comment.

> [...]
>
> > +&lpass_tlmm {
> > +     spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> > +             pins =3D "gpio12";
> > +             function =3D "gpio";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +             output-low;
>
> Please drop output-low from both definitions, the output state is

Ok for v3.

> controlled manually by the WSA driver. Although from the diff below
> it looks like spkr_23_sd_n is unused and you only have 2 speakers

Looking at the public specs, it only has 2 speakers indeed.

> [...]
>
> > +&tlmm {
> > +     gpio-reserved-ranges =3D <44 4>, /* SPI (TPM) */
> > +                                                <238 1>; /* UFS Reset =
*/
>
> Please ensure your tab width is set to 8

I will fix this in v3.

> [...]
> > +     cam_indicator_en: cam-indicator-en-state {
> > +             pins =3D "gpio225";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     wcn_sw_en: wcn-sw-en-state {
> > +                     pins =3D "gpio214";
> > +                     function =3D "gpio";
> > +                     drive-strength =3D <2>;
> > +                     bias-disable;
> > +     };
> > +
> > +     wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> > +                     pins =3D "gpio116", "gpio117";
> > +                     function =3D "gpio";
> > +                     drive-strength =3D <2>;
> > +                     bias-disable;
> > +     };
>
> and here (+ these last 2 entries are out of order, GPIO num-wise,
> please adjust that )

Noted for the tabs here + the 2 entries to reorder based on GPIO.

> [...]
>
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights rese=
rved.
> > + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "x1e80100.dtsi"
> > +#include "x1-microsoft-denali.dtsi"
> > +
> > +/ {
> > +     model =3D "Microsoft Surface Pro 11th Edition (OLED)";
> > +     compatible =3D "microsoft,denali-oled", "microsoft,denali",
> > +                  "qcom,x1e80100";
>
> Are the OLED models always X1E and the LCD ones always based on X1E80100
> and LCD models always based on X1P64100?

The OLED models are always with the X1E and the LCD ones with X1P64100,
at least this is our understanding from the specs and online configurations=
.

> Konrad

Thanks a lot for your review,
J=C3=A9r=C3=B4me

> > +};
> > +
> > +&panel {
> > +     compatible =3D "samsung,atna30dw01", "samsung,atna33xc20";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/a=
rch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > new file mode 100644
> > index 000000000000..7c064ad49395
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights rese=
rved.
> > + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "x1e80100.dtsi"
> > +#include "x1-microsoft-denali.dtsi"
> > +
> > +/ {
> > +     model =3D "Microsoft Surface Pro 11th Edition (LCD)";
> > +     compatible =3D "microsoft,denali-lcd", "microsoft,denali",
> > +                  "qcom,x1p64100", "qcom,x1e80100";
> > +};

