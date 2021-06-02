Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783CE399411
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 21:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhFBT50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhFBT50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 15:57:26 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F4AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 12:55:42 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d12so2753807qtq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8u4p0mRfsdYCtJTM/K9Y8fUxpv3fGAAMx8yDE7edtM=;
        b=HsQThjsbdcgxS4Sauu7xku8z2h1uwLF/YPWdO1UOAI9HZDGPb7fUQoXB6idd3xfv18
         i7HuJMXCBFL7mA3gPVv3GVJiOuGtYyNhWodZ+KsqW9K8AdbJyCAZnDN9DdTx5pYLelTj
         RF1p+HGUT84HhloeqrFD8xLpnmqkQsw1qdNrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8u4p0mRfsdYCtJTM/K9Y8fUxpv3fGAAMx8yDE7edtM=;
        b=aIUbt+KgZEkMfHDdL24UNvmr+aU7Y44gFoN84RB6Hsni7vapuXJPIFkFGQ34Zz1m+s
         /qdiOg7ZN++UD1HvhKC8EqtIGTHxyR+NoGTCOxfdAHr9hz4Eq3qYTexQ36nyRe5Jw/Q/
         0dGqEA2zuQK6FgJpPkShFZaciIYiwg9UKfDQHiyXVoWZBB6bO5vWldElzkuIOvXA5GmJ
         0oEY/nzqFw7cujpnZMypIc9xkYl2H86jvPeMLu2bKqzGGoOOLMMHHjPFYeKE3leun+Fj
         G2ABldIzVVAxQafMjglM/4iOlrauxArvVsgF1DQ0a28APtk0OvVtsj7D2arS7nTDTpxH
         pHuQ==
X-Gm-Message-State: AOAM532t7RTbi0B4AKQuTDp391pg2PbxZEn5g5Wlmp0pKEVNny7F3V0m
        XNo8bDR9fAPj1fpLqc5XRRZQj0AWGXapgA==
X-Google-Smtp-Source: ABdhPJwNoSF5lu7jTam78xLFFlm0MR3wQNmgrl8hZDW0LiQwHyRJn7wyrDJeK4MDbvnxQhOLqJ6MgQ==
X-Received: by 2002:ac8:4f44:: with SMTP id i4mr510051qtw.57.1622663741787;
        Wed, 02 Jun 2021 12:55:41 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id d16sm455826qtj.69.2021.06.02.12.55.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id q21so5468408ybg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr11929577ybi.276.1622663740165;
 Wed, 02 Jun 2021 12:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid> <20210602181621.GB3692772@robh.at.kernel.org>
In-Reply-To: <20210602181621.GB3692772@robh.at.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 12:55:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyXfi-v6zO_v3YDN71OrXsOVkf1W5h5gV4zwJ4_fBzQA@mail.gmail.com>
Message-ID: <CAD=FV=WyXfi-v6zO_v3YDN71OrXsOVkf1W5h5gV4zwJ4_fBzQA@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
To:     Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 2, 2021 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 24, 2021 at 05:01:52PM -0700, Douglas Anderson wrote:
> > Now that we have an eDP controller that lists aux-bus, we can safely
> > add an example to the aux-bus bindings.
> >
> > NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> > one. It feels useful to have the example in both places simply because
> > it's important to document the interaction between the two bindings in
> > both places.
>
> Don't forget the 3rd copy that exists in some .dts file most likely.
> That's 3 places to fix when we improve or add some schema.
>
> I've generally been trying to de-duplicate examples...

I'm interpreting your response as: please drop ${SUBJECT} patch from
the series and leave the 'dp-aux-bus.yaml' without any example. The
existing example in the bridge chip is sufficient.

-Doug
