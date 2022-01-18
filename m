Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CCE492D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 19:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348011AbiARS3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 13:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348060AbiARS3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 13:29:37 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1F1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:29:37 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x22so74269938lfd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OagjV4JQafhbWieBrHavLWQQxuEkUJcsu80STrEG7sw=;
        b=NLq5MfxcRRvWGEg5r38hLDWd4gPFd+3r4KBg1sC7hHskOwiqkjVc+Q7klTwt83OHKi
         k5BYVWiAH/ov9kef04Y4L3yM/yv435t5uRRTPi8MTryWfL5MNp0Jm3EtKKL1S6GiRYsl
         HwYsP8Et7OFue6l0SWjDDTcUIbm/+q8bSKvPPObDpEs2pA/qj00t/zmkC9I4SPYeLmuY
         Y2jLUIh5JrOWPdWP7+arnAjPxobPKkBlcAIIPWZzUf4gwNk2wGW3/vjnALW/SQRGFEuf
         PAgjX81akE/16766LWYMsPRIsjMPlYKYs6/9TxAn2R5XzMU0t61Vip4HufVI2LOICLIP
         Bzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OagjV4JQafhbWieBrHavLWQQxuEkUJcsu80STrEG7sw=;
        b=EYaRfd1ExJt1XzKWY+Np1/YTV6w2Rv3dRx7+Dj3kcVMEwl3frMsBwcMiHehnByIIgi
         jCKoLnqkwHPhKs/J0w6dsoGaFb96LYZV9ObzIl4pAevzKkZZHxR3g3+Rvs0/sXTFG5H3
         bFXY8iAGpydnBdq+Kvk8G8Yb+/XwxoLfWRqDpP/2IHZjdykZjdJ9dmSyd4wDqUROMXUQ
         3xfY4izUnlCs4YedFjyBfiZBvB/WT7+JXMTISj15Rgj0ao11CuY+WAkv6vu/nfqCazIg
         j6gLQYVJIzL78v1ZgC+MzMi3eTobG5cMmS3Pxy31oG9IRzWRkp6nwiKJjL5dhlJe9VGA
         bt8A==
X-Gm-Message-State: AOAM532tFocq/6qIeNGn/g2PeKgDW8ToBYv09OgDaM43TjLEpVFyJvsl
        dLx76+vBCF/YQQyjPS5kIN4aMA==
X-Google-Smtp-Source: ABdhPJwwf5WFfOrZqTIqoSvyi067OmK7dEd2gHtZ/NXTwWyWHsR+LLVzSivc70GYsk5AYZa3veLYgA==
X-Received: by 2002:a05:651c:4d1:: with SMTP id e17mr6040730lji.447.1642530575598;
        Tue, 18 Jan 2022 10:29:35 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o24sm747849lfb.163.2022.01.18.10.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:29:35 -0800 (PST)
Message-ID: <28289471-c4cb-cafe-0357-1f3230135026@linaro.org>
Date:   Tue, 18 Jan 2022 21:29:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/msm/dsi: Add support for flexible DSI block
 mapping
Content-Language: en-GB
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org
References: <1642527088-13088-1-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642527088-13088-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2022 20:31, Loic Poulain wrote:
> The QCM2290 SoC integrates same DSI hardware as SC7180 but mapped
> at a different address, 0x5e94000 vs 0xae94000. To support such
> case, this change introduces an optional io_mask value that can
> be used to match multiple mapped addresses. It's probably not the
> more elegant solution, and could be revisited if necessary.

I'd prefer to use another approach here.

Allow dts to specify the exact version of the block 
("qcom,dsi-ctrl-6g-v2.4.1-qcm2290" in your case. Or just 
"qcom,dsi-ctrl-6g-qcm2290".). Do not attempt autodetecting the version 
if the dts specifies the block. This way you can have special DSI 
configuration for qcs2290.

Also see 
https://lore.kernel.org/linux-arm-msm/20220108190059.72583-1-david@ixit.cz/

> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  | 2 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 41e99a9..195ab2f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -36,6 +36,7 @@ struct msm_dsi_config {
>   	const char * const *bus_clk_names;
>   	const int num_bus_clks;
>   	const resource_size_t io_start[DSI_MAX];
> +	const u32 io_mask;
>   	const int num_dsi;
>   };
>   
> @@ -61,4 +62,3 @@ struct msm_dsi_cfg_handler {
>   const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
>   
>   #endif /* __MSM_DSI_CFG_H__ */
> -
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index f69a125f..428641e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1779,6 +1779,9 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>   	for (i = 0; i < cfg->num_dsi; i++) {
>   		if (cfg->io_start[i] == res->start)
>   			return i;
> +		else if (cfg->io_mask &&
> +			 (cfg->io_start[i] & cfg->io_mask) == (res->start & cfg->io_mask))
> +			return i;
>   	}
>   
>   	return -EINVAL;


-- 
With best wishes
Dmitry
