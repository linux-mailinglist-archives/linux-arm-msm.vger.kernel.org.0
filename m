Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC6E4469B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 21:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhKEUbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 16:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233617AbhKEUbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 16:31:44 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA15C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 13:29:04 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id u2so16294445oiu.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8JOiyVnxfxaZAhXkgjHfAK5HrLExH5oiye43Nc9y5lE=;
        b=Mkh7tjdb+bN/TRolya14M3jL1kGZiyedL6PMEh8LA19iejEw/DTZsdk3WhwKP9870o
         gnhPaIE6lMNPDZXnoMl3bV4nqSkCnnVcBUV3WZyzt1Jlxzy1vhG8Z92AeNC+4BByn6GD
         cCblwnlHT/5PSL/T9MENFZI4KIBTqCwXE6ilRQrgZxV+XzkVuFDkfGZw8oq/y1igL6ZO
         p1JnAnwT4gQouVR3lGoiwxh/Eh2ljiQczHGJXxyMYIy848ciIc8G5EGt5DPONSQz7ldK
         1WgeNYkxTZJbcX6UmDqXNRtz6/cLKOeC1vNFWWMo1rvp69mJCVwhxX5X2UvKrSl1pifH
         ADPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8JOiyVnxfxaZAhXkgjHfAK5HrLExH5oiye43Nc9y5lE=;
        b=y8eeq3vWpjKo5b1QMxp1LDLvk8FS0+xjAxZyh+20dTWPCp+JlwpfhSzU9E+5A8p1+V
         T9HkzRrQkZAqVR9sGeHtjqS6ZtldrcLSUUZMdKrlqJZmNdqQrgdpDM249lrwYqEmbaF8
         tQ9O8N/aGypsJd9fe1UE8PcJa4UYtQ50FWnPOZ1nJv4YYO+VL7ayqBLJXx4rp9pKs3Kc
         xZBWI4fK9txhTcUzR90ZABbpFoe3o1kHvq+RYQ5uIRHkjg06Eszm5PFEN2j8EdP31lr1
         kQuWcg2xdiM/H1TwVmOlAJsDG0fTKx4mkv2W0tdp3HAtixfbBudK/a1OnUzu65Giu3v7
         6JdA==
X-Gm-Message-State: AOAM530Gub19ReNTkV8g+Pxa4ja2db3/Ox/0gt9RxSjD5DaO4IOzL894
        ZAHiAhFmI4yX/UQk4g+BSfg8IL08Rn4uKhOc
X-Google-Smtp-Source: ABdhPJx4R55434miRtFXT3rDjHhYO7yoc/PDMCPS0UxSDNaJESWi8pqHCWAz0JuewFqOuhbI+Hr6Zw==
X-Received: by 2002:a05:6808:158c:: with SMTP id t12mr24051841oiw.24.1636144143770;
        Fri, 05 Nov 2021 13:29:03 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id c18sm3551722ots.64.2021.11.05.13.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 13:29:03 -0700 (PDT)
Message-ID: <fb85e94a-a961-aad2-494d-9318e9ae8f1c@kali.org>
Date:   Fri, 5 Nov 2021 15:29:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20211105202021.181092-1-robdclark@gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/5/21 3:20 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d32b729b4616..07f1169df89b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,6 +20,10 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	struct dev_pm_opp *opp;
>   
> +	/*
> +	 * Note that devfreq_recommended_opp() can modify the freq
> +	 * to something that actually is in the opp table:
> +	 */
>   	opp = devfreq_recommended_opp(dev, freq, flags);
>   
>   	/*
> @@ -28,6 +32,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	 */
>   	if (gpu->devfreq.idle_freq) {
>   		gpu->devfreq.idle_freq = *freq;
> +		dev_pm_opp_put(opp);
>   		return 0;
>   	}
>   

Tested on the Lenovo Yoga C630 and don't see the message from v1 :D

Tested-By: Steev Klimaszewski <steev@kali.org>

