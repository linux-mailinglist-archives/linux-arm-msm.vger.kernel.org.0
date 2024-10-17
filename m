Return-Path: <linux-arm-msm+bounces-34735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A83789A221B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2286C1F225EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D751DD0E0;
	Thu, 17 Oct 2024 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dNWL1j/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7351DA0E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167683; cv=none; b=gO9PMvn5AAkMRLAQ2M+vZAWkAIxhb1DxwteuY748QpGvWnn+wRE7IT+8Zc2BxfPhpPvEH38BMdmAI0N9KkahRYulMPL2AfBxYbtOu+0UTEOKXuRi/V/4eIGCluhyJX0teX35ePL5wJ5zrPymV3OncE2hUpbZByv2oKiU1FTweAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167683; c=relaxed/simple;
	bh=TLpRYug+jRkcc+6bUgddKf7OkvULgear2yUqG7Xkl4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mphWSuW2f40OqPYtQ2jKFuFd391RSXRdgfceHMoNdmVMS9ZfaNvv9PcQwYR9yEUeiO6EZXn8aD2hXH5oR3oTJMcQus2nY8TzvsxBz2QGn5kgMgJgAOHDCfjyz1vi5VxbJJKOxLITRjr9No5yaF35rY2qg0fP5vanCLYqddI5avg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dNWL1j/w; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so9738221fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729167680; x=1729772480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3JftuYkmaOD+FTGiAk1je2e2cGUJTRB0pcGXg4/Rqc=;
        b=dNWL1j/wQwjiDOQ1QJt492EYY2jAWzieG9QX8uvaSRFshPgnJfXRJ34BzMX9v+t8cn
         br0OBMlBA4wGv/HQU6suXN31H4idv7Kf/BnGtOh/zPgIFOnDDQAknqbXvoeebuAMCd2R
         ykd1i3y8ylt+nQhlc895IcqJMmzDnacC27G8nLi0vGHc+AgPDoJRxc3ixg5BBHYoBz5V
         MY/uOx2q3npbVOyhInHKqChu+I7fxNEv8Ln0+FN+cuI96PjK5j0pm18uM0WJ2976mxVN
         hjXnBmQ+8ZnHutHGtwLAwZreua160hFF2TJQRP41l02hEV70Lu1Z4PptxTiBx6bvkJcH
         3m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729167680; x=1729772480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3JftuYkmaOD+FTGiAk1je2e2cGUJTRB0pcGXg4/Rqc=;
        b=eNTk760FnqIL4N4mkX99wxbrQMqymOc/gx9q6/65iSF48TDzwV0nafFPmG720DBw9K
         IsDyDF8CGaycpGX47mnl/hrYOn5+fktgmoGu8oL9t0Y1ovDJU/Rz6zM2hA89qqBcSacm
         0I17nYXG5T7Me8HEWMapj5B1tQLavhz0Bly+v+b3g7umBig6MXAtGAP5QCuedZ8GCCv1
         CABK5dKE4aDTMAX2tebjFJH8qBpyLw/0iTXNEJdOcWECg7qRMaL+DcXMPjmkUSRI/aJ+
         gs2bGMJbxT5XfmJY7Z/3NCUDoPMAIoxnxRye4kewYsRpE1isDXS2Vmgv9ElmSou9UaM2
         6j/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXySDXVeJYGwP9eAx0tqG8XkotOy+1E2xO6m67BZyI/Xnl4QRhxB7yYr8rWemK/sznSDvVq6Z2NMEAshlKm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbjix2xxkpbqxa7aPl57TZURZaeHuYOgpK5eSOHt/x7d/4c5n9
	V6QJnfWTLO9szPEayLGCrkUO2XOynqT5L+jF5EBSUYUYu3uS0opP8ku0upmO3P/jRhYbnBqySrO
	Oyd2rKHgmugFXh9TbDXswf97xPkdvaxUjRaVU8w==
X-Google-Smtp-Source: AGHT+IHLGi5nxbb1txYuw+MIyNFfnuRnXLKNo6JruGArclVxzTrWsQKk8UE5+NJPE7ge5jI3Pag/GlMt2/gHbT4TstI=
X-Received: by 2002:a2e:be21:0:b0:2fb:50e9:34b4 with SMTP id
 38308e7fff4ca-2fb50e93dfamr72979481fa.8.1729167680258; Thu, 17 Oct 2024
 05:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com> <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com> <Zw_dE1rQ-Ljsh-sY@linaro.org>
 <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
 <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk> <CAMRc=MddPDFaw6vYo1FzXHbUsLyr2QKT6oy2i68ZCdJdFWCJww@mail.gmail.com>
 <a14e5488-d0e8-4f04-b419-0b4c566219bf@sirena.org.uk>
In-Reply-To: <a14e5488-d0e8-4f04-b419-0b4c566219bf@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 14:21:08 +0200
Message-ID: <CAMRc=MeYDi0_+y7a-KQhh=ft4rstng5H24LJBgsJg1BdXfc-nQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 2:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Oct 17, 2024 at 01:28:00PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 17, 2024 at 12:59=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > Fix your driver to request the supplies that actually exist on the
> > > device rather than just some random supplies you hope will work?
>
> > Let me rephrase: the device has this supply but on this particular
> > board nothing is connected to it. It does sound to me like an example
> > of an "optional" supply. Do you have anything against making it
> > possible to define optional supplies when using the bulk regulator
> > APIs?
>
> Oh, right - please if asking questions ask a complete question rather

Sure, sorry.

> than having a long email thread and adding an "any thoughts" at the end
> which makes it unclear what the actual question is.  In general the
> expectation for optional supplies is that you will need to do something
> different depending on if the supply is there, that will tend to mean
> that it's fairly natural to do a separate request for it as well.
> What's the concrete use case here?

A device is wired differently on different platforms. It requests a
bunch of supplies using devm_regulator_bulk_get(). One of them is
unconnected on one of the platforms resulting in the "using dummy
regulator" warning.

Concrete use-case is: make all but one regulator mandatory when
calling regulator_bulk_get(). My proposal is extending struct
regulator_bulk_data with a boolean flag called "optional" which would
result in the underlying _regulator_get() receiving the OPTIONAL_GET
flag only for the regulators that are marked as such.

Bartosz

