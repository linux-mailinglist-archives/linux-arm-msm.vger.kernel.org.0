Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F21B41FF2C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 04:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhJCCP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Oct 2021 22:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhJCCP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Oct 2021 22:15:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D08C0613EC
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Oct 2021 19:13:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so54871424lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Oct 2021 19:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N3yCtuhM9OsDyxx9IPztw+FRq2KEOy1aJh96Eu0sBd8=;
        b=VgBeru/4HyYEaPnWLp9u8BPNQpjlmLejiIEE9xZ4HESa/izcwdgarT9SgyyYPBzYWr
         8GqGIvZwxqyUPHE6LMiqdpv0N02pwY4qapREZL9HtZefZSWmLg3kLM/xob1bEsL54zz5
         X7TOEbikcG6RIa5MXjcwHDcIBuXO28xgDEkd2+fGna5fuG/5XrL/+slxoRxa9eQF/RmA
         IUMx52ab3q4qZSIcEgkZ0jIRCsOeHe4rrH2Up1+kCui8ePtCBbCqiwaUh01PhRhxhRdX
         FyGC+MwbPIlh/4NH8RUE/fC265GDnCLuDXh6+G2aXar80yR2XaSRYE5feTKrIuXm7SfX
         fHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N3yCtuhM9OsDyxx9IPztw+FRq2KEOy1aJh96Eu0sBd8=;
        b=PPjyFH8Y8oscQ4mk6jTel5ccYN2K6hu/IkVINhuioj0fwhTpcsF38SPGFU5+3CUp1l
         PT28Twl8JXsjQnACNvlAE5jYp1lcfrKRvAgTNS0Ox4eOSx6BXu+t6kdRSKOIn6vwhCc5
         ftvR1VGmj3vr2/w+qEJhud3K523/WGiP/gx3V437Mx6Zyj7ZTvwEujmPeO0sNR7oDlsR
         2uc18DOhXAzpQCaB75X8EW0MUTJggXNL++6xKt10kt3pEah0JWxlK/zYcHsd+ZwSjRl0
         1A1avA+N+JRLCpHXoT8yKJiqfPI9AdR9cMNge+g5ZkRJxMHmUX5e+mCM4VzDM+fPFHTF
         v02g==
X-Gm-Message-State: AOAM532uKSah5HX80cunPzAmltJy2pOGU3MDl/LI5sa+TqveVgZIR4tz
        MWHVxFbnMggj4Po85Ev3B8vy0Q==
X-Google-Smtp-Source: ABdhPJwP5EIRQWUNuGs8pI4n3eXcr9+JH9M2Pb35Cgepvn6RbL2/Fv5GaUyOcQz9un1xyxzNDaVGYA==
X-Received: by 2002:a2e:2406:: with SMTP id k6mr7193185ljk.453.1633227219905;
        Sat, 02 Oct 2021 19:13:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n9sm1192107lfu.88.2021.10.02.19.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 19:13:39 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] drm/msm/dsi: stop setting clock parents manually
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
 <20210709210729.953114-7-dmitry.baryshkov@linaro.org>
Message-ID: <f4237446-135b-c683-7346-236ade69f05d@linaro.org>
Date:   Sun, 3 Oct 2021 05:13:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210709210729.953114-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2021 00:07, Dmitry Baryshkov wrote:
> There is no reason to set clock parents manually, use device tree to
> assign DSI/display clock parents to DSI PHY clocks. Dropping this manual
> setup allows us to drop repeating code and to move registration of hw
> clock providers to generic place.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

As the DTS changes were merged for the 5.15, would it be time to merge 
the rest of this patch series for the 5.16?

> ---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  2 --
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 51 ---------------------------
>   drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
>   4 files changed, 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b07eced..1f0ec78c6b05 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -170,8 +170,6 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
>   			struct msm_dsi_phy_shared_timings *shared_timing);
>   void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>   			     enum msm_dsi_phy_usecase uc);
> -int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>   int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
>   void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..1fa6ee12395b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2219,57 +2219,6 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
>   	wmb();
>   }
>   
> -int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -	struct msm_dsi_phy *src_phy)
> -{
> -	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -	struct clk *byte_clk_provider, *pixel_clk_provider;
> -	int ret;
> -
> -	ret = msm_dsi_phy_get_clk_provider(src_phy,
> -				&byte_clk_provider, &pixel_clk_provider);
> -	if (ret) {
> -		pr_info("%s: can't get provider from pll, don't set parent\n",
> -			__func__);
> -		return 0;
> -	}
> -
> -	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	if (msm_host->dsi_clk_src) {
> -		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -	if (msm_host->esc_clk_src) {
> -		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -exit:
> -	return ret;
> -}
> -
>   void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc4a9ac..4a17f12b9316 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -78,7 +78,6 @@ static int dsi_mgr_setup_components(int id)
>   			return ret;
>   
>   		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>   	} else if (!other_dsi) {
>   		ret = 0;
>   	} else {
> @@ -105,10 +104,6 @@ static int dsi_mgr_setup_components(int id)
>   					MSM_DSI_PHY_MASTER);
>   		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
>   					MSM_DSI_PHY_SLAVE);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
> -		if (ret)
> -			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, clk_master_dsi->phy);
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 6ca6bfd4809b..952fd0b95865 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -835,17 +835,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>   		phy->usecase = uc;
>   }
>   
> -int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
> -{
> -	if (byte_clk_provider)
> -		*byte_clk_provider = phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
> -
> -	return 0;
> -}
> -
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
>   {
>   	if (phy->cfg->ops.save_pll_state) {
> 


-- 
With best wishes
Dmitry
