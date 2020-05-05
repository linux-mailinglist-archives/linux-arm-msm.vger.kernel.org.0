Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1E01C630B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 23:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgEEVZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 17:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728356AbgEEVZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 17:25:42 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3902C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 14:25:40 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id m9so986575uaq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 14:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SD6x55Qhc8P/MQPIZ2l6eEcYMnu118KHZyq+VyyY6KU=;
        b=fvA9b4tWrD/H0GLbXPEs6tOAK8UDJwvrvOiaBXGDoleVtHqp6BYMLM+ltfgx/p5gGm
         LwoaRBfPSkzoqh3TIhzjxtbDYblUMcqBZBysucb+19H1nqGwdJsX/IL9K9qBxJ5AZJo2
         DsCRTaiymbtLV9sjkfLLVI0ujcE7nd8j8d/m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SD6x55Qhc8P/MQPIZ2l6eEcYMnu118KHZyq+VyyY6KU=;
        b=PH0Cj0wiuoLDU9wnFdHu4DDc+MiG3FBA91EyDVlEGH1eV1MKsCaUglbUNeBuXTP9g2
         2A3S/Fr6zRnHRuSjtdr4/tqFDJemqf8+Xcx2Np4nYQ1JrcdWBd/2BDVXnIqt8v0C8WNN
         rYiECWhJXpkVHLcaLNSmeAkFMa0wLvnZdxPoPxzSmiq3+DpoJX+n5twWWUad0SPbevd2
         lG1fh4zDJxjswqLVwfhC15Oaz6bEB7Kjp2X+3CRhRKfAJtIud7Qq/pHwq1wTYfrSAv20
         4nikqqPcefpLoHXhfHfQvKlMzdwNO74I27cyIYy9LbKiPiNzjhj06MO8zwLS07ok4MHR
         MfIg==
X-Gm-Message-State: AGi0PuYjE7REIaObxez+xUxH3B3AlxftCtrAaTw00TPYYD2A6gE76/sc
        NDt+DzdfG27pR9Pbw/8z62qVybeqX94=
X-Google-Smtp-Source: APiQypJx3pW+YH+LVhPhJ5Wv509nEGIKlQ/+qW7/xFOb4aiXrtHTGtVSxLSli7w/ZjnLrPtA+oTXyA==
X-Received: by 2002:ab0:7845:: with SMTP id y5mr4579743uaq.34.1588713939948;
        Tue, 05 May 2020 14:25:39 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id x6sm116719vkx.1.2020.05.05.14.25.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 14:25:38 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id u12so117937vsq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 14:25:38 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr4978460vsk.106.1588713937569;
 Tue, 05 May 2020 14:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com> <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com> <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505212055.GA17960@ravnborg.org>
In-Reply-To: <20200505212055.GA17960@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 May 2020 14:25:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Viwon0KV297H55Cv0XTaf5p2JFnzjc97m1srpbbmVMnQ@mail.gmail.com>
Message-ID: <CAD=FV=Viwon0KV297H55Cv0XTaf5p2JFnzjc97m1srpbbmVMnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 5, 2020 at 2:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dough.
>
> > >
> > > If we don't want to test that, I would at least document it in the DT
> > > bindings. It will be a good occasion to switch the bindings to YAML ;-)
> >
> > Interesting that you bring this up.  Conversion to yaml is sitting
> > waiting to land (or additional review comments):
> >
> > https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid/
>
> Whole series is on my TODO list.
> But it needs a few hours so do not expect anything until the weekend.

No problem.  I know how hard it is to find time for big chunks like
this.  I'll hope for something next week.  :-)

-Doug
