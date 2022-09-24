Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E4F5E8952
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 09:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbiIXH6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 03:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbiIXH6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 03:58:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE17014D4AB
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:58:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j16so3542353lfg.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PuAD5D24+uhiTufP7iRuy4/qPUMPXXbRcb/BX2Cq2nM=;
        b=JTe0XbPvc/lRhAN1tYDhKZ4GB6Hh1TcDdNJM4+2cOC+m4/ti45IidoVxhDJCrNig5n
         M4erezjwOcrobgE6VYLgKJLZdRmQSdW4hmU8fddW3ZNvSz7lpMkjYBRwi9oOyN9UAZSJ
         ueizoDb9ymiWmeUBz+vLaoIpXBVYxXxeBpBYniO/lMwwF0/JMWtaB/Y+alqVElOpgDN4
         oCdVP+iD3xeBB2IbNurTfxD0b1UwZwpqdIKuMr9DpS/oVgXahWS0x5rPVwCmapZYNDWo
         YyBttJj2PtnuK3zj983nwl/v6iMPMNRzytYlB6+GSU+nhD5FSrlx0fbotzeokNk7Tf5f
         XOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PuAD5D24+uhiTufP7iRuy4/qPUMPXXbRcb/BX2Cq2nM=;
        b=3a9nQPtPK/OdW58DASLXPj2lEiXlyI/XaL3IgrbfU0yIZ/mwscr9NR3cvKzgEv/nEA
         DPsmOpp0FntwnCxTDs/avQ7ONGhE44+abgLn3kU8acs4vql/ekJFeThJx3mGAIVRC+zx
         O2WjK7XgGUzlKRFsqx3OeJxSym2dw1C8puOj6KMC1EPUO/oElX18e09v6qUYGaM7GtR6
         kHPWSDBRPJo4Xt/Ll7e70UhHjOfvxtq6axJVP2XgpbpLtTvhAu9BsF3t150tEzHNA9sA
         Na5WtV9uK/7aekKu0g67bYIxROA4yqgN8B9Kf7q3UlhhKTJyT9dXeUvursDNjwiy3hap
         qlNw==
X-Gm-Message-State: ACrzQf1nP9xAz715ip/n+2EhSvONDvjLoG4jfEhdaeD2lpBaRNUulxnT
        aOqhKfr5T7K+1r1H/1WAFFJ3LpnBrzqYtQ==
X-Google-Smtp-Source: AMsMyM6ekgKdbnBtoOQtlJcTEqNZ6lujJDmoNH/8dtqntP29FkpXXY9MfO3O/BLpQXz9Frzy3/A2EA==
X-Received: by 2002:a05:6512:3d25:b0:49a:d2a0:7208 with SMTP id d37-20020a0565123d2500b0049ad2a07208mr4764144lfv.82.1664006316147;
        Sat, 24 Sep 2022 00:58:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf37-20020a056512282500b004a05402c5c3sm637801lfb.93.2022.09.24.00.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 00:58:35 -0700 (PDT)
Message-ID: <5557551c-9cdb-f35e-647e-610243b65c2e@linaro.org>
Date:   Sat, 24 Sep 2022 10:58:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] drm/msm/dsi: Add phy configuration for QCM2290
Content-Language: en-GB
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, shawn.guo@linaro.org
References: <1639416720-6732-1-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1639416720-6732-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2021 20:31, Loic Poulain wrote:
> The QCM2290 SoC a the 14nm (V2.0) single DSI phy.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Okay, I nearly missed these two patches (and stumbled upon them only 
because I was looking for qcm2290 examples). I'll resend them including 
the freedreno@ ML, so that they end up in the patchwork.

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9842e04..c42e8f5 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_14nm_cfgs },
>   	{ .compatible = "qcom,dsi-phy-14nm-660",
>   	  .data = &dsi_phy_14nm_660_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-2290",
> +	  .data = &dsi_phy_14nm_2290_cfgs },
>   	{ .compatible = "qcom,dsi-phy-14nm-8953",
>   	  .data = &dsi_phy_14nm_8953_cfgs },
>   #endif
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 4c82575..68e0777 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7414966..20eadce 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1084,3 +1084,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>   	.io_start = { 0x1a94400, 0x1a96400 },
>   	.num_dsi_phy = 2,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
> +	.has_phy_lane = true,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vcca", 17000, 32},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0x5e94400 },
> +	.num_dsi_phy = 1,
> +};

-- 
With best wishes
Dmitry

