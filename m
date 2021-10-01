Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AD841F7F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 01:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhJAXBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 19:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhJAXBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 19:01:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA69DC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 15:59:58 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y23so9341268lfj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 15:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MrcSevZqtNOFUzq3pWbbRjEjIk8+7OFN/vmiST/wtNU=;
        b=RgwL5KCvqBIeZB/gE1d8cY3bovbOy61asvkdirxaHIlo5MBe0JgNim+YGg9lSkZZi7
         s3kW6XPLnV8BHaEbrUCX64Qjrjndp+tGvPGvq7kMN3tadiWf7h6qjcNYKbxC9kXAdf1Z
         zyBlubbSFaP2lUsMcyymA3rJ3NQDPTZuD2qJ7BEZ2LyVBWSHM1jOJFRnqq8xU9ja4Ts0
         ccq/l0AeBTr+K6OygMYiU5NTee0Z2zxlNf1+wzLSDW4S04qaMgXZV3Pb0DPMqagLI44h
         vCEY4K+/i7Na4Hq5AGkgnwT3rL3/C2R8FI622J0qkIQCeBVFYycwUE/R3nMBJvnoty/L
         OA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MrcSevZqtNOFUzq3pWbbRjEjIk8+7OFN/vmiST/wtNU=;
        b=Ke8L0X22LLIIc/VMYUceim77iBVlX4guS9wzq5y9Tb/tlD95gFw9FlG/7jOzl5rCwi
         rTDkgQzwXs3+PfLV4tcM0S1d6vLooIdKYb9mWWcNS785r9sMtqzqWE9Pz+N/VUN8UF6r
         wVD2j8yoZchCyxf30ue7pvksqywtpQVo/QV5tBUITjcYkQ7yW6ySzAdBMBFaO7TGPsV7
         RbfFyHnsAo8Lgptb6KEE9iwY73euIv9jomMf0iXC5j8KAdxu1AvmdnT1flASiJVjflrm
         U+gIO5E+pcLGI1XFzMAV/jKHRpVK6WmX+dnXTMaGUmu6Q2PWBevOPQ2ejOFskkscNSb8
         Ir8Q==
X-Gm-Message-State: AOAM533vWT3TTiZepa1LJs9jOI2k9brt3iMAlKlAx6UZTQimQ/Sg3B8a
        vbnfq6jfWQG8cn42OamoQjHKNA==
X-Google-Smtp-Source: ABdhPJyDZ2oSrPzTa/TydJ+YDRi4V0TZmc4niH4msrXenJu8SJD6xo7ep5yvzdkledpWM36qcjmr1Q==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr645027lfr.265.1633129197104;
        Fri, 01 Oct 2021 15:59:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 131sm552169ljj.43.2021.10.01.15.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 15:59:56 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/msm/dsi: fix signedness bug in
 msm_dsi_host_cmd_rx()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>, Hai Li <hali@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123617.GH2283@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
Date:   Sat, 2 Oct 2021 01:59:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123617.GH2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2021 15:36, Dan Carpenter wrote:
> The "msg->tx_len" variable is type size_t so if dsi_cmds2buf_tx()
> returns a negative error code that it type promoted to a high positive
> value and treat as a success.  The second problem with this code is
> that it can return meaningless positive values on error.

It looks to me that this piece of code is not fully correct at all.
dsi_cmds2bus_tx would return the size of DSI packet, not the size of the 
DSI buffer.

Could you please be more specific, which 'meaningless positive values' 
were you receiving?

> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index c86b5090fae6..42073a562072 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2133,8 +2133,10 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>   		}
>   
>   		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0 || ret < msg->tx_len) {
>   			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
> +			if (ret >= 0)
> +				ret = -EIO;
>   			return ret;
>   		}
>   
> 


-- 
With best wishes
Dmitry
