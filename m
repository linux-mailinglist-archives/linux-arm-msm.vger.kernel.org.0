Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC6B39AA72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 20:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhFCSuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 14:50:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:55638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhFCSuS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 14:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 140F1613F4;
        Thu,  3 Jun 2021 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622746113;
        bh=ZUGi28CzawjzJFRPa1IvCeYStgPTnkk5SqqRbIhNZDM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=soH8j4t25NOwvyZBPPkJbKQtyXAAn4mzrtMX7uqb2Ajqfc9qqVQZzXVxgrOqs77qY
         Xl3ftEyqTMUxxFHbsiZM07FAsNHDEbrAWM763p1acyUeLmoTPFia89LgdzyfvXdZdX
         g1nv5X+rzVxk8jvbe6aH/34P0mjtMvILQPExuvv4LSgrMHxdTAqwtV3HIWvRuJ9cwd
         z4yOK6cm7k8NyboSpL4W6Whr+46niYdAyMZ0lcy1HscbNbU+x14tCvJE7xdzIfjgIk
         sn+N8oOYCTktX17MTbukrUS3kiVKP7JYisWZBiEmDkLTuciLPzA1gH3nut4+bc+aVp
         0BdMkvyhHybHQ==
Received: by mail-ej1-f50.google.com with SMTP id ci15so10709485ejc.10;
        Thu, 03 Jun 2021 11:48:32 -0700 (PDT)
X-Gm-Message-State: AOAM531haRqX2FiZMv0bSRrDhMttmo403AcJaVPfpKo/hZWKBvPpZmc5
        FuO0j4JVxq8O3l9mNJfZgyIZzBANTPZnAqwogA==
X-Google-Smtp-Source: ABdhPJw6rdWaR+EBOCW3Z6uvG9Ev3pS5OtlzkBci2gYyzny++PgdOWYgLxObTC4SuMLjl6sYA51sEw2fqRUI5kQVgOo=
X-Received: by 2002:a17:906:1d0a:: with SMTP id n10mr660877ejh.341.1622746111501;
 Thu, 03 Jun 2021 11:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-2-keescook@chromium.org> <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
In-Reply-To: <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 3 Jun 2021 13:48:19 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Vjz9V=of5XXizTBGEq1Cbx3hU9vi-CC3587B1BXphDQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Vjz9V=of5XXizTBGEq1Cbx3hU9vi-CC3587B1BXphDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: Avoid circular dependencies for CONFIG_FB
To:     Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        kernel test robot <lkp@intel.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 3, 2021 at 3:48 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 02, 2021 at 02:52:50PM -0700, Kees Cook wrote:
> > When cleaning up other drm config dependencies, it is too easy to create
> > larger problems. Instead, mark CONFIG_FB as a "depends":
> >
> > drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> I rebased this one for -next and applied all three patches to
> drm-misc-next.

Patch 3 is not the right fix and I think breaks some platforms.

Rob
