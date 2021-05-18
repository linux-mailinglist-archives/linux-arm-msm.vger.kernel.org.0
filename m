Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C43387919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 14:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349354AbhERMnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 08:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243882AbhERMnU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 08:43:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCE256139A;
        Tue, 18 May 2021 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621341722;
        bh=Kq9PPSOj69H9CJtjL589JZsUAf2E9fTSyIGGIo8pLqA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NlrKy1ZOxb1/CwXwGdvedqToS11Q9qYLrtEKnjaIOloL5ZOs48bFfAJnpb1Nz+uPn
         /fNWRrVIHhs8BYJURBfj4zR2ubWujnFvIdUXaRud0OejZivFP38BPF7ZHY+c66y6SC
         i1syIbA75NV5UfnMx5GODI6Gu3KItJCwskrY1N5ein7oR4g2sHjv59Na8aw96mQzHs
         86AyjzfoT2cPZIxC9oTE82aO98NN5hmAfzjk9M4XZiDPivxXbSbTAhMPEzWuZL5PVU
         CG6OXaSfs27w7BHeKYBLX6/z++qJUvP6tgV+xJSZmz/oEGjv+BqZRuC2Q+EDoy5Itp
         IwPJRRta5UTpw==
Received: by mail-ej1-f47.google.com with SMTP id n2so14295043ejy.7;
        Tue, 18 May 2021 05:42:02 -0700 (PDT)
X-Gm-Message-State: AOAM532rBw9uuLZOt4tCH16Pc6ssLJV72Sa4rWfNCOnshJCoxpRIOz6P
        yU27J2fToFzweMG5RpdoZSQy+BOmQaNegGG+DA==
X-Google-Smtp-Source: ABdhPJzMG+XGPvZbk0Iau8OvJwjoVTbmUys2mLehU60lUDIjVY+xUQXZC2//c41WPPciXZ404z8EPYbgJKmoIyXac5A=
X-Received: by 2002:a17:907:161e:: with SMTP id hb30mr5851896ejc.360.1621341721096;
 Tue, 18 May 2021 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org> <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
In-Reply-To: <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 18 May 2021 07:41:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
Message-ID: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
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
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> These are described in panel-common.yaml but if I don't list them in
> panel-simple then I get yells when running 'dt_binding_check' in a
> future patch. List them along with other properties that seem to be
> listed in panel-simple for similar reasons.

If you have HPD, is it still a simple panel? I don't see this as an
omission because the use of these properties for simple panels was
never documented IIRC.

Not saying we can't add them, but justify it as an addition, not just
fixing a warning.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I didn't spend tons of time digging to see if there was supposed to be
> a better way of doing this. If there is, feel free to yell.

That's the right way to do it unless you want to allow all common
properties, then we'd use unevaluatedProperties instead of
additionalProperties.


>
> Changes in v7:
> - List hpd properties bindings patch new for v7.
>
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index b3797ba2698b..4a0a5e1ee252 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -298,6 +298,8 @@ properties:
>    enable-gpios: true
>    port: true
>    power-supply: true
> +  no-hpd: true
> +  hpd-gpios: true
>
>  additionalProperties: false
>
> --
> 2.31.1.751.gd2f1c929bd-goog
>
