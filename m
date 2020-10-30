Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2712A072C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgJ3Nzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3Nzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:55:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC67DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:55:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t13so6914084ljk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jEivHHHppW7lKJKSPaA2MJ5onUInG0PkEmmlb+QvN6w=;
        b=htnlI/L0D+pPOTdEbli9XM5YC/psfkjbq7r2oMpqoiWUyoGis/mQCEbr+t/EYnCc0C
         979OuGH5bYgzBKnrAZ+6W/E9f8qxwnMYapNv/omy8Qu0E8Kl/hTiOV7lCqN6IO5UnunT
         NxcGVEHKW10cbrwjW1aZruyU5AZBiQMBUk4eqkDEuUAPTwx6I9fwI/lcf0DLlxKmAqd9
         h/2cux67cuo3A8zYwyrO1C8WkMGu+vQ+PZLLmHgnDcaDrSwwI/gadVOGF/UAbi1m0aHW
         VNdn7TuImE3850PXxcNtzDgyo/tY3iFAlD8ssbcY6jKuBtHYCWz7dSVAyVXroKxDXxL9
         DWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jEivHHHppW7lKJKSPaA2MJ5onUInG0PkEmmlb+QvN6w=;
        b=cAB+XMKZRiczTBwCajwqmncucXeA4XbgMDtr+4EihezfNnLV7to+XmPgvTRBjwXCl5
         fSBo9hzbRmYXB1VC1UpBberRdLO/JTpukg5deY9ot09NxzcJ1Zl4GAZbhX9b+RvL643C
         6/VYxvJnlgoWwv/BMYCl8eJcqQH0MfdNhoEW+K8hn32usi/TL8+yFYNppbC3xNJO347I
         YrDFEW0FpP9Gt6kERFMKVz0evqGofKwKzi6G6YQbRrGOl3nuAr2Sa3CqKNp8h4kXOBbO
         X7mZZynioyyCejdsdv6S5Gsp63LaMEvCHb4IxPKVrpDfXc0tBZ8xDPQOiZA9UWz0VdJp
         pWhA==
X-Gm-Message-State: AOAM533ILSrtQGUdxk309Qxm/rozMpgK94Q80YcyfYQT4HtmmJrXVnvX
        U1dt1bWeKeoONcLp0TCBkE6Pk9zQvfJcBv7N
X-Google-Smtp-Source: ABdhPJxcxVFBXD2WZ2FNbzFXyybMDQDLxJSVhSrScs29gB2Kab/Nk1XvOZiqO64RPpB7wOWcP8lo6Q==
X-Received: by 2002:a05:651c:1343:: with SMTP id j3mr1071034ljb.336.1604066129156;
        Fri, 30 Oct 2020 06:55:29 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.225])
        by smtp.gmail.com with ESMTPSA id b15sm696918ljp.117.2020.10.30.06.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 06:55:28 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
To:     benl@squareup.com, robdclark@gmail.com, sean@poorly.run
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        zhengbin <zhengbin13@huawei.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Anibal Limon <anibal.limon@linaro.org>
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
Date:   Fri, 30 Oct 2020 16:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On 07/10/2020 03:10, benl-kernelpatches@squareup.com wrote:
> From: Benjamin Li <benl@squareup.com>
> 
> Take advantage of previously-added support for persisting PLL
> registers across DSI PHY disable/enable cycles (see 328e1a6
> 'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
> support persisting across the very first DSI PHY enable at
> boot.

Interesting enough, this breaks exactly on 8016. On DB410c with latest 
bootloader and w/o splash screen this patch causes boot freeze. Without 
this patch the board would successfully boot with display routed to HDMI.

> The bootloader may have left the PLL registers in a non-default
> state. For example, for dsi_pll_28nm.c on 8x16/8x39, the byte
> clock mux's power-on reset configuration is to bypass DIV1, but
> depending on bandwidth requirements[1] the bootloader may have
> set the DIV1 path.
> 
> When the byte clock mux is registered with the generic clock
> framework at probe time, the framework reads & caches the value
> of the mux bit field (the initial clock parent). After PHY enable,
> when clk_set_rate is called on the byte clock, the framework
> assumes there is no need to reparent, and doesn't re-write the
> mux bit field. But PHY enable resets PLL registers, so the mux
> bit field actually silently reverted to the DIV1 bypass path.
> This causes the byte clock to be off by a factor of e.g. 2 for
> our tested WXGA panel.
> 
> The above issue manifests as the display not working and a
> constant stream of FIFO/LP0 contention errors.
> 
> [1] The specific requirement for triggering the DIV1 path (and
> thus this issue) on 28nm is a panel with pixel clock <116.7MHz
> (one-third the minimum VCO setting). FHD/1080p (~145MHz) is fine,
> WXGA/1280x800 (~75MHz) is not.
> 
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 009f5b843dd1..139b4a5aaf86 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -621,6 +621,22 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		phy->pll = NULL;
>   	}
>   
> +	/*
> +	 * As explained in msm_dsi_phy_enable, resetting the DSI PHY (as done
> +	 * in dsi_mgr_phy_enable) silently changes its PLL registers to power-on
> +	 * defaults, but the generic clock framework manages and caches several
> +	 * of the PLL registers. It initializes these caches at registration
> +	 * time via register read.
> +	 *
> +	 * As a result, we need to save DSI PLL registers once at probe in order
> +	 * for the first call to msm_dsi_phy_enable to successfully bring PLL
> +	 * registers back in line with what the generic clock framework expects.
> +	 *
> +	 * Subsequent PLL restores during msm_dsi_phy_enable will always be
> +	 * paired with PLL saves in msm_dsi_phy_disable.
> +	 */
> +	msm_dsi_pll_save_state(phy->pll);
> +
>   	dsi_phy_disable_resource(phy);
>   
>   	platform_set_drvdata(pdev, phy);
> 


-- 
With best wishes
Dmitry
