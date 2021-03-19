Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C404C3420F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCSP1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhCSP1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:27:04 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519B9C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:27:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v11so9506482wro.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gvh5IzYHTObqHI3vd7r3li3yWFFbiFLNzISSaMCoxao=;
        b=qgeeSL4tmHxIIKsIXPSCoDU2YZv1gkDExJKE+OCC0cdBvQRcB5tZypCVIGfnDMF6+w
         t+gm2pQfScCzkJVlbNC3BLzNFMSjzKh0j2EJnL37uh6tCE0sj6r2kJa9chr9oe/mtjqt
         pn22G6leatJ1E+XkLkSGuE/r5AdiSHtG1toUUtaAd9MRHbTWDmGbhqfKSiNpvgs6v0/7
         RXoFG3qM63RF8oL6ImkbprgourT/0zt7HrCwPP9eKmctRVOP+68wtbVjvd9lUDWpdWS2
         p7O2iObAJ0aiE2KPtK9hu+huhTsFH9fFgfjo//ek2vV9azebyVsoWvgBAA8abSY6+u6M
         aJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gvh5IzYHTObqHI3vd7r3li3yWFFbiFLNzISSaMCoxao=;
        b=bKiTCRCfY9JyKHdov1WZuQEBotaGOTwfyHfd86xv5eGyUS2DpG6A5mPaJEOuMpLm1s
         PQDh5WK1kbQwbqTjfAf14Koh0szlMqgRxpbhbyIQ2pMOnOypEKieEwAviuJO9UfMuC1R
         VNEKGc43QOOpcwp5JPooaPfstZuJBhiDcwY/G5B/YgvO38uYWr+aCp/aUjfZmI9KkImH
         JZoRxAV2mav9SOnbuplZeGZW2hqxUlOg+Lp1N/PzVZPGDzQP2Z1M6VTezY+Aq15ws+3d
         QFq6C4q9eTB07z0FXVJxpWLNSiyRALeD27fngFOHXjDnk4dkmMb8mL0HrqlShz3RJYh3
         D6DA==
X-Gm-Message-State: AOAM530UogMbJeypvAxj00Daz8rdegZK7hBO7v7mWK3Yfoy7OZOgPJKK
        +71yyagQAcUPfwYjyhqgycTYWh/OE/2py/3SBlI=
X-Google-Smtp-Source: ABdhPJzEhz8Z9xqP3e4t7/ZysEmGfcbBrY+UUjoLI5+CPNKPmNo7GHtQxga++FhVy5w6xi2tsM+UoN2ps7L+a49zduQ=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr5121562wrs.83.1616167622087;
 Fri, 19 Mar 2021 08:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com> <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
In-Reply-To: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 19 Mar 2021 08:30:13 -0700
Message-ID: <CAF6AEGtj22ut=YsL4So6NtoC06swtQcCh24rZs_aryq2SYdQbA@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 8:13 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Fri, Mar 19, 2021 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> > I think that might not help if something fails to probe due to (for
> > example) a missing dependency, so !priv->kms is probably a better
> > check to cover both cases.  But the 2nd patch makes a good point, that
> > the suspend/resume path probably needs the same treatment
>
> Thanks for the feedback.
> I will follow the same approach for fixing the suspend/resume path then.
>
> Let me test it and then I will re-submit Dmitry's patch and the one
> for suspend/resume as part of a patch series.

Thanks,

BR,
-R
