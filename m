Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5507465832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 15:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfGKN5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 09:57:02 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33967 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfGKN5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 09:57:02 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so5923560edb.1;
        Thu, 11 Jul 2019 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOuNeNHVv9/VVG4l5Hr645r7uYLWPBnGXVkIWcZHk1k=;
        b=axG7bOARPIoTxYMvOcDOF/i1jLKA7ugbJM5J2diOYTfJSi1G02UMeCwP0qKtKZ0x/b
         XK+cwxGV7LGh3jue4qzcMwws9DmDl9mTsEBdza+3KVA3Db6NQuIjTKfAvOg3/CVJax2t
         awEUyzFocfnhMkakkOvkn3qSWuLQtjSpUS8iRtOlJq74YbViyepwXTM4waUWH62+eGBp
         dvASbyXaGReT3F55G9qNyr5sPN1zClC/3b6IBx8bLuihYRO/0qg1+awW6N94K50pwD9H
         MbJNBC6xtCS4tJwiFQJA1lZOH0MrGUj1hfXdAGPSxWbMZtywtF1go93s2eE0m1EcT+ja
         0aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOuNeNHVv9/VVG4l5Hr645r7uYLWPBnGXVkIWcZHk1k=;
        b=kciljKD57CK0P9TG731+CMuh+Khj41YDYRsoff9avL+tBtshDWYqDyVP0dnaV+yTnb
         xY9Vxr0aQtZRgdZ0JNbu0h/GD3qF0PId6MDibKFu5CUdypEKTVDihnwuAawNL3rtTSkc
         iWduNtW+jMyAlpqP1bsPPBTAMtrZyTrGXRk9/wIvoioE26G0Xipm9jTaGliqQrvMK0Hy
         i2NYdiH7NeULpWsFyBT3UFL8NXLybS9kgJqMd3r7cDfO1T0CIYGAWhjyDzxzn/Y/WRdT
         +rfUpJ6Q7LjmqhjSBz010FJaOmXuNBWUjFfKJCX+/R2GuXDeX9hI4axOCLZNMBhCNwaj
         Lljg==
X-Gm-Message-State: APjAAAWAqsOWL2SkRDrV4xEcXImqQhTTdbwr9toJKOt5FxT3+m3eQMpE
        EQQ+23m3JH2Q4th6dgtTM8HJu76NkjkblZjJAO8=
X-Google-Smtp-Source: APXvYqzCXNLAVWTByGsPoZc2vVxWqyN7oxSE4kQB+14zl0pHNyO0KNu+RzsrXlqWTab7INRkE7CRqcAP/9FQebzVmI0=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr3631650edn.272.1562853420690;
 Thu, 11 Jul 2019 06:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com> <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk> <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
In-Reply-To: <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 11 Jul 2019 06:56:47 -0700
Message-ID: <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 11, 2019 at 6:11 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> On 06.07.2019 03:06, Mark Brown wrote:
> > On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
> >> Add basic support with a simple implementation that utilizes the generic
> >> read/write commands to allow device registers to be configured.
> > This looks good to me but I really don't know anything about DSI,
> > I'd appreciate some review from other people who do.  I take it
> > there's some spec thing in DSI that says registers and bytes must
> > both be 8 bit?
>
>
> I am little bit confused about regmap usage here. On the one hand it
> nicely fits to this specific driver, probably because it already uses
> regmap_i2c.
>
> On the other it will be unusable for almost all current DSI drivers and
> probably for most new drivers. Why?
>
> 1. DSI protocol defines actually more than 30 types of transactions[1],
> but this patchset implements only few of them (dsi generic write/read
> family). Is it possible to implement multiple types of transactions in
> regmap?
>
> 2. There is already some set of helpers which uses dsi bus, rewriting it
> on regmap is possible or driver could use of regmap and direct access
> together, the question is if it is really necessary.
>
> 3. DSI devices are no MFDs so regmap abstraction has no big value added
> (correct me, if there are other significant benefits).
>

I assume it is not *just* this one bridge that can be programmed over
either i2c or dsi, depending on how things are wired up on the board.
It certainly would be nice for regmap to support this case, so we
don't have to write two different bridge drivers for the same bridge.
I wouldn't expect a panel that is only programmed via dsi to use this.

BR,
-R

>
> [1]:
> https://elixir.bootlin.com/linux/latest/source/include/video/mipi_display.h#L15
>
>
> Regards
>
> Andrzej
>
>
> >
> > A couple of minor comments, no need to resend just for these:
> >
> >> +       payload[0] = (char)reg;
> >> +       payload[1] = (char)val;
> > Do you need the casts?
> >
> >> +    ret = mipi_dsi_generic_write(dsi, payload, 2);
> >> +    return ret < 0 ? ret : 0;
> > Please just write an if statement, it helps with legibility.
> >
> >> +struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
> >> +                             const struct regmap_config *config,
> >> +                             struct lock_class_key *lock_key,
> >> +                             const char *lock_name)
> >> +{
> >> +    return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
> >> +                         lock_key, lock_name);
> >> +}
> >> +EXPORT_SYMBOL_GPL(__regmap_init_dsi);
> > Perhaps validate that the config is OK (mainly the register/value
> > sizes)?  Though I'm not sure it's worth it so perhaps not - up to
> > you.
>
>
