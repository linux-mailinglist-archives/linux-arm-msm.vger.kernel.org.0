Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151BA648267
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 13:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiLIMfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 07:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiLIMfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 07:35:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3426663F6
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 04:35:53 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g7so6815505lfv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5LAJn5eb20EOKQaaJgFOuqiaayE8m62dxwkyVKCyi0=;
        b=q/mAhZviyoSb6rIud5deF7CYKr4vesqA4O49CQNDKEDUf5UOeqRQeHEisKcx+MJ52W
         7d1drFcqGBov7sI2W6BoBieOsMXA8bjXbGfsHcWpYJmHW+p3saCpZ+SEJanthGzitdnX
         d5W1O5cgMch/Qxu9hjj7PwH43LvKeK4N6OaV4TSjAB10LQ6oYKwsz6xEKzulmTyC1mUC
         4Bs/LiurqlMMZ3cj3Z8Ao4EdG4rodAkr8VLR0fq6YotiDjZy5SoqHjkETkRLSXlZcK6+
         7LYb1lsQu0RMU8ymfjza0bEUMv168CrW48MEYZ2DxLO71gz1VQ1HbhOo+QTPwwxSx1ie
         aY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5LAJn5eb20EOKQaaJgFOuqiaayE8m62dxwkyVKCyi0=;
        b=B9PiIFF1gEFyUCX1GvQ31YOIPEcxNsGs5ZpT7FWDGs3K1l8L9lT8TOSHFHJAadTJoz
         FUcsYq+mrfh8E5r8k4yPkxhtMBc8lLMlsfm3ttGyAmFUwvKsgmNXGOHz27so0PK5glFS
         s/QtH263CuMobdyhIURMnp5dj5A5FvSc+5XhHrmsBkAQjsC6ETIJCIrFpWe2E8IXOoLD
         2JhHwidUE0dvFek++CmjltLx1COqc2IRj2/uFytAXjAqGA8ivVRxpC8YhcEPZTRTykzt
         KtNkBE4loPM9/zdY4u3OvZySp/3N+DA0Q5WWj/rlNs25q+kDXmNMIRhJl+/2c/Ad7lbU
         AR0Q==
X-Gm-Message-State: ANoB5pmlj5TR3qYXaNBpy7pa1giNQDIt4fOfnagcZKyeWE11eCCCYOEG
        7om8/ZceQ5tM2u8lP44TUKF55Q==
X-Google-Smtp-Source: AA0mqf7GXkR8KHHNI7a/cuoVTYEpSvuA6Y/WZDPv+8xgyv0PNGicf0nZK37Tglz2e7QcaoYhu35kEQ==
X-Received: by 2002:ac2:52a6:0:b0:4b5:5caf:9d62 with SMTP id r6-20020ac252a6000000b004b55caf9d62mr1420731lfm.61.1670589352223;
        Fri, 09 Dec 2022 04:35:52 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id z3-20020a195043000000b004a478c2f4desm242123lfj.163.2022.12.09.04.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 04:35:51 -0800 (PST)
Message-ID: <d3693f37-0edd-f56b-9825-eaeda8b41d93@linaro.org>
Date:   Fri, 9 Dec 2022 13:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/msm/dsi: Fix byte clock interface rate for 14nm PHY
Content-Language: en-US
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2022 10:54, Loic Poulain wrote:
> According to downstream driver, byte intf clk rate should be half the
> byte clk only with DSI PHY verion above 2.0 (14nm):
> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dsi/dsi_display.c?h=LA.UM.8.12.3.1#n3991
> 
> This change introduces a no_byte_intf_clk_div phy property, used to
> control byte clk intf divider.
> 
> This fixes DSI sync issues on 14nm based DSI Phy platorms.
> 
> Tested with:
>     - QCM2290 (14nm phy) + tc358767 DSI/DPI bridge
>     - QCM2290 (14nm phy) + lontium lt9611uxc DSI/HDMI bridge
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
Required for the DSI display to function on SM6115 Lenovo Tab P11

Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/dsi/dsi_host.c         | 5 ++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 428641e..1f8287a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -172,6 +172,8 @@ struct msm_dsi_host {
>  	/* from phy DT */
>  	bool cphy_mode;
>  
> +	bool phy_no_byte_intf_clk_div;
> +
>  	u32 dma_cmd_ctrl_restore;
>  
>  	bool registered;
> @@ -484,7 +486,7 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  
>  	if (msm_host->byte_intf_clk) {
>  		/* For CPHY, byte_intf_clk is same as byte_clk */
> -		if (msm_host->cphy_mode)
> +		if (msm_host->cphy_mode || msm_host->phy_no_byte_intf_clk_div)
>  			byte_intf_rate = msm_host->byte_clk_rate;
>  		else
>  			byte_intf_rate = msm_host->byte_clk_rate / 2;
> @@ -2196,6 +2198,7 @@ int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>  	int ret;
>  
>  	msm_host->cphy_mode = src_phy->cphy_mode;
> +	msm_host->phy_no_byte_intf_clk_div = src_phy->no_byte_intf_clk_div;
>  
>  	ret = msm_dsi_phy_get_clk_provider(src_phy,
>  				&byte_clk_provider, &pixel_clk_provider);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 4c82575..06d2284 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -103,6 +103,7 @@ struct msm_dsi_phy {
>  	enum msm_dsi_phy_usecase usecase;
>  	bool regulator_ldo_mode;
>  	bool cphy_mode;
> +	bool no_byte_intf_clk_div;
>  
>  	struct clk_hw *vco_hw;
>  	bool pll_on;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7414966..f4849e6 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -897,6 +897,9 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
>  
>  	phy->vco_hw = &pll_14nm->clk_hw;
>  
> +	/* For PHY version <= 2.0 (14nm), byte_intf_clk = byte_clk */
> +	phy->no_byte_intf_clk_div = true;
> +
>  	return 0;
>  }
>  
> 
