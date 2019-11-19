Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 129D310122E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 04:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfKSD3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 22:29:08 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33027 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727239AbfKSD3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 22:29:08 -0500
Received: by mail-ed1-f65.google.com with SMTP id a24so15801750edt.0;
        Mon, 18 Nov 2019 19:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vlbYDXkHVS11+pIejDVy67CBctjo9Cx4yVStRKhyhsY=;
        b=e9pPJgmpwWB5+H/T4XPYX2ke0+dZt2xHpk3ckSpB6R7lZPpyKhFvMTnAivjVxKyFuN
         GCz2ah4YfBBzxbC7LgRaAffoRqYIqVE7CERvk/g63OuQsy+sp1EctRsi5AaCdpWx3SoC
         jae+MrHMcDGNaM46fcMal8dRAtyd/TRFRv2lG/sIQ1RlqbJXDofQVZP4jibg6f6O5kNM
         /SETT9+jW9R0YjL8IMaAjlAT4m++Y4mLbIArvmmKhm8daU5d3EefjKkAqXWHWsyfZsDF
         THHID6CAyNQnJ6NPyXN4EHvQ/EGjTj6T6KGGfrCBtDokPoqbhEaVTI0+tWQPD63oxtly
         UgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlbYDXkHVS11+pIejDVy67CBctjo9Cx4yVStRKhyhsY=;
        b=BQyiJG0dGaXK9dp6w1RkGVPI049YCGVc9JQ5UWQgeiIOnSJJHwwb0NC3bnhxVt4yV6
         cXF5YHjlO3raLgPX1s2Bthuf+Bm7nscj+w6PdCf710E6v/Q8wpljvp3mUqCnU/cum2UG
         TUKDkQDfYYv05tDXk4DMToEjEf2xb/G/SZ63zNGlgJYti2rWPKE3b1mM8424V2JcCn1v
         cg1SE/pj22aBzI3ll2koiZt5c1mVuzWskSoae/avljQcBD9GwhlOQagWrWl67u8L06G+
         80VJKj53e5jHFBn1B30s6qgojf1+u7D80e1HJuhWn9NeApKVyNLeof6YEuAOQdRsFryV
         sFNw==
X-Gm-Message-State: APjAAAXK8KQO+OfuqCKSkylT1DZh4sQShRLNxsQDUyWn20bZqCKZlOyT
        3bzo8Mk0BxNxBa1R76DyDod99UhN+xQQ+XiApXQ=
X-Google-Smtp-Source: APXvYqxm1W9gpI9FbX3HkqAKkjJm3EXrNSSNVFtuevJ5u3ngnRzXg4dB/mAf3Ptai6GpG8/qoxqvKAOFtqnVhTSt45k=
X-Received: by 2002:a17:906:aad5:: with SMTP id kt21mr1593370ejb.228.1574134146033;
 Mon, 18 Nov 2019 19:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20191118234043.331542-1-robdclark@gmail.com> <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
In-Reply-To: <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 Nov 2019 19:28:55 -0800
Message-ID: <CAF6AEGsT6NrHp99AjgAERBsf77TC3E7OUhC733z2tFuu9XE39w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 18, 2019 at 4:32 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2019-11-18 15:40:38)
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > index 39a26dd63674..2af91ed7ed0c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > @@ -63,6 +63,9 @@ struct a6xx_gmu {
> >         struct clk_bulk_data *clocks;
> >         struct clk *core_clk;
> >
> > +       /* current performance index set externally */
> > +       int current_perf_index;
> > +
>
> Is there a reason this isn't unsigned? It looks like
> __a6xx_gmu_set_freq() takes an int, but maybe it should take a u16 or
> something?
>

no particular reason, other than other things where already using an
int.. this is just an index into the table of opp's so it is never
going to be a large int.

Depending on GMU_DCVS_PERF_SETTING it could probably be a u8 (I'm not
*entirely* sure from the code how large that bitfield is)

BR,
-R
