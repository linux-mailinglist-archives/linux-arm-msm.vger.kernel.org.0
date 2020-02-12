Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBF615B469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbgBLXEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:04:46 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46175 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbgBLXEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:04:46 -0500
Received: by mail-vs1-f66.google.com with SMTP id t12so2344612vso.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZc6YtKm0NgqfqELl0Ged7y550Im2QjkLBOstVaWr/E=;
        b=B/RnOoigo7Do72Ok+CIzPjCgyPH4qvuU85m2AGDbWVIlI2aVD4kshxqVkcOHxItPAP
         lhsMokayGGzLw6FPwokLCGD22QDsalq8UCou/e6YKFTLfhT74HnB6cCK3tKn8UojpvHb
         7jh2/BPTkwQWMPDnpUknof63iws9HXf5zTXJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZc6YtKm0NgqfqELl0Ged7y550Im2QjkLBOstVaWr/E=;
        b=OAb1FgkYCyQ4PWWsypx3+hAT+VtZXwglSMY7LhYT8aqYVRB9Q5oJPr7SWR2P+cPwxy
         ALnM4VViW7wVucZCTyZ0FrMdnO4FtwjvgU0S3JX8rnB4qFcFJ3aIW4TGinMjueokJemr
         W6aPqWiWhe86Hrwj78ZgT6zr/Xax8if50A2zY2DIc1npaXtiIre8h5KH5oU9vYK08tzE
         1Tw3c55KqyUhEToTodWvcCByupV7wjYgXjEunm7p+vGCzEmMEgsWoPEfXHEccwyaxmdp
         vEhj4ZH1qwF/5HKuH1VE7edbSetkPbNVoG+klwd87X6dcKBlNpj40YYeDhw0GmdAZzP4
         9A0A==
X-Gm-Message-State: APjAAAXznrIgE0qTUWlMH7EtZnIEi3bzWUsGAYfgxZtUBQjkHp7UfX9z
        Bi+6wgTHZ/w4GhY23MKAZ0UmsA1ucA4=
X-Google-Smtp-Source: APXvYqz4F55DMDS5x1hUCYVTkA8DwP5KHDThFI2ynFsPAcMhePrEoofuyrZJ8Lj6ktpmKXRzv2ataQ==
X-Received: by 2002:a05:6102:405:: with SMTP id d5mr13455974vsq.94.1581548683815;
        Wed, 12 Feb 2020 15:04:43 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id c2sm228003uan.14.2020.02.12.15.04.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 15:04:43 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id p191so1036768vkf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 15:04:42 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr582450vke.40.1581548682205;
 Wed, 12 Feb 2020 15:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200203233711.GF311651@builder> <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
In-Reply-To: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Feb 2020 15:04:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XPscj+bDBjxqBSudj77WeAjCvmOYcOu27jk4gqiCcWcA@mail.gmail.com>
Message-ID: <CAD=FV=XPscj+bDBjxqBSudj77WeAjCvmOYcOu27jk4gqiCcWcA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Andrzej / Neil,

On Mon, Feb 3, 2020 at 4:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Andrzej / Neil,
>
> On Mon, Feb 3, 2020 at 3:37 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:
> >
> > > The current bridge driver always forced us to use 24 bits per pixel
> > > over the DP link.  This is a waste if you are hooked up to a panel
> > > that only supports 6 bits per color or fewer, since in that case you
> > > ran run at 18 bits per pixel and thus end up at a lower DP clock rate.
> >
> > s/ran/can/
>
> I'm going to make the assumption that you can fix this typo when
> applying the patch and I'm not planning to send a v4.  If that's not a
> good assumption then please yell.

With -rc1 released, it seems like it might be a nice time to land this
series.  Do you happen to know if there is anything outstanding?  Is
one of you two the right person to land this series, or should I be
asking someone else?  I can see if I can find someone to take them
through drm-misc if there's nobody else?

It's not massively crazy urgent or anything, but the patches have been
floating for quite some time now and it'd be nice to know what the
plan was.  I also have another patch I'd like to post up but was
hoping to get this series resolved first.

Thanks much!

-Doug
