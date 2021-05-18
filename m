Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675E4387A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 15:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343739AbhERN7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 09:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239860AbhERN7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 09:59:50 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520C6C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 06:58:31 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id i5so2080840qkf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c0rcuf59hk8zzhGYb9mHFLDEmB+phP4Kth6slEOIZYA=;
        b=lFI0AHcModwrEa18qX2uKnk2Wac55m5AiPLM2cv6lnVwkVH8JDjqEIw0gazCaElftB
         cHNLRg0l98UfE8vp/8XiQGbD96CtVJc0fhLv9d7phtdY+1C1sgwhDT1cCrwNauVQRMVj
         zr3eFfPWbISXhR8fSSHBrFosPT42cHLgNrX+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c0rcuf59hk8zzhGYb9mHFLDEmB+phP4Kth6slEOIZYA=;
        b=hpILagbYl7ZlzAwAXzlJlTym7DsVdBZ1v+LqQCPynog53isFK27RSjJjiqUEyWJX1P
         OkjwEAOakF2PR0LzCITaF8AIfICkjvMTLzh9m0Niye3Q5twHQa2SaVQfvqqdFDX6s5F8
         ctku8bizjIzpoaUsm7wA7gKomgvpD9ZJgoLshJcRlkUG7eEzBenbMqgP3n6Ir8mNS8hw
         QJALJIKv4tIjTUj3eVra44DAZsO1McSFQgrWEggQlPqMAjJ7KucrHKlOduhXb+50jyhR
         z2fnFahhwIt7Bl90Js0uHQumM+Z6Hl0XKgIt/qY+9Yi5pt7yOWSAmOMtAtjJnV32HdJO
         rBAg==
X-Gm-Message-State: AOAM532NecYSsAr1fLtRHmvnfYvlN05TG3sV6yetKT0EFP+uWLvuG9JW
        zEBf7+I2LrgxK/gkGee1tI9ob4vGajE5aQ==
X-Google-Smtp-Source: ABdhPJyVcFdN5rbQLb9PpauEXYonguCFtRkLdr0ikS0gickxxEtSckkcAk3nKHRNoc4y9hF1BJPkXg==
X-Received: by 2002:a05:620a:b09:: with SMTP id t9mr5684834qkg.17.1621346310175;
        Tue, 18 May 2021 06:58:30 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id e5sm12959871qtg.96.2021.05.18.06.58.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 06:58:29 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id h202so13348457ybg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 06:58:29 -0700 (PDT)
X-Received: by 2002:a25:aad4:: with SMTP id t78mr7268437ybi.343.1621346308916;
 Tue, 18 May 2021 06:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid> <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
In-Reply-To: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 May 2021 06:58:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
Message-ID: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 18, 2021 at 5:42 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > These are described in panel-common.yaml but if I don't list them in
> > panel-simple then I get yells when running 'dt_binding_check' in a
> > future patch. List them along with other properties that seem to be
> > listed in panel-simple for similar reasons.
>
> If you have HPD, is it still a simple panel? I don't see this as an
> omission because the use of these properties for simple panels was
> never documented IIRC.

I would say so. It is currently supported by panel-simple in Linux. Of
course, you could make the argument that panel-simple is no longer
really "simple" because of things like this...

I guess I'd say this: I believe that the HPD properties eventually
belong in the generic "edp-panel" that I'm still planning to post (and
which will be based on this series). I justified that previously [1]
by talking about the fact that there's a single timing diagram that
(as far as I've been able to tell) is fairly universal in panel specs.
It's a complicated timing diagram showing some two dozen timings (and
includes HPD!), but if you support all the timings then you've
supported pretty much all panels. IMO the original intent of
"simple-panel" was to specify a panel that's just like all the other
panels w/ a few parameters.

NOTE: I'd also say that for nearly all eDP panels HPD is important,
but in many designs HPD is handled "magically" and not specified in
the device tree. This is because it goes to a dedicated location on
the eDP controller / bridge chip. I added the HPD GPIO support (and
no-hpd) to simple-panel because my bridge chip has a fairly useless
HPD line and we don't use it. Even though the fact that we need the
HPD specified like this is a function of our bridge chip, back in the
day I was told that the property belonged in the panel and so that's
where it lives.


> Not saying we can't add them, but justify it as an addition, not just
> fixing a warning.

Sure, I'll beef up the commit message.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I didn't spend tons of time digging to see if there was supposed to be
> > a better way of doing this. If there is, feel free to yell.
>
> That's the right way to do it unless you want to allow all common
> properties, then we'd use unevaluatedProperties instead of
> additionalProperties.

Ah, perfect. Thanks!

[1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com/


-Doug
