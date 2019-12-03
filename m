Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E312111B99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 23:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfLCWWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 17:22:36 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45657 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfLCWWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 17:22:36 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so2521852pfg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2019 14:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WUFFntsV9GWQxH2xEiMtMGTiHEnUItioA0CI190kL8o=;
        b=bn3QlKL7vQGhK8lGFIzeXVQeOlnmkW/WGjIxexoPzjAeijuRHQXjl0M/udzBuAI6cW
         QCaVRG5f/+Ls5qE8X9irTu+6QP+a9IvZ+SYeA7nmk9Pe4nU1ZBCK1MHX2YPQCvIseMS3
         iiHYDyWjBtXGx+TKbfqCahbY+bU12y33YOblo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WUFFntsV9GWQxH2xEiMtMGTiHEnUItioA0CI190kL8o=;
        b=hy4XR2t/fX7wwbcLl7NKVNf4n6flVh7+B0cgK+v034qnJ59ipYbSuZvbVS7hflG3CD
         tcLfHwYIy/whMc8cqHpAI192dKl/ZppUn18/+d0DazLbhFV7KGU7Jam/KBsj6Or4xK3E
         bIZ2icOJmw9y/vVEsgtVUYOYiiizfbDsIbyqDlD2LvFY+tvV7N2JxsXZ/Jy6dFvenkGh
         9In8O1S8FDGJaVw5b/EVfChkZvJOwlOV2IAv/nHFv0sI9Cfg8APbmTXy2trxFEoe9uBw
         bX1j0RqIqHBviM4C07HixOxh1jpyaqo7qQQb7T52KSo4OEKVMiNS9QcH747AsF+yRpWD
         rsSg==
X-Gm-Message-State: APjAAAVe7+/BHjL6ZpY35VSGhRudwdCFqnjB+gj//Ky1+6/ludVolXoX
        QcTUmGXW4N0vVDarkv4s8C4zNg==
X-Google-Smtp-Source: APXvYqyWX3GXr5G09PtL3d5pS+d902L2fj13z6zE3hBT0ixPruP16jvHAkG9yTWgiA2y8zHopTszAw==
X-Received: by 2002:a65:5c0a:: with SMTP id u10mr7846832pgr.258.1575411755669;
        Tue, 03 Dec 2019 14:22:35 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id l9sm4444155pgh.34.2019.12.03.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2019 14:22:35 -0800 (PST)
Date:   Tue, 3 Dec 2019 14:22:32 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180
 soc
Message-ID: <20191203222232.GG228856@google.com>
References: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 29, 2019 at 12:35:05PM +0530, Harigovindan P wrote:
> Changes in v1:
> 	-Modify commit text to indicate DSI version and SOC detail(Jeffrey Hugo).
> 	-Splitting visionox panel driver code out into a
> 	 different patch(set), since panel drivers are merged into
> 	 drm-next via a different tree(Rob Clark).

The change log shouldn't be part of the commit message, please place it
after the '---' separator.

I think at least a one line commit message besides the subject is
mandatory, so if you move the change log down you'll have to add
some short summary.

> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
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
>  	"iface", "bus",
>  };
>  
> +static const char * const dsi_sc7180_bus_clk_names[] = {
> +	"iface", "bus",
> +};
> +
>  static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> @@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.num_dsi = 2,
>  };
>  
> +static const struct msm_dsi_config sc7180_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdda", 21800, 4 },	/* 1.2 V */
> +		},
> +	},
> +	.bus_clk_names = dsi_sc7180_bus_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> +	.io_start = { 0xae94000 },
> +	.num_dsi = 1,
> +};
> +
>  const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>  	.link_clk_enable = dsi_link_clk_enable_v2,
>  	.link_clk_disable = dsi_link_clk_disable_v2,
> @@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> +		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +
>  };
>  
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index e2b7a7d..9919536 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -19,6 +19,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
>  #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
>  #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
> +#define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  
>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
>  
> -- 
> 2.7.4
> 
