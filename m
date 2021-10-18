Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867224317CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhJRLtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:49:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229843AbhJRLtE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:49:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D0961038;
        Mon, 18 Oct 2021 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634557613;
        bh=J9Gx0uI7w+ObGUE84Nn47QKLJdT8mYLoZGvmeUN9NJc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d/cQ+0wSgv+vlpIqsvRTJfe/Dj3GNieSP14DEm6d7pldxs3v5BfNxHIZKBG/U1Ecy
         dncEe5IKK/j7H9yMEu159u3kX6l4LhuAyPDoQPOVrxy445oS48mHYxSUIzvoYe7m3n
         bx412iE6O5V+PY9D+zzG5TzdObnlaBEDq/Q2UoHeV67oMMePeHadhwggzPm+Qgi8Yh
         3xzbSrM0XJx3hBqe06+tgTBguNZlkx1c1ssYNilTjzohoat08zaYeK90SGArhhXtpf
         ZH2xs6metcfCBST95cplrBPpS2pjZh5qQT6VqpOLwo/fFB3juC6E19H/NEKpdeLC1q
         XjABNeXecJPFQ==
Received: by mail-wm1-f42.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso8232923wme.1;
        Mon, 18 Oct 2021 04:46:53 -0700 (PDT)
X-Gm-Message-State: AOAM5333EWhJs3cbHZlBETb0R2bIH5NPK/uaYFV3qydYSJ5ISGeBiJsY
        Y9UeHyO9T0KJRJ4RAJhx2ou4tK7dMTrncRZ4Y7g=
X-Google-Smtp-Source: ABdhPJw+sSTMe8TvOfF2FXGoaZcKthZkAjaQ9Hu3boxVgG+XZg1J+DOK5aKoASwYzjSrLyKfsIlJDLoitfBg8bR4cyw=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr42229521wmi.173.1634557611719;
 Mon, 18 Oct 2021 04:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org> <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
 <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com> <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
In-Reply-To: <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 18 Oct 2021 13:46:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0E4F8eE0Py83Am-huirrvgomUqrwSSr9+vD8RuMZfSGQ@mail.gmail.com>
Message-ID: <CAK8P3a0E4F8eE0Py83Am-huirrvgomUqrwSSr9+vD8RuMZfSGQ@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 1:40 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> >> I have absolutely no idea how a platform can have IOMMU but no MMU
> >> support but it indeed seems to be the case here.
> > Huh?
> >
> > Parisc has config MMU def_bool y?
>
> Then why vmap isn't available?
>
> See the mail thread: [linux-next:master 3576/7806]
> drivers/gpu/drm/msm/msm_gem.c:624:20: error: implicit declaration of
> function 'vmap'

This is just a missing "#include <linux/vmalloc.h>". It must be
included indirectly
on some architectures but not other.

       Arnd
