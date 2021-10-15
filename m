Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0B542E8DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 08:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhJOGWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 02:22:52 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:39917 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhJOGWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 02:22:52 -0400
Received: by mail-ua1-f41.google.com with SMTP id f3so15949380uap.6;
        Thu, 14 Oct 2021 23:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EeqGcsm7RTKlniuoQ/dGkOIPSSc1dZROADBLZSH8YyY=;
        b=euqc3fFdWnDkRL37JrUkyB3Vh1RazcT6QLxJb0MGlnRDtupYB5dmhtiVcn9QgrlPzj
         bqNC4hBcjchzeTgWCzKXAQZehhShanYyWE6ex0Qh+2VwT1xJH9V80h7QCPTLfJ7/wCRJ
         /X9m0ATZvMIMJiQsbVt7rIOePV6A8A+cOMyAxdEwEYJswbyFbqIaMO12m9GUWCWlekxP
         ENw4wQgLGCJTH2vAXzv8B1ka55O01RljAZunCzmudTIb8czzb/uT380d9+ffAfX3hnCf
         sNXx8WfwQJ9TWOrpQ9LmiqsJ+NwOluMhDj0b3Q21k1IJwxDomQjQT639gUSF2qAKpHx9
         /k5w==
X-Gm-Message-State: AOAM5307iJFbEn62u1mviKA64qkJZROuKxZnU4aY8VPrEnk0ntddPdZD
        C1+hFpSXs7+DT6IadIjfj+2Vu8inbVK2NA==
X-Google-Smtp-Source: ABdhPJyBAU1G3iQs8MdWf7KeZjIswf/c+eknWjvgST9MFPHg+GwkWwcHD01JdBGQ3i7leL8mkpdRiw==
X-Received: by 2002:a67:d38e:: with SMTP id b14mr12472403vsj.34.1634278845566;
        Thu, 14 Oct 2021 23:20:45 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id v184sm3133975vka.34.2021.10.14.23.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 23:20:44 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id i15so16076956uap.0;
        Thu, 14 Oct 2021 23:20:43 -0700 (PDT)
X-Received: by 2002:ab0:538a:: with SMTP id k10mr11690117uaa.14.1634278843480;
 Thu, 14 Oct 2021 23:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org> <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
In-Reply-To: <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Oct 2021 08:20:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe74a32nkM0+yETnGL9P6TrtcpXEpHS0j__Ye8GRBKdA@mail.gmail.com>
Message-ID: <CAMuHMdXe74a32nkM0+yETnGL9P6TrtcpXEpHS0j__Ye8GRBKdA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Alex Elder <elder@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Fri, Oct 15, 2021 at 2:26 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On 13/10/2021 17:42, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> > phy code is left out, which results in a link failure:
> >
> > ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> >
> > This was only exposed after it became possible to build
> > test the driver without the clock interfaces.
> >
> > Make COMMON_CLK a hard dependency for compile testing,
> > and simplify it a little based on that.
> >
> > Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This drops dependency on CONFIG_OF. While ARM64 selects OF, pure ARM
> does not.

But SOC_IMX5 depends on ARCH_MULTI_V7, which depends on
ARCH_MULTIPLATFORM, which selects USE_OF, which selects OF.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
