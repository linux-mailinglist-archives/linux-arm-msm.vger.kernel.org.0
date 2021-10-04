Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C3F421AA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhJDXdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJDXdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:33:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74D4C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:31:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y23so39057562lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eG6tducnbwkd57oriMfFg35UkKe1MQC+voX1S99LbmY=;
        b=cnJGKFFpwzs/UHA1SufgRgzNzvMgfvJAVbA1aTZhX+FsIPmDmPB6OsO8/KgkZvpWNh
         74nzkdsOxRsmsCOoBIFJIJkJnwU7GMW+Yhcd6a63emMCsMES0s0w4i69FtEM2Khl51Oa
         fpZJlL2KsN22BWDKs9LjYOBrEVCVeVc/baNKJsJd5lqMrMlEe4pHhD8I4rNWokBQPS1A
         EhzDU7kbnM0VderIo7C6CAbbN/p7ID8JTqt5OH/Qj8Va3LTrZ6CcJxJZUD84fzEIEIi8
         hzkyrp3C2Hit3Uhj74R7xXQrhLrDood6sbmdnJAe8GLD39ePHSVGH7Uk3hoxtkQhjw96
         7kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eG6tducnbwkd57oriMfFg35UkKe1MQC+voX1S99LbmY=;
        b=aamCR4mLzp7sAJm1Pk0U8Ey7sa511yftgswMjDUUAEvTR4wfKIZeCV3Gl2wB1YdQmH
         7SGl3R40DD6XseFM7kxkurnzYgJRTDuiMxewM88AvbXm8iX5ymfE0ZD9EVikdZJdCVjm
         MKc9voqpSD8s7cHg+jqiFzOFyiveSYuvwDkBrupcZPt4c2JPpA2BSkyWvoGTG5/gyDlP
         SXlY7i2qu02+/q0FeTgKIAYhvZRJHYssZ5bwx2udDK5U9bNsBRoCbYS7YpCr7MRtWyNx
         I7i0Rc1lcUN9i5xcbr9l64GNtODkd/x7qVarYiDdb4r8V4EaYtZ/MAbArxYII/OA9620
         5OFg==
X-Gm-Message-State: AOAM530ltv+44sHNbk+4hZuxTryihsRkpArYcgX7JkOqfJsrngY9gJsk
        mhVU/KfGeBUUY71xFeVJh/4sGw==
X-Google-Smtp-Source: ABdhPJxvtDbY4NUT4Dq1MSN8sc0QXq/h9qy9y2ktuSBvmh3qT33rUk1G58QWJiRCT3SOAoznP79C5A==
X-Received: by 2002:a05:6512:32c9:: with SMTP id f9mr16711396lfg.296.1633390274053;
        Mon, 04 Oct 2021 16:31:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s25sm1699710ljc.100.2021.10.04.16.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 16:31:13 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/disp: fix endian bug in debugfs code
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211004134721.GD11689@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ab7f1f10-f366-40c1-436d-d7ebe15c7a9f@linaro.org>
Date:   Tue, 5 Oct 2021 02:31:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004134721.GD11689@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2021 16:47, Dan Carpenter wrote:
> The "vbif->features" is type unsigned long but the debugfs file
> is treating it as a u32 type.  This will work in little endian
> systems, but the correct thing is to change the debugfs to use
> an unsigned long.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> You might wonder why this code has so many casts.  It's required because
> this data is const.  Which is fine because the file is read only.
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 21d20373eb8b..e645a886e3c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -305,8 +305,8 @@ void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
>   
>   		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
>   
> -		debugfs_create_u32("features", 0600, debugfs_vbif,
> -			(u32 *)&vbif->features);
> +		debugfs_create_ulong("features", 0600, debugfs_vbif,
> +				     (unsigned long *)&vbif->features);

As you are converting this to the ulong file, could you please also 
remove the now-unnecessary type cast?

>   
>   		debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
>   			(u32 *)&vbif->xin_halt_timeout);
> 


-- 
With best wishes
Dmitry
