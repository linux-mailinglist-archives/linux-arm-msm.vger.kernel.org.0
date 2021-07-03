Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2C83BA9FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 20:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhGCSZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 14:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhGCSZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 14:25:32 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C044AC061762;
        Sat,  3 Jul 2021 11:22:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t6so6729035wrm.9;
        Sat, 03 Jul 2021 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xB2P4tf2ZnREI1OThuK+uDcZdI5i8XE4aLNhKgcZeXQ=;
        b=gHFzYWzfyhEza4GLHis81G5QxNeU0PQUL7vO4Zc/BkHi4DXFsGXSxb+cDZa/0btK2G
         p1wExGiWY/WhIAxd5h/iQbyin+7dJzwDDbP8cXrOqKZGEHPshVQRq9kVEmi+2wtTlCki
         quJFPI6HX8Oij+CN2tKuoXEiCTF7P3EhmMWrPyzdC5/Ti1hP5N/GiC/SToGYILYfPTRo
         vLaMIFSoE6JKTH1RoOOmrVMsg0nTzGBgA1e2ANlRUxLLgg3W0NpmPkVL1qvo5qc97U7F
         XxPekd46d2lV8hCS3gxSlYfkTSHOnDBfiJPtfO//9gJhJGAJg1mUxBkioP7h5qVVWco6
         TYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xB2P4tf2ZnREI1OThuK+uDcZdI5i8XE4aLNhKgcZeXQ=;
        b=llRCZBugaPmfx4Vi6/0ovh62Ra6rkrRebKsgOBQydc7+KjUHVMIG95C2J+2AdkkQT9
         IYWYWNVIrdPsn3yhM+Qn+b4R224AEsli33VzX+MKWyT7WhqSYQn8zuZMnzH6h0UeXVkg
         6/o8FHKSyD7yckvRZQXoDFvgeJR12LGSs0Pd17ApQC9xBkpZvesXVbNVoimT8OyLXcau
         3DsC8FdxeMKYvkz2X43o66qEkcQeYeGDIihYhJYypUkUQW+H8s/1rqIN6CNl/XtNcnbd
         +cGGwb1Wowdd0z6+I7XayyAHNFK9XHUdCfi0nGyrwoqH6kNqUhCObsD7Vhu5fwXIHTZS
         n5IQ==
X-Gm-Message-State: AOAM5306r2fSAIThORfUwKwBm8AgOnE5nobfOF86RB2wFzN9PHm3j3k2
        pfY6zHyMjuj9BZCFp+8Cp6mGt7QITCUsj7akZjw=
X-Google-Smtp-Source: ABdhPJxC5BxID5OlR6PtE6kMNgXsqNv2B4grb90ehKfdlYRt5kItejvy6CCRRR/aD/dDxY4dfmgfatoC7VoJvXbSkTY=
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr6354866wrt.132.1625336577239;
 Sat, 03 Jul 2021 11:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1625311962-14185-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 3 Jul 2021 11:26:59 -0700
Message-ID: <CAF6AEGs6ochnO=CdOk8U9ZFSecv8JSiA=L9es_rcFReJ3Sz7dQ@mail.gmail.com>
Subject: Re: [RFC] Inline rotation support in dpu driver
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 3, 2021 at 4:32 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change adds support for inline rotation in the dpu driver.
> When inline rotation is enabled the VIG pipes will directly fetch the image
> from memory in a rotated fashion
>
> Inline rotation has following restrictions
> 1) Supported only with compressed formats
> 2) max pre rotated height is 1088
> 3) restrictions with downscaling ratio
>
> Queries:
>
> 1) Since inline rotation works for fewer pixel formats with specific modifier, how can we provide this information to the compositor so that
> chrome compositor can choose between overlaying or falling back to GPU. In the patch it fails in the atomic check.
>
> 2) If a display composition fails in atomic check due to any of the restrictions in overlays
> can chrome compositor switch it back to the GPU and re trigger the commit ?

The correct way to provide this information to userspace is for the
atomic test step to fail.  Admittedly the CrOS compositor makes some
invalid assumptions that if a given state was valid in the past, it
will be valid in the future.  But I don't see height/format/downscale
restrictions as a thing that would change from frame to frame.

BR,
-R

> posting it as RFC as validation is not complete, please share early comments on this.
>
> Kalyan Thota (1):
>   drm/msm/disp/dpu1: add support for inline rotation in dpu driver
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 47 +++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 20 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 93 ++++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  2 +
>  4 files changed, 128 insertions(+), 34 deletions(-)
>
> --
> 2.7.4
>
