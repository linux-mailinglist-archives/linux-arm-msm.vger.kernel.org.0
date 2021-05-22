Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D470938D536
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 12:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhEVKkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 May 2021 06:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhEVKkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 May 2021 06:40:00 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D48C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:38:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w33so25452790lfu.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YDP7cgKPnmfHekICN1ZUqXwsJ8B2vownzYJ7Goi+DeI=;
        b=YUouiI1hWFF6RhOFFEDsvCZKfzP0Q1WjQ1yTzd1Nwkd203W2WpW0KUq02UK4sUdedQ
         kPpH/9R2Q6k2oGQPU+CEKSed7RaYHMWn0moLZ9YI3w6rRSiUM2/mMP2N9rsmgA9nnCVm
         1gnymfMd5kdslq+5Zkn66CnoUwok9PHgZMpg1mgkcX+5zQSobOkxrYyooXl6ojyipcBT
         6+OjOW29bGwfLwgOddvQJ0NWfRr/yaeDtb96d6qxbc4JRBoeboLbkKbUw04AA6ZS9iwX
         G/KAWLPk72o/VDTaWt6G3nV5HDzjKW+JuVKjQf0rdJMMqxTBj+YR93IUL5XiNAg+BEfO
         nlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDP7cgKPnmfHekICN1ZUqXwsJ8B2vownzYJ7Goi+DeI=;
        b=Iz1xO50FxpWiyiJDDGsTlzwokMPk1TFEXJajOKqRQHIvGxKofaq2dZl5M0/M7lF32a
         EmmKGarL942MrJnrj+5HMp/R8dojLqkpSYhKOfoCstiInThRT96NbqsuK5vQdyz0srSK
         Mp4StERf4FsCXPIS2V4D/HaEXqfPqwYCgKLG8Zppm2fyLIpkmUKRDkHOYw3Ot8Z/XW8V
         fIILjp8AMlTqzq6fEUgl8OZtA0Ru5l7CANPhXnqqI3t9SCBzGB4P+uJrdsO8PZ/xt/uY
         7IFiBoDKVFEr+RBVj2LOQjxXja04RgL3peHv0sgoJ0goSX62RM8aGJzQRztH8x7uWNWl
         SCRg==
X-Gm-Message-State: AOAM531Jg/HJPsb/VcgUMghJe8PnrVd1HfA5fth17EuzFQ21bKxCx6DB
        HlIE/7R9IBnCHbsYN34J8eQ2wNMcUBw006DpxoDE8A==
X-Google-Smtp-Source: ABdhPJw32JQfF9p8nsp7bu7cLUXb+nPLcZsZnsZN7Ja4Wkr9uNgmEYkdrOBP927EgYJCjUeMJd4/1kCAoDVWQ8D4Qmo=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr4973996lfl.291.1621679913318;
 Sat, 22 May 2021 03:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
 <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com> <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
In-Reply-To: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 22 May 2021 12:38:21 +0200
Message-ID: <CACRpkdabjzxSSj6PH3n+5AKU5MAnciN_yVySYWPHucEgDK4qEQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
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

On Tue, May 18, 2021 at 3:58 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, May 18, 2021 at 5:42 AM Rob Herring <robh+dt@kernel.org> wrote:
> > On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > These are described in panel-common.yaml but if I don't list them in
> > > panel-simple then I get yells when running 'dt_binding_check' in a
> > > future patch. List them along with other properties that seem to be
> > > listed in panel-simple for similar reasons.
> >
> > If you have HPD, is it still a simple panel? I don't see this as an
> > omission because the use of these properties for simple panels was
> > never documented IIRC.
>
> I would say so. It is currently supported by panel-simple in Linux. Of
> course, you could make the argument that panel-simple is no longer
> really "simple" because of things like this...

I think it should be renamed panel-panacea at this point. I think
I pointed it out before. But not my pick so I rest my case.

Yours,
Linus Walleij
