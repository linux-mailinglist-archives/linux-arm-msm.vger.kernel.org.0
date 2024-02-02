Return-Path: <linux-arm-msm+bounces-9549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C184710B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 14:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49611B21BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 13:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2353C4643B;
	Fri,  2 Feb 2024 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a7fClUo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB545BFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880244; cv=none; b=iZo+kV9k3BSneFaWkwlHJm8HO+z0Mfs4xITcLtSo2anVmt973Lr+2cpkzVkCW9S2vQkdXgQTwiJmw9+386CPhlcMi8eMIO4ApcyYv+RQxKkFAPOJ7mbpGO0sdgCQwfZzVAjeMvO3KGRDoB70ZKKUnIj2Vpe4a0IopDrZSh6voA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880244; c=relaxed/simple;
	bh=UAaor+OvHRxZyb19OeeiMq5YPyGKff5Y3t7zNK5hQio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NR6ShGBNncISuWsQAv4vy0DpKUW2NRrbaD+lnzl0q7hUSvZmcdF/GSnKHNUqytF42QhzEu/6u2HFbrTuA3tJ2CfS1LenfxxANC24BZMWNJxgakA+ePMBmBLb8CZ3faOYy9gCu4fI3ep22gBNW30NyGHLUnAXJeuiOd2uzF1GGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a7fClUo5; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-46d0266391bso152453137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 05:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706880240; x=1707485040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz8xZTKk1yx3xYmAtNA8p+sXodOnGKPr8O/375rWSU4=;
        b=a7fClUo59NJhPA1ErWnmZbE5HKGKf57H4BEv1vLgB2psSSIcIWWk3I1iXkcfktbUJZ
         62hvTvJoBSPygBbjVX1KQWQUqGJorUBVr1PU9yxWqBXKxeWqjng+RtSXcGiB9JixOJ+3
         A1FBrkxZDkyxLxvwphZJXDPlsxXT1/8OwxUp0tMnzE0/zZr7xjtbqqP5e+XYFgbNqHtf
         XyJ97MBpySHM3fhyy+AQzkxDR8mBlC+OmjCWYj6KNZ+g6lDoI6eAakzYTEtesrUvU5aB
         HXDoJllnInkzI37vPC1tesNuCBReeE+m9Miw/t/31oDWKk1YHRGz9xSo9Tr171Rsfihe
         8p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880240; x=1707485040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hz8xZTKk1yx3xYmAtNA8p+sXodOnGKPr8O/375rWSU4=;
        b=j5hvv2s0L2VPsXV8cbIKeaILaurFlJoOa3R+OmaOtdoPyUuOnfrYF9zJYk4k1Jj3/T
         lHqiZCZ+qSzp15iJLblAV99Rai8fMRHpz77lf84COOMEjOjOLu7r6nn8dNoiI42r8F1/
         Ogs1faGqcnSjKAXAE4ClLLq8ATth7KX14FHvF7Yc/uA13jTx3JbgdMdZM0mKXWq/Pxkz
         IfqpVc/XHRLEnWxHvbbyjrQyZdKE1LoHVg1Y3Xxecps3Ri/pIaR07+OFiwRzEmDTbTL2
         A6DTdsMqHzRwgzituZJX+7qFFXWzzNnzFooaQ06StzxBdc7+/dgv5LiNT4xxmtzAvCqz
         eI9Q==
X-Gm-Message-State: AOJu0Yx6HrLjJS581v5ZUX/PU89gqivZY+Q8DU7n4ef/ZDMxZGPgb38V
	bcjddRhFyBtpTRhjBd1mVr8O8+5ymLEgN9Mcz8mMp1VB2cU5nvDhz4ueYiWMmRVXhdc/jnzawkw
	xVTqpCmLM9BDyhO2Bc04pZ+KEYMNRjCpasDbRnQ==
