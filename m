Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490792A4BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 17:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgKCQuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 11:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCQuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 11:50:22 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60807C0613D1;
        Tue,  3 Nov 2020 08:50:22 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id k9so15267027qki.6;
        Tue, 03 Nov 2020 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLxArigo/vAFHtRBezBTG6zXcEDbTSwmKkVCAjH9nhY=;
        b=UUvPJ5fGE/KE4WisAzaWRrv2QGwS0xTYFbSs3cObE1+MFKNRaneyanvIkHmzcW7Ugz
         J4W2xAp8L+hYdDzVw1CT/QVbDN7xu+uYF7vOjh28y0V/KwY3t7mjrODjhq11NqZOCmtN
         FjwSBU3r2pw60PPfPbbTi8fgpKcWPRy3K2mvQNqlqsHbbQKZhJ2ENAjZWBffmnoRi5Qi
         wy6LQJWS+PVOotn6KObscfUQBobTzQX61abnthvhqOj9+oDGz/VLlrgAAOlUf6ROjIfv
         bp2nnE4NRoxXxRVl4RAVUjAt2+Zmfqtun0rHeuZLcrQyIOum7UmfVehdiu3tSGPh2VOU
         gpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLxArigo/vAFHtRBezBTG6zXcEDbTSwmKkVCAjH9nhY=;
        b=MSkKo+7ZXVu6u6y1nCzL0iRzatj3YYtLF5JKX6KTPUKSoUNvdnnaW0RmRu8NB4BiWH
         CVb3op7YVU6NaXx8OPaCDlSOhSSO/CJ2/E9JbdYLGQjGkPHuPRdyu9kiAJxZZj41OkcN
         fOemXQ7yEojFk0GpYO+SbnbolvqxJL95M1iCoLn1GSHO75BxehTjcvHvwcqd4GqkKSDR
         1zufjblkg+cJbbEWDxc6S0ovTNfqeu5Irnb4nijWBMY7ZHCh1+3TOqhKESVU5vtQm7uN
         za0V61v11qvpsMDGVJF/tjQnVs20gmcchLwMB9lA5jCW/sdFsGktts0ifmMJ6QDMlsBT
         yVjA==
X-Gm-Message-State: AOAM532SW0PNMWGO3kvhMX0jOdrea07CUHiU070ArZtlDewcPfSWiSRw
        oSJM8WDFbU1/uA25ynIKYm+xWflXU7PHM16G4W0=
X-Google-Smtp-Source: ABdhPJyVW2rVtqO6Z46y19qhhUOixlYdNIfwnLNkfE0+nGAPvQnEG0zJo1YnyVZWXPCTUab/vvarxdWL8XJ90XaoTq8=
X-Received: by 2002:ae9:f444:: with SMTP id z4mr20261842qkl.338.1604422221471;
 Tue, 03 Nov 2020 08:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20201012020958.229288-8-robdclark@gmail.com> <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7> <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7> <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7> <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7> <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
