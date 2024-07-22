Return-Path: <linux-arm-msm+bounces-26809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5F9390C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 16:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAAFE1F21CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B0F16DC2E;
	Mon, 22 Jul 2024 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCI7iava"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B416DC18;
	Mon, 22 Jul 2024 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721659041; cv=none; b=XmITUAh4aBN669fBxCEF6hxUUUyN7Eyq2S1b+j855v+pDOmPHvm9MDO750SsZ0CoKAm0WAk9ANtEFl98UTvT0iCAHOG1sKc8OOSrLOS7sDGunfO4h5ZnxAaF3Vg+hMQGfxWblaKogFhUYBzy6DNrO5u9pyW+m2GzT4qBJiYPnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721659041; c=relaxed/simple;
	bh=MvpVzLHlVkx8/sZBzvSeTY1D0P5hBX4gn4GUfZLoKl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrjZ4slpZJGsrh8k7ODQ+Aj+0w1izwVgLBkQf7a3F3y8uFtKSFjTJvue/yxMhDo+hYl8nHKInXqGCBuqyoeBnOjVZVXj90UygCW2rJleSaYlPMQRIUqk2iumWSVmyWGyHrkcucDbVE/fdFVVDYuJHdTIddybzL9jxc34leN75Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCI7iava; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so3389164a12.2;
        Mon, 22 Jul 2024 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721659038; x=1722263838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3+G2QlEbIFJV4XtgE8FwNJl+YIdhu5UoRItWUY3mc=;
        b=UCI7iavaqwsphuklEsgfxCZDUFJymoQYSu/w6tEx0M6LbDlCt9JAnF+XW/UUnNaI8g
         P8nTacDp/vmu9N5zqXUOGf8W4gjyUo/DEMyemDmYKBaMHZdciJ9kCbe4/TysxhHdyR52
         sJpIJXggRcU/O1c37FF8rQ3mdBiuihGASo1oAY6qK2DIfYto8csnNBvG8HEQUubxA1A3
         6kJDV3peWbRYb6kLdEcR+K8D9Xwcww2U0w73EBBISb5wy67+YM2zGTSsZuW+23DWvIOZ
         YtvXr/KtwQ6cntxqYCv582unAoBZuJq42SltT2miqEGz9uKt4eFOZzL+kXvMa+mDyvcT
         9gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659038; x=1722263838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ3+G2QlEbIFJV4XtgE8FwNJl+YIdhu5UoRItWUY3mc=;
        b=mWVCvVfXOxZ9tIkW7w8DZYKRAjz8uuWq2mLJfcA9xeNAMvRqm58hJbwwgM0xCCJWoq
         d2Ztbhl8niucPDTGte5zw0WgN+efOaAYy8h6UTuE2thWis+49pcHcO+9dPdKIfMh24al
         lRwRfOWDEl+C2tJcdmzV/N2cqHciwWnE/D2+IiTLAMwhELr9WErnbpcmOasXMxps3xXg
         UQY7xxj+7oX7fVOtFA6R4n4g5OKfx5ClLSPJJC72pf3b86PefrBPj56fKUka1eAxD+m8
         th2eATzs3vrbiVp6WragSXKRFR+0c7q8SapFYRkD2X9qBD96Lb59rvZ74Ehr5rF2QDzZ
         55EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPcB1Q1UYDfxOSfnc4i43m5BIyNDWQu4E81URljv6wu6SaYVgBS+reBRXzLFg49E/6zT+Q30ycsRhRvOCeY39aeoLgFw2H89fU0tct0/KCwOyrwLY3ia34Mj7lfaEQwCQQ8Wsv4uJd2A==
X-Gm-Message-State: AOJu0YxgnIKk+7RtKgk2MNu0VoVjF8jDCoGoCzmBlgpriH8arV0UvlFa
	QSSqAQwnWYs/MDUAv8CP6LlB5y0HlsvsJwP7NewTLgJtyuMQKzbnPdsTptY+2r4AhS8xYQ2ZuUR
	9nuhDPq5kgtGtNRNqRrBTzfh5ZUo=
X-Google-Smtp-Source: AGHT+IFrNRCnjGINLJwAcytw6uUdPTSr4b8V3amgWKwsMlBAA8ir9niNomin2f6Fod/g9L4G5551XHKdl9nl+O2gNxQ=
X-Received: by 2002:a50:9505:0:b0:59f:a278:8641 with SMTP id
 4fb4d7f45d1cf-5a478b78e66mr4107513a12.3.1721659038097; Mon, 22 Jul 2024
 07:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719185250.4877-1-robdclark@gmail.com> <20240719185250.4877-2-robdclark@gmail.com>
 <Zp4HCPYId4sjd32Q@linaro.org>
In-Reply-To: <Zp4HCPYId4sjd32Q@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Jul 2024 07:37:05 -0700
Message-ID: <CAF6AEGt3hggc+eiWfr4V7YzoVtMNT01EUfn0X_+WvsjuBBDEwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Rob Clark <robdclark@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 12:15=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Fri, Jul 19, 2024 at 11:52:50AM -0700, Rob Clark wrote:
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
> > index f569f0fbd1fc..28a6ea5a24fd 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > @@ -592,9 +592,13 @@ &mdss_dp3 {
> >
> >       aux-bus {
> >               panel {
> > -                     compatible =3D "edp-panel";
> > +                     compatible =3D "samsung,atna45dc02", "samsung,atn=
a33xc20";
> > +                     enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_=
HIGH>;
> >                       power-supply =3D <&vreg_edp_3p3>;
> >
> > +                     pinctrl-0 =3D <&edp_bl_en>;
> > +                     pinctrl-names =3D "default";
> > +
> >                       port {
> >                               edp_panel_in: endpoint {
> >                                       remote-endpoint =3D <&mdss_dp3_ou=
t>;
> > @@ -663,6 +667,13 @@ &pcie6a_phy {
> >       status =3D "okay";
> >  };
> >
> > +&pmc8380_3_gpios {
> > +     edp_bl_en: edp-bl-en-state {
> > +             pins =3D "gpio4";
> > +             function =3D "normal";
> > +     };
>
> Did you omit the "power-source" here on purpose? It works without
> because the firmware already configures this pin, but ideally we should
> provide the full configuration.

I just copied the CRD.. other than the panel, things appear to be
wired up in the same way.

BR,
-R

> In /sys/kernel/debug/gpio you can check how the firmware has configured
> the pin. It is probably exactly the same as for the CRD.
>
> Thanks,
> Stephan

