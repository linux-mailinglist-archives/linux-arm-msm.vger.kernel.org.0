Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851502FAC59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 22:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390514AbhARVOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 16:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394539AbhARVOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 16:14:23 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17BC061573;
        Mon, 18 Jan 2021 13:13:40 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m4so17750467wrx.9;
        Mon, 18 Jan 2021 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfnA+OcAFtcFxr40jr50iORRAFqvfHPsv5cZyKe+q38=;
        b=kf4hcAQVI7z5D5nCKKuzsC9xlBGTr6pcXf2bXzpyb9Vg1yxZryQb5rVAczfXwwMB/O
         w0ytaMNItFQpH5QEcHdBCppcQke40xV9cTnVyaHzfHjcHarRkwFiEP5Tg0hCZN3V5m1m
         hbtVC7T0YMhs5T9rBfF2JUVrVYnmCHr0rjxgHghCN7O6NS/5TrsBOkizPTEi1+37Cbrh
         XUuHWX31En/fpzPOC0+UuoE2twEcws7bG8pylBQMEz5ix+tDoxoHFCdXD3QTCEokX9Xi
         1MjI3jMzZ3VLADyM9sMKKPpt46Xl7bnNgjwTwI3GBEQDnNfNX2YYNfeoa6YS3ii/CkPU
         2adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfnA+OcAFtcFxr40jr50iORRAFqvfHPsv5cZyKe+q38=;
        b=QNu+OCMBRzx4Q2mGaJfX+XyFkPahmRui8YWEFErsKahWqxPZ+uw28vs2Q4SUr0tfPv
         dXey2hdiS3/34tTKcxjx1Jw5yXpT5c7aipYx4M0DHYOtusIOFfP1tMZymS6G2BX47FKW
         iW2bOqRSi9xeecTmoSAGEBWw9VogcRwveIPi28jdacDSea8dQG7p9N6JMYyDdl/GYHLw
         kuRlWRqLwnsAs2yv///1LeFaDuIPoJGOiReW/lMrcjziMciIdLS4LGCkGMJoh66dipoB
         MOLv4n0BNBs3umkpIPyj+P1gjIeMB6mJ07MR4D0nLUw5AT6LEzbzRrOySARRaoYZKroa
         pOGQ==
X-Gm-Message-State: AOAM532tY7gbzDw0QgNnaPTOQVvzDgvZFOthBIBe0D9qOm7Dm79Aad0a
        W7TS3tSn5yF6NIBhySgRRkVcrNSFVWZBDyl4R5A=
X-Google-Smtp-Source: ABdhPJwNOfYdNWJWdIYge61E+UF9gSVsMDMzVfyui5Xghpvq/H1vicFDjuRCKS1ARBjA6DEcTHQinCCBWD3lyiMeF/o=
X-Received: by 2002:a5d:6909:: with SMTP id t9mr1174197wru.327.1611004419225;
 Mon, 18 Jan 2021 13:13:39 -0800 (PST)
MIME-Version: 1.0
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org> <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
In-Reply-To: <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 Jan 2021 13:16:03 -0800
Message-ID: <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm: Add dependency on io-pgtable-arm format module
To:     "Isaac J. Manjarres" <isaacm@codeaurora.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will@kernel.org>, pdaly@codeaurora.org,
        Android Kernel Team <kernel-team@android.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 21, 2020 at 4:44 PM Isaac J. Manjarres
<isaacm@codeaurora.org> wrote:
>
> The MSM DRM driver depends on the availability of the ARM LPAE io-pgtable
> format code to work properly. In preparation for having the io-pgtable
> formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
> ensure that the io-pgtable-arm format module is loaded before loading
> the MSM DRM driver module.
>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>

Thanks, I've queued this up locally

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 535a026..8be3506 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1369,3 +1369,4 @@ module_exit(msm_drm_unregister);
>  MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
>  MODULE_DESCRIPTION("MSM DRM Driver");
>  MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: io-pgtable-arm");
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
