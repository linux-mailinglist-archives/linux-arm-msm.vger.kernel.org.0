Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43465EF847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 17:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbiI2PFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 11:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235255AbiI2PFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 11:05:19 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CB465574
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 08:05:17 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 65so1885175ybp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
        b=j/p76Gbz/6p+klZe5CzqnqgPqzGWALW2g91DrPRqYNms6dk5oGuWDhJHL1Tvx+U25E
         nv9/Y0D9beecD9wyAD08rbImhYmv8NXz9nzQnidMa8IRhaLbrWuagphyW2wJHaXf6e3y
         ORntlHyPdupf80tWY1phTwvXu6h2ci8lJbuNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b9uxRyoaMis4M/Del53oQhe/OKhSA38Po18Or6YilLY=;
        b=RExGddhPe/VUpSPomDRcMAcAjQ17nsp3WHdVlzzzKLSylBBuwMeUG5S+s17m8LwDzl
         lgBnvOiS4DL76h3ygefUwn47/6L2nUxV5QPdmeG0q6tJbw3sAlEV99eFb+PoLF+/98CI
         YCIKA34TtczQdcxWNaY6kFtWW1WOQsR20kqDeFhNt75nln+3KeNPt7k3UL/JnBTKLmgi
         GNiinCNeB/93rOGAdJkE6HZfNhTrQfvKoept7JoN63CabQhLIIuxD/sRGwl/u8vw4n+5
         LXbEZ29+f1HRvhHdXWoB5G4hescoTJkqaZRiw6zdBD7wPNTWjsy3wNCI0TMdLiuQuHEw
         6+nQ==
X-Gm-Message-State: ACrzQf2xSJ6M7YfF5cHhBuhMLjR2KFce/tSSVvvW0rocwK5E9TZFnEw5
        3egUly6DakDxVZ+Ldx0X4yaglghOHln9T8S4A/W2nA==
X-Google-Smtp-Source: AMsMyM6mVFtECpxKgra3ZkQaG9b6seBNybgK+xW2wUNsy82MrfUpk07hV4+qwXFgEt9Ky8+H6uTmtZZfdLoFajaRwaU=
X-Received: by 2002:a05:6902:284:b0:67b:fc57:9104 with SMTP id
 v4-20020a056902028400b0067bfc579104mr3718530ybh.647.1664463915933; Thu, 29
 Sep 2022 08:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220928192605.247546-1-broonie@kernel.org> <68689c5b-327f-65df-0d34-a7e1a851f568@infradead.org>
 <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWrQabb_LoCPfbdWo9D11+4kxSjQeBStpjvckvuXuBMNQ@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Thu, 29 Sep 2022 08:05:04 -0700
Message-ID: <CAJs_Fx4NzHVRvN6xd-unrpmv=Nc_PXYbHvYujhz7UZ=YRkRZ7A@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 28 (drivers/gpu/drm/msm/msm_gem_shrinker.c)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, broonie@kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 29, 2022 at 12:09 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Thu, Sep 29, 2022 at 8:10 AM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> > On 9/28/22 12:26, broonie@kernel.org wrote:
> > > Changes since 20220927:
> > >
> >
> > on x86_64:
> >
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c: In function =E2=80=98can_blo=
ck=E2=80=99:
> > ../drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: =E2=80=98__GFP_=
ATOMIC=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98GFP_ATOMIC=E2=80=99?
> >    29 |         if (sc->gfp_mask & __GFP_ATOMIC)
> >       |                            ^~~~~~~~~~~~
> >       |                            GFP_ATOMIC
>
> Also on m68k, as reported by noreply@ellerman.id.au
>
> I have bisected it to commit 1ccea29f90329e35 ("Merge branch
> 'mm-everything' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm"), but I didn't
> see immediately what caused it.

I'll send a patch for this shortly

BR,
-R


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
