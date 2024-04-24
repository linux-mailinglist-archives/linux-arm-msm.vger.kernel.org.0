Return-Path: <linux-arm-msm+bounces-18471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D08B0FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 18:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834281F25BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 16:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024D0168AF1;
	Wed, 24 Apr 2024 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LRio9Mca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9E165FA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713975896; cv=none; b=TI7S+Boy3NMWTLtRFf+1790wXgwDjV+AlO0sAIsJugZY1DTsTIcGwTkCpJidn9qwxGJbyffBNPFEJmsuURJI0CItI5i5v/igN4V4zIvftWjyGSpwi460vBLaPRRRTuWR/ErSzttbDb3OsXXJHHo+1GPc9QbfCpuuAj5UN1W4G40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713975896; c=relaxed/simple;
	bh=cND1PE1vSAdhfk2CRs7RXl5CX9byI+l280+lm5j+WZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGKs1IiqC3d4Zy5l0CjSHW8cQxeYQSWUKHaRjkkF+v8kDtb41O+wWoKkjMKYrcl6LXcyEgZCy6Kl9tNqqQ8yF2vPZoEhcJZ0IfGJKGx++CJbGcq+9BJSCq81PdEKeUyOHSBVMqVAZoOMpBsJAmaAotj8TlFLpe158vdxUIfrmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LRio9Mca; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6a06b12027cso10213386d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713975891; x=1714580691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TxYW0LPM0T5UqY1oRd1cuem+oFb+5LidVbsapA3pB4=;
        b=LRio9McanT5qsAfv8GtMZo4kdHMb3Is30CWRUz3lHoatihdsjZzZS1FSe/ZH8YxU9s
         Sd5gpaAbw45ledP7R7Xgpg5ZWfAaDFTjoCrVT677r/j3yMameL4rhZ3kk3u1oYar9GHc
         eiHwxl6JPCiicIw9G43TPYBmzUbyIQeoAeptE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975891; x=1714580691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TxYW0LPM0T5UqY1oRd1cuem+oFb+5LidVbsapA3pB4=;
        b=mdM0Vh4HOWniTLgh0BV84C24K8NobTfWwwjzqsL6ndj1cgaXHUEa1P6jMI2wMMwXLn
         MK0PNvFBSZ65MpEFbROxg7TUDe+Fn8JpAZJAl1xFH8mNAppWHDKqMq8BDwbVNO+eeMUd
         Q6hPKqcJiwGVkB6DRLnIY2W/7EuiZ+8HBuvXWtlmOqo2vFTB3rn8zOt3MnQLsizsuGLt
         ulPKQWfhlwW0Qo0M3Wh/m8LOaPw0XF429whmx50WQ8M0CXpyylCmyL6oUDkaTuFejv4N
         BV/7atV/+hhoqC+ExZArngjQ9fa7DLg3uDMjUfHZwLOYAu9n9u03cuSwd7Oj3Qa9gDjT
         6OZA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBZ3cNhd3CjUTXOqf433OaF+08/GLxFKNXsRi5yaJcE2nyjDkf3MUMcdagzGEUP6jTzzP1OpeiRDvvBuVyxEVyrAXYFPW2Wui+ySqTg==
X-Gm-Message-State: AOJu0YzvMXHtpQwBob+cz2bZw4sBoOHtTUJcbnzwNMat9s0YWxkXjsQJ
	j5EX4uqcQW5wEUiqaKd2sWpMm8KHHAPbU7qrO/d6nx4hKCziW+DRikp4Dp3TLq8TULfwjmEiCyw
	=
X-Google-Smtp-Source: AGHT+IF0nLLYOk35rUUlSM0jizPyoLvWTJkCiimPVPDx1oo8H8WQ+PJK0YwzQhstrLh9wcLCOhINmQ==
X-Received: by 2002:a0c:fc50:0:b0:696:a490:a94f with SMTP id w16-20020a0cfc50000000b00696a490a94fmr247680qvp.30.1713975891294;
        Wed, 24 Apr 2024 09:24:51 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id w11-20020a0c8e4b000000b006a06f044a34sm880196qvb.23.2024.04.24.09.24.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 09:24:49 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-439b1c72676so594801cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRXbxF8QzAYRvVcJVfLqW6dOF8Am8YLW1uBmhBgQrN4rn6AqPLbVZC36oUlfo6BubgDMpHmiyBXhPfCZDc2gJ+CJx0Vwy1llieaHHUfA==
