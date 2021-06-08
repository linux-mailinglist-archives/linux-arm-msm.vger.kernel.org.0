Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEA039FF07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 20:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFHS2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 14:28:35 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:42504 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhFHS2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 14:28:35 -0400
Received: by mail-wm1-f42.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso2536837wms.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dpc7jDBgR4bRpyMxKiXPomFG+A3xIaiwS0cF873d9mc=;
        b=KWkZvnHH4nxrApOkUehAeCyA/rXa/6rXfhy3TXCuxO1ELjYLR5JOVuwHID6fMdUdR3
         So2WEZVTMUm7TerayCLetB7N4TU3eSAIApIImU/UB4CF1z250RdTgeJtQjfyVUMSLekd
         KJUQCeb3AHWCAF8IBtH+H+L360Y53dugYCoN0QKIjQYnWj+Cc5kYwBUThnKeHNQCR7In
         neh8DtKATy4ZxUB3FsTUR2liOFldzj0hmjOl1W0y9XuBAklsRhIarK+8ytPMZmh6JGY3
         ik4VvTClouqJoxnl8Mds2dDLyVwducLo+GV1QJFmFRGcifmCsL6p2TTuuxifajUhON1A
         0c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dpc7jDBgR4bRpyMxKiXPomFG+A3xIaiwS0cF873d9mc=;
        b=lJVsJbTMkT9d07fILo5ahMrUOdZ9Rij2mme+KHoGtmLK/B8P1aI/6HcGG62GjupSkB
         /KB0GWJ4KMt5ir2KUSMzwcvDswtlUvzsZQ77MY3xoz6NwX/kkiV3yledONJ2QZoqx8Sa
         BzWIRP9EVQBwXVrp1/z+jAe/jMeIzjfcfNUmoJJNY619Cdpg0H2HGJA+mpiK4diPPwwT
         SEEf0UDIql26iDIPrKCXnyVgdL7GxORp4dtpEOh76MyV5PyHwgN9axcYp/Zo8UM0xIaA
         /Gmzfv3VpucyFP4FYRBoNygfHybZqyGa+t/O2aADEVexMbXJkvJGEIOblDNRGHPt+bKj
         uI2Q==
X-Gm-Message-State: AOAM5309dKbqDVntpeq3qZO2vbCHd7fDwry/+PcXEL5tAvmz6VBKDUmy
        c3vXEBaTiD1GzW5zJ5xE2ojtcuSZV4f/vKibcUE=
X-Google-Smtp-Source: ABdhPJx9NnFyX8wNc/FCRYHa2nklvr22qyrJ85Vop8BJ6EWvcd9fUqRCCIPSZwGzWxtXWq5SbvlnnUFj17ZgcRkBZnE=
X-Received: by 2002:a05:600c:1c84:: with SMTP id k4mr5813076wms.164.1623176727348;
 Tue, 08 Jun 2021 11:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Jun 2021 11:29:21 -0700
Message-ID: <CAF6AEGsKyvkreMM67HY2Oi8LN=-w7sB7NWVoPdyfaJ8390Lz=Q@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-06-08 for v5.13-rc6
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sorry, spotted a small typo, I'll resend this shortly

On Tue, Jun 8, 2021 at 10:32 AM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> A few late fixes for v5.13
>
> The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:
>
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-08
>
> for you to fetch changes up to 924f4cba9e68bf2b4717e7941697db96c6f203be:
>
>   drm/msm/a6xx: avoid shadow NULL reference in failure path
> (2021-06-08 10:08:05 -0700)
>
> ----------------------------------------------------------------
> Alexey Minnekhanov (1):
>       drm/msm: Init mm_list before accessing it for use_vram path
>
> Jonathan Marek (3):
>       drm/msm/a6xx: update/fix CP_PROTECT initialization
>       drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
>       drm/msm/a6xx: avoid shadow NULL reference in failure path
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
>  drivers/gpu/drm/msm/msm_gem.c         |   7 ++
>  3 files changed, 122 insertions(+), 42 deletions(-)
