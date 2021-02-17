Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2B431D422
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 04:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBQDEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 22:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhBQDEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 22:04:01 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717D9C061574;
        Tue, 16 Feb 2021 19:03:21 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v1so15799075wrd.6;
        Tue, 16 Feb 2021 19:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K5+6phUMVFMaRDA3F4TKDcCMWV0Y6SKjytFwuos+eCo=;
        b=N5NMdUkX/SISYBEbo4zogYa+OyoIMfr3kgfB3MAeDQ5I8q6OAdeag2hCtK+P4X/Ph9
         Den0jMO4Ij95BqW3JWmXwXK7r7Li4vZGZEJqDFITh/xQBk2FV97Xkq4jdr7d4vkxXxf5
         Ww8n3z2hpCFxmkx0KQdZv5PCjKnt9wNQCdMSjwcfb1JNGfP4sTU+atKMvF1CJ9/xy2xr
         9dfwRWLbIydH6e86U7Gdh31dFxX4NLKP7V/dz20zNfMohDU28haRs+SlWOsJhgtEE9LS
         T0VCdbab2f1nS5GuKY/NPP4ow7z44GgbKbRwvDzfrDaAHbB4rjS7xxJmeeRXcH8L4c5b
         sWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K5+6phUMVFMaRDA3F4TKDcCMWV0Y6SKjytFwuos+eCo=;
        b=n6wxQhJpmN9il/W0fe9dzsVLPDg1lgzVgrRr8BXYscA2d0BVTasbMiCSaHNEFCSYdE
         sOo6YIGio+mtXr8q1a6SPdlXeCGmLYF1C5Q2nFKZf57H3r/kl2nEulxNAFOKOFhChNnq
         KT3CMd+/3CKlPr/lSe3bwYKVr5IFMvu0mnbyeC+xxbKrdC4bmHXYfqqrB+gUnirDX/PL
         Qe1X0Zxb+WvagWC7ubfEgYuG8BQlHuGJVfTz6Z/rMTo23CS3OtIBSlQmAuWJYjognOJA
         FL0cfGzDYxL9xury6G55AYUuwYX4dLhUS5xcIuNwOxFZBSF6/u9xrvBWKjbZkvYiezYH
         Kjbw==
X-Gm-Message-State: AOAM532FspFcMxqi4kBuQivE234BM4H37ar/dx922qw4a4He5/vmgVAh
        eVy/3fCWN5Us/jFCLAvKKxBq2ib4STbGvsPCGkAvN0z98zUwHA==
X-Google-Smtp-Source: ABdhPJysM4i+VFwS+4UtJ8OqSqZC7ZdIVq6OmnStef7a16sT9kl+pO99M9F3CAk2lUJ2USJ7LmdYJxRJ6PGmb8/Mh24=
X-Received: by 2002:adf:fad2:: with SMTP id a18mr5618297wrs.147.1613531000181;
 Tue, 16 Feb 2021 19:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca>
In-Reply-To: <20210216200909.19039-1-jonathan@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 16 Feb 2021 19:06:12 -0800
Message-ID: <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>
> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ba8e9d3cf0fe..7fe5d97606aa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>
>         cell = nvmem_cell_get(dev, "speed_bin");
>         /*
> -        * -ENOENT means that the platform doesn't support speedbin which is
> -        * fine
> +        * -ENOENT means no speed bin in device tree,
> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM

very minor nit, it would be nice to at least preserve the gist of the
"which is fine" (ie. some variation of "this is an optional thing and
things won't catch fire without it" ;-))

(which is, I believe, is true, hopefully Akhil could confirm.. if not
we should have a harder dependency on CONFIG_NVMEM..)

BR,
-R

>          */
> -       if (PTR_ERR(cell) == -ENOENT)
> +       if (PTR_ERR(cell) == -ENOENT || PTR_ERR(cell) == -EOPNOTSUPP)
>                 return 0;
>         else if (IS_ERR(cell)) {
>                 DRM_DEV_ERROR(dev,
> --
> 2.26.1
>
