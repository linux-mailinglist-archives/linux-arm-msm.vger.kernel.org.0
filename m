Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2CB3F1DAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 18:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhHSQVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 12:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhHSQVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 12:21:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71972C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 09:20:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y34so14115226lfa.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3asku0pLtHQRy/+xXumiM58BWe9crM57UxtzOfQVQq4=;
        b=bNYG/IJ/v86SVujewP4QJxLlN/utOyYqjWhe3wbSTEcCLJDtxm3Dr7bqajuumek1FY
         4Cde2gyL7jmUrv6J3cvLu8H4m8nP2BXCOW53Fckz38BkRNUq62n9GkYUz8ebeJgBO43e
         Tu7fi+nbJDnDgYk/qu/4KpR5MEi6vHE4CFb0ZSUc4rMwwVbEf0s3cChC7t9w1yMjrUHh
         0S+JunTw2an+s5pAFUgEV878CM/EmtGtexBRNwOEClD91Jvc0tZKMI9j87vaSEQPkbuz
         4mO2fBIKj41KlWaXzlxkt5QqSA0nL9x2pGA8zorzIp9NwvIM0TD1mhInDZsYbRfFEO8B
         L19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3asku0pLtHQRy/+xXumiM58BWe9crM57UxtzOfQVQq4=;
        b=dMNKuLgpNw7NP6opNC7szThKX1hN5objX6rIGHOlpy+nDJlkbliJ+DuJgJ/aTYdsXa
         MvK6zxi24MjZHnM2KQdma3Jt7enjL8CxuY2mOfL16E41D17eWOs1EIjOiBRHkmGWdWer
         7fLhOyZbLuWBtYJ7zX1dTsFlGdllRRd7hNikh8ZM3yET92UNDeI5RwCTeYDD9nlpRTwn
         MNPqQmkhiYxS+oJ1k7tL9TQfI4sjoUY2XUq1R2UzVicrXb8QZjiC3lMtwq+U0AI0gubh
         74xNVn24WAKrVA2hVOPnaxvdkAc9qDUBR2DOyA00ubWb8+AfER3vbl1i35WzY81bx4ZJ
         XkDw==
X-Gm-Message-State: AOAM532GMSEnoMGZ20ME7ily99KpT9pgjp18xtQh8O10X8n3Zpb6ckFx
        WBMzPg0etnGz6cMw7yBwo5X2lg==
X-Google-Smtp-Source: ABdhPJyXdxWtx1IexvtSBR0aUvfLyPXwSJV4HhYjAENl0Srz4sZjkoHT9yHpNluBqLYsRnLFr2hSKQ==
X-Received: by 2002:a05:6512:110b:: with SMTP id l11mr11099003lfg.199.1629390029852;
        Thu, 19 Aug 2021 09:20:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9sm348734lfb.236.2021.08.19.09.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 09:20:29 -0700 (PDT)
Subject: Re: [PATCH v1] drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ
 register
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, angelogioacchino.delregno@somainline.org,
        mkrishn@codeaurora.org, kalyan_t@codeaurora.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20210819133636.2045766-1-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <acf419d8-724b-4df3-a610-0c8cb7502094@linaro.org>
Date:   Thu, 19 Aug 2021 19:20:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210819133636.2045766-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/08/2021 16:36, Robert Foss wrote:
> Both PINGPONG4 and PINGPONG5 IRQ registers are using the
> same address, which is incorrect. PINGPONG4 should use the
> register offset 30, and PINGPONG5 should use the register
> offset 31 according to the downstream driver.
> 
> Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2e482cdd7b3c5..420d78cfce8af 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -794,7 +794,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   			-1),
>   	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   			-1),
>   };
>   
> 


-- 
With best wishes
Dmitry
