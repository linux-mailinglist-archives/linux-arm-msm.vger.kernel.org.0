Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC2F10F12B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 20:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfLBTzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 14:55:53 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34617 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727977AbfLBTzx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 14:55:53 -0500
Received: by mail-ed1-f68.google.com with SMTP id cx19so696840edb.1;
        Mon, 02 Dec 2019 11:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMJrw1j/pvu1iTGY8pM0wCN2Z1+KfJ2O6ateeNGld0I=;
        b=WlefZGQNVPxv1RDNohpw2YBv8o7ZCghZpIMAxbHdVopovNYnGv6BA1DTyWctuWWNAH
         ezPN6ifqps0iyargYIqrDc1QWz+TCqaf4mK9BK7FJ1ugJyAyn6eUpkqqh4P9jMmEdOWQ
         WbZjwGoSGGZBsfQCJHK4Q/XWfBPkgrewKudJdYG5IU4omAxdd0vBGz1OUcaOWcKr5gXX
         qrv5OlklCc545GX9ZMp7pir/5AQt4D0t1dKsaVqZcYDWqja1qbX7OOkiW1cJsQ1Cf8lk
         2zxcHI+bbAkV8lH8HN5OP2UMDvueBshl4YDl21e5rNOieZtV+oyr2LP9fRqeNgVoqNp8
         OfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMJrw1j/pvu1iTGY8pM0wCN2Z1+KfJ2O6ateeNGld0I=;
        b=o7RCZAoqi6TK/G8vW0nSRcEFl//CDrNKIdIBNrPSdVVyL+c2W3FZbyQ+yrF9luJ7IF
         pUAMojN0Wu2LEa/Kqs8HIJNxBKwE1YG5gc/S7Tkv8KXeZndoVICG7OBPvCcZc+nQik34
         /seAaYSUUGNUDnofXSW1kgKeu+alrqH7L5lBSAoy7Q4tVDvl7RdMbUenqsMJb09H64KP
         UEGxOf68/zQD0gHJj5hUBdH7Vm9UFSmmeg7b8tMMHRWFd6fqSg/92WxV4u3mfwkH0+/3
         2TUOV1F1H7vh0foOjdcOIf7+WvxABWTGieAXiMv8nIzsI3MPc4maT3seyQ7QjKjwWM/f
         /bdg==
X-Gm-Message-State: APjAAAWKRJkTeM04t1sfnFlhknaU6Hau6ugR7GHwJ6Ax6+agXQx3hguQ
        By6j29CnscdGYCBDw7JSj4K8WkoNFTSm5qwgLPg=
X-Google-Smtp-Source: APXvYqzhBu0NZunAmV85IeuYNwR4VFGS6U/nWViEG3owaoouFkOXT76zHxBLe+Fv+kgzYb//3znvP/A636d5rkEOJ04=
X-Received: by 2002:a17:906:b6c8:: with SMTP id ec8mr1133332ejb.64.1575316551333;
 Mon, 02 Dec 2019 11:55:51 -0800 (PST)
MIME-Version: 1.0
References: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Dec 2019 11:55:40 -0800
Message-ID: <CAF6AEGuSb1p1=hPYwRgo8hWJc629ywK_qCg2vBLyXQKvjGvM3A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180 soc
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 28, 2019 at 11:05 PM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Changes in v1:
>         -Modify commit text to indicate DSI version and SOC detail(Jeffrey Hugo).
>         -Splitting visionox panel driver code out into a
>          different patch(set), since panel drivers are merged into
>          drm-next via a different tree(Rob Clark).
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index b7b7c1a..7b967dd 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
>         "iface", "bus",
>  };
>
> +static const char * const dsi_sc7180_bus_clk_names[] = {
> +       "iface", "bus",
> +};
> +
>  static const struct msm_dsi_config sdm845_dsi_cfg = {
>         .io_offset = DSI_6G_REG_SHIFT,
>         .reg_cfg = {
> @@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>         .num_dsi = 2,
>  };
>
> +static const struct msm_dsi_config sc7180_dsi_cfg = {
> +       .io_offset = DSI_6G_REG_SHIFT,
> +       .reg_cfg = {
> +               .num = 1,
> +               .regs = {
> +                       {"vdda", 21800, 4 },    /* 1.2 V */
> +               },
> +       },
> +       .bus_clk_names = dsi_sc7180_bus_clk_names,
> +       .num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> +       .io_start = { 0xae94000 },
> +       .num_dsi = 1,
> +};
> +
>  const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>         .link_clk_enable = dsi_link_clk_enable_v2,
>         .link_clk_disable = dsi_link_clk_disable_v2,
> @@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>                 &msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>         {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
>                 &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> +               &sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +
>  };
>
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index e2b7a7d..9919536 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -19,6 +19,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V1_4_1    0x10040001
>  #define MSM_DSI_6G_VER_MINOR_V2_2_0    0x20000000
>  #define MSM_DSI_6G_VER_MINOR_V2_2_1    0x20020001
> +#define MSM_DSI_6G_VER_MINOR_V2_4_1    0x20040001
>
>  #define MSM_DSI_V2_VER_MINOR_8064      0x0
>
> --
> 2.7.4
>
