Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C16D23F02E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 17:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgHGPvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 11:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGPvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 11:51:06 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D553CC061756;
        Fri,  7 Aug 2020 08:51:05 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a15so2094064wrh.10;
        Fri, 07 Aug 2020 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d8KKNb4TkrE6Ypv5Ck8Yh1XjDKF4AFR1yDDhTp3rLrk=;
        b=bo8cuN9el/eDYqqyyB/XysVl/VZvWGfzR+Vj+TRUOCZW3z+J/ntDSoalHmoJ0giTt6
         7D4H2Y8Ejwr6PH1h5SjterSCcnnMVcgIwHkC+brWBDEdy7NwWREsG95HSH2XW6Gc8DoU
         DeiZ0ZdXjWr5WKeI2vl9cFu+21Jo9gzUdoSXK94HsmgfX3OcNN0HH6FvXsCZN86JkssI
         BQX73k5779DPXMa6HqfeVVPes5zv0jDww+9nuqa7UnNbQNWpOBH2iCw1/UBMpzZkEcrx
         XcHEXcjdMvULWffqNdenjXSvW8+W7+11FZw5TErWFfWkAQPhu4pMKm7ZtHCq5cMimruP
         DBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d8KKNb4TkrE6Ypv5Ck8Yh1XjDKF4AFR1yDDhTp3rLrk=;
        b=N8HetVqPEr+kMlWwvP9uAZ8vesZ5rsSAtiFsOeteQsU5q8MDvq8n4lusmDEY8XKqtR
         qCZYrM8zXWP9nRWC3c7LwcOPY9XWDWh1Q51QzMUYNAn0HbtS8U7kAH6v2UfDnlXSsxGn
         NYKJk0O1c8SPo9YGh+IFS0BHc9TV7EyUByLVb6iipfH49j/HywdBHyVLoTVzX70DxbZW
         +SG8Gg7e4x8oPjPdZVc0l1lJ9wYM7C66FiomImO1HINgyzRP9himcdoBKHWE9zAbzo6k
         o5x2IMvDdopsERW6bhM7Q2a1NNkKW/FgY4RhktMhXa3JmvTqplXqJCWxqx2i0qmNgS3y
         uZJg==
X-Gm-Message-State: AOAM532zOP5tjsD+shVvuFKDN2lROsRKh0FiT9Rh5v0O5a4PAzwjmeV9
        vBK/46zan7aFR0fE/KrbKQwbsCcPkE6JgSW4fDqUaH+S
X-Google-Smtp-Source: ABdhPJxOuPWr3wvV9ELQ6TgKNOqVn/hVXy8qaCByWnSbkOvUKzemxZS7/rDkhkXwWS6kCiI602GZS0cRDCayKNIIIQI=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr12061544wrq.327.1596815464428;
 Fri, 07 Aug 2020 08:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org> <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
In-Reply-To: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Aug 2020 08:51:48 -0700
Message-ID: <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 7, 2020 at 8:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index ea3c4d094d09..cc1392b29022 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
> >  config DRM_MSM_DP
> >       bool "Enable DP support in MSM DRM driver"
> >       depends on DRM_MSM
> > +     default y
> >       help
> >         Compile in support for DP driver in msm drm driver. DP external
> >         display support is enabled through this config option. It can
>
> Hi,
>
> You need a very strong justification to make an optional part of a driver
> to be "default y".

My opinion is that if the driver is built, everything should be built.
This is what makes sense for distro's.  It is only the embedded case
where you want to trim down unneeded features where you might want to
disable some parts.  So 'default y' makes sense to me.

BR,
-R

> so why?
>
> thanks.
> --
> ~Randy
>
