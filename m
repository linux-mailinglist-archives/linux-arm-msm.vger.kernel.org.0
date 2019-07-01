Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F329E5C182
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 18:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbfGAQzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 12:55:51 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38862 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbfGAQzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 12:55:50 -0400
Received: by mail-vs1-f68.google.com with SMTP id k9so9353560vso.5;
        Mon, 01 Jul 2019 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9hpsLHOwYBTNgUUHIZrkULO7G1kYAcJRjXyIqaOWRmI=;
        b=qcpTiHJPbLBWjXPetB6GIiRnwUcaNNyX5NB4TnmPGjus6TpXK7WjOIQbb1ldh95SZG
         B0C3W1rCUkB35dC33DoDQyFIWv3LApNphWwlfrhm2VUBb+g6JudyExYvHsJaJ8eYuIsq
         GhpJN6Bb5i8gp/Aam/UdZUP4+c4mBHKLtWXRNRYpF+l5CyaZHc+SZC3fZlZ+jle00wHv
         NWgtEXh3NfJvdfLf8ZPIDTUvAN6EZMAhUsigt3GM+Lgc/FhHEhYBphSQgzrsnhiOr16+
         LVuHnDWH6Yg+0OlnRUhnpt+S06HdIKO6nzeoKu6ienC2prfjPAZfk5nIjukpsTAgg3mk
         bZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hpsLHOwYBTNgUUHIZrkULO7G1kYAcJRjXyIqaOWRmI=;
        b=Em1f+ugYnG0Q0jVeEnZHcJKTOZ4vx6sBSCR8BpA3xCWo7hbkdOaVvQ4UiN3+hGcCx+
         PJV9m8C6amKUCoB/yJGwVg1ywo7U539fN8ORNJoQ024sK+8NZ6J+a/68C4MPmpKS0qs9
         q+aJm/h6E/ZpZHHK7vHbnCTz+aRiMLU4OIezv/CtaakhMGtiU5izo6PBTGDV4F7368GS
         BmAUTbL1G0YQwxAMv/ufWsg4PfO2hMXXYD07DccSF9gv0lo3OLZgoaK3CoSwiZIQvkpi
         LsWonXt/7A7VsL9f5oU9u0dEQnsC70iLvzATyyaTerO5LHBR8Ol9GmOJFRc4NryxQLBg
         YStw==
X-Gm-Message-State: APjAAAXgK7/pYwyhR3LWqil5R6EdxMIH0j0oPYor953obP9FajNxOu3S
        Vtm38AvUr6XwcL15mh93lKjPrq1XMWrxTLgGDo7NnrMo
X-Google-Smtp-Source: APXvYqxXrwMWAFaMAkfDfGjVZRGknf91sOEOwGuCDcLY5CpuQQCHeG4XkXBuiu4jeSaNk1Y/xa95e2GybiNG9fSePV0=
X-Received: by 2002:a67:9946:: with SMTP id b67mr15331235vse.37.1562000149810;
 Mon, 01 Jul 2019 09:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032245.25906-1-huangfq.daxian@gmail.com> <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
In-Reply-To: <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 1 Jul 2019 17:56:02 +0100
Message-ID: <CACvgo525gKG1xok-O-AmTLT4OgupB2FCoO=qeBqS=DXK5vhFOg@mail.gmail.com>
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

On Mon, 1 Jul 2019 at 13:37, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Fuqian,
>
> On Mon, 1 Jul 2019 at 08:13, Fuqian Huang <huangfq.daxian@gmail.com> wrote:
> >
> > Using dev_get_drvdata directly.
> >
> > Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c      |  6 ++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         | 13 +++++--------
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c        |  6 ++----
> >  drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 ++----
> >  drivers/gpu/drm/msm/msm_drv.c                   |  3 +--
> >  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 15 +++++----------
> >  drivers/gpu/drm/panfrost/panfrost_device.c      |  6 ++----
> As far as i can see the patch is spot on, thanks for that.
>
> Can you split this in three since it covers 3 separate drivers.

Quick grep for "platform_get_drvdata(to_platform_device" showed a few
instances through various drivers - exynos, msm, etc.
If you can address those with v2 that would be great.

-Emil
