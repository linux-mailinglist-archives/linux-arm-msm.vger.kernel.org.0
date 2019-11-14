Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2ADFCC21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNRrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:47:18 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37792 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNRrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:47:18 -0500
Received: by mail-ed1-f65.google.com with SMTP id k14so5801601eds.4;
        Thu, 14 Nov 2019 09:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uIo531B/cUq75IiN6qR4DNybSGADhsaWaGA4/dANrUU=;
        b=rw6xzVmS7zdh8IO41zKmyH1EwS5ub484ZDfPzqMFnsZ8/bNOCwpsqUJT3eapWamnoa
         hRE3otsinYDkEiNefw82XE+uOulf3MvWrhYEfNyY7RFgYcmWNcyS/yvHKJpQpenMAgLM
         OD4hNu5S8VQ6WRXzgydzo0hjCt3n4IYDjIc9OYPRlSLy0Q5wGmBEhYZ1KLElSAnxuk4d
         LWiULGeDyeTj3t8PP+E9iAPFSqc5jjeaUG9F3W0rEzd8rIu5HXHvb6X0nfY0Cz3eSSEj
         t7aWD0smLhxLrybsj8804sTrjcFhPRFAbZdOCdNXQIwjN0lZiRGqA2mKWsppRsa4E9aE
         UdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIo531B/cUq75IiN6qR4DNybSGADhsaWaGA4/dANrUU=;
        b=CEGQHxgwxcUm88TPR9QdaeO4ywvm0tPnU2CqdMF6iVjAYj/+/NEiLEUkkZ6wtiXNU+
         L0JW3dDmFcveydUyedpuyUwhGhGr+27rI2YMHbwnripDyqlJoWkeTqBpQxbyuzg+qWBM
         /C16Nm+Vr9/SYOKtR9TnEOBD5iYcjaSDZh/HnEDmuw2yHdn5/cTVgXpCyXmlbmExkMDv
         jnfOYsEtUXJSzDbsf9/wQeHjB+BO6qE+pxx2vcsTyJmZhnHvRolNpVHFzU4n8HvT6c5D
         c7QuOwolxmE2TS0HcEqbCP1V5YeSd58e/0AqD5JismS+s/Pq+vDp8Ii2z5c6G54RluP2
         KvkA==
X-Gm-Message-State: APjAAAUx7hzG9rFIoJzGuZQxfGRv3Hrj/K4+OYfChTqWwIvOA3ol111F
        ByxNyb2Z5vxxddtMoiCKRMXgF5ayvvom7urm8z4=
X-Google-Smtp-Source: APXvYqw3CejNmaVz5GldVr/MDvSo09GNjIMxV6cGEH5VCjX8kpYok2NSUnjdMbIQdf5qOmCQs3bB2RJx5SRQqmEzN2w=
X-Received: by 2002:a17:906:f209:: with SMTP id gt9mr9586553ejb.241.1573753634099;
 Thu, 14 Nov 2019 09:47:14 -0800 (PST)
MIME-Version: 1.0
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org> <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 14 Nov 2019 09:47:02 -0800
Message-ID: <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/msm: add DSI config changes to support DSI version
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

On Thu, Nov 14, 2019 at 2:16 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add DSI config changes to support DSI version.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

For patch 1/2 with the panel driver, probably best to split that out
into a different patch(set), since panel drivers are merged into
drm-next via a different tree

BR,
-R

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index b7b7c1a..d2c4592 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
>         "iface", "bus",
>  };
>
> +static const char * const dsi_sc7180_bus_clk_names[] = {
> +        "iface", "bus",
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
