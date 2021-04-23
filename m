Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E7D3695A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 17:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237082AbhDWPJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 11:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242861AbhDWPIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 11:08:55 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083BAC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 08:08:18 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id d19so14182514qkk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
        b=XOkKKQbXZMkWcDYshtTtl3Sh5yWiva3sTa0AFxXsmvrvXjZf/atJ/JoRYC3Xts8BlV
         x24uSpxfwlU+Iaiugh3ZBy6Em1Buzir/Ra1YhNj4PqxdGWvFFEglcbo0vRDdd+tlY+5t
         4jI98v069K+8dRH1yXwmoHbEyw74tXNy6N6ivCjatW08mku/mqGSVpniDXVEKNq/3LkK
         v+DhmSy9VbpjBKzTzcJXYZDhLzMSVASlrRfaIt0TQec3DTrCwa/jEmj3P3MFIHnQ9s3f
         ZIUQyYTom/Dc1nFC9c/dgHRF2oISmsLcG64q+2+6FowSxj17c6vHT5KADrUjwyt5SiJ8
         7/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
        b=On8wjKNhOfqAaTumFlOkZ2qfwCfcBLZcabj6ww6i6D7qwuh76FRVXfxfPCKgWo+Ox8
         8nP4nXlW64c3KF/7PGMWwK7/bbku2Pu0XVoOciLsxkForzOVG8cCNHhdQI9IBllEh7Cr
         RQNT1uuDuAXCOzr7d3tyNhgnN3Gvfzv3FQOmLvbGKVwFo9BiPFj9XgIYdtS2FYGkE3iO
         PqXxHRK0NrJSQ7DevFBd9hTLrzyVNr39ToLnoXuX431yhLBu81C3CAUTzfp2dxObDOqD
         cUHFC0aivrCqBSX9wh2D4FbBHvI/y7TWdbG1NZEh5x1o4Ru6ZA2qTSHASE79CSuUfKL7
         ktPA==
X-Gm-Message-State: AOAM530cCwdF/Z1f2CmIe397hhOAvEub9cHxQVCL+mWlO2aa+exPSFEP
        Lo+UcspgvMjPsD4gNBOENPdmdA==
X-Google-Smtp-Source: ABdhPJyTywhnJyaB9YRYFW07GHm65WRhqKgMqmwDxOTsEt8/ukIP8gBQYati/quG/amJc+aBgYA/wA==
X-Received: by 2002:a37:68d4:: with SMTP id d203mr4474732qkc.189.1619190497287;
        Fri, 23 Apr 2021 08:08:17 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id y6sm4488489qkd.106.2021.04.23.08.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 08:08:16 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <589a5a1c-cb90-72ce-38df-4f497fd36f16@marek.ca>
Date:   Fri, 23 Apr 2021 11:05:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Jonathan Marek <jonathan@marek.ca>

On 4/11/21 8:01 PM, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 
