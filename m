Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BE1394142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 12:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236624AbhE1KlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 06:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbhE1KlG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 06:41:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B3DC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:39:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a4so4646902ljd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
        b=t+lLmqG6vhSL5GOTsD3igXoE9y+U3voqARx5bNC/6yF5ZmO5i7rp29h1AzqqwIPRar
         SJpmSwu7mC8ELldZnVaMgd3M5gJL4ol1TvsbelBxIZiboxUS73LMGHNqRz3/W0I00Y3e
         vbJn/B4JPV8Zplh0wa+Yzbe5yrz0A+4T1kkOpoYFM4FT7eB9QkF0cTHgGRQQcmRQlMLo
         +gx1sdra00IG3CQ+tH6ZPqqEX3TcN3ia/aBYazKqCB8kgasWm6KaIBRZw9ZaOYV8K3QH
         QRm7d+knoS+RrVD0VaAqZQHXiuvdjlVRUjQXlPPQ3XiMtpziwjZ+Glrc+wPmQYnqm8Tl
         iD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
        b=A4H47CcE2IiCMGqc1VsIc26Xr07zwdeLDsLOBiAIjKfnHF6EuKkxrseG1zy6A4RgdQ
         xd0YlltQwJyHN3DqOWf9aGl7W+4odC30zJmO2FQrd2mAyOYywbXGFcaIsnPXWCSji2l+
         cS7Dqft4YzdHtuK2Ip5v4Mo05oZEe5wRUQjH2pySIXWYrdkBJKYuoXSVhk/8VjMCVihp
         L4qXd3BBXoTFsmDRoZ5NfNDiLrwIH2kpaN8Ztct0+q+r7OSMVoFsUMdVT/MdfLqAmAgo
         Vye9kesF+LTo7ASpOb3lQH3IUBCTbsyAtp83SSXwN0zkYVXIVSBn72ukq4f0jziX90gV
         lkmg==
X-Gm-Message-State: AOAM533xGR35k/Hx5/AkKC7cONc10ByJvavqJ1/56WbbL5UVzjnroMxe
        z9prdX77Jkw5IJ/smoj2lvk70Q==
X-Google-Smtp-Source: ABdhPJwCbJydztxsaJRWMPiKOT4hMuN+hHwbIbtvAvgLZGDGbJ/JN0fwZr30y0hbtQZXIDGZHjnPHA==
X-Received: by 2002:a05:651c:54a:: with SMTP id q10mr5930164ljp.420.1622198370217;
        Fri, 28 May 2021 03:39:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4sm438895lfc.258.2021.05.28.03.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 03:39:29 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
Date:   Fri, 28 May 2021 13:39:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-16-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2021 15:49, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions upto 4k. For more resolutions like 8k this won't
> work.
> 
> Furthermore, we can use 1 DSC encoder in lesser resulutions, but that is
> not power efficient according to Abhinav, so it is recommended to always
> use 2 encoders.

Not power efficient because the second DSC would also be powered on or 
because single DSC enc would consume more power than two DSCs?

> 
> So for now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 18cb1274a8bb..bffb40085c67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -609,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive upto (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> 


-- 
With best wishes
Dmitry
