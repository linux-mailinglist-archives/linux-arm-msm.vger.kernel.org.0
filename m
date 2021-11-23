Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0269145A6D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 16:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbhKWPx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 10:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238493AbhKWPx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 10:53:57 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A50CC061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 07:50:48 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n85so19825752pfd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 07:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5/dnjXoJ8teDVOSqiNUzGVK+QNLdlAM4nDDCgZROWw=;
        b=SZkGjoNNQtoublRXDZq9kgD0trOc0Q3U7nJiv1jg/3HrkIypSCJMhDm2r8+yI4mlNk
         wFndxsoxTZh4EX9CjzlM8JK1ivzYhc7Sib4z0ff7ifSmOdO23HtUVAM2g1V+TL1QhNDq
         p5q8jjV7FynYOzQdmJcOyaP1OyvIqyI2wNEf9+YGWW6VwpAHNjHnURtVWJuIzu6sr+qF
         mUn7Aqm/BHrSARXaf6omS1Xina4ZDNToYiAsaS3znXEVPkbyhoRiKxOVT5NTA2/CmrCp
         Z3TuNp85RgwLUhTTvyeaJBqKu2iMIweqZRtjp7IFx6uZW2CHflreaDUWP707y/lYeuY6
         stjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5/dnjXoJ8teDVOSqiNUzGVK+QNLdlAM4nDDCgZROWw=;
        b=bfgEayPlkJRzMuqhCMrunlo8quN+a+qALggUsgLu+I1cwBx6HUVk4iSzdMpmrIvmas
         JdyAIi+1WLEukQC+A4UN27zoD7HtyC8GksxF95BbOJUpJEv01L4Gkb3/Uv6GvKZHFZjc
         VU59/cwuHRaOAnB9Y5UMXiSKx67aE3FKcrDuda2wJbiOutOzbzsUkUyVdJ7ru1VwJIKX
         Us+m88k4/k3fJd+pfnSD493JujUkRQWkKhfYR6sPYCexf98MG0DFLn4/ufrb4yWzPA6/
         qkwOhSGYf/hDlue2+WACgXJxVzfbL9zuRPDlbO/Mw+toyDLlk11mdof/iL/NOLaGgHVq
         tn6w==
X-Gm-Message-State: AOAM533cuDDMVegSkJ6FHzqJS0CLFlOP4MFQS9RqSiQfGhfFTgwnmtIm
        ch3w4RcUvc3sxbthAn7lEidGSUvVkllyOPyd7/xqtQ==
X-Google-Smtp-Source: ABdhPJx911N+Fj7qf+H5dcOu/OnmfyUkA1zkkaVVKqEAufjOTT1k6nEfn/NtxZ2mTj/uwQ0jK+uc0rkOnN6MIwSWgRU=
X-Received: by 2002:aa7:9903:0:b0:49f:e368:4fc3 with SMTP id
 z3-20020aa79903000000b0049fe3684fc3mr6070106pff.1.1637682647615; Tue, 23 Nov
 2021 07:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20211123154050.40984-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211123154050.40984-1-bjorn.andersson@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Nov 2021 16:50:34 +0100
Message-ID: <CAG3jFytT1Bvagn8hQnVvE48X-jR+pyNuQtjcgJAYmBC97=BL7g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add more of the INTF interrupt regions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Nov 2021 at 16:39, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In addition to the other 7xxx INTF interrupt regions, SM8350 has
> additional INTF regions at 0x0ae37000, 0x0ae38000 and 0x0ae39000, define
> these. The 7xxx naming scheme of the bits are kept for consistency.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 18 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  3 +++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index d2b6dca487e3..a77a5eaa78ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -30,6 +30,9 @@
>  #define MDP_AD4_INTR_STATUS_OFF                0x420
>  #define MDP_INTF_0_OFF_REV_7xxx             0x34000
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> +#define MDP_INTF_2_OFF_REV_7xxx             0x36000
> +#define MDP_INTF_3_OFF_REV_7xxx             0x37000
> +#define MDP_INTF_4_OFF_REV_7xxx             0x38000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>
>  /**
> @@ -110,6 +113,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>                 MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>                 MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>         },
> +       {
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
> +       {
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
> +       {
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
>         {
>                 MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
>                 MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index d50e78c9f148..1ab75cccd145 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -26,6 +26,9 @@ enum dpu_hw_intr_reg {
>         MDP_AD4_1_INTR,
>         MDP_INTF0_7xxx_INTR,
>         MDP_INTF1_7xxx_INTR,
> +       MDP_INTF2_7xxx_INTR,
> +       MDP_INTF3_7xxx_INTR,
> +       MDP_INTF4_7xxx_INTR,
>         MDP_INTF5_7xxx_INTR,
>         MDP_INTR_MAX,
>  };

Reviewed-by: Robert Foss <robert.foss@linaro.org>
