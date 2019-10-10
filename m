Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A5DD30FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 20:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfJJS6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 14:58:17 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:38553 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfJJS6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 14:58:17 -0400
Received: by mail-yw1-f66.google.com with SMTP id s6so2563382ywe.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HnzDo6J7XPtXSDGmFJ7m3yzfxGtmqMxou+frhT1YXbY=;
        b=CQDn43tZBrhtRfHpzLdWL4rdyoSA0rTfFg/J40LA8pTbo9zJBlPXaAKX8dCLzTbriS
         USdPMwP8uzu7N7TGxaqN9xLUWJtG4knYWhb/kdT5uPwLy/3AxHkSb6aNm0QaKxnv7PsT
         H89yVk/OqtnXkLyrEHWazDd6ioGboYjwP/mPLNwQvAlK1an72DiOEN+mFdjA9Zi0CFHw
         AYX6bD46i2M3Tj7ZyYwtH4CnJjN4xCdKIjNT2Q6b/4eHTdNPprqkJn9el6CgpJ0N5CF9
         k6cYdWo7rGN2Upddpdf5M2idrg4Fd/f0md4xNV+ct5LJFzQwryNg2zNXkqPu+P0CxEUD
         prWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HnzDo6J7XPtXSDGmFJ7m3yzfxGtmqMxou+frhT1YXbY=;
        b=UK3RYnI3JSs60aHJAgeaVhUYB/fG+lON7/CdtP7o1VPhjm+pVDmCaX9EmZnSGULXOF
         mHXASjb5yeT1nV5ljxoZNDY8BBfvNdsuqWSllWgudDIF1HOPO04vifTeYpwRvgM1OscI
         GVM8AV2MUTDQFetHSx99/Gnxjn2rAhO0JOsQk8RpTgot89EuGvwMGI+fXZX9153FIxbY
         ukOw/BpcLMFTefmwWr1kYgzXyKvwTVT7moOtW2xolZvpyF2/8FUYK4jYpe7BtmF6Oqaf
         VsrBMQ3UBJMM2s1idqrCwWc+kPTLVpSV4VPLei57tYZ0OtwFNvzhaGwvPleP0uGlVsZn
         pv4A==
X-Gm-Message-State: APjAAAU3WDujTuA5khrUiDvX8oURm8HrhJlhmErVRtWH/oxuUoFu4MVJ
        PxYUy/eJ9jFq3hhVb1ebaOA95w==
X-Google-Smtp-Source: APXvYqykLeC0EhYVvNXlLWQlfAuhK8feubMl8CwTajOuOLhB38mkuNImas2t5fnAYgZxwucnqhDaaw==
X-Received: by 2002:a0d:c385:: with SMTP id f127mr8349803ywd.509.1570733896503;
        Thu, 10 Oct 2019 11:58:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id r193sm1583030ywg.38.2019.10.10.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 11:58:16 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:58:15 -0400
From:   Sean Paul <sean@poorly.run>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        tglx@linutronix.de, jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/5] drm/msm/dsi: Add configuration for 28nm PLL on
 family B
Message-ID: <20191010185815.GM85762@art_vandelay>
References: <20190926105256.61412-1-kholk11@gmail.com>
 <20190926105256.61412-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926105256.61412-4-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 12:52:54PM +0200, kholk11@gmail.com wrote:
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> The 28nm PLL has a different iospace on MSM/APQ family B SoCs:
> add a new configuration and use it when the DT reports the
> "qcom,dsi-phy-28nm-hpm-fam-b" compatible.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c     | 18 ++++++++++++++++++
>  4 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586c898f..d3ba9ee22f38 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -83,6 +83,7 @@ DSI PHY:
>  Required properties:
>  - compatible: Could be the following
>    * "qcom,dsi-phy-28nm-hpm"
> +  * "qcom,dsi-phy-28nm-hpm-fam-b"
>    * "qcom,dsi-phy-28nm-lp"
>    * "qcom,dsi-phy-20nm"
>    * "qcom,dsi-phy-28nm-8960"

Same comment here re: putting binding updates in separate patches.

Sean

> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 4097eca1b3ef..507c0146a305 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -481,6 +481,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
>  	{ .compatible = "qcom,dsi-phy-28nm-hpm",
>  	  .data = &dsi_phy_28nm_hpm_cfgs },
> +	{ .compatible = "qcom,dsi-phy-28nm-hpm-fam-b",
> +	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
>  	{ .compatible = "qcom,dsi-phy-28nm-lp",
>  	  .data = &dsi_phy_28nm_lp_cfgs },
>  #endif
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index c4069ce6afe6..24b294ed3059 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -40,6 +40,7 @@ struct msm_dsi_phy_cfg {
>  };
>  
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index b3f678f6c2aa..3b9300545e16 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -142,6 +142,24 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
>  	.num_dsi_phy = 2,
>  };
>  
> +const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
> +	.type = MSM_DSI_PHY_28NM_HPM,
> +	.src_pll_truthtable = { {true, true}, {false, true} },
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vddio", 100000, 100},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_28nm_phy_enable,
> +		.disable = dsi_28nm_phy_disable,
> +		.init = msm_dsi_phy_init_common,
> +	},
> +	.io_start = { 0x1a94400, 0x1a94800 },
> +	.num_dsi_phy = 2,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
>  	.type = MSM_DSI_PHY_28NM_LP,
>  	.src_pll_truthtable = { {true, true}, {true, true} },
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
