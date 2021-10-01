Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F69641F7BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 00:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356148AbhJAWth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 18:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356309AbhJAWta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 18:49:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B77C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 15:47:44 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i4so44695432lfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WGjN04878+AMOMEOZmF7yNpwbG05OAzAKgYFczYhOeY=;
        b=bZe2t/n/O2ewi8yHei5TI/UaERKkhxeLGNHYwiOCTMCHlrYgV4mk5y7fnmCRxnrXw6
         6YhY1nYq0j+TvH0ETbnJPu6HltvKqd8X57GLIAQxPYJkEsbNLx2ahTHaE2Aww9x2sGjY
         boV82MRCpslGNCqEXnkWsE0dWpGiUPnuScI8hsWOzDG5hi5dq6JFSgjN7Bkx7aG93BHj
         ji/ixYG7ZAR/UNjg7YfMWO5HgbFSKtSqaCKJk5Qst+vn1MKt/bjXl1N8YpriyFfZGaNo
         IEkSfm7ZcyHbe2vhAtWcn82yrd6BdnFtZichw/1tYFmLVmy14z/+qxk6poyvT5D8YoMX
         uI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WGjN04878+AMOMEOZmF7yNpwbG05OAzAKgYFczYhOeY=;
        b=eE+3JTfntVWB7McPyLgkOxtqpQsr92+6DWru0LBaQ/rB7sdShqcRH1yqpGgYaGWTpz
         SVQNL86bzQsM43ekI/MmNeIiwozpUPjlof0inIt1ubWT8KZmw7JhyEH4HIzCJNsFWGJl
         4t02cVotXLE1Mu5aRlMxmkl7Dnd52e/PH2kD5exTPtEPAfKDT9s7JKZyDz9lHsBu/Jgq
         uUIvX6Gx9Y1LTBIl25226ZLS56fWsKcL+NjNhp2U1VfWtYNmuVB34Pd6giEDIwbNkCcV
         G82DMBZgyouOu+QnlQXfeH7CSBKIbKFMdAwCLwmgCu5jH4OBh5TwMNHhzROPqMtOEX+Y
         08UA==
X-Gm-Message-State: AOAM5335dgcFvBMDvQK46x9JDiPlIsYLpIiY3eRyB+PNtY7BEQMoAhXX
        rV4mD+XjC0tHfeEfNgpMdu/kyQ==
X-Google-Smtp-Source: ABdhPJyFcXijt2H4S9oPNqMyrwyHFwAbIQq4n5w+wmArWVtZP0jRKm0/fY4MurzPfhycLe2LUEskvw==
X-Received: by 2002:a19:7519:: with SMTP id y25mr579354lfe.473.1633128463332;
        Fri, 01 Oct 2021 15:47:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d13sm870643lfi.48.2021.10.01.15.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 15:47:42 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm/dsi: fix off by one in dsi_bus_clk_enable
 error handling
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>,
        Archit Taneja <architt@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123409.GG2283@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e9aea681-c27a-d3fd-2c2b-1a0486173dbc@linaro.org>
Date:   Sat, 2 Oct 2021 01:47:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123409.GG2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 15:34, Dan Carpenter wrote:
> This disables a lock which wasn't enabled and it does not disable
> the first lock in the array.
> 
> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We should probably switch this to bulk clk api.

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..c86b5090fae6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -451,7 +451,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>   
>   	return 0;
>   err:
> -	for (; i > 0; i--)
> +	while (--i >= 0)
>   		clk_disable_unprepare(msm_host->bus_clks[i]);
>   
>   	return ret;
> 


-- 
With best wishes
Dmitry
