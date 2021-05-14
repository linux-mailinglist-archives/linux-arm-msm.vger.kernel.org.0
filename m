Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340F638134C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 23:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhENVo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 17:44:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:60894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230247AbhENVo7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 17:44:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCDDD613BE;
        Fri, 14 May 2021 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621028627;
        bh=nFTNUf+AC7R9gxTMKt09zZHN/guSnHnnI1FujB9AH4U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=L5RmQoLBbE2UEZsWCu0+0kvKidJh63T2v+p4gRnylG1h77+uBj98JrmJ5TkypzhVy
         ym3enc5S4inHywFlfxoakfpUsohLOWdp5vgubY44DNDQv8Gz72ZA5BkciujmfCn2PM
         bSs1QuUo9kS/jXsXeT5VUGJxIzoe7mPoo9sF+0i+RCBfD67A9rVgqDIf5aQcpcZw6s
         UtbcpNHZC6EBsGCSlCL333Bh60VpglUptmCKnwQxHQZPghAboe+V5Tmy+67WUYSm/V
         cAzEQD6W3u6P7fR4yXU45kodJY2vQBRm1/6VHFWqq5wnVLyhiCqoaAXHFPU3u3cEGu
         ZZlDxSAG2TCUQ==
Subject: Re: [PATCH] drm/msm/dsi: fix 32-bit clang warning
To:     Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20210514213032.575161-1-arnd@kernel.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <58a35b85-eb0e-bc02-29be-0cae46bd75b8@kernel.org>
Date:   Fri, 14 May 2021 14:43:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514213032.575161-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/14/2021 2:30 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang is a little overzealous with warning about a constant conversion
> in an untaken branch of a ternary expression:
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: error: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 5000000000 to 705032704 [-Werror,-Wconstant-conversion]
>          .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000UL : ULONG_MAX,
>                                                        ^~~~~~~~~~~~
> 
> Rewrite this to use a preprocessor conditional instead to avoid the
> warning.
> 
> Fixes: 076437c9e360 ("drm/msm/dsi: move min/max PLL rate to phy config")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> As found with another patch, using __builtin_choose_expr() would
> likely also work here, but doesn't seem any more readable.
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..accd6b4eb7c2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -972,7 +972,11 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>   		.restore_pll_state = dsi_7nm_pll_restore_state,
>   	},
>   	.min_pll_rate = 600000000UL,
> -	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
>   	.io_start = { 0xae94400, 0xae96400 },
>   	.num_dsi_phy = 2,
>   	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
> 