X-Received: by 2002:ac8:48c5:0:b0:439:9aa4:41ed with SMTP id
 l5-20020ac848c5000000b004399aa441edmr389310qtr.16.1713975889167; Wed, 24 Apr
 2024 09:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org>
 <20240423134611.31979-5-johan+linaro@kernel.org> <CAD=FV=XP8aCjwE3LfgMy4oBL4xftFg5NkgUFso__54zNp_ZWiA@mail.gmail.com>
 <ZijlZw6zm4R9ULBU@hovoldconsulting.com>
In-Reply-To: <ZijlZw6zm4R9ULBU@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Apr 2024 09:24:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vxgu==8Cv3sDydFpEdd6ws2stkZvxvajE1OAFm2BgmXw@mail.gmail.com>
Message-ID: <CAD=FV=Vxgu==8Cv3sDydFpEdd6ws2stkZvxvajE1OAFm2BgmXw@mail.gmail.com>
Subject: Re: [PATCH 4/6] HID: i2c-hid: elan: fix reset suspend current leakage
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 24, 2024 at 3:56=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Apr 23, 2024 at 01:37:14PM -0700, Doug Anderson wrote:
> > On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kern=
el.org> wrote:
>
> > > @@ -87,12 +104,14 @@ static int i2c_hid_of_elan_probe(struct i2c_clie=
nt *client)
> > >         ihid_elan->ops.power_up =3D elan_i2c_hid_power_up;
> > >         ihid_elan->ops.power_down =3D elan_i2c_hid_power_down;
> > >
> > > -       /* Start out with reset asserted */
> > > -       ihid_elan->reset_gpio =3D
> > > -               devm_gpiod_get_optional(&client->dev, "reset", GPIOD_=
OUT_HIGH);
> > > +       ihid_elan->reset_gpio =3D devm_gpiod_get_optional(&client->de=
v, "reset",
> > > +                                                       GPIOD_ASIS);
> >
> > I'm not a huge fan of this part of the change. It feels like the GPIO
> > state should be initialized by the probe function. Right before we
> > call i2c_hid_core_probe() we should be in the state of "powered off"
> > and the reset line should be in a consistent state. If
> > "no_reset_on_power_off" then it should be de-asserted. Else it should
> > be asserted.
>
> First, the reset gpio will be set before probe() returns, just not
> immediately when it is requested.
>
> [ Sure, your panel follower implementation may defer the actual probe of
> the touchscreen even further but I think that's a design flaw in the
> current implementation. ]
>
> Second, the device is not necessarily in the "powered off" state

Logically, the driver treats it as being in "powered off" state,
though. That's why the i2c-hid core makes the call to power it on. IMO
we should strive to make it more of a consistent state, not less of
one.


> as the
> driver leaves the power supplies in whatever state that the boot
> firmware left them in.

I guess it depends on the regulator. ;-) For GPIO-regulators they
aren't in whatever state the boot firmware left them in. For non-GPIO
regulators we (usually) do preserve the state that the boot firmware
left them in.


> Not immediately asserting reset and instead leaving it in the state that
> the boot firmware left it in is also no different from what happens when
> a probe function bails out before requesting the reset line.
>
> > I think GPIOD_ASIS doesn't actually do anything useful for you, right?
> > i2c_hid_core_probe() will power on and the first thing that'll happen
> > there is that the reset line will be unconditionally asserted.
>
> It avoids asserting reset before we need to and thus also avoid the need
> to deassert it on early probe failures (e.g. if one of the regulator
> lookups fails).

I guess so, though I'm of the opinion that we should be robust against
the state that firmware left things in. The firmware's job is to boot
the kernel and make sure that the system is running in a safe/reliable
way, not to optimize the power consumption of the board. If the
firmware left the line configured as "output low" then you'd let that
stand. If it's important for the line to be left in a certain state,
isn't it better to make that explicit?

Also note: if we really end up keeping GPIOD_ASIS, which I'm still not
convinced is the right move, the docs seem to imply that you need to
explicitly set a direction before using it. Your current patch doesn't
do that.

-Doug

