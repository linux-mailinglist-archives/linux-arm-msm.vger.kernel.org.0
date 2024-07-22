Return-Path: <linux-arm-msm+bounces-26812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599893912E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 17:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2452F1F22202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 15:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16FF16D4FE;
	Mon, 22 Jul 2024 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LabKBzJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72216C875;
	Mon, 22 Jul 2024 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660434; cv=none; b=rEOWX/9xpHE0ISFLHgqCtMozbtZQdrwmXLOM5v5brEQMti5wZXuxDd3VRH+93mUpeL2VBzfpYtAG+86zr5piXkCHKzpf81gwdZq5GNJF6IIg7ymj+vMHaglyM8z3GdI3NrZxuE+XszOW9rteTzt9tF4kKmUGm9rothDclTxxmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660434; c=relaxed/simple;
	bh=j3+p+cg/rjUpWdDNzHFZEYlAwXBdIF3dmU6gKky6JSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0+dBP+fg1xuUo4OOl0h2cJTh+J2IRYeGzeQ/SJLmDJJ2xwaVlhp41rdQ6s2xBQ+Pa+1C4dUaZF4K8XHDgkKBZ5Vwz8hJRFkgjnd/TifEJ/1mLiayRTB+G57KYy47VrFwyH4souA9FuN2ZCuP2cmdyktfYNEfKm1tDRwSWFPIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LabKBzJo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so3429887a12.2;
        Mon, 22 Jul 2024 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721660431; x=1722265231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqc5e5BXGK4DUmC1lbglGU3PLR3icIed3BDZbOgHemQ=;
        b=LabKBzJox7jsbYfptVDkmBzGK6vKi1wwFzzSxD+45s6iCODR5DqNwBbGvJgTkPgsmB
         w1K00x0LXiDT81VehQz/ErVXPmXcPdh2k1EbOkNARltUfvNuGwkyW7AsiudMlYZFxKCq
         0ugFQrgWvmsPZZnQ/WKs7vEU77pazrAJoNK5Wfe4JoGbbo8//odIPIUiDCrub6re39dO
         JaEdQY+KW2ycARjZ/YzhD+GZpdNsMTD7G+J2YgNwqajhngLaH7/9u6QQUf97IaRvykuF
         /g8qKIbAeVI55rX8qLOUFMHUH9D+O66T16O6N2G5dJ8voa+RtyMDhDj5+cn3qA6kXCtB
         wMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721660431; x=1722265231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqc5e5BXGK4DUmC1lbglGU3PLR3icIed3BDZbOgHemQ=;
        b=QA/JxZxbLuSiqRQVKvaw4Lanp4+9yfXXMfH/Udm7KEIhdvs+nEb7tMS68ipydW5MYb
         mQIIIAunh/TldquvwgzLXe4hEiQUlVwW/YCG4fwRsP2uz8QsUrRgNQuqhz5F4pM5vEXa
         SEX4c2H/DGFBGba7Mhj4HP+w5Tm0RUq9GLg/6qRR74fJ77JFoYgTEv1qEi3Xg+9JiKDK
         0GLKeyf+bI/PHpnlcIrsJGmfPxsINpmwOJZHP+D0wArbK69NFjP5I6V15aAiOS7sOR41
         9WmOVc9M4n081MHKLrnMQMSVSl/RPBbKvSHhDNTDYiztcXLaMhu54M9j94u7TNPXPraB
         H38Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiNhK3oubpuv96pAXROzJ3rtf3hBIaDoSRJL0CcbAehuQKp2vG+yiAcenEtMCyRwMcDIpJmfurb6s2vfKlRygN1zFgnfMOfeQADaWAV+neQsSsc9BYrI400+dByrY/JaxTrP0F1caRjs0jCtPs1QEiqYKjYPFIaG4D4uxPdW+DXzlhrDEEZFo=
