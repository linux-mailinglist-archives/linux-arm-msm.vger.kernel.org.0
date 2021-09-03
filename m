Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFB74004D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346630AbhICSZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbhICSZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:25:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E65C061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 11:24:06 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w4so156025ljh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
        b=qkHognoxURfD5dM1rhFf+ejqDj4AodnjjnIF1fbS7miJaIFBv2d/cjNFUxR8VJyJwW
         lnzREYn5RxDERjhpg7YuKd9sehvjNbCoUvLo4jQhVDbY7p6ErcqHr8ECQ7M3xzi+D76A
         LVuweIsCoAAdrnOsmRcRcWUWvZT6p2QZBVfUqKqKzEhZ6mnet9eMgu3x/BXf8LMk4fu0
         wtJiRevjC5awf8fEkww+Jn96XQ1ssiYUYr8GSieEJMC4ejhv4XVPi05LNfX1/Lq1hjjI
         aaRMmxpebkxUEWopvuZKq5LY/W/UtOYlhpg19nkeuAcTNTH9RQiLsvaJ4oPY3PDWvLNb
         W+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
        b=E+KZO2dS8Qmh4Bbn9wVPBdOIMrhbCM8769aPlDzGsBH28M4GS3esBjbmEsLM0GSegw
         +M9uwZhZL6mqH8blpcoNo8IvQOVwj37s0zDpQ2O9IALo/sfU+Yf8Qbk/X2oSvEH1d92M
         QwyuVy6VL+dtqNymoz6kpGEdEgVYr4rBIS/34SAPzvDougcUKMNWejdNF0mz53NqJJmM
         wkzP236/Q44yK7Ws3aWZ2zrctARPrqWhuFkowcOmnYvKCFvR/5AGW+cLnV7wIwnBV9E4
         JiVkNUn27qOJfUIxXEAN6CgOEUk3e3BL8k2zE9IQPaarThHxRdyHaBx7RKCdThYb1yf1
         F6BQ==
X-Gm-Message-State: AOAM5327zxwPaVbfRj7nuMr168S33w657y7FiUCAOuUHJlKdzmNElIE9
        o3BM5X9Pdf4WeCkIChJ+ACnaow==
X-Google-Smtp-Source: ABdhPJz6vIY3BKpngT9hBro3h/w+4cLaEvhEKm7lFcDxED6un/1W/8r+MNrcUUM3Mi0WXbnil6rxGw==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr235236ljh.403.1630693444412;
        Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w18sm17659lfa.50.2021.09.03.11.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        devicetree@vger.kernel.org
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2efd8a35-10af-473c-b6d4-81a757949c40@linaro.org>
Date:   Fri, 3 Sep 2021 21:24:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2021 21:11, AngeloGioacchino Del Regno wrote:
> The enum dpu_clk_ctrl_type misses DPU_CLK_CTRL_DMA{2,3} even though
> this driver does actually handle both, if present: add the two in
> preparation for adding support for SoCs having them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..059e1402b7d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -432,6 +432,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_RGB3,
>   	DPU_CLK_CTRL_DMA0,
>   	DPU_CLK_CTRL_DMA1,
> +	DPU_CLK_CTRL_DMA2,
> +	DPU_CLK_CTRL_DMA3,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
> 


-- 
With best wishes
Dmitry
