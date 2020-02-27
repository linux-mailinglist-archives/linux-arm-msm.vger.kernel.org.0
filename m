Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F789172C68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 00:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbgB0Xlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 18:41:39 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35521 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729750AbgB0Xlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 18:41:39 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so472451pjc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 15:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
        b=NgD9KMhGVNVhQUdRxhMPpfYcyj4KNSCvL5unnyCbaQTOPhFfKGRPgZ+HQFMfzKULX2
         aPNS2TYrdM+f3jXnVBZMXwXR3BpGH+Qs4QzCMeTaGA1XeJAChmSALB3gsedpMWHKl5I5
         7vSS6POjQckU5dQYHVECKTG9TVgtWw56n8PkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
        b=CO+frYzrTBLjfap2/14x0tEY4lIv6husWpQdY60FwjHs/rZ5wmDlpfcYYtu9DMIvSU
         BWZrhOOReSBo0uClNKbcD0GC1gTYJ4jaDSH6sQTUspXMo7jazkizk+l+70hipDo4EOBP
         E0ubAPsT2AzkZ9FLtNIxErXSDFueFiyMtnE7rLOBF0+hCcJaEl1ldDYTgkxxDTZEA5Tc
         NJOlMlDn4gUoB8uOLNgJ5pOwHsT7031+VPlaJcm3dP2enKzhYh++v1RuSPsBXL8o2om4
         a1sv0hfTQscjnRMI8sJJMSkkgxXu/HiU7BPa+4m3P6ZgMHaQOaQNEOxSx4AZll5LreYP
         TWng==
X-Gm-Message-State: APjAAAV3hATz9kwjFUf3IWnJDgia83N+jN5Cg1q3MiHdSWZdSRELOGFA
        VkWrDMAeUC799e7QRTGjk7pwIQ==
X-Google-Smtp-Source: APXvYqwF7mXopVy4e3b74ONItwDUAaWOB6zck1YGUfvRN/uUanLfN7+dU7YIvhfbunorfy/XmpJlhw==
X-Received: by 2002:a17:902:aa49:: with SMTP id c9mr1254841plr.145.1582846896504;
        Thu, 27 Feb 2020 15:41:36 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u24sm7665466pgo.83.2020.02.27.15.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 15:41:35 -0800 (PST)
Date:   Thu, 27 Feb 2020 15:41:34 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        abhinavk@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [DPU PATCH v3 4/5] drm/msm/dp: add support for DP PLL driver
Message-ID: <20200227234134.GL24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 02, 2019 at 01:48:27PM +0000, Chandan Uddaraju wrote:
> Add the needed DP PLL specific files to support
> display port interface on msm targets.
> 
> The DP driver calls the DP PLL driver registration.
> The DP driver sets the link and pixel clock sources.
> 
> Changes in v2:
> -- Update copyright markings on all relevant files.
> -- Use DRM_DEBUG_DP for debug msgs.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
> new file mode 100644
> index 0000000..6ef2492
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>
> ...
>
> +static u8 dp_mux_get_parent_10nm(struct clk_hw *hw)
> +{
> +	u32 auxclk_div = 0;
> +	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
> +	struct dp_pll_10nm *dp_res = pclksel->pll;
> +	u8 val = 0;
> +
> +	DRM_ERROR("clk_hw->init->name = %s\n", hw->init->name);

drive-by comment: DRM_ERROR doesn't seem the right level, DRM_DEBUG_DP
would probably be more adequate.

Also I found this line triggers a NULL pointer dereference on a SC7180
system, where clk_hw->init is NULL.
