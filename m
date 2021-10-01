Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537D441F29A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhJARDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhJARDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:03:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922DBC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:01:16 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i4so41719328lfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6V1sgB8xFr3XkM1mp3PJ3AXlar399UUua4e4vTPpcZQ=;
        b=R1nYDvfDnDxqq9+zLbJvawWEwsFQ1qCwxhw1s0eRSXtDSUV0P+5ratb6sLWXWxpeGT
         mTkkVcx29cvm50SyXuQg475PdK3XVU0Fn+p+KKFlwADyUQ1BTPLRtkhGd26rhc85f3DT
         lJA1sllpuu6vHw8GAQsgSP3UFbyT5q57Pk9oBouKOnF/KF1V1PUf0eCmzcvk3AWmZDxE
         yR/Pu+pFKeWbJoaiwrYOX4aiYi7C/XpkbCglPsdb14Bc7fM/GCFCcsLbsTHuIFBGcgs7
         lwswcl9ose9N52hQ3/GlkZmTmRo4Mp2QECENFLVKthbqi6hqC0+ANo8qbJf54u+BjUCJ
         NXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6V1sgB8xFr3XkM1mp3PJ3AXlar399UUua4e4vTPpcZQ=;
        b=SEpFtd+s6TRseREyE1iqaJ2bpZU9hmr01680dGGOWz33gZ268m/z8Rb0pbgkPKxxda
         jZTS+5qvUe3b8icFGrXwZflNtsgK8QIVD7DiKP48y5Sh14ozlCSKkmFqj8ab/iKRiVWe
         aTR7lNUFX2em7k20IvDdCQDygt1yoZGJTZpeNeZtHPzZFDHS7yJEq0Zm1nwPD5SYH9iJ
         oZaOv7BHVfhBpaNq57WjSonirALAfRWJ/X17KV2XE5weSMNizyh895Y3Z2Hp293qTA+x
         sV5KCpQQt0b5+/v5Qdi4vOZ00Q6QQ2mvaURP3EMXTLkF3A2aVXjiZD2hI3AYj8XsOXf0
         ufrA==
X-Gm-Message-State: AOAM531N5UPhKJ8PbYnM8YUJtdrfS2UpfT+cKUO6cJZDbjyGJA7KH4kZ
        oZR3au/ioGmjVfwFxV3ct59K+lh5X9IbEZ5c
X-Google-Smtp-Source: ABdhPJwVsPJf/bidsSzZsTPdoUDvBipwmsUBJsjM/aGi4H28uBlyedpYfY6yBtQvp9XJAd83UJY/JA==
X-Received: by 2002:a2e:92d5:: with SMTP id k21mr13021912ljh.83.1633107674899;
        Fri, 01 Oct 2021 10:01:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h12sm693509ljc.65.2021.10.01.10.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 10:01:14 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in
 poll_for_ready
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210906202552.824598-1-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <92d901c6-88e1-778d-dcef-39e460693237@linaro.org>
Date:   Fri, 1 Oct 2021 20:01:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210906202552.824598-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2021 23:25, Marijn Suijten wrote:
> The downstream driver models this PLL lock check as an if-elseif-else.
> The only way to reach the else case where pll_locked=true [1] is by
> succeeding both readl_poll_timeout_atomic calls (which return zero on
> success) in the if _and_ elseif condition.  Hence both the "lock" and
> "ready" bit need to be tested in the SM_READY_STATUS register before
> considering the PLL locked and ready to go.
> 
> Tested on the Sony Xperia XA2 Ultra (nile-discovery, sdm630).
> 
> [1]: https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/clk/qcom/mdss/mdss-dsi-pll-14nm-util.c?h=LA.UM.9.2.1.r1-08000-sdm660.0#n302
> 
> Fixes: f079f6d999cb ("drm/msm/dsi: Add PHY/PLL for 8x96")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 30 +++++++++++-----------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 8905f365c932..789b08c24d25 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -110,14 +110,13 @@ static struct dsi_pll_14nm *pll_14nm_list[DSI_MAX];
>   static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
>   				    u32 nb_tries, u32 timeout_us)
>   {
> -	bool pll_locked = false;
> +	bool pll_locked = false, pll_ready = false;
>   	void __iomem *base = pll_14nm->phy->pll_base;
>   	u32 tries, val;
>   
>   	tries = nb_tries;
>   	while (tries--) {
> -		val = dsi_phy_read(base +
> -			       REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
> +		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
>   		pll_locked = !!(val & BIT(5));
>   
>   		if (pll_locked)
> @@ -126,23 +125,24 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
>   		udelay(timeout_us);
>   	}
>   
> -	if (!pll_locked) {
> -		tries = nb_tries;
> -		while (tries--) {
> -			val = dsi_phy_read(base +
> -				REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
> -			pll_locked = !!(val & BIT(0));
> +	if (!pll_locked)
> +		goto out;
>   
> -			if (pll_locked)
> -				break;
> +	tries = nb_tries;
> +	while (tries--) {
> +		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
> +		pll_ready = !!(val & BIT(0));
>   
> -			udelay(timeout_us);
> -		}
> +		if (pll_ready)
> +			break;
> +
> +		udelay(timeout_us);
>   	}
>   
> -	DBG("DSI PLL is %slocked", pll_locked ? "" : "*not* ");
> +out:
> +	DBG("DSI PLL is %slocked, %sready", pll_locked ? "" : "*not* ", pll_ready ? "" : "*not* ");
>   
> -	return pll_locked;
> +	return pll_locked && pll_ready;
>   }
>   
>   static void dsi_pll_14nm_config_init(struct dsi_pll_config *pconf)
> 


-- 
With best wishes
Dmitry
