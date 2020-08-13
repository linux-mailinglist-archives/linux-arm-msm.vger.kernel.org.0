Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF41F243D19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 18:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgHMQQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 12:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHMQQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 12:16:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3DCC061757;
        Thu, 13 Aug 2020 09:16:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id p14so5187718wmg.1;
        Thu, 13 Aug 2020 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
        b=Me8R6C+bT+HcxPAfKWKJXWW0PdK3ui8PTkMX4mfTZia+OsdLQzy26AOH4SPA6csTne
         AH/QScFCt8eRHHy2kzT0sDROOyf/+cesMWqQDzb45MRYMkUxfYD4JU2UFEkPDBweUBWh
         sJ/MW/U31mPfbg6SC3XGecibDGmFei+W06ypvarH3yHd2NYMKqVlsHuPeDVYWw0HcyNq
         lxgL9T9/VTNfOTsOVzyWrBvLE9UymEpSfbSKTeDB9N9XjyKafFen4Me03sf8odU6w2LK
         7VGQQiyLYvEn+HgMVau1xJUNdI/Qgc3hT9zkTgbZpBYzqv70RrLfp518z+Su3/QtbSWd
         MMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
        b=IqWhVWrb36HKQZMtkS+pWRkVXE4ovhqA5qgSnIecSaQPkDMIzwGgG6bBgHro57YNdN
         htscDxBTHrOHEOQgUOkL5yP4S/WUhdHB1f5XUzIbdm/2KwVPlP2jL0sanjLySF8XoTrS
         LovPevFJIHjI3Ey+mmpZuUDllI6g7QLEhdCYy5S67tYA0YSwCtIbPnaDavxpK2GpR01z
         CEnLekZ0fsRSvnCXC24WPcsJSqqQDo2jRLKSZ8cnsByDd4qcm5ApKTyoXYdy7O+ItQeI
         MNUT+JMvQQgxP1kPwsvGWT5KH4LY5Xe3lsUphVC2oGU9MFJuxrHPYHN7W03WZgwRCN3T
         KBzg==
X-Gm-Message-State: AOAM531MHcNXSk/qxSSGCpIjZVRsxKa/EagPHyME4kg5ZYFriSRyNyfp
        N1/JbRji8MFz3mGvWkKuQc/IatJZaWCPl8YWiWVL9ssm
X-Google-Smtp-Source: ABdhPJx9BIL8YvczFKCJBH4UENkHUjiA1/2Ml3mI2JxBFhQVn2uDFhMYCBAVLjNaZCNs0zfCkO4LE+S5uR3RemIOvk0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr4890016wmj.164.1597335395036;
 Thu, 13 Aug 2020 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org> <20200810222657.1841322-8-jcrouse@codeaurora.org>
In-Reply-To: <20200810222657.1841322-8-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Aug 2020 09:17:21 -0700
Message-ID: <CAF6AEGsA-jWLvSjZYz=ZkM7cxC5Wv6rDcoVv-9K5QpEZT=Cv7A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 07/13] drm/msm: Add a context pointer to
 the submitqueue
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Will Deacon <will@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sam Ravnborg <sam@ravnborg.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sean Paul <sean@poorly.run>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 3:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 972490b14ba5..9c573c4269cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,6 +142,7 @@ struct msm_gem_submit {
>         bool valid;         /* true if no cmdstream patching needed */
>         bool in_rb;         /* "sudo" mode, copy cmds into RB */
>         struct msm_ringbuffer *ring;
> +       struct msm_file_private *ctx;

So, it looks like this is (currently) unused, and everything is
instead using submit->queue->ctx

That said, changing this so the submit also holds a ref to the ctx
seems to fix the intermittent splat I can trigger by repeatedly
hanging the gpu.  Which (from the pile of additional tracepoints I've
added on top of this series) seems to be related to re-playing submits
after the userspace process has crashed and/or closed the device.

It seems like the reference the submit holds to the queue should keep
the ctx (and therefore address space) alive, but I need to dig through
that a bit more.

BR,
-R

>         unsigned int nr_cmds;
>         unsigned int nr_bos;
>         u32 ident;         /* A "identifier" for the submit for logging */
