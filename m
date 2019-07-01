Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF7635BB9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 14:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfGAMhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 08:37:20 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39047 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfGAMhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 08:37:20 -0400
Received: by mail-ua1-f66.google.com with SMTP id j8so4979326uan.6;
        Mon, 01 Jul 2019 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8qXk/n+3rdVBDEavtXjY7etsHzDiYEiRL3WTtVL85Y=;
        b=qYcY/7lQy1CgNd8mir2T92J/oON5i+/nuKlFXZbwntSuvuJwOcgd5/nbtSfY9c5wyK
         68U+Qg0FMSB07vB2zreh5uJ0/057ANxLNDTzaNtIrRod8+E8PUmEPV8zB+CyzVbpetdi
         7iLYej+bNrBSeIEdu8AAmmE5MKztobYW4JAHWauvGIyDL+MwSB+suBGxZWFFm7GNDOsR
         S21Vix2PC5KtrjI8V2uUHvM9QtzqcruXKJNC+NJa45roazBRj7xNp/nyhnu4HpBejhjt
         d/giHHUifsBkWTZgsFQ8ijJ0gfMLmtv6aEYpOpU1sK5cz5fRdo/cjdLoRrpsbiD15LSf
         DNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8qXk/n+3rdVBDEavtXjY7etsHzDiYEiRL3WTtVL85Y=;
        b=Gql5f/tFtNM1yPkVJFZjrcSsIYGuQqWVobVKxS7FD1JEfN4LigmSvgbK7T+vy3e0Hc
         ViyERjieNMbspAF1Ir+neETA1i4q8Y2jSgvM9TnvjebfiLO2hvy7t0V0oxXIBpkqHSaV
         baY9hlPWIB3/hxwsiiOUgi/7t83ds0gKr+42HjR+k4knmP8PHWx3FXm54Kgf+V+7MsTY
         Xbe6tKuWF9iyZW1A0IBMyuaJjvMzGdIR67aQb3GJwuFYVexVCm2I8UztBWfS/j5BzAij
         seOe7Hw10VxR/3iqEp59amVMyhyo+JrzJxUU4GGWXJVcUdOJgu7gD5/tQAq+NSEhym8b
         m7Sg==
X-Gm-Message-State: APjAAAVSIJ2aUlTxXGdDO8HYFqWsKq0nxEhVM3wZ72ZI8HTZVixRMJL+
        CdyPvZ/0fyjN0GNc8iT9XTx/9RbX0GANQVfRag4=
X-Google-Smtp-Source: APXvYqwX1A2Ge22hNk0sNPWU4E1Kc+5pDoUd7KJF6Ltzx2z+GBS1+2EbBnnCCdTqd/lxfujquNJ3jA9QZRjJxZN2nr4=
X-Received: by 2002:ab0:5973:: with SMTP id o48mr5077380uad.19.1561984639288;
 Mon, 01 Jul 2019 05:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032245.25906-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190701032245.25906-1-huangfq.daxian@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 1 Jul 2019 13:37:33 +0100
Message-ID: <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpu: Use dev_get_drvdata()
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     David Airlie <airlied@linux.ie>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        Rajesh Yadav <ryadav@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Enrico Weigelt <info@metux.net>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Fuqian,

On Mon, 1 Jul 2019 at 08:13, Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> Using dev_get_drvdata directly.
>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c      |  6 ++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         | 13 +++++--------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c        |  6 ++----
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 ++----
>  drivers/gpu/drm/msm/msm_drv.c                   |  3 +--
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 15 +++++----------
>  drivers/gpu/drm/panfrost/panfrost_device.c      |  6 ++----
As far as i can see the patch is spot on, thanks for that.

Can you split this in three since it covers 3 separate drivers.
For each one you can get a smaller CC list - patches with 20+ people
tend to get blocked :-(

We can pick the PANFROST entries from the get_maintainer.pl output,
and add them to the commit message.
Thus git send-email will parse the commit message and automatically CC
the people ;-)

Cc: Rob Herring <robh@kernel.org> (supporter:ARM MALI PANFROST DRM DRIVER)
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com> (supporter:ARM MALI
PANFROST DRM DRIVER)
Cc: dri-devel@lists.freedesktop.org (open list:ARM MALI PANFROST DRM DRIVER)

HTH
-Emil
