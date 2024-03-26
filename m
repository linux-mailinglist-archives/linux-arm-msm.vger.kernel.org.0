Return-Path: <linux-arm-msm+bounces-15235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DF88C971
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 790A2B24F58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 16:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DF51B285;
	Tue, 26 Mar 2024 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tbx9eszl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46CC171BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470791; cv=none; b=poUQ0/zphOBKG2DwyP7S50MgKgVq8KxYcdN/oUlRyPXVCe16utC099WEGN8hCuM6nVORS+aFfVC92GBF8iaBcoXjeHS5LclTDuHzYKMg4GOPuWX6jblvyYdhtx/Qh2jHywSlUe9N8Jnpvbv9SC4DeaWobCdFkw7wUxflZkuBk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470791; c=relaxed/simple;
	bh=lVoQMVplppCC3bZfzFJMPRwm9a5E9DObxpQyJv4ei/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRFsZIg8iQDncoJnxRO+VO0f2Dtwi+cfAUT5KSqa9kSp989UY4XFu5QQpNU6BbOW9/z+/+qvSj3oJP9Dc0x6aNoUmoam/OHe+FgQPzsdqr8VFk5ylJnabsD6C1uhs2qxooFP2+8UzBaaLfdK1f+1ExbUP0BUqAgOYknp1IPraC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tbx9eszl; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so59435571fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711470787; x=1712075587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ6jS2CUTKGhZdxpuXUPTr0agZibBpPyyI13tXK5e6s=;
        b=tbx9eszl0cv3hSGR2z5T1MUqNEFMqOK0hvuUXK4rky/ZLiX7/ruc4w35Wa6enxWLhy
         jqYTQ6baqOYwBEPfw8EyZsa1IaqSg7IlHG+YqWDCCA0rIkEN94Vbs5U6ww3v89vN1w1I
         0nqGzNdcCZSF0zAp6TSiu46brej3P99kOXNi4PRIAzaw0yMELlRpmcXliW4+4QxY+LtV
         O8xrYDYrVS4Up40ecp8dyuj/sICiqnVfBNZVkxQg6hmXUnZFDaK/qkfK7cpzxGt63mcL
         eZAhX6x/1ghz8UjnhKhvM95t5Bgtrh5YH7RDfBvymF0vUdIjbVmyPCYnXR5AfFfD5PYR
         BD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711470787; x=1712075587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ6jS2CUTKGhZdxpuXUPTr0agZibBpPyyI13tXK5e6s=;
        b=YNSkUrPL5KSt85hIWsR7MoUQoIAzA5muQGyDBJ7EaISgm+YPk01VAJD7fR4yoWDHBy
         RZLZ+t9jvjlSUutKMWT6yUC15QZzfw5dWjYFv/usowhpMwXbl4b9N1emadIn73Eqozgl
         e3kEp1sdd75d5ktXrbff7kL91va1AwCQz4GIKfcgivxjAq5GGuaK7FNXNSEk6+eXZAlH
         Pxg0EB6qGnCMP6vi7OXxlKmlWbuhLX5UFzNWBtE/b1z7k+SnUX5CMMPtJK4XLn0gqJMv
         Un/QkBofraC+xYIwpT6/JnKBEoqJkSCwyOeFc2c4fdXhr8U4aqRVFVLeqlL0MWolEnG8
         PPqw==
X-Forwarded-Encrypted: i=1; AJvYcCWGRurTY50pbuPvGw/ZtsGkwDozTpyDtWyAsYstqpMKxkuIZlPB/29NVQSVj6CLAYI+hXSgcoK1isdXawsb15nBUlT3eMUU1EFtQuyBuQ==
X-Gm-Message-State: AOJu0YwnM67ue+q4DsEdiRm4qRrIrDdDbP4vZLGjcLjzzIULMr0gucMq
	5MZ1zonwUHX44b+gMlkVbNHS6hQYm4p6IGZmT0KPilgfze5gUMt62VFE/qhNPuDKPOAAliuZA7O
	8f8fIkazv6EbVLQw+pVvzioEip3mI2LMh7SqVkg==
X-Google-Smtp-Source: AGHT+IEPlW3Mndd9DAskKl8BnO4uLoQgb2fvBGrOQCORYGpNt3ZO7pjyZJGUAGM4Jnm65aupzhhwN4AXLf4B/UzV5SQ=
X-Received: by 2002:a05:651c:210b:b0:2d2:4477:6359 with SMTP id
 a11-20020a05651c210b00b002d244776359mr800282ljq.7.1711470786783; Tue, 26 Mar
 2024 09:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325131624.26023-1-brgl@bgdev.pl> <20240325131624.26023-5-brgl@bgdev.pl>
 <87r0fy8lde.fsf@kernel.org> <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
 <87frwe8jiu.fsf@kernel.org> <CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
 <874jct10yf.fsf@kernel.org>
In-Reply-To: <874jct10yf.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 17:32:55 +0100
Message-ID: <CAMRc=Me5ef_kFDz0SyGZb4S+2Ma4i=Fek_tzwj+bYD4DGSV4mA@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 4:12=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> >> >> I don't know DT well enough to know what the "required:" above mean=
s,
> >> >> but does this take into account that there are normal "plug&play" t=
ype
> >> >> of QCA6390 boards as well which don't need any DT settings?
> >> >
> >> > Do they require a DT node though for some reason?
> >>
> >> You can attach the device to any PCI slot, connect the WLAN antenna an=
d
> >> it just works without DT nodes. I'm trying to make sure here that basi=
c
> >> setup still works.
> >>
> >
> > Sure, definitely. I there's no DT node, then the binding doesn't apply
> > and the driver (the platform part of it) will not probe.
> >
> >> Adding also Johan and ath11k list. For example, I don't know what's th=
e
> >> plan with Lenovo X13s, will it use this framework? I guess in theory w=
e
> >> could have devices which use qcom,ath11k-calibration-variant from DT b=
ut
> >> not any of these supply properties?
> >>
> >
> > Good point. I will receive the X13s in a month from now. I do plan on
> > upstreaming correct support for WLAN and BT for it as well.
> >
> > I guess we can always relax the requirements once a valid use-case appe=
ars?
>
> I think we have such cases already now:
>
> $ git grep ath11k-calibration-variant -- arch
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:     qcom,ath11k-calib=
ration-variant =3D "Fairphone_5";
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:              =
       qcom,ath11k-calibration-variant =3D "LE_X13S";
>
> But please do check that. I'm no DT expert :)
>

You're thinking about making the required: field depend on the value
of qcom,ath11k-calibration-variant? Am I getting this right?

Bart

