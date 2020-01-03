Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5987212FD52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgACT6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:58:20 -0500
Received: from mail-ed1-f54.google.com ([209.85.208.54]:35732 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgACT6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:58:20 -0500
Received: by mail-ed1-f54.google.com with SMTP id f8so42536959edv.2;
        Fri, 03 Jan 2020 11:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lElfBd/8jigO1KSCmDplgs5SeL89T17ANPHJDCQ3IOA=;
        b=Coe0w+paNOOQSNE3/OF7/NyZkbuDuTiyGJaCeDoUv+GeyzNQPhIm58cgy9bk+qZHj1
         oCnaRvLbS8kQ8y11xuOpVuaRY1+GBhFZ/cbtR3/VoLOh2Crv53tN7lc2yPjkWM3htBs4
         3sf4oPhGAsdw37jeFw0b1YHfxilF8wK2I/0ZFqA7ZH3lz2VBVtYolZGnGJU3OoRmqP8o
         4g5tpxdV5+amASC8oDIvLB8BPaIXsTEsUG0yZj2es4AUz5Xyo1qDHG+HUBFaeQPJoae5
         9K83e5zWYJAbiWkX3DbbmmTWKiFznYDlfF6zx8MnrIBPXPeKM2j8Rx3PPX6SGihtBApN
         E1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lElfBd/8jigO1KSCmDplgs5SeL89T17ANPHJDCQ3IOA=;
        b=DqWiMhyEIfK/rHIge+DcpJUG6Gdxo4ypnrwesio+4ZG+cmj2Lr4nWlAOvrKJBCmG7p
         LtDQSenkcEGUeasujg63kL67I9n1Fok2Dux08W3szuL0NsmUBr3iiYWdI5ClkIqGZ9+Q
         5q0ClU2v3Ji3WFknX2ZdRrnvQag14tf0+xpXdWZuc/TYWQnR/xIaqA2CEnfTtbn8T0az
         RWbn/i8OeprCi3755duP7EFcbk6eDJxVKRmJToYZodICBAzuKhmm93tuZQ99d6aVAmiW
         TMTph+f4i6i4K5QOa/Zmn40lV9uR1tV4A8nIIuxUA1+WEysu9s4qmieLQH91Fagb/MNf
         9DCg==
X-Gm-Message-State: APjAAAXPpLg9/9PXmRWGI9yq324Cgcr0iwR0aG0swCyh/O3nxT7wsGtw
        minEIkCyghcCqdoiuaWeEKN9hPLK2AiKND1geUk=
X-Google-Smtp-Source: APXvYqyugADp3hO7h03oK2DaaWliYETiOggFR6uHjCw4XYSOsGVANeWDg8mecDKvovZmnz2SYVwWs6I2LeUmZU+WXP0=
X-Received: by 2002:aa7:da03:: with SMTP id r3mr94729576eds.163.1578081498516;
 Fri, 03 Jan 2020 11:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20200103183025.569201-1-robdclark@gmail.com> <20200103183025.569201-2-robdclark@gmail.com>
 <20200103193135.GA21515@ravnborg.org> <CAF6AEGtdFA7XzSq3w3N6_TRLWQY+zumU2mahbsPY=pc0r_x6fw@mail.gmail.com>
 <20200103195406.GA22623@ravnborg.org>
In-Reply-To: <20200103195406.GA22623@ravnborg.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 3 Jan 2020 11:58:07 -0800
Message-ID: <CAF6AEGvCNK8fQW3JvXk63ecpTU7Q-ixf4yJsYQyxwiV-4SUf0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 3, 2020 at 11:54 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> > > Please fix and resend.
> > >
> > > I am in general holding back on patches to panel-simple.
> > > I hope we can reach a decision for the way forward with the bindings
> > > files sometimes next week.
> >
> > I've fixed the sort-order and the couple things you've pointed out in
> > the bindings.  Not sure if you want me to resend immediately or
> > hang-tight until the bindings discussion is resolved?
> Could we give it until Wednesday - if we do not resolve the
> binding discussion I will process panel patches in the weekend or maybe
> a day before.


sounds good

BR,
-R