In-Reply-To: <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 3 Nov 2020 08:50:08 -0800
Message-ID: <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Menon, Nishanth" <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 2, 2020 at 9:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-10-20, 17:05, Viresh Kumar wrote:
> > It isn't that straight forward unfortunately, we need to make sure the
> > table doesn't get allocated for the same device twice, so
> > find+allocate needs to happen within a locked region.
> >
> > I have taken, not so straight forward, approach to fixing this issue,
> > lets see if this fixes it or not.
> >
> > -------------------------8<-------------------------
> >
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index 4ac4e7ce6b8b..6f4a73a6391f 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -29,6 +29,8 @@
> >  LIST_HEAD(opp_tables);
> >  /* Lock to allow exclusive modification to the device and opp lists */
> >  DEFINE_MUTEX(opp_table_lock);
> > +/* Flag indicating that opp_tables list is being updated at the moment */
> > +static bool opp_tables_busy;
> >
> >  static struct opp_device *_find_opp_dev(const struct device *dev,
> >                                       struct opp_table *opp_table)
> > @@ -1036,8 +1038,8 @@ static void _remove_opp_dev(struct opp_device *opp_dev,
> >       kfree(opp_dev);
> >  }
> >
> > -static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> > -                                             struct opp_table *opp_table)
> > +struct opp_device *_add_opp_dev(const struct device *dev,
> > +                             struct opp_table *opp_table)
> >  {
> >       struct opp_device *opp_dev;
> >
> > @@ -1048,7 +1050,9 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> >       /* Initialize opp-dev */
> >       opp_dev->dev = dev;
> >
> > +     mutex_lock(&opp_table->lock);
> >       list_add(&opp_dev->node, &opp_table->dev_list);
> > +     mutex_unlock(&opp_table->lock);
> >
> >       /* Create debugfs entries for the opp_table */
> >       opp_debug_register(opp_dev, opp_table);
> > @@ -1056,18 +1060,6 @@ static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
> >       return opp_dev;
> >  }
> >
> > -struct opp_device *_add_opp_dev(const struct device *dev,
> > -                             struct opp_table *opp_table)
> > -{
> > -     struct opp_device *opp_dev;
> > -
> > -     mutex_lock(&opp_table->lock);
> > -     opp_dev = _add_opp_dev_unlocked(dev, opp_table);
> > -     mutex_unlock(&opp_table->lock);
> > -
> > -     return opp_dev;
> > -}
> > -
> >  static struct opp_table *_allocate_opp_table(struct device *dev, int index)
> >  {
> >       struct opp_table *opp_table;
> > @@ -1121,8 +1113,6 @@ static struct opp_table *_allocate_opp_table(struct device *dev, int index)
> >       INIT_LIST_HEAD(&opp_table->opp_list);
> >       kref_init(&opp_table->kref);
> >
> > -     /* Secure the device table modification */
> > -     list_add(&opp_table->node, &opp_tables);
> >       return opp_table;
> >
> >  err:
> > @@ -1135,27 +1125,64 @@ void _get_opp_table_kref(struct opp_table *opp_table)
> >       kref_get(&opp_table->kref);
> >  }
> >
> > +/*
> > + * We need to make sure that the OPP table for a device doesn't get added twice,
> > + * if this routine gets called in parallel with the same device pointer.
> > + *
> > + * The simplest way to enforce that is to perform everything (find existing
> > + * table and if not found, create a new one) under the opp_table_lock, so only
> > + * one creator gets access to the same. But that expands the critical section
> > + * under the lock and may end up causing circular dependencies with frameworks
> > + * like debugfs, interconnect or clock framework as they may be direct or
> > + * indirect users of OPP core.
> > + *
> > + * And for that reason we have to go for a bit tricky implementation here, which
> > + * uses the opp_tables_busy flag to indicate if another creator is in the middle
> > + * of adding an OPP table and others should wait for it to finish.
> > + */
> >  static struct opp_table *_opp_get_opp_table(struct device *dev, int index)
> >  {
> >       struct opp_table *opp_table;
> >
> > -     /* Hold our table modification lock here */
> > +again:
> >       mutex_lock(&opp_table_lock);
> >
> >       opp_table = _find_opp_table_unlocked(dev);
> >       if (!IS_ERR(opp_table))
> >               goto unlock;
> >
> > +     /*
> > +      * The opp_tables list or an OPP table's dev_list is getting updated by
> > +      * another user, wait for it to finish.
> > +      */
> > +     if (unlikely(opp_tables_busy)) {
> > +             mutex_unlock(&opp_table_lock);
> > +             cpu_relax();
> > +             goto again;
> > +     }
> > +
> > +     opp_tables_busy = true;
> >       opp_table = _managed_opp(dev, index);
> > +
> > +     /* Drop the lock to reduce the size of critical section */
> > +     mutex_unlock(&opp_table_lock);
> > +
> >       if (opp_table) {
> > -             if (!_add_opp_dev_unlocked(dev, opp_table)) {
> > +             if (!_add_opp_dev(dev, opp_table)) {
> >                       dev_pm_opp_put_opp_table(opp_table);
> >                       opp_table = ERR_PTR(-ENOMEM);
> >               }
> > -             goto unlock;
> > +
> > +             mutex_lock(&opp_table_lock);
> > +     } else {
> > +             opp_table = _allocate_opp_table(dev, index);
> > +
> > +             mutex_lock(&opp_table_lock);
> > +             if (!IS_ERR(opp_table))
> > +                     list_add(&opp_table->node, &opp_tables);
> >       }
> >
> > -     opp_table = _allocate_opp_table(dev, index);
> > +     opp_tables_busy = false;
> >
> >  unlock:
> >       mutex_unlock(&opp_table_lock);
> > @@ -1181,6 +1208,10 @@ static void _opp_table_kref_release(struct kref *kref)
> >       struct opp_device *opp_dev, *temp;
> >       int i;
> >
> > +     /* Drop the lock as soon as we can */
> > +     list_del(&opp_table->node);
> > +     mutex_unlock(&opp_table_lock);
> > +
> >       _of_clear_opp_table(opp_table);
> >
> >       /* Release clk */
> > @@ -1208,10 +1239,7 @@ static void _opp_table_kref_release(struct kref *kref)
> >
> >       mutex_destroy(&opp_table->genpd_virt_dev_lock);
> >       mutex_destroy(&opp_table->lock);
> > -     list_del(&opp_table->node);
> >       kfree(opp_table);
> > -
> > -     mutex_unlock(&opp_table_lock);
> >  }
> >
> >  void dev_pm_opp_put_opp_table(struct opp_table *opp_table)
>
> Rob, Ping.
>

sorry, it didn't apply cleanly (which I guess is due to some other
dependencies that need to be picked back to v5.4 product kernel), and
due to some other things I'm in middle of debugging I didn't have time
yet to switch to v5.10-rc or look at what else needs to
cherry-picked..

If you could, pushing a branch with this patch somewhere would be a
bit easier to work with (ie. fetch && cherry-pick is easier to deal
with than picking things from list)

BR,
-R
