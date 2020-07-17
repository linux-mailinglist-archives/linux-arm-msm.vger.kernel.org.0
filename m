Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FC0224520
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 22:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgGQUYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 16:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgGQUYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 16:24:22 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB91C0619D2;
        Fri, 17 Jul 2020 13:24:21 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b15so8628034edy.7;
        Fri, 17 Jul 2020 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UcOeSmTNajKlxkTZ54NN5i0ysWJoAdlrcGAA/78GxpQ=;
        b=KoA4hgce859kSnJSyvomMlV1xsBmgCAAlDU9Bzb/q5p2Ab9+67q5QF3XuAAMpK0ukN
         3P2nx4tfXRCbr1jwYqG9FTPiPx49t31qUyBaAXrPGDWUjqDHZlOjmZlmWK/SU3g/LyKs
         75yzJKISm/gW62f6cL9DQClA8XxbA5poy5ckUBSjgaOdy1ribHskSi+EftXem/L9OU0t
         3ix0QFag8/VPDPDLbEPisFwtku+qj0NKM+8JUxZEYU5nGPkoL9D0HDb/H8E4lByewQoI
         RMP5ro39O7sIsZzGjgbOo3WryMGMo3sZpOvoz8rFgerkcrayFR60UvyHmfcSVEWAfVWZ
         Zqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UcOeSmTNajKlxkTZ54NN5i0ysWJoAdlrcGAA/78GxpQ=;
        b=so7XF7Z8ScKzNVNWHqJXhRhG9N0rDJefWzP0X4O2nx7MyKI0St9ljr3RAET6AcJCFd
         87SyG/OeLF+aYro3wLxiR6daMae7QLi/DMAqSiYVlAjg7j5ZKBV5aqJd7Wjtr+7zQXMJ
         2fNHzRVZeLl9yzuS/rkceyi5XXTGCFYb15Fah9/3/T/nXYHvqW6OixN0oOIUxUeq8Qqv
         mTOm1+PlaKzbHGkoMH2dvxCn2HeI9tSA1Te14qNO/q0jdgqzez+VQDTtKmovIW0Lf9Hc
         80lcOCF88UEW+aFqVI5yfoO6+ny4KvxQfxhtAOfn8NhJYmLSG12mJ7Pg812n9lX3JW15
         vEVA==
X-Gm-Message-State: AOAM5328SZGKTvsZWgaTFbVKiU7yVpS7Nbz3XuZFwMZVs3c9NFFcarsv
        Dmbc1249XNdgAkzHr0iRvsjCp857eTUCGHXWj2c=
X-Google-Smtp-Source: ABdhPJx5mFL4De+x85MnBmDv2P7aJhpwZLDm06tgPH4oAUStkwZmhvug/BQ9YZby3s4dP4Ve+SX98GMCH1Sx3YdZCzk=
X-Received: by 2002:a05:6402:a50:: with SMTP id bt16mr10575485edb.281.1595017460203;
 Fri, 17 Jul 2020 13:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com> <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
In-Reply-To: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 17 Jul 2020 13:24:54 -0700
Message-ID: <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To:     Doug Anderson <dianders@chromium.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 17, 2020 at 10:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > > during its initialization. So, move the refcount-get on GX PD before we
> > > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > > during GPU wake up during a system resume.
> >
> > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> >
> > The Signed-off-by needs to be at the end but I think Rob can do that for you.
>
> It does?  I've always been told that this is supposed to be roughly a
> log of what happens.  In that sense you added your SoB before the
> review/test happened so it should come before.  I know some
> maintainers seem to do things differently but that seems to be the
> most common.  In that sense, I think the order that Akhil has is
> correct.  ...but, obviously, it's up to the maintainer.  ;-)

yeah, I chronological order was my understanding too.. but presumably
the Reported-by happened before the Signed-of-by (which is how I
reordered things when applying the patch)

BR,
-R