X-Google-Smtp-Source: AGHT+IFW4i4ANf20+Aj8hI0qnUo70/DfClBMexuJC+KQ5QvWnmdXsoNCitjgC49/m3KRH0I430Kb7cSQQ8+F2edsC+A=
X-Received: by 2002:a05:6102:3e1f:b0:46c:f805:eb7e with SMTP id
 j31-20020a0561023e1f00b0046cf805eb7emr5536531vsv.28.1706880240522; Fri, 02
 Feb 2024 05:24:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201155532.49707-1-brgl@bgdev.pl> <20240201155532.49707-3-brgl@bgdev.pl>
 <5lirm5mnf7yqbripue5nyqu6ej54sx4rtmgmyqjrqanabsriyp@2pjiv5xbmxpk>
In-Reply-To: <5lirm5mnf7yqbripue5nyqu6ej54sx4rtmgmyqjrqanabsriyp@2pjiv5xbmxpk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 14:23:49 +0100
Message-ID: <CAMRc=Mcq8a7T06DaX9nirfHOXPs+Bh51rKgO3FksxKH+Hph2FA@mail.gmail.com>
Subject: Re: [RFC 2/9] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 5:34=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>

[snip]

> > +
> > +             wlan-enable-gpios =3D <&tlmm 20 GPIO_ACTIVE_HIGH>;
> > +             bt-enable-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > +
> > +             regulators {
> > +                     vreg_pmu_rfa_cmn: ldo0 {
> > +                             regulator-name =3D "vreg_pmu_rfa_cmn";
> > +                             regulator-min-microvolt =3D <760000>;
> > +                             regulator-max-microvolt =3D <840000>;
>
> I'm still not convinced that the PMU has a set of LDOs, and looking at
> your implementation you neither register these with the regulator
> framework, nor provide any means of controlling the state or voltage of
> these "regulators".
>

Why are you so fixated on the driver implementation matching the
device-tree 1:1? I asked that question before - what does it matter if
we use the regulator subsystem or not? This is just what HW there is.
What we do with that knowledge in C is irrelevant. Yes, I don't use
the regulator subsystem because it's unnecessary and would actually
get in the way of the power sequencing. But it doesn't change the fact
that the regulators *are* there so let's show them.

What isn't there is a "power sequencer device". This was the main
concern about Dmitry's implementation before. We must not have
"bt-pwrseq =3D <&...>;" -like properties in device-tree because there is
no device that this would represent. But there *are* LDO outputs of
the PMU which can be modelled and then used in C to retrieve the power
sequencer and this is what I'm proposing.

Bartosz

> [..]
> >
> >  &uart6 {
> > @@ -1311,17 +1418,16 @@ &uart6 {
> >       bluetooth {
> >               compatible =3D "qcom,qca6390-bt";
> >
> > -             pinctrl-names =3D "default";
> > -             pinctrl-0 =3D <&bt_en_state>;
> > -
> > -             enable-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > -
> > -             vddio-supply =3D <&vreg_s4a_1p8>;
> > -             vddpmu-supply =3D <&vreg_s2f_0p95>;
> > -             vddaon-supply =3D <&vreg_s6a_0p95>;
> > -             vddrfa0p9-supply =3D <&vreg_s2f_0p95>;
> > -             vddrfa1p3-supply =3D <&vreg_s8c_1p3>;
> > -             vddrfa1p9-supply =3D <&vreg_s5a_1p9>;
> > +             vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> > +             vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> > +             vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p85>;
> > +             vddrfa0-supply =3D <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1-supply =3D <&vreg_pmu_rfa_1p2>;
> > +             vddrfa2-supply =3D <&vreg_pmu_rfa_1p7>;
> > +             vddpcie0-supply =3D <&vreg_pmu_pcie_0p9>;
> > +             vddpcie1-supply =3D <&vreg_pmu_pcie_1p8>;
>
> As I asked before, why does bluetooth suddenly care about PCIe supplies?
>

Yes, I forgot to remove it, I'll do it next time.

Bartosz

[snip]

