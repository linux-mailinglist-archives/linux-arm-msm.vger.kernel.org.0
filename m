Return-Path: <linux-arm-msm+bounces-18355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 513D68AF815
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 22:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF8D1F23C2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 20:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DD3142E60;
	Tue, 23 Apr 2024 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GGcpfzFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67565142E79
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904653; cv=none; b=F58nVMN1s+603vruQrGfCGeDWL2/b9EHJwkedIk7VCHAeEbUZ3isXon8BLK5EmsO1vJdSdBMbvaKR1J9LpOiVq7ensUxDIzzoOH6tUtXaIYBYm9/sKBxrxbwMebRrOA+8gKQbbMWotje/caIF7fhdaraghPI4FhxC43Cxy66TRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904653; c=relaxed/simple;
	bh=rfhmOs1XODOFJs1l4DWhrD2bkxios+soWFbzgeUP8Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEAR/3IVDR9/e7cSx5cGy3hVIwDQWqzFC4xXT86XbWw80P3+Sgn/Njz1UmCuBlat3eWB+5j7G3DyLfTAox+IE1RqLUWv0mqmxTYeXnE8nUyBEZmZhkDEaIS39KprI3628sdbVfSflUJ3hIGoIvKRq0jTO66N3vz8/2/mEUFJZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGcpfzFY; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6eb7500abe3so3462054a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713904648; x=1714509448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8Z4Xephtak0B6Z0C10bXQoxaaScZEGJ8HuSBBJAqAk=;
        b=GGcpfzFYUJLBQnGwSWyhreb9yGqz7lbtwpIgktXrvLVkfuvg7TR1hSgevNYM5o8fSw
         0hWI/PJImoPnWf2/NEzwsFT0YHTJiRw/BFgL2TB/VOCic+WezZ9A3mrJCzMSUH3jkSOo
         PbeqMME/OMN0P1zVcHGsRElSpFyiIuJj75cIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713904648; x=1714509448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8Z4Xephtak0B6Z0C10bXQoxaaScZEGJ8HuSBBJAqAk=;
        b=Nygze4WmjuPgMJe+uCEabWNYx9I+pKHULWLCup8dOy2Q0WkGao9TaMRuCpb3mKN7i1
         Zy00JgWI0pNZs1l9TjmztoBiK0hgJdYgEqpQmDriWFfJxF2VcWPgG6YG70wIyLsBAZT1
         8PU8qstnG3yS8UzGUcy5R68MWVcKTsDSD4ydwRBhyjRizNHmdLIhOSJ9c8JDU9QJJ+RK
         UxhXJFRPLDLAH6RW13+hTC7aqDYAWprtS0CSNsdhe7ejkJDNSOiomc1tseG8PJnak69U
         Dsiup1ahwD7mx7XiF9uzOZF0oWA9OIJ1sv8wRTckpZfbZZMHwUTx60k2zb+1ld+ROrhW
         OOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2/N3AjtIa6dC7iF8VKnq4XSotgI1lycVa2VjbqaD2Y/TAGyIrHcHG0Qih8V/vFYFu8ibif8XJUZui6P/PNpRHxE6eACNw01DuD2BJSQ==
X-Gm-Message-State: AOJu0Yxhjc3zTr2DDA/GLZpnNFMBoA5yu/JgGGrz9tOdIkEMPwC3Nrnr
	QKd52+ns2RRMUy3tFZkRHcwewUQgVgJMUo9e5CwEsnIyqetynn+eBCXOgjKY7biReF7ngsH/FEW
	cHrIO
X-Google-Smtp-Source: AGHT+IHPEMnM/CE5fUaiAj4zW2LVg9okMSl078fwUuYjfq+4WK4XQIboGK0V3njZmHL4QFTTlPmwMA==
X-Received: by 2002:a9d:76c9:0:b0:6eb:86c4:eeb5 with SMTP id p9-20020a9d76c9000000b006eb86c4eeb5mr821383otl.23.1713904648378;
        Tue, 23 Apr 2024 13:37:28 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id j1-20020a37ef01000000b0078efd5f89ecsm5543983qkk.64.2024.04.23.13.37.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 13:37:27 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-434ffc2b520so45881cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV6bCRvA4oqap8/Fw/dORUn2G3JxL8Rulp5JLdb8f+huZLB6AYY2fpunZpcOqRMdHTgAqPh+59m9070uH9YzghaOqWpgySkZvJ0tnqkw==
X-Received: by 2002:ac8:48c5:0:b0:439:9aa4:41ed with SMTP id
 l5-20020ac848c5000000b004399aa441edmr71354qtr.16.1713904646630; Tue, 23 Apr
 2024 13:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org> <20240423134611.31979-5-johan+linaro@kernel.org>
In-Reply-To: <20240423134611.31979-5-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 13:37:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XP8aCjwE3LfgMy4oBL4xftFg5NkgUFso__54zNp_ZWiA@mail.gmail.com>
Message-ID: <CAD=FV=XP8aCjwE3LfgMy4oBL4xftFg5NkgUFso__54zNp_ZWiA@mail.gmail.com>
Subject: Re: [PATCH 4/6] HID: i2c-hid: elan: fix reset suspend current leakage
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> @@ -87,12 +104,14 @@ static int i2c_hid_of_elan_probe(struct i2c_client *=
client)
>         ihid_elan->ops.power_up =3D elan_i2c_hid_power_up;
>         ihid_elan->ops.power_down =3D elan_i2c_hid_power_down;
>
> -       /* Start out with reset asserted */
> -       ihid_elan->reset_gpio =3D
> -               devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_=
HIGH);
> +       ihid_elan->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "=
reset",
> +                                                       GPIOD_ASIS);

I'm not a huge fan of this part of the change. It feels like the GPIO
state should be initialized by the probe function. Right before we
call i2c_hid_core_probe() we should be in the state of "powered off"
and the reset line should be in a consistent state. If
"no_reset_on_power_off" then it should be de-asserted. Else it should
be asserted.

I think GPIOD_ASIS doesn't actually do anything useful for you, right?
i2c_hid_core_probe() will power on and the first thing that'll happen
there is that the reset line will be unconditionally asserted.

Having this as "GPIOD_ASIS" makes it feel like the kernel is somehow
able to maintain continuity of this GPIO line from the BIOS state to
the kernel, but I don't think it can. I've looked at the "GPIOD_ASIS"
property before because I've always wanted the ability to have GPIOs
that could more seamlessly transition their firmware state to their
kernel state. I don't think the API actually allows it. The fact that
GPIO regulators don't support this seamless transition (even though it
would be an obvious feature to add) supports my theory that the API
doesn't currently allow it. It may be possible to make something work
on some implementations but I think it's not guaranteed.

Specifically, the docs say:

* GPIOD_ASIS or 0 to not initialize the GPIO at all. The direction must be =
set
  later with one of the dedicated functions.

So that means that you can't read the pin without making it an input
(which might change the state if it was previously driving a value)
and you can't write the pin without making it an output and choosing a
value to set it to. Basically grabbing a pin with "asis" doesn't allow
you to do anything with it--it just claims it and doesn't let anyone
else have it.

-Doug

