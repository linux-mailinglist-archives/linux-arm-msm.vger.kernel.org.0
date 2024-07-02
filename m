Return-Path: <linux-arm-msm+bounces-24876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDC923C2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31BC6B22834
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CB415B0FF;
	Tue,  2 Jul 2024 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BHvmyow5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E415ADB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719918804; cv=none; b=OCbgphN+ulQ6xLPn2645PAR9hH7e/s7Pv8Ryj5ehDBG5YvuhCrmFvPFkFEfVWxbO4KwadcdybVKvfIZtW/Yik+Xx9gql+Q2wOMlV2UXNLJYCUz1LyXwitNMH636QNIYB2HOluRoA+QSVxlmUqqhUTvaNjthgHQeJjtPy9Udpapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719918804; c=relaxed/simple;
	bh=FEzAZrinYSgKqWj7/IxtBzwbjFB433v1SrOlmQnoOoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKkO4qEtPTSe589p8qNM+vscfFKNJYPP7lSlotJXGvHFyIggtzDQ9epZo+t3ln4Vq0Wwko59Jc7mOJn5tuV57LYpPYVs1QGtphxsKl9uN75FzvZFIE36T5QyCphyaLXS9dtT+PU8xybkT0OHscgvLUanJHVEU9ZTePvzgRCrAEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BHvmyow5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso37863401fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719918801; x=1720523601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXVf53dMq+GkSsb1wJOBeHG07AED2HZbgsgsqvcOurk=;
        b=BHvmyow5VSDCWyaG/E8V2S/FSAr+5B5KYQvEn15kepsagWycTwV4RoY80PMa/ZBCd8
         usItgf1tLQNMRJ0KG6722Sj97+MbQyp+EEBUBMqShfPe3Xgns3MOdB+6wiJWsbx1AnOV
         12IUwXWJvO1hYExajfW+shSWJqknd2uJpi5EAWqgO0qKbqPQ6SCCPpV/x0AeZpfcf1mB
         b7thrV3CnSlPFiAB6pdCykN3OvL8kggXsrwiLKL3bo/ZdIlA5OAih0UpI4c+iUARpnU/
         G0Te4exf0zwF0Z1441/ouSkyN+8Yqcb6H2w1/r73JgHT5iNjXtWH7Bi4T1FT5wJu67ZM
         kwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918801; x=1720523601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXVf53dMq+GkSsb1wJOBeHG07AED2HZbgsgsqvcOurk=;
        b=ftdgXGN7GP77CQrr3Hq+QIK6u6AD2dSmudOzZ7S/7otMqwkXikgOCz5Q6AtbnQa8jG
         MoKCPu4aAnau7iBi92Tc3Y3QmRKSTfzTgO+irGFPz8xi7U5rejbu8F8JY5oCiGfL8idm
         TZPqPrKfRNK7JfF/9rVLTJ4S3IJB4Ag1nwUHfOOH23bk6BLBfY38UVYooOCkEV7pKrn4
         DFaqePg+tWjI2DhCu1l0OiGnOSQCH+Av6qYQP01shig7EQY8r2fX3LGN7Um3sOhZKpMn
         SD7Th4kzJg0DN4qtLMVCl3PipYfUwbDasZDxMT2zNAmfofMOA0tFrzmsotU6zg1FL+4J
         jouA==
X-Forwarded-Encrypted: i=1; AJvYcCWFuGKe5RWXaTFp7SvPiUfL+TiEXy1Ra39RlQlmbrfwwpZoVAE5JaMtrE2NMHSoBJ60oP/+egjWd2GnVyOCG3gF647WvAfzfb3I7BC2OA==
X-Gm-Message-State: AOJu0YwLjQrKl+OcyLclr+gtipRBwqnxBeB9ShlJrmuHb3Re/XkrE9R5
	sFIGEv+jvEP1lNs/6ISnGMIW39TtMCSNx1Xv8sGGo8PmXPG1OOCRHHnkNlzwm5tGz97ibOXafSK
	3iGt+WoecuOzmTtDGo1qU3fp5QFOZFHs37R8AXw==
X-Google-Smtp-Source: AGHT+IHvjCTeQ1yMSQAKmkjAiUyEGF3PJGfRktiAFT6n+uk73noO/r6tMhHeUlrkzOcuFyqs9Y2EcNw/jRZUcS44wLE=
X-Received: by 2002:a2e:8e89:0:b0:2ea:ab3b:fd89 with SMTP id
 38308e7fff4ca-2ee53bfa81amr35042901fa.10.1719918800733; Tue, 02 Jul 2024
 04:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702091655.278974-1-amit.pundir@linaro.org>
 <8ba07bbf-e8b1-4244-882b-ff2575368b20@kernel.org> <he7q4mzj7u7t3c4pndu565m727e6hqpf2srrqgbdltjdffugdl@x3xrwteqpki3>
In-Reply-To: <he7q4mzj7u7t3c4pndu565m727e6hqpf2srrqgbdltjdffugdl@x3xrwteqpki3>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 13:13:09 +0200
Message-ID: <CAMRc=Mepx86sQmPYLq2TkvhxtwUtsQGeYTVUc585oiuvOzLc-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-hdk: add the Wifi node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 1:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Jul 02, 2024 at 12:42:02PM GMT, Krzysztof Kozlowski wrote:
> > On 02/07/2024 11:16, Amit Pundir wrote:
> > > Describe the ath12k WLAN on-board the WCN7850 module present on the
> > > board.
> > >
> > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > ---
> > > Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add=
 the Wifi node").
> > >
> > >  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 97 +++++++++++++++++++++++=
++
> > >  1 file changed, 97 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boo=
t/dts/qcom/sm8550-hdk.dts
> > > index 12d60a0ee095..c453d081a2df 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > > @@ -279,6 +279,68 @@ platform {
> > >                     };
> > >             };
> > >     };
> > > +
> > > +   wcn7850-pmu {
> > > +           compatible =3D "qcom,wcn7850-pmu";
> > > +
> > > +           pinctrl-names =3D "default";
> > > +           pinctrl-0 =3D <&wlan_en>, <&pmk8550_sleep_clk>;
> > > +
> > > +           wlan-enable-gpios =3D <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > > +           /*
> > > +            * TODO Add bt-enable-gpios once the Bluetooth driver is
> > > +            * converted to using the power sequencer.
> >
> > I don't understand why hardware description should depend on the driver=
.
> > Either you have this GPIO or not. If you have it, what does it matter i=
f
> > there is no driver who can play with it?
>
> Then there is a conflict between BT and PMU, which both will try to
> access the gpio (or at least the pinctrl).

Ah, so this slipped through the cracks. Amit merely copied it from existing=
 dts.

Yes, there's a conflict but Krzysztof is right - we should handle this
in the driver, not in dts.

However for that we need a patch for the PMU pwrseq driver first. Let
me cook something up.

Bart

