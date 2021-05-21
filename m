Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DA038C8F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 16:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbhEUOLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 10:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233556AbhEUOLY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 10:11:24 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2E5C061574;
        Fri, 21 May 2021 07:10:00 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id k132so6651873iof.4;
        Fri, 21 May 2021 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgp+As3KlbEBKSyVtxsdvRFYlyX0rJUqDcyGgOG4188=;
        b=rCvHAT1e9N+Z+rjcivIbW+yWiuaTrYUO4h7otm2/sRCHaUk8pHxU4B3+PkmI3d0ZRJ
         2tAzBYA0FogjgbAW9UHIPwWHSJqgoogcJk+KIxo9bKBoFrhp5PDLOIkEL9pExfV5qjoo
         WgzhYo/qWms4xYCdozWOV/TKQivldqCSJmrbLDXIAazejM/OtE+9GQCH4nacmJzStpjG
         BjJf4OjkQJ44BYLrYcH1vgch1bc9kA1cg2kKmfMtI/+126z7oFd71CzcEoYOufDuYUy2
         yk0jOfGH+/6HiIgsfUp30JWLGgCVUWja0/QtiKJ8pn7eVEIIW2BgHxpDpAUalZn3IwKh
         vAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgp+As3KlbEBKSyVtxsdvRFYlyX0rJUqDcyGgOG4188=;
        b=bMoRJJI/2q1nWU+pUZDfna3VUH34dGYpuw78JefGPYcls95IyuOBAJrLsCVHXo/W9K
         2KBgB7Oiuvzs3SCV4aKfN28eV9UKg4M9FggpxC4aDU/V7ttEyhAod77f/6GhCB07Je3y
         mnhOy0La2MToybsWV3/wLi9gNbU0H+LHolyUdgsCgV1TiNlR1oPZRClJMudfIocFK53g
         39ePn9gSvOTbpx9itQE59H/Jc4BLXcUaJxs0JX+lMPXOkyISbjQkng0+88US5gaKJnTr
         rKbSckP1NHlKRlvPObwjpcQddZr7UDmfKZQ7R6ueHXbeOPnTS1xRn0JzlOZJIUaOhPE3
         e65w==
X-Gm-Message-State: AOAM530CI9uNd9T//gYt4wEM1VtwRCDxkCZKzb4HlziO68wvdaRs29Bm
        7Ec4X2GRwN7NCtTPqacrQgDRS9f3UQTIKsEjTbrpWHqL
X-Google-Smtp-Source: ABdhPJx963ZKIoMW0yX6SSKHV7v9iBzcVj51DKJpySvD2v+xqvtzSsBZXXpCXXZJOjbXRyJqMGA75GXapMiUzwK9shY=
X-Received: by 2002:a05:6602:14c8:: with SMTP id b8mr11637904iow.209.1621606199837;
 Fri, 21 May 2021 07:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org>
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 21 May 2021 08:09:49 -0600
Message-ID: <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, DTML <devicetree@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Display Stream Compression (DSC) compresses the display stream in host which
> is later decoded by panel. This series enables this for Qualcomm msm driver.
> This was tested on Google Pixel3 phone which use LGE SW43408 panel.
>
> The changes include adding DT properties for DSC then hardware blocks support
> required in DPU1 driver and support in encoder. We also add support in DSI
> and introduce required topology changes.
>
> In order for panel to set the DSC parameters we add dsc in drm_panel and set
> it from the msm driver.
>
> Complete changes which enable this for Pixel3 along with panel driver (not
> part of this series) and DT changes can be found at:
> git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
>
> Comments welcome!

This feels backwards to me.  I've only skimmed this series, and the DT
changes didn't come through for me, so perhaps I have an incomplete
view.

DSC is not MSM specific.  There is a standard for it.  Yet it looks
like everything is implemented in a MSM specific way, and then pushed
to the panel.  So, every vendor needs to implement their vendor
specific way to get the DSC info, and then push it to the panel?
Seems wrong, given there is an actual standard for this feature.

Additionally, we define panel properties (resolution, BPP, etc) at the
panel, and have the display drivers pull it from the panel.  However,
for DSC, you do the reverse (define it in the display driver, and push
it to the panel).  If the argument is that DSC properties can be
dynamic, well, so can resolution.  Every panel for MSM MTPs supports
multiple resolutions, yet we define that with the panel in Linux.

Finally, I haven't seen the DT bits, but I'm concerned about using DT
for this.  It inherently excludes ACPI systems.  You appear to have
sdm845 support in this series, but what about ACPI boot on the Lenovo
C630 for example?  Or any of the 8cx laptops?  We don't read the panel
resolution, etc from DT, so why the DSC?

I'm glad that work is being done to add DSC to Linux, it's something I
struggled with when working on the 8998 mtp, and I realize this is a
bit of a drive-by review.  However, it seems like there should be a
better way.

>
> Vinod Koul (13):
>   drm/dsc: Add dsc pps header init function
>   dt-bindings: msm/dsi: Document Display Stream Compression (DSC)
>     parameters
>   drm/msm/dsi: add support for dsc data
>   drm/msm/disp/dpu1: Add support for DSC
>   drm/msm/disp/dpu1: Add support for DSC in pingpong block
>   drm/msm/disp/dpu1: Add DSC support in RM
>   drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
>   drm/msm/disp/dpu1: Add DSC support in hw_ctl
>   drm/msm/disp/dpu1: Don't use DSC with mode_3d
>   drm/msm/disp/dpu1: Add support for DSC in encoder
>   drm/msm/disp/dpu1: Add support for DSC in topology
>   drm/msm/dsi: Add support for DSC configuration
>   drm/msm/dsi: Pass DSC params to drm_panel
>
>  .../devicetree/bindings/display/msm/dsi.txt   |  15 +
>  drivers/gpu/drm/drm_dsc.c                     |  11 +
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 204 +++++++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  11 +
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  22 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  26 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  79 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  32 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 293 +++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                 |  32 ++
>  include/drm/drm_dsc.h                         |  16 +
>  include/drm/drm_panel.h                       |   7 +
>  23 files changed, 1043 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>
> --
> 2.26.3
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
