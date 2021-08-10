Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9A43E8397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhHJTX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 15:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhHJTX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 15:23:58 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E027FC0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 12:23:35 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id r5so645100oiw.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=gbNCzQEoZzdqhswDFYAzHfEyUYgfJuQIU33EIgWMMXo=;
        b=kFL5rzZpadirkAhLE2tGfeO6LjQTce17lnPNSp+BWQyeiRDkxIegGLus53E5JV+x5H
         TzYRWaiDzQtfy+PKm4IswLi3Bg93FquYoAacozMVz14/wyMVZQ2Qv+gcZX6o2p69dG7A
         Z5521vOWj+Dl4HA/CVvYlDl40nN6iZ6YgXF8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=gbNCzQEoZzdqhswDFYAzHfEyUYgfJuQIU33EIgWMMXo=;
        b=kvoyK3o8JkLCdN0Ts3Us3evi1annopnOL38YQB9GdJBkPrWD3ejt5ydePXyn86SLRD
         yFaMVeCD7H2y3cuvQmbZUFeKq84ClKZsrmo0lxG/ksTGysQuqR6QBOhbSj7ZVcbT4baP
         kPb5VCCkHQdknC03sMkhd8dYxm+FSekGbPq0xCxnoensCyP+1L/wRVW6R1p8mi8MjU/C
         WJGabUqiKst6FS/r+dwYLwKiYr1FPebw2Ev8x10Fsn6Gu77UOei0M+fQH4IjZZf/2P+v
         A3Pu+/en4P9CiijlaJtG1vNQcrtckjvpr4z9GCYospfbyrMemNwCCBiOfF7of7bx4O70
         HPUA==
X-Gm-Message-State: AOAM530IZILAj9MRcFVGn7Q32vaDEd/1e4ZXlcDUtuyR3l8L+CsjY9Fe
        G+V7FQsrC5pqKg11nsuQ9T/iSm/CmypoaBE9Hvc3Uw==
X-Google-Smtp-Source: ABdhPJzMsxkOmMEvS4X7L5p033iIi+R8pUAaMXRbTWMCFKsky5WKLkf7f7xLj0/wZhPuKNLFX+3Xvli4+2iPGOdYA5A=
X-Received: by 2002:a05:6808:984:: with SMTP id a4mr4938223oic.166.1628623415364;
 Tue, 10 Aug 2021 12:23:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 12:23:35 -0700
MIME-Version: 1.0
In-Reply-To: <abd00c9d395473875c31379ca0288116@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com> <abd00c9d395473875c31379ca0288116@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 12:23:34 -0700
Message-ID: <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To:     khsieh@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-08-10 12:18:02)
> On 2021-08-10 11:33, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> >> Changes in V2:
> >> -- correct Fixes text
> >> -- drop commit text
> >>
> >> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
> >> of debugging")
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >
> > BTW, this conflicts with commit
> > e8a767e04dbc7b201cb17ab99dca723a3488b6d4
> > in msm-next. The resolution is trivial but just wanted to mention it.
>
> I Just fetched msm-next and cherry-pick this patch over, no conflict
> seen.
> Is this conflict need to be fixed?
>

Oh sorry, I mean commit afc9b8b6bab8 ("drm/msm/dp: signal audio plugged
change at dp_pm_resume") which doesn't seem to be in msm-next. Maybe Rob
will resolve the conflict directly.
