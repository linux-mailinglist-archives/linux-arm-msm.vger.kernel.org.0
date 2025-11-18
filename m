Return-Path: <linux-arm-msm+bounces-82249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE255C68BFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C82E94EF5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853E133BBBC;
	Tue, 18 Nov 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9cmm8Bs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458133BBC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460829; cv=none; b=mJRBsz854Ue3PkxyH6W5F718RvPTle0QDU2VbiOwsegK4aCPXDcqCzJW53b6LTJRdCvZcg3nNqu4dt9p0u46NGQzfkBYm4ZP2lhhAr/qoEFGmm0peWuDZ8mgnBcDtjVV/bZIA69ZAn/wvCluSLH29fAic8oZ9JNSXyisUw7FELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460829; c=relaxed/simple;
	bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxdIzg/fAOg0dFUTh3CGInDFnGxJklUVO582nrSHfID9MBVzCHExAEKER+YaFk4zCvss58K3+smeROmOonozV948cTeBUMmJUUWYrQ04rmH2kK43Mbs45iwuqzLGi04ZDdGX8r99/pkq79Zny+TgjzeJ8/ZQeaciu1YcnyJL7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9cmm8Bs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7355f6ef12so905766166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460821; x=1764065621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=Y9cmm8BsFk0UIt9LTXQ4X+ZBSdO7Sg/SdvUL5WStCnKBy5XT5JLPAJW2pFO6eg7IId
         6qL0vWAxmIrRfZkeTk9T3W9biEwYiblf0dVNhfSwC57/mdnA5K9koyWzkUP+ObNjC+Bj
         yXQbgknBo0KtnEUrd2bivKnK9byPVlZq3Y0bgByvdlIrjnBjRQdrVoqMkAAO+PxPajqo
         ASDohyxFrvYfJoIbMfN+l+/UniVTUb/wDv+E64ZnCc73iuxldKr5Gormu3lw30+u9TDD
         UxB+ng3pH6Ezf4ctVPDn8BftG+JQ398dgi3DLtm7wizmpBniiNzAajR6HhpRevJfcfD7
         h75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460821; x=1764065621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=cgAl93ZQEeS6LbsC9fUO43iUAwdoXGo35WTR2yL1xnRS71tdmCNtgSQDq8h1PvBb+9
         0AYqxyBIGhVRfi9voSzOGYk9yHRwvsX2Veh7EXXqnpZmo9Hm1rUPHmkqQzKtZGXzFNzd
         uE0S/e+VpVQcP3l8u5km/C3kmYg+Wa9rh9SL6J20djJ6Z+lHSxHScRacfBrbM5VqHM7d
         /SSc3aYvEzWI6OfgpNaK9LwuQqOI5ZEbfT8157GkzCiB5yUqHX3d0hmp2iRwRhwaApLV
         gW+S0Z2QfeB51MMTWAO5/CiHib+IAzRmtv5cyUg5GIIgoxSRXFSxOFW/JdKddiSgITkp
         rOkA==
X-Forwarded-Encrypted: i=1; AJvYcCWMuzs7MkZj1rEIh8lvFlhgruV+h74qGtrD8ufGJ5oca7bKBuclqzpIS/AnpbuxAaAlWTubxIRxbdVqnKWx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52I8j6y6WaNk6kTBz6kc8AvHhSNkIEuhprAiLD/IMrVOQlooZ
	/reZcuhr+B9V0pDBeIgmIXWt2wdzc0RzRXAhgXU3PFSCleXGbPUS0CwZ5WfulccrtrjNoclDMeB
	fH64I3C0bwv9DrG9xSw+mIZuYDhrQCEQ=
X-Gm-Gg: ASbGncsbSpquw6lGl44u9v/O5ChqDuduzGlr5lEDbKTfd0I2U7EgCMkjGfkFGAX2q2K
	zDGcg9ILT53cnIVCGget8H9fIyCwvaQGizg0oAAXHtpYHiWBw3Unsaq8LfAstR8EcWHpVVmWdI1
	7aQLmo3XV1mSjbca5GIOj50S0zaDFmSVxt/FXdcwIQeye2D1epOdgMUFQvsUYmyzWPhROZcB/nR
	YwefN3e5azGIGMXkpf67r4Pfpjp5NLftqqx3N98tq55G2FrMuKhGns+8uKiJO51ku1MrEC/jIAf
	Cl5N/TiO5yq9NW0hut/fuBT0xrTaCqu4tSTuuSu4xuh+/H1Lofgbu9wNNgKf
X-Google-Smtp-Source: AGHT+IEJTl+Y0nxnsqFxRaoeNJlW33h1PhyfMHfP+H08fkNstExAh/KMDUENdNIJwaldyRxp9vjkOUQWvebpfsJzkrQ=
X-Received: by 2002:a17:907:961a:b0:b73:1baa:6424 with SMTP id
 a640c23a62f3a-b7367bfbedemr1652125566b.55.1763460820308; Tue, 18 Nov 2025
 02:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
 <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:13:03 +0200
X-Gm-Features: AWmQ_blpLOjcJSfageDQJ0p1yverbXLRzjhug3ph18HdqFCZGe_i141QG5p4Fcg
Message-ID: <CAHp75VeqaZ9BOYaEDdrShtZ=5o75HmeKBHv9dpiYpQLudCr2Ow@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> > On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:

...

> > > + * True if @str ends with @suffix. False in all other cases.
> >
> > Maybe added "empty strings never match"?
>
> But they do, please see the test.

I also think that "" =3D=3D "" (on the same page as Bart). Why should we
make it different?

--=20
With Best Regards,
Andy Shevchenko

