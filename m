Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF26720EC11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 05:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgF3Dfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 23:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgF3Dfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 23:35:50 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6D0C061755;
        Mon, 29 Jun 2020 20:35:49 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so18955467ejn.10;
        Mon, 29 Jun 2020 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJmSmwrsaH1bBcOCXi7RMW99NT7rqTSYgM8PKCwsCVQ=;
        b=qDEvnMum80gV5DvWSU5LwQhbLXk5TfinUIQ/IMpus0k6Rw+VScCW9Yv1HA7db8lJ8E
         sS0nOnrkDYcOTrQ7N55qSxOB+vBYLLNN5+f7ee8WhBC0DIvpmoujM4v/TXmTo7RCb211
         b1qW0H1YU2AGgcLuswKtS/A+kAdIrTbKnNhRGaOR7OEuN40xea79yJxzoSEIn4rUmcK1
         xEt1v/X1I1X0FDC2+42Q7u2bczAIjNLPly7sSY/lwpdQnDpYdUXfh3olM3AQeJaHTqfE
         SFoebc9xy3rDlLgua88QRc+TiL/NDg1ZZezu+PnwlPtUY6LOIeCDthEY5hSDFQkdcYYh
         houA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJmSmwrsaH1bBcOCXi7RMW99NT7rqTSYgM8PKCwsCVQ=;
        b=gM9aAjdK7VIN31271KVcyM2jvf9W4b/CBJFmubQjQKIaxiFlwd8BGGydkpj7/Uk96v
         o0a+e5ymnE1z+c4/Hq3RY7AGJl5FMou5R+wObvD1QzSq+v2dA/C05ZYrMX13/JXvW5Gy
         toOEhmVk4av18e2o8FHse0O9Osp+hdtnWFGJl1GVsmnnBDLYxpDTpBFHSaI/gCw9+SaL
         TZN99n/oF+V37xhcfxA/b9/+VZr975BeSt1HmiSqY+RfsC0dAlKaVNpSZLiDGjuHc7jU
         cC0N9vA0b3vJkda2qfJyEO9EFzfy4uqyyArFVz1Kb7tuU8o9gvWgkHc+shjdqZaRD/Yx
         1E/A==
X-Gm-Message-State: AOAM533T7LCteTF+waItVhG8wzWUVV/DIu4gyAGUE3oh+fsrhdDdUrtS
        aC1v/xfsx0QLAgvuui1ldEOu1d2wWRfzunYi5yw=
X-Google-Smtp-Source: ABdhPJxIln0jXR4HaSVjKUP56QmC1imF/pnulXgJu7ASsZsBlTWTXsrX/u1Fk9SDVfSNOKBCkCqdGImbFFK86KhXx1Y=
X-Received: by 2002:a17:906:ca4c:: with SMTP id jx12mr15323864ejb.231.1593488148574;
 Mon, 29 Jun 2020 20:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200629234921.3511-1-jonathan@marek.ca>
In-Reply-To: <20200629234921.3511-1-jonathan@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 29 Jun 2020 20:36:18 -0700
Message-ID: <CAF6AEGtEbAKo21YNMrV58FWiXSSKR7odycXYp=cW9Mso=qFATA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm/a6xx: add A640/A650 hwcg
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 4:49 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Initialize hardware clock-gating registers on A640 and A650 GPUs.
>
> I put the hwcg tables in adreno_device.c, but maybe it makes more
> sense to keep them in a6xx_gpu.c? (this would allow switching a5xx
> to use the gpulist too.. it isn't possible to include both a6xx.xml.h
> and a5xx.xml.h in adreno_device.c)


yeah, I've kinda tried to avoid "crossing the streams".. maybe these
should move to adreno_gpu

BR,
-R

>
> Jonathan Marek (2):
>   drm/msm/a6xx: hwcg tables in gpulist
>   drm/msm/a6xx: add A640/A650 hwcg
>
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 140 ++-----------
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 219 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +
>  4 files changed, 251 insertions(+), 123 deletions(-)
>
> --
> 2.26.1
>
