Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33772CBCBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 13:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgLBMPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 07:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgLBMPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 07:15:50 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDD1C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 04:15:04 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id m19so3805679ejj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 04:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/6gXxZUIKeeLUrixJ+HeGzB8S1bikNPjMnxhIjyt9GA=;
        b=PzZqIP9jURIO+D0aE4nicJusK+I7ZnM8l5+qnBYLB0eG/m/7gKndrT70AiSh0TvCzr
         TpN4R2UNrHRQ1fyWxOXN80UxebyH08KospQUHycRnBerGB/RRglkxZuTH6xRIpaNbmxj
         GiyndXJsGcIk6suqnre6TR95z7Va/4SsuhEH9gChYJxzO997/nJKOJy9/cJN42izP092
         TmZL3eIuWatmVC9VbJ/znyrI8qTkrUoOdHA8hObJSMgCJmXAOSN3IxFg5KS+J0ChK+Vh
         8ZAloyQ14eymB0lC2ny+Um1ilkbY+/N7I/WwXyxTPIsBqbB5Vsnv4bxkNxdM+6kYcpxU
         1dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/6gXxZUIKeeLUrixJ+HeGzB8S1bikNPjMnxhIjyt9GA=;
        b=bBWXFMKfxd5M3uOKgPwXAdtd8gEY3d1Wf+Qo5njNqgKybEU2d3jWThBsrDgPcBMws7
         tvZfLF6ZWEN1VXU5Cou9fwYtNT6M8yjQ1Sb1o111v9hMRo7gj56DsU8DcHzYa03G6e7q
         zh2mbkU81zzdU/2dK6SWxvtTr5CMaq4o8ehl/0EZqRwarOL0fi/ztsLC+vtGuXRMTlbd
         pvsc8DmJePEbzCKcm50/kW6q5X2iSf5EaIGWebYvlXQccgk0fEdkbLDl2OrFKwsYsdcf
         uigronX9QpPEVcUe1fUkSVUlqG8p/UhimOz/iMtNbPfUuIA0H4dE4bTbuqkghwDOZSg8
         n/lg==
X-Gm-Message-State: AOAM5332pG5hXl1Ro0JtGV20mWO2tEwEjfD+FpANdjTfP50dmo1AUl74
        si6GdkcZxu4oEHgOBxryeYULVQ==
X-Google-Smtp-Source: ABdhPJzDocutnc+9XTJOaGJ4tFU73g29sVkcV5i3PrV6P6AAEqkfPSo+2XMChnWuyDgGwsNrDNmojQ==
X-Received: by 2002:a17:906:3153:: with SMTP id e19mr2079701eje.17.1606911303218;
        Wed, 02 Dec 2020 04:15:03 -0800 (PST)
Received: from [192.168.0.3] (hst-221-93.medicom.bg. [84.238.221.93])
        by smtp.googlemail.com with ESMTPSA id b21sm1135840ejz.102.2020.12.02.04.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:15:02 -0800 (PST)
Subject: Re: [PATCH 1/4] media: v4l2-ctrls: Add random intra-refresh control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
 <20201130090859.25272-2-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <159cc27a-20a8-383c-025f-e3e32742c3f5@linaro.org>
Date:   Wed, 2 Dec 2020 14:15:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130090859.25272-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 11/30/20 11:08 AM, Stanimir Varbanov wrote:
> Add a control to configure number of macroblocks for random
> intra-refresh mode.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..59c5d3da4d95 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1104,6 +1104,12 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      macroblocks is refreshed until the cycle completes and starts from
>      the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
>  
> +``V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB (integer)``
> +    Random intra macroblock refresh. This is the number of random
> +    macroblocks refreshed on every frame. Here the positions of
> +    macroblocks to be refreshed on every frame is random. Applicable
> +    to H264 and HEVC encoder.

Please ignore this control.
I'm going to change the semantics in next version of this series.

-- 
regards,
Stan
