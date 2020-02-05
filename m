Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10E54153A01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 22:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgBEVSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 16:18:47 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40581 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgBEVSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 16:18:46 -0500
Received: by mail-ed1-f65.google.com with SMTP id p3so3626602edx.7;
        Wed, 05 Feb 2020 13:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HwPPuPnmVEwZ6aDLR6Qux/8T5vpoODzKg3MxR8eUbtI=;
        b=uaLEGuO51KXNG6vo70c0VJas4nlwIgWh3AIlvLVPa+k6MIC61WrmeJiOV6irU8bBJn
         FMojQR6awRUvBofxnnvbPG5tfA21oxc2TXBUJ6n97ia0GLOM200Yns8ZkWjGba70+vuv
         40g2Fi6yHD3PGwqGCFSiSc7GhCMS0Bp0kFyKhiuzt0QVh19vfF1LH05eaUVyEEd+9TNj
         w7XFGFlfMhgupGDb8bUcmBivE1qoji1UkhO01xM5OVTHZz/g2INx308WQLwgj+MqbUW0
         jDvMaRlP6xbYqTj5hNszoUaUC7Lu5NbGwyvL1WFgkCkxLcfkmJDdUeaAzOrY04InCdIb
         hkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HwPPuPnmVEwZ6aDLR6Qux/8T5vpoODzKg3MxR8eUbtI=;
        b=j5hoN9BQHnjyjvb0BoMQ962tfXZu/eHCNX72L9WlyMyrFZJBH4ZZBiZaynALR72iIO
         6iFIfM8aVzXOn/WIbPhswipO56H0QBgNSosVniSrA+At95z+Ex1un0MRmppi77FqOBtv
         xiKEyz7x/Ly6Ry5Mtey810Z58RkYoiBRMYw0VquYvKDQV/hqk88FMIPeE+YQvIYSnBkG
         RJiktWHrR6LfRnWry5DT0JCUELn1160Az23hDiG/OGoHlstfexdgrf2ZlxzzsSKR+T0u
         rm6awHI/dPoObVUufJqCqEufY5UgwljjfFMY3+lMhkdB4Emee0ZSeyAbh+dnLdmzr+wN
         xhzg==
X-Gm-Message-State: APjAAAVgF1YV9ElocZvFCVJSCLD5cYxfTDg8MC80waAhW+7M0Yi/AmDe
        KZD6e7KHsF6EC0Jrc5M+5ci/RAcjwgnMHfDNpT2KsuTQ
X-Google-Smtp-Source: APXvYqwwgRaj4ECfGfJoTZ8YyHexZeS1MvdlVz7PnDwj0THon8h0EODB3kHzoiQQoG1OEnlQsrBRRd2OhNZ8owrKaT8=
X-Received: by 2002:a17:906:6d03:: with SMTP id m3mr18262ejr.39.1580937524119;
 Wed, 05 Feb 2020 13:18:44 -0800 (PST)
MIME-Version: 1.0
References: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Feb 2020 13:18:33 -0800
Message-ID: <CAF6AEGv4z=XBuiNdnga2LofubRLjZ40O6chpjGorqeZJz2YQXw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Update the GMU bus tables for sc7180
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 5, 2020 at 9:01 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Fixup the GMU bus table values for the sc7180 target.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

I suspect that we'll need to figure out a better way to get these
values from the interconnect driver in the long run, esp. since there
are several different SoCs with a618.. but for now, this looks
reasonable

Reviewed-by: Rob Clark <robdclark@gmail.com>
Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")


> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 85 ++++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index eda11ab..e450e0b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -7,6 +7,7 @@
>
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> +#include "a6xx_gpu.h"
>
>  #define HFI_MSG_ID(val) [val] = #val
>
> @@ -216,48 +217,82 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>                 NULL, 0);
>  }
>
> -static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> +static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
> -       struct a6xx_hfi_msg_bw_table msg = { 0 };
> +       /* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
> +       msg->bw_level_num = 1;
> +
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x01;
> +
> +       msg->ddr_cmds_addrs[0] = 0x50000;
> +       msg->ddr_cmds_addrs[1] = 0x5003c;
> +       msg->ddr_cmds_addrs[2] = 0x5000c;
> +
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
>
>         /*
> -        * The sdm845 GMU doesn't do bus frequency scaling on its own but it
> -        * does need at least one entry in the list because it might be accessed
> -        * when the GMU is shutting down. Send a single "off" entry.
> +        * These are the CX (CNOC) votes - these are used by the GMU but the
> +        * votes are known and fixed for the target
>          */
> +       msg->cnoc_cmds_num = 1;
> +       msg->cnoc_wait_bitmask = 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] = 0x5007c;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
>
> -       msg.bw_level_num = 1;
> +static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> +       msg->bw_level_num = 1;
>
> -       msg.ddr_cmds_num = 3;
> -       msg.ddr_wait_bitmask = 0x07;
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x07;
>
> -       msg.ddr_cmds_addrs[0] = 0x50000;
> -       msg.ddr_cmds_addrs[1] = 0x5005c;
> -       msg.ddr_cmds_addrs[2] = 0x5000c;
> +       msg->ddr_cmds_addrs[0] = 0x50000;
> +       msg->ddr_cmds_addrs[1] = 0x5005c;
> +       msg->ddr_cmds_addrs[2] = 0x5000c;
>
> -       msg.ddr_cmds_data[0][0] =  0x40000000;
> -       msg.ddr_cmds_data[0][1] =  0x40000000;
> -       msg.ddr_cmds_data[0][2] =  0x40000000;
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
>
>         /*
>          * These are the CX (CNOC) votes.  This is used but the values for the
>          * sdm845 GMU are known and fixed so we can hard code them.
>          */
>
> -       msg.cnoc_cmds_num = 3;
> -       msg.cnoc_wait_bitmask = 0x05;
> +       msg->cnoc_cmds_num = 3;
> +       msg->cnoc_wait_bitmask = 0x05;
>
> -       msg.cnoc_cmds_addrs[0] = 0x50034;
> -       msg.cnoc_cmds_addrs[1] = 0x5007c;
> -       msg.cnoc_cmds_addrs[2] = 0x5004c;
> +       msg->cnoc_cmds_addrs[0] = 0x50034;
> +       msg->cnoc_cmds_addrs[1] = 0x5007c;
> +       msg->cnoc_cmds_addrs[2] = 0x5004c;
>
> -       msg.cnoc_cmds_data[0][0] =  0x40000000;
> -       msg.cnoc_cmds_data[0][1] =  0x00000000;
> -       msg.cnoc_cmds_data[0][2] =  0x40000000;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[0][1] =  0x00000000;
> +       msg->cnoc_cmds_data[0][2] =  0x40000000;
> +
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +       msg->cnoc_cmds_data[1][1] =  0x20000001;
> +       msg->cnoc_cmds_data[1][2] =  0x60000001;
> +}
> +
> +
> +static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> +{
> +       struct a6xx_hfi_msg_bw_table msg = { 0 };
> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>
> -       msg.cnoc_cmds_data[1][0] =  0x60000001;
> -       msg.cnoc_cmds_data[1][1] =  0x20000001;
> -       msg.cnoc_cmds_data[1][2] =  0x60000001;
> +       if (adreno_is_a618(adreno_gpu))
> +               a618_build_bw_table(&msg);
> +       else
> +               a6xx_build_bw_table(&msg);
>
>         return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
>                 NULL, 0);
> --
> 2.7.4
