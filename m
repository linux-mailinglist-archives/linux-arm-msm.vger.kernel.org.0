Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37281BBD6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 14:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgD1MVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 08:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726645AbgD1MVf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 08:21:35 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94ADC03C1A9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 05:21:34 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u6so21209181ljl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=66PEvgq166rYm5NNqO/K4FUqV5SVNdU/W11wcLnh4KU=;
        b=gESl0rihIt+DG1G40TUmI/KlPAmkk1+4Aiwp1MDMPvqaBcQyaLgL0tP2AHgbZg5nk0
         Zpdq1rk6wT2WQ+bLxj3SVmtk9lXfualx8/Cw8wEteyO31K3kSq/vUb86877Of6KdH0io
         f2COEG+8BhNtvaxctV6KpKzRKGo/JVpELc5SyrcjWxVrbK+uiUKLtkQXzxgTWv2WgMiG
         Qiz0ZwMhbhudDACBVjvsTLMiMV8Sf0tjqm4cdShDq0oNkVfXuXFN6tDh9kF34y0SLf6s
         MzV7Ht5jWfSj0hMkPlHRIvJQX83Mdi5vEpjcfQ1aZMcZ/HOCfb2pg8UsWyQjOj1fdaUH
         4Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66PEvgq166rYm5NNqO/K4FUqV5SVNdU/W11wcLnh4KU=;
        b=Lkn9QMXoT96XF6b96H5IkkPhOHmXYC2ggRhU9kC9WOL67GqeWa1xHreNye/QX6byq4
         E8rwUTHgVddzYNM1q9vfmA/Y31onmrHK/Lhiefk5oq/UnoT3ThtRnaTqVnlQirPOznBh
         aZx0gTKV/8sY1AdyLpXmjKXSMxRL78mFlFZmmYrZtZptz0h8MVue0/mae8msazYBA7EX
         owZ43OP5ldyjxwTkyW6DCEuJocdFbleB36i6Mn2MhDAg7K5d6Efl96h5fwIPGII+lvq3
         TdzLiV2DazpAxhyKrpU+/HjDpTIp9lSt2eZfKc5nx81dAh7cxReIFa9pUF+Wi5m0hjcR
         sFIQ==
X-Gm-Message-State: AGi0PubgQyZHGlJEPqLVxfBRBLuDpFQKu0keERYgMqSfIyk4KySVkw7C
        6RmlSOyFIZc7KOTSWAOmfDBTlV//ot23JeeFEiP/pg==
X-Google-Smtp-Source: APiQypLFGrgmnKJg9/f+LHPrCacUiDgVAehn8XuE+AFvss3TzqvRIrzE2HTQI0KghqzPidyFO40ACxVTMr2WJwrJBP0=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr17558469ljp.277.1588076493277;
 Tue, 28 Apr 2020 05:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
In-Reply-To: <20200423092431.v3.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:21:22 +0200
Message-ID: <CACRpkdZEhqaiStFPdg3VOamKnCMjMsj+MMXimqmHW6eSGah+nQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/panel-simple: Support hpd-gpios for delaying prepare()
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> People use panel-simple when they have panels that are builtin to
> their device.  In these cases the HPD (Hot Plug Detect) signal isn't
> really used for hotplugging devices but instead is used for power
> sequencing.  Panel timing diagrams (especially for eDP panels) usually
> have the HPD signal in them and it acts as an indicator that the panel
> is ready for us to talk to it.
>
> Sometimes the HPD signal is hooked up to a normal GPIO on a system.
> In this case we need to poll it in the correct place to know that the
> panel is ready for us.  In some system designs the right place for
> this is panel-simple.
>
> When adding this support, we'll account for the case that there might
> be a circular dependency between panel-simple and the provider of the
> GPIO.  The case this was designed for was for the "ti-sn65dsi86"
> bridge chip.  If HPD is hooked up to one of the GPIOs provided by the
> bridge chip then in our probe function we'll always get back
> -EPROBE_DEFER.  Let's handle this by allowing this GPIO to show up
> late if we saw -EPROBE_DEFER during probe.  NOTE: since the
> gpio_get_optional() is used, if the "hpd-gpios" isn't there our
> variable will just be NULL and we won't do anything in prepare().
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v3:
> - Remind how gpio_get_optional() works in the commit message.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I have a small inkling to protest against calling this driver "panel-simple"
as we tend to stockpile things like this.

I suppose panel-panacea.c is a better name at this point :/

Yours,
Linus Walleij
