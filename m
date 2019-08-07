Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE21C852AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 20:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbfHGSJG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 14:09:06 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46625 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbfHGSJF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 14:09:05 -0400
Received: by mail-ed1-f66.google.com with SMTP id d4so87334167edr.13;
        Wed, 07 Aug 2019 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwJtWVakiEP96kTbkFoUqxH1WvOLhFPnnG3gbiyDKlk=;
        b=QH+xHLDZ8h7jAONg1Dh/3Ql+72SyGAQz1LfNGCnJM1+xeo9YGSGSpEq6CINv1ZUTN3
         dnOcMxwTS4iNO2ND8CYtXDKVvgaEEQdThDijSve89oBokk0Wb4Uah/6vaWrFna1YhuD/
         4Qlf+/g4khOYm7OxaOS8RNpOrq+qSFfhQnGyP3fOuaHAQMskx+PbHPGPbvGQSsMQsOrt
         FtneiDcCb/ROHvOC3HduArDTEURsMp7O4n/AjqzUrqEPp5RWjOMO8iSY7uXwPQZhbEFi
         cML2UlAqmv2BDOwrGrCAmSJ/vLrYvCdl7naVBPysHNWVoe0bxxqbdDdk0OgrXKMSKg9d
         PuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwJtWVakiEP96kTbkFoUqxH1WvOLhFPnnG3gbiyDKlk=;
        b=WSNs0Z76hmCDY7HVDY8XuqMqQtJyBJizi4cNRz8vHn2pkPMIKkIn4wzB1uqKkyFmHf
         r4i5oDIROR1nMiPU/Z1CI60SgJZDuY269eYY98/SiAsCJGCg0CjQYS1W1T9J2cr+wUpV
         T7RYTkX5XcKbJyvJPN6EKddLYSxRsvYnQ2WeesrsRsu+kZXV2O8poUyekc9Q1d4o6wfF
         dEoaHnN3Ky0IONGCPLgLo9LeYC2uzmzbU+fyKVWx3Qr9ut1ou6LhiDTljBdmB1/c/i22
         h3ht4E+EIFGRwUy4cfzEiDG4rO+GMXIZ5BG5ZbLKeRB8LYIco0oIzT4f+Yhy9EpTYhHu
         qJ5A==
X-Gm-Message-State: APjAAAWjlJHKW7yB4fzMWV4h+HrlKBoX8UGqLz7IUNV21LCZyE5Kdtih
        /+zVoBKIvVUYf9tGcHH1UUcR9nEdKTzskvkWRAI=
X-Google-Smtp-Source: APXvYqwNSW7qT7c14KaVkJ6ZlQvzKS1pNZqmXqcTIV2GCqWc+nIWGWtfR6JORaHchzzgwHd/UZI6g3dEbNkRdUCK5oQ=
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr9491438ejb.265.1565201344021;
 Wed, 07 Aug 2019 11:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org> <20190807173838.GB30025@ravnborg.org>
In-Reply-To: <20190807173838.GB30025@ravnborg.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 7 Aug 2019 11:08:53 -0700
Message-ID: <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 7, 2019 at 10:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jordan.
> On Wed, Aug 07, 2019 at 11:24:27AM -0600, Jordan Crouse wrote:
> > Most use cases for DRM_MSM will prefer to build both DRM and MSM_DRM as
> > modules but there are some cases where DRM might be built in for whatever
> > reason and in those situations it is preferable to still keep MSM as a
> > module by default and let the user decide if they _really_ want to build
> > it in.
> >
> > Additionally select QCOM_COMMAND_DB for ARCH_QCOM targets to make sure
> > it doesn't get missed when we need it for a6xx tarets.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 9c37e4d..3b2334b 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -14,11 +14,12 @@ config DRM_MSM
> >       select SHMEM
> >       select TMPFS
> >       select QCOM_SCM if ARCH_QCOM
> > +     select QCOM_COMMAND_DB if ARCH_QCOM
> >       select WANT_DEV_COREDUMP
> >       select SND_SOC_HDMI_CODEC if SND_SOC
> >       select SYNC_FILE
> >       select PM_OPP
> > -     default y
> > +     default m
>
> As a general comment the right thing would be to drop this default.
> As it is now the Kconfig says that when DRM is selected then all of the
> world would then also get DRM_MSM, which only a small part of this world
> you see any benefit in.
> So they now have to de-select MSM.

If the default is dropped, it should probably be accompanied by adding
CONFIG_DRM_MSM=m to defconfig's, I think

BR,
-R

> Kconfig has:
>     depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
>
> So maybe not all of the world but all QCOM or IMX5 users. Maybe they are all
> interested in MSM. Otherwise the default should rather be dropped.
> If there is any good hints then the help text could anyway use some
> love, and then add the info there.
>
> The other change with QCOM_COMMAND_DB seems on the other hand to make
> sense but then this is another patch.
>
>         Sam
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