X-Gm-Message-State: AOJu0YxPawputyQoJ8xINRDfA5XrIWHN1/HaC+1Zcq5PQhgTr2hq+E77
	GzOsbxO401CcMOWB3iRANzRUHCz7oUcyuEjGJe+OhGzP6meIUAsgbci+27UK4S8jAmvCfr/t8kK
	FEf5160uqYyuI5tAi10qLduju7v4=
X-Google-Smtp-Source: AGHT+IH9LH3E/9hTjgXHmTL9AgNlfgrM5AKZUcizv/ZNH4AKJ6MbW2OvqEv3Yqh33cU4tOV/C2BDdw6b/C59lABijYw=
X-Received: by 2002:a05:6402:5110:b0:5a2:9b09:449b with SMTP id
 4fb4d7f45d1cf-5a478b77f44mr5635030a12.4.1721660430945; Mon, 22 Jul 2024
 08:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org> <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
 <Zp4vghH5SK/rLEce@linaro.org>
In-Reply-To: <Zp4vghH5SK/rLEce@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Jul 2024 08:00:19 -0700
Message-ID: <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 3:11=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> On 24-07-22 10:42:57, Konrad Dybcio wrote:
> > On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> > >> Add support for the aforementioned laptop. That includes:
> > >>
> > >> - input methods, incl. lid switch (keyboard needs the pdc
> > >>   wakeup-parent removal hack..)
> > >> - NVMe, WiFi
> > >> - USB-C ports
> > >> - GPU, display
> > >> - DSPs
> > >>
> > >> Notably, the USB-A ports on the side are depenedent on the USB
> > >> multiport controller making it upstream.
> > >>
> > >> At least one of the eDP panels used (non-touchscreen) identifies as
> > >> BOE 0x0b66.
> > >>
> > >> See below for the hardware description from the OEM.
> > >>
> > >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/leno=
vo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > >
> > > Few comments below. Otherwise, LGTM.
> > >
> > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > >
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 ++++++++++=
+++++++++++
> > >>  2 files changed, 793 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts=
/qcom/Makefile
> > >> index 0e5c810304fb..734a05e04c4a 100644
> > >> --- a/arch/arm64/boot/dts/qcom/Makefile
> > >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> > >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-hdk-d=
isplay-card.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-hdk.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-mtp.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-qrd.dtb
> > >> +dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e78100-lenovo-thinkpad-t14s.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-asus-vivobook-s15.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-crd.dtb
> > >>  dtb-$(CONFIG_ARCH_QCOM)   +=3D x1e80100-lenovo-yoga-slim7x.dtb
> > >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.=
dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > >
> > > So what happens for SKUs of this model wil have x1e80100 ?
> > >
> > > Maybe we should stick to x1e80100 ?
> >
> > This one only ships with 78100
> >
>
> Sure, but then in upstream we only have 80100. Plus, it is included in
> this file as well.
>
> I don't know what's the right thing to do here. But I think it keeps
> things more simple if we keep everything under the x1e80100 umbrella.

plus sticking to x1e80100 will avoid angering tab completion :-P

BR,
-R

> > [...]
> >
> > >> +  vreg_edp_3p3: regulator-edp-3p3 {
> > >> +          compatible =3D "regulator-fixed";
> > >> +
> > >> +          regulator-name =3D "VREG_EDP_3P3";
> > >> +          regulator-min-microvolt =3D <3300000>;
> > >> +          regulator-max-microvolt =3D <3300000>;
> > >> +
> > >> +          gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > >> +          enable-active-high;
> > >> +
> > >> +          pinctrl-0 =3D <&edp_reg_en>;
> > >> +          pinctrl-names =3D "default";
> > >> +
> > >> +          regulator-always-on;
> > >
> > > Drop this.
> >
> > Oops!
> >
> > [...]
> >
> > >> +
> > >> +  edp_reg_en: edp-reg-en-state {
> > >> +          pins =3D "gpio70";
> > >> +          function =3D "gpio";
> > >> +          drive-strength =3D <16>;
> > >> +          bias-pull-up;
> > >
> > > bias-disable, maybe ?
> >
> > Yeah, probably
> >
> > Konrad
> >
>

