Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3AA476221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhLOTtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbhLOTtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:49:31 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0E8C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:49:30 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 207so34931528ljf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2Jdbxx8yhXD15gHEUpM6lHyLqMwp2IChCOBO/z10+7k=;
        b=Lww4o1mOGnsQcztPqGeqiJAHh8oityHaAea90qQKRPI8ultTJ7YAcj5V2zEfNqK4rG
         iDmYqr9up1TXQWaxUd/jf2dxzmrgOMQNZb1gvjRWv4GP6M63ixqU08dqjmE52V/1m+2M
         +EXWwJ02l+jhNVulEbDYpxUGrwH7fmtwkxU9espd27qqg10ZGPGzgY7QDGMnlmdwa8pz
         WtQ9Hhr2bghLzlYu3SWvSvRWfCacpOlOv3dY4rpmqrygKJgLUuEe8JponEszaekTatT8
         9gOVUtp6TexDQe0yT34c0TjfZNYUzPMjD0PaLMd3K4vy+A8HEQSoSteizObwLorh3/CT
         OUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Jdbxx8yhXD15gHEUpM6lHyLqMwp2IChCOBO/z10+7k=;
        b=oWzauXPSBGMLrPyJD2aIC4LmMqSNdiXwqxHaumIRiF0rH4Qdfb8iMMXVu2xQqq4kB+
         QiNgi1FlPeEy+cRiatXNyloPegAwArztkYg9a/bMqefcbWD8VFwKVq0rQgBfKFdkbLa9
         YWnnk5WOuV2BeoAr/Pm+DO0wEuZbSlad4NMPZpRUNvXCCZ7NrwJI593KKOq+OTPV38Hy
         5DJAmDb5Gh8rvX4FictLCa7nW8JH1ZhsI1D3JS5ycy+cRft//hr30IHbYxThJWSSDHE8
         l6bP5/nErJna05xISWPrC2PV05UlVGiBG4qv/9kBnaDOqAPoQgecM53aDAI4//lGdjAQ
         zcCg==
X-Gm-Message-State: AOAM531pZsLpEwm9Qe3E5ELr826ft9P4CfF5ZdsjySyvsEqyN31jfCFz
        yieuMykSQFcfwf5yuQ7JHqOg2A==
X-Google-Smtp-Source: ABdhPJzExouZ/WhriICLDITDfeC8Z9c4Cg/WczYq5K2alaBvVhuaktrZ/1hWVV+3tXuFko9PZQjrYQ==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr11613559ljk.291.1639597769020;
        Wed, 15 Dec 2021 11:49:29 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id d10sm467446lfe.106.2021.12.15.11.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 11:49:00 -0800 (PST)
Message-ID: <195d6835-c1ee-e818-3760-835a60b94402@linaro.org>
Date:   Wed, 15 Dec 2021 22:48:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 3/3] drm/msm/debugfs: Add display/kms state snapshot
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-4-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215174524.1742389-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/12/2021 20:45, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2: Drop unneeded msm_kms_show_priv [Dmitry B]
> 
>   drivers/gpu/drm/msm/msm_debugfs.c | 75 +++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)-- 
With best wishes
Dmitry
