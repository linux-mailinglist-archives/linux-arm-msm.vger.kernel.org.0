Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BAD45D58A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 08:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbhKYHhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 02:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhKYHfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 02:35:36 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E438C0613E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 23:32:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bi37so13987518lfb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 23:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tY0dI4JKSMqLqN8bCT5xhyliQM9cl3Za+ENI5kRKGSo=;
        b=MStlbuYF8XwOtaZm2IZDizPpaqNzw/O0bk5WXfDpOkji9Fo+7tKIwAdHX1Q1q2Ddn6
         4wKOsAgl/kwiIf6TDdRbFcKFBoIko4gHB3sEpXZ2h92dsV+AehEE78QfLPfoS6325J4K
         4jEuVVTdsl0tZBaPYqCYSH+/mBWzSLxkhq+23G/7my8i6fiU6Bd7jvvkVtjIewIznFz0
         mluf8oJk+qvs0tnccQ15XopVMiFaCIaD5sqpwAHFci8jxVfmJXboeQKJzKYUZ9mjiS4s
         CyKtnFdE784toKoJ2yas/U8sqRsgQdvq8uc6YlKb5oST5hgnqwSUPiw7BuP4UUogoFNU
         lSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tY0dI4JKSMqLqN8bCT5xhyliQM9cl3Za+ENI5kRKGSo=;
        b=gy+hIAbG8F7+BPhtQ6Ys/ucnBK/tTp8cQsHU3GZRyrQI0UkC9BZlfwoPtKVuNKU1nX
         Qu0How/D9+i9IA62w3pmNLizrPEmUylLFQCtTCuMfIMP0M/Z+rYNeFd2Pg/gFbS+jYhy
         nzxQf+rrBUkeunoDV5fc0RGXCHcG6wTRAPSv4jggN7SLXSfEKq5gGpVwv4GtqnW+BvkW
         G5qc9XG0XszWwAI9dNJOdGvGRUG1htZ3QXVN2GIae9/FYARJH9ujNyJjmoMgCjFoB9j/
         1K+nnt0CXABCLrpZomEQ+VKm+iQ2T21qDbcoxZRTjRlf+GcdJMsR0eck+yhNmq+e6gnS
         JOzg==
X-Gm-Message-State: AOAM530KO122N2925+W3O+fEE9TFLvxH8ifZMWUA5b3+yTARiayTcnrf
        IvMFHclNBeupq1YX6PQ9X9xyajYWB6v38g==
X-Google-Smtp-Source: ABdhPJwXQ9uRH7aqsvlifGN5TFtW5mUpNOGPU6NkYy5ht0oPrCfiw1c4pfU6DkFusieGl3fIGNkrHw==
X-Received: by 2002:a05:6512:1316:: with SMTP id x22mr1314120lfu.639.1637825541825;
        Wed, 24 Nov 2021 23:32:21 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m14sm179162ljg.2.2021.11.24.23.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 23:32:21 -0800 (PST)
Subject: Re: [PATCH v4 4/4] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
To:     Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
 <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ff384e41-cc86-8028-fc81-b0b41140dcd2@linaro.org>
Date:   Thu, 25 Nov 2021 10:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2021 07:35, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-21 16:37:38)
>> Add checking aux read/write status at both dp_link_parse_sink_count()
>> and dp_link_parse_sink_status_filed() to avoid long timeout delay if
> 
> s/filed/field/
> 
>> dp aux read/write failed at timeout due to cable unplugged.
>>
>> Changes in V4:
>> -- split this patch as stand alone patch
>>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Can this patch come before the one previously? And then some fixes tag
> be added? Otherwise looks good to me.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>

Is this something that we still need to pursue/merge?

There were changes requested for this and for the previous patch, but no 
new versions were posted.


-- 
With best wishes
Dmitry
