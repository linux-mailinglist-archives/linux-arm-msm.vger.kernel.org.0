Return-Path: <linux-arm-msm+bounces-26607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0A937276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 04:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358171C20E3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 02:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E6515D1;
	Fri, 19 Jul 2024 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieU/1HHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6CA20;
	Fri, 19 Jul 2024 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721356319; cv=none; b=e2YvLbunHHm2yHKgKVu0kh+HR/W6qXG42kT/UScHfCPNeMkKlqrkGuIparBHTJNdx6liyPKEAD0MUipqFrT5vxxcsUj9rgiYI2P8BOM3fb82osxr8/+iGsz+HR3x+gUp9m2zH8IXkR/C3Q3oI/Ll2VaTNM+WePew6AXh47jdLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721356319; c=relaxed/simple;
	bh=1eHruuzyH4lwVbohssPdqsbHPvnfHUhQv4M5I9WgDSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsrPgPIWPjd2dFbvk8MEfM/m7FKB4dHNxLDJp4AruVNfTEM3JvOSExqGa3mudI4CvENXwMOy4BkO0aD5P2GtBmjQ1aQTJzsRvZtXNlzykvnZc2xJTVlqETOmrhN5xZejLHJhxoX3fznzgTYNRhjyRifwQdM+CQzikvRevTuOwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieU/1HHg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7b237so482987a12.0;
        Thu, 18 Jul 2024 19:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721356316; x=1721961116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSfCpRvrtDUA7KWTei+7BsVJMQHuCFn+vDpvi90vOF4=;
        b=ieU/1HHgpoCNW8E/mF8VVcP8ZPrtvXxpFCXNwt/hSxhzKtmYCO8kNHPEpROwIyDosd
         wIv9+HRUSYeYE2KthPnV3sAoX8PclEFLR6ncEXyr2mVkoLpV7qK+leAHXVvQg+2S63Z9
         R0GUd2nQYFRzA6FAzgBUthes4dlpu12YkIUkG8wMhmRQ1PnRj0NU3lpxVpp+K+yH83fy
         b4hOEXgamBHvnqG4Z8oQs/14UrQ6voPun+wInQhOATJYPfPsXpTWFESw17qpQ3RS/wfw
         lcbUWVut5JMVj3OQB51ad+B3nN/afBqiW/ZC9lNHCaMrExDqxaToc9fe/ZoqVKHgI8io
         9CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721356316; x=1721961116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSfCpRvrtDUA7KWTei+7BsVJMQHuCFn+vDpvi90vOF4=;
        b=SAY3h590U2yZihlufR4OBVFZNcyyOKraihLR9zVaO7xhy6aijCsqa4JaVeE0vW9led
         nEphEKjKRcbKl2RGv9Z3PIa3cFXJXSqp7gs1X5REohkBmWAY48YSxIGRQtGM48+xgnp5
         VxLDVJ+H5gky54yn7tfrgkQwgucTfMcZeT70zgZhbUeNkj22i7vJOqJl9rABI83aENZU
         h5kAfsjvvkJnFH3g9Xi8/qTJR33CzocPleUvNpdqXDYbOms08wXqMeXJX19K7Fyoxuxz
         XA7e9XeV7iWuiSPZ/zyRswk9jX7qsdGgUJtWGitRhJ7hBw9PnZNXrSohNAigzfuPO/Mp
         sB7w==
X-Forwarded-Encrypted: i=1; AJvYcCVil6DulxiCmqfqi7sFRpa2xyJOsNwbctTnLNLJYDzVbjP7JcvinEY7Xa/P88EuIU43K/wXoyQcOcrb81YWshw1jrmvECaWxUtpw6pTAqRZtK0GB8I+fxmTeGfbjyNGHaGOFKGO0Y6Ecw==
X-Gm-Message-State: AOJu0YzimMabUBfbjTdmFl+gbF2axzFkRq8ImrtMY0KIwxjPQprKbE93
	HFR3ZxbKoroTeEiXGgoiYJ00zXKG3lk5XpZ8u0WDxy2RQKbKwy/AuWW48CKtR0/NHhb+RXg2hXJ
	7ZhAIHKDtgjaTCFbHhD2m3J+jvuM=
X-Google-Smtp-Source: AGHT+IHogwOAWIPKyeUgS3+HdTK+jinx3AZCocYx/Cb3OOAO1gebXjmXvBJXRfrSeVJUQRBwiIx9Hks/wleUwHNi2iU=
X-Received: by 2002:a50:a693:0:b0:5a1:c43:82ca with SMTP id
 4fb4d7f45d1cf-5a10c4386fcmr3672605a12.26.1721356315939; Thu, 18 Jul 2024
 19:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718184434.6307-1-robdclark@gmail.com> <20240718184434.6307-3-robdclark@gmail.com>
 <CAD=FV=UDopTSfpfzjUDPFQKyhUTNOk9z_Q5qnH4Up24M0xZoPQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UDopTSfpfzjUDPFQKyhUTNOk9z_Q5qnH4Up24M0xZoPQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 19:31:43 -0700
Message-ID: <CAF6AEGvz8ZaM7a0_jVqT-zv5QOEznqrOHd_1zQcDQcQ5uM-9UA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
To: Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Rob Clark <robdclark@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 4:12=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 11:44=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Use the correct panel compatible, and wire up enable-gpio.  It is wired
> > up in the same way as the x1e80100-crd.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b=
/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > index f569f0fbd1fc..37ef05f8c7e0 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > @@ -592,9 +592,13 @@ &mdss_dp3 {
> >
> >         aux-bus {
> >                 panel {
> > -                       compatible =3D "edp-panel";
> > +                       compatible =3D "samsung,atna45dc02";
>
> Instead of the above, I believe you should use:
>
> compatible =3D "samsung,atna45dc02", "samsung,atna33xc20";
>
> ...which makes the dts work without any code changes. This is what we
> decided upon for Stephen's panel [0]

sure, that sounds reasonable.. I only saw the first version because
that is what is in the x1e80100-next branch atm

BR,
-R

> [0] https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2=
f658a3@linaro.org/
>
> -Doug
>

