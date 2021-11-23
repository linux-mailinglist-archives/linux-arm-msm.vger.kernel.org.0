Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448D4459F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 10:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbhKWJs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 04:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhKWJs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 04:48:26 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C56C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 01:45:18 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id f65so8173688pgc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 01:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XHuvo2x+OlRhRQlyyaSsF2RC7via/pGpyBvUj9FX4XU=;
        b=K0ZM78+Hf9/vyE5zAX7uuEQaHPYP2iCpPBxEY3O3fRyvQFcO4TnyW6phYpz4Oixtt/
         tAu7ghTvuu93XEf81vurhvttwX9EWozsK1vhwWzRHbas6P2l3tisFhy/lGmLhHdfEXiw
         Qba/QorKK6YDPTxJ/chQRqw7ULSg0Yl3P+yR2yqWQIrprCVC3CXlmdukavbIHyR0AqgU
         YLHxCGkfZnZkr+mWdf1V4+kI6rcpKVWvLTkIE6irxl9scBAE3/radgUfu+BTiGK5aVx1
         qP7PWFOYhDyknepEM3k3Z5TJvNSQDg6s9JcV93WpnKF6O70yAX9EWdbeoUZLUA3Aqiri
         FNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XHuvo2x+OlRhRQlyyaSsF2RC7via/pGpyBvUj9FX4XU=;
        b=bx3kGL92vW9B78jkKmMpVsqmsOaUqupiFljmc1vqK0MJpv0y1tsa7jolSQ0Vxv1LUh
         fiBfZsDvy4nLRHLND31qHdapeUC+e1U/hZlRAGaZZcvXj7uYeYO3VAgym1sYMQXF/4GE
         8zcliX8sZIUpUSZ99ofM8itXzKG9SVVws/VGJRvylZuCD+w0RH7mxQS0XrHcEFMhrc1J
         lnBv7dR3dJxEGzXQq0KANQBX71YUOmPYEOxIxNTXfVX0UBtgiHwSwub25b7KbaLGHpRH
         WXTZVMMXcXYeEE3Cg1nV8u1GFLkERyVh7+ELo0QONGBVaennQO79Z/UqOrvM6Bk4Rygl
         Ol4Q==
X-Gm-Message-State: AOAM530gQcjtnSrf17oXpIgeRYEw4l2KDQhMZ20T+TtZGev7Pp8wwvxk
        mkBAxR3CXTa4aBQjDqHiwS0wdQ==
X-Google-Smtp-Source: ABdhPJxgbdewxpbk63GjDbRW194lG8SOkV1t2IUg5KeiI+Y6rtfDsiwaujd6mjtc5UI6d4tdPCXFaw==
X-Received: by 2002:a63:e06:: with SMTP id d6mr2820962pgl.449.1637660718161;
        Tue, 23 Nov 2021 01:45:18 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id md6sm589612pjb.22.2021.11.23.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 01:45:17 -0800 (PST)
Date:   Tue, 23 Nov 2021 15:15:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, steev@kali.org,
        sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
        linux@armlinux.org.uk, gregkh@linuxfoundation.org,
        rafael@kernel.org, amitk@kernel.org, daniel.lezcano@linaro.org,
        amit.kachhap@gmail.com, thara.gopinath@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Subject: Re: [PATCH v4 0/5] Refactor thermal pressure update to avoid code
 duplication
Message-ID: <20211123094515.yeqlqsx6acj4sw7t@vireshk-i7>
References: <20211109195714.7750-1-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109195714.7750-1-lukasz.luba@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-11-21, 19:57, Lukasz Luba wrote:
> Hi all,
> 
> This patch set v4 aims to refactor the thermal pressure update
> code. There are already two clients which do similar thing:
> convert the capped frequency value into the capacity of
> affected CPU and call the 'set' function to store the 
> reduced capacity into the per-cpu variable.
> There might be more than two of these users. In near future
> it will be scmi-cpufreq driver, which receives notification
> from FW about reduced frequency due to thermal. Other vendors
> might follow. Let's avoid code duplication and potential
> conversion bugs. Move the conversion code into the arch_topology.c
> where the capacity calculation setup code and thermal pressure sit.
> 
> Apart from that $subject patches, there is one patch (3/5) which fixes
> issue in qcom-cpufreq-hw.c when the thermal pressure is not 
> updated for offline CPUs. It's similar fix that has been merged
> recently for cpufreq_cooling.c:
> 2ad8ccc17d1e4270cf65a3f2
> 
> The patch 4/5 fixes also qcom-cpufreq-hw.c driver code which did
> the translation from frequency to capacity wrongly when there
> was a boost frequency available and stored in 'policy->cpuinfo.max_freq'.
> 
> Changes:
> v4:
> - remove the warning when boost frequency is passed and set thermal
>   pressure to 0 in that case, which means the capping is totally removed
>   (issue reported by Steev)
> - remove the check from patch 4/5 with
>   'throttled_freq > policy->cpuinfo.max_freq' since it doesn't have
>   effect; instead relay on new arch_update_thermal_pressure() handling
>   correctly such use case; this would also fix an issue in that original
>   driver code, where the reduced capacity was calculated wrongly due
>   to 'policy->cpuinfo.max_freq' used as a divider
> - adjusted comments stressing the fact that the boost frequencies are
>   supported

> Lukasz Luba (5):
>   arch_topology: Introduce thermal pressure update function
>   thermal: cpufreq_cooling: Use new thermal pressure update function
>   cpufreq: qcom-cpufreq-hw: Update offline CPUs per-cpu thermal pressure
>   cpufreq: qcom-cpufreq-hw: Use new thermal pressure update function
>   arch_topology: Remove unused topology_set_thermal_pressure() and
>     related
> 
>  arch/arm/include/asm/topology.h   |  2 +-
>  arch/arm64/include/asm/topology.h |  2 +-
>  drivers/base/arch_topology.c      | 42 ++++++++++++++++++++++++++++---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 14 +++--------
>  drivers/thermal/cpufreq_cooling.c |  6 +----
>  include/linux/arch_topology.h     |  4 +--
>  include/linux/sched/topology.h    |  6 ++---
>  init/Kconfig                      |  2 +-
>  8 files changed, 50 insertions(+), 28 deletions(-)

Applied. Thanks.

-- 
viresh
