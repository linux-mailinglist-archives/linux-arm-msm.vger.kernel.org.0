Return-Path: <linux-arm-msm+bounces-27416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A7941451
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 16:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6BD71F236A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 14:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE27B1A2575;
	Tue, 30 Jul 2024 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKy6wAdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE831A255F;
	Tue, 30 Jul 2024 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349603; cv=none; b=iJN53mDU5625bUOjuHGir9ZIJtvYpAh1J1/XoktP8l3ia9rD6F/3dS2nsiEcKkSVeagl7x6wgC6U8UkyMrwsaKLADOyvzNrAlW0fc8bzQ7YZaktiKmsm/swHjXBTmW/NjG5ObzEdG8edlKV6sFHYjkFMxqeV6BvZu3Kv6QxpMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349603; c=relaxed/simple;
	bh=Qt/UfB4zNTUWDjBkoJRjyNL0poNjeKX274lJz+2B3A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ci2ECKLXYHkWTlong34DA9hpE9xjo1YAfwDqEdVE7iV6U/HPQ2h867D0PkMZiCMM35GWIEY3wehO59B/0POsFA4RDg3WnOaIo+wf2rPJytdUMf75uiu3gSwRgseGkHl/bdb1RSn4eWRJVOHPAnoxwOqf0oKvPlclEetT+i7PZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKy6wAdR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so7028984a12.2;
        Tue, 30 Jul 2024 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722349601; x=1722954401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2BJJA4TAF9/LiRxJWO/jSMth8qVK7VTphNa2oVP9/g=;
        b=EKy6wAdRJYsxW3PMO8DZVCSMxpdaz3I4TXn/GQ1Bf5yNscBsjYMn8hCQMKR9ljoevp
         KevVhkvym2SGTg2w6Jt++ezg5+LxwYzGeeO3SRlK45Ny6b+i0ryMPa74tjDAKxTGvPbJ
         SMFPWaqNlWT1aMa5lYD7Qk7I9hox1bR1Bq4ilV0KpjZwJ4VCjyIU8nEtHsp+DZUoHRPT
         sFZPSaHs8dXWZg3WTSZ4sE6gE3uXkx/A6/uBWJFjOXWTTkSREyxZPTbih3IxEYSyBUK5
         tm6/oYkMOz+zBNzJrmHz9m9oJRDqdFIzXDBa8wks5qfIuImqxNV19cr/s4MEZweCFAfa
         577Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349601; x=1722954401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2BJJA4TAF9/LiRxJWO/jSMth8qVK7VTphNa2oVP9/g=;
        b=kvynMPytvxTCYggyVzpVA7LQWbY38BufhCFO+zUTyS8FGQJAwC3MzSEL3xG6uy6gov
         hm7jeyGdJQxi0zt0RJ2QiKdi3h+sPfuOSrvd+xUOFvbwwbDQR8jxcmUAaQCBBmsj8KHA
         wcZhD/sGy/IJmEDhyasjINAfTddeF59jYIbP2SNiZPO4BnZDQgSAYjDxa4ApWMoqCU7T
         +ylc7WToor3XClWrr9bh7WtDETiNOJzT0cm3TZyNrJvnshdXe8X6NNkUxBAgrFteuIAo
         JS1O7eLraMsRcUNBRRRQVcWvbDrGi5chWu6CILSlQGflRED/Rt/A4z/30UuD4E+l29MF
         1ESg==
X-Forwarded-Encrypted: i=1; AJvYcCVSOT4A9BM8djakjGZJa1AyHsdMgpC2JXxhzorJ9aZVofxXCe2EStho57izVW8Din5rDoY0tM1HwOJjAkH537DhB0Nec11Mk4q2x0EKCwfLIbUgjECqe34w8S7CibWFy2gFZLSK/Q6AuQ==
X-Gm-Message-State: AOJu0YyABSWY26l/1CIctT0k5t7rYqKXmpT7OW+VTFl6bac21h8Fld88
	X9Nol/W8N4YmZADT0hHu+M7Hf3t/QW6+xW3VGYjIsfCsqOuGe18J5yQFPlIor/YLzHQH+kf3fbG
	ygNvsnmtwOO4xL5NmWm8WlzmrR8ZuuA==
X-Google-Smtp-Source: AGHT+IGL0saf7WRa1TzF/fPTy+5z6N2A4MAbOuaTNeNW0c6l+eyZ0QsrGTeLQCbCwkD2Z5gAFbs/+N/Swbrrj5KOTg0=
X-Received: by 2002:a05:6402:26c2:b0:5a3:3553:9aaf with SMTP id
 4fb4d7f45d1cf-5b0201034a1mr8128434a12.2.1722349599677; Tue, 30 Jul 2024
 07:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com> <20240729205726.7923-2-robdclark@gmail.com>
 <Zqi5rUQqWa9wZCva@linaro.org>
In-Reply-To: <Zqi5rUQqWa9wZCva@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Jul 2024 07:26:27 -0700
Message-ID: <CAF6AEGvDJO7T8DMZLy7764AxO1fqPmUWDm2eh1gqV5T-sTfKOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:00=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Mon, Jul 29, 2024 at 01:57:25PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Use the correct panel compatible, and wire up enable-gpio.  It is wired
> > up in the same way as the x1e80100-crd.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Note that the power-source differs from the CRD.  Figured that out by
> > diffing $debugfs/gpio.
> >
> >  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b=
/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > index 70977e9fa266..6f8d52c368a4 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > [...]
> > @@ -669,6 +672,16 @@ &pcie6a_phy {
> >       status =3D "okay";
> >  };
> >
> > +&pmc8380_3_gpios {
> > +     edp_bl_en: edp-bl-en-state {
> > +             pins =3D "gpio4";
> > +             function =3D "normal";
> > +             power-source =3D <0>; /* 1.8V */
>
> Hm, are you sure the firmware sets it like this?
>
> power-source =3D <0> is typically VPH, i.e. the main battery supply
> voltage or similar. This will definitely be higher than 1.8V. It seems a
> bit odd to use a variable voltage source for a GPIO...

:shrug:

Board level stuff is a bit outside my area of expertise, but it's what
made /sys/kernel/debug/gpio match for gpiochip3 gpio4 and it's what
made the panel work.  Using <1> resulted in a black screen.

AFAIU Srini has a yoga 7x as well, and perhaps knows how to read ACPI
better than I do, so maybe he can double check.

BR,
-R

> Thanks,
> Stephan

