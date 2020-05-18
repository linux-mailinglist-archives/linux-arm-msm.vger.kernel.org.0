Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF76B1D839A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732022AbgERSGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732269AbgERSGR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:06:17 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDF0C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:06:17 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id w188so2666862vkf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3UXUPcrt3P6Bgw39Gw3bWHJNGcf+91G7bjcoOjFILM=;
        b=li91YZRk4xYKI9MXE0tWUzbZMwcWG60O5oELkyNKU4sTYVNPY20T5Tu/2C4PXO0pSb
         metKaUg3abydKAsYDkjq5QAPkQqK7PqGeCwzCrjMqbAJG1JvjKQ0vB5xZdrqIZcj7Gph
         UoleVSIHc/fp4FoD48l5IFZcAOxm20aQrn4GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3UXUPcrt3P6Bgw39Gw3bWHJNGcf+91G7bjcoOjFILM=;
        b=oCyDlwFcTj4BqMbveQ75zeudCgaoUcvoFgzOmy3PgiK20SUM7WBjwb0hluKNFBpi8j
         kAp3gIt+ENsyQPh7QPkAqr2RzdHBBnEHKVKuSDg3j9Vhn7q1WDznskzDD/nyFb7qKP9w
         m8k8pn3eWeZMGwaDr81cpSyK4kaJRBYELo8QNl+IRUGTPndGyk0piuro2KKwg7mtWBpE
         RrlNQXagDibomH7jb1JJsgxXgYzZsjk23XXeqeyeTz5mkLuScbmANmusdinfMP/GrYHa
         zjCupyIlJDBhltsKajmIGqwzogmw6mU4Cay0yTs6vkrxT4LU4ohf+VUKnEbZyk3YfYGT
         UcEA==
X-Gm-Message-State: AOAM533CjH7N7xwss8tGzP+t7s79avPY9VOy+sqrsNXAuKqz165iQOMi
        fc3C6UW9Wh8O359LDlTk7XMqVevlkK4=
X-Google-Smtp-Source: ABdhPJzm+XfPdjDQ8WQBlR/HzjaJCXpiAOzi5Fv+4Zs2fwg8fvksrP1ogUcXaYf6Gm2YMxWWyi0EMQ==
X-Received: by 2002:a05:6122:11bc:: with SMTP id y28mr6808556vkn.75.1589825175591;
        Mon, 18 May 2020 11:06:15 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id s3sm3363386uao.0.2020.05.18.11.06.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 11:06:15 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 21so2650831vkq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:06:15 -0700 (PDT)
X-Received: by 2002:a1f:4e46:: with SMTP id c67mr11262026vkb.92.1589825169814;
 Mon, 18 May 2020 11:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200509201511.GD30802@ravnborg.org> <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
 <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com> <20200518175939.GA770425@ravnborg.org>
In-Reply-To: <20200518175939.GA770425@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 May 2020 11:05:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
Message-ID: <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sam,

On Mon, May 18, 2020 at 10:59 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas.
>
> > > Given the previous feedback from Linus W, Stephen, and Laurent I
> > > expect things are good enough to land now, but it'd be good to get
> > > confirmation (I removed some of the previous tags just to get
> > > confirmation).  If we can get review tags early next week maybe it'll
> > > still be in time to land for 5.8?
> >
> > I think all the others have reviews now.  Is there anything blocking
> > them from getting applied?
> Applied, including the small fix pointed out by Linus.

Thanks!  Ugh, I just realized what the problem was.  I posted a v6
with this fix but insanely somehow didn't CC you (!!!).  It was here:

https://lore.kernel.org/r/20200513215902.261547-1-dianders@chromium.org

I'm super sorry about that and thanks for fixing the nit.  That was
the only difference between v5 and v6.  I just checked what you pushed
and it looks great, thank you.

-Doug
