Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C386465823
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 22:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240391AbhLAVKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 16:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbhLAVKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 16:10:15 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AEAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 13:06:54 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id i5so55147286wrb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 13:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RtdWsCBsliPnNDNZn5f2NubECexJaGsJxOP0Bpv1OKY=;
        b=Ii4Af+s+GOqhBaysiVVGFdaakjXx771tNa4Av1um1v8FmaPSuX0lMlVzULowrYTdGq
         zpwTqgdA4mFgc6DGbVk9XYXiwQCUn8cGwaGmlVgT0175HLSJmJ9F3N+1G9j3pgxeylnj
         y3pKZzbeCXJAq/FFVYtdH+GyKIfzkCKGVWK90HQhWDkXs0wG8OlE7Vi3QLgtGP4+MsoE
         4G7TnR3MuTheDk2WGKImFIuXCoiAlMlI2Mq4dUAUf/fj4AVMdllz96Nsz+ZpFAUVKy7n
         fdi2/K6gkccbX2Xg1f8VLmxq7wfdCcZP1qfOxSBNV022MgLdUxAYW2dt+A9+FJabjlIv
         /PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RtdWsCBsliPnNDNZn5f2NubECexJaGsJxOP0Bpv1OKY=;
        b=Lg5x9uOTARPGHwgnFrf367nrCMllo2XZqJI/n04tGbH1bCfJ+O+ILj81WIjbMEs7Yt
         dQ0KNTDAcbHIGuVMnxkX3gm8oB4URHRSV7lzVnxbb/LRUXLkJ0Pl4WjLMq2HDxPL+f9v
         4d23IgAIv+X9/udHF7xqqHF7THruGDFHRgyRGrsGAzJ7TYrYEmbsks2nU0ocDTQrf9bv
         lQNXs1cso5qMYZJktnSPvCOXtJ/ZawN/PrpZzU4p5acWjdBYzeDmGp28uPS2npB0om2X
         UF2K6lpy9ZI1GXd9VSXUhsM+tdbehs27XciYXsr404saSWw57NNosGCxygT8ur5eSLhl
         JUHQ==
X-Gm-Message-State: AOAM533GmQEm7kyGYKfLFKFjTTAG0MS95fKWjlaanX+sm6BDYb+tt2WD
        zTNxyGAiOQFXAOM8czN5KU0RxHYV2OrKq6bj6j4=
X-Google-Smtp-Source: ABdhPJzNdOH9H02HqXVPwQ7TTJUP1vhkHn+2KgbhkBCl5Ra5WkUYjeWWb+KUQAvaGgUVZEs2EalEzn4BMO6GuzALumA=
X-Received: by 2002:adf:e904:: with SMTP id f4mr9266679wrm.245.1638392812496;
 Wed, 01 Dec 2021 13:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20211130004324.337399-1-robdclark@gmail.com> <20211130004324.337399-2-robdclark@gmail.com>
 <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 1 Dec 2021 13:12:04 -0800
Message-ID: <CAF6AEGtU1KSc70wndMFn6R2QTnuP3pRCb-G7RLc8iwjW0=y=0w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt 1/2] igt: Split out I/O helpers
To:     Petri Latvala <petri.latvala@intel.com>
Cc:     igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 1, 2021 at 12:39 AM Petri Latvala <petri.latvala@intel.com> wro=
te:
>
> On Mon, Nov 29, 2021 at 04:43:23PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split the readN()/writeN() helpers out into an igt_io module, so they
> > can be re-used by tests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_io.h    | 33 +++++++++++++++++
> >  lib/igt_sysfs.c | 45 +++--------------------
> >  lib/meson.build |  1 +
> >  4 files changed, 135 insertions(+), 40 deletions(-)
> >  create mode 100644 lib/igt_io.c
> >  create mode 100644 lib/igt_io.h
> >
> > diff --git a/lib/igt_io.c b/lib/igt_io.c
> > new file mode 100644
> > index 00000000..ad54cbe5
> > --- /dev/null
> > +++ b/lib/igt_io.c
> > @@ -0,0 +1,96 @@
> > +/*
> > + * Copyright =C2=A9 2016 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +
> > +#include "igt_io.h"
> > +
> > +/**
> > + * SECTION:igt_io
> > + * @short_description: Helpers for file I/O
> > + * @title: io
> > + * @include: igt_io.h
> > + *
> > + * This library provides helpers for file I/O
> > + */
> > +
>
> This new section needs to be explicitly included in the docs. Squash this=
 in:
>
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/r=
eference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 189597c6..0dc5a0b7 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -30,6 +30,7 @@
>      <xi:include href=3D"xml/igt_fb.xml"/>
>      <xi:include href=3D"xml/igt_frame.xml"/>
>      <xi:include href=3D"xml/igt_gt.xml"/>
> +    <xi:include href=3D"xml/igt_io.xml"/>
>      <xi:include href=3D"xml/igt_kmod.xml"/>
>      <xi:include href=3D"xml/igt_kms.xml"/>
>      <xi:include href=3D"xml/igt_list.xml"/>
>
>

Oh, right.. I've squashed that in locally.. lmk if you want me to resend

BR,
-R

>
> --
> Petri Latvala
