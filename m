Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291A91D7E59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 18:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgERQZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 12:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgERQZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 12:25:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE94C05BD09;
        Mon, 18 May 2020 09:25:23 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id be9so4810706edb.2;
        Mon, 18 May 2020 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=C9o4dW1opf6PK9dDJU+olx6LivIhnF/LUajcX/auTKM=;
        b=mk9a0EE30LQPszKX5ot6/btd4Lvv+bgSkXNddm9G/X4xPGhTcYfGn9iToM4kQPb/aU
         bCDe3NfgCGMurJGVDAnSpPBLaTOXEd/bT2NFKE/v4MuX2/c2VqGk+EFAfp7T2o2JYqMA
         zsJwIKhZtvZ7nq9HWgQl35cR3+Ew4PlBMq6VU8M0Ii/nrjhC4DWDeqVzm5wmoA02AZHy
         aHi0JKC+zVh29NEUQL+FyqnIzfROsHeli2W1Lc2Lop/O2qTCY5exQhzQXiRDVaqnRNKF
         nC62vqaYbx5FkbjCkN6dXtoAEhJxwRuhHYF2cCsn1WJ6lfpVyExb4l1U+fIwjAg1W4AN
         GfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=C9o4dW1opf6PK9dDJU+olx6LivIhnF/LUajcX/auTKM=;
        b=M1zNNeqSHzaJHlA8Ygw1NXYyDMeK8r2DA7jEs2ykoCWjJ0BimjqxJrHO8P/+HWuxuI
         4AulfHf379MAOT2zt2/B8mqdsjOZpa88XgOHvrvtTI87cYhk31REH7uhPtdDESizq9bW
         KS6n+8cmH+oqu2Nu9eu0RcpPfINX48Rf6btD/5NyLDUZnAMtXJQfQMXv5anx8pgsOH+y
         30dYhUQJ53itOhS6tEWmgXI4krT/1vfwfcJ8fis5TgTUxwDQN03+lrvik0k/+VN3EzQG
         bj4gbxZj1+O4BCcOTYxy3A8wV7RaiU4WpYo3PekQWNMeb3U3QW1mUk/5s9hNCrI9v57E
         nJfw==
X-Gm-Message-State: AOAM533rI4c+hclhXg4kVpSFlJDT/+DbhrTYxLwnenoX4K9gbNoDvKC9
        E3adgO174xa5kDtjjcWE0ejpe3/8E5gZytcLFo0=
X-Google-Smtp-Source: ABdhPJwYjoPZytoziRsU8pzisjXxK0MKS7CxJZXMVVTHEUikl7yW7jJlqgckmGbHBkbra1XtkUxs8t43eY3HhJcYOUQ=
X-Received: by 2002:a05:6402:1a29:: with SMTP id be9mr7821163edb.70.1589819121915;
 Mon, 18 May 2020 09:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org> <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 May 2020 09:25:41 -0700
Message-ID: <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To:     Sharat Masetty <smasetty@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> > This patches replaces the previously used static DDR vote and uses
> > dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> > GPU frequency.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 2d8124b..79433d3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >
> >       gmu->freq = gmu->gpu_freqs[perf_index];
> >
> > -     /*
> > -      * Eventually we will want to scale the path vote with the frequency but
> > -      * for now leave it at max so that the performance is nominal.
> > -      */
> > -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> > +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> >  }
>
> This adds an implicit requirement that all targets need bandwidth settings
> defined in the OPP or they won't get a bus vote at all. I would prefer that
> there be an default escape valve but if not you'll need to add
> bandwidth values for the sdm845 OPP that target doesn't regress.
>

it looks like we could maybe do something like:

  ret = dev_pm_opp_set_bw(...);
  if (ret) {
      dev_warn_once(dev, "no bandwidth settings");
      icc_set_bw(...);
  }

?

BR,
-R

> Jordan
>
> >  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> > --
> > 2.7.4
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
