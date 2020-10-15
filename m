Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C1C28F4B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgJOO1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 10:27:55 -0400
Received: from foss.arm.com ([217.140.110.172]:45326 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730160AbgJOO1z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 10:27:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DAB113D5;
        Thu, 15 Oct 2020 07:27:54 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBEFA3F719;
        Thu, 15 Oct 2020 07:27:52 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, peterz@infradead.org
Cc:     coresight@lists.linaro.org, swboyd@chromium.org,
        denik@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <c02be978-5d78-b88d-ea87-b9958b6e3a05@arm.com>
Date:   Thu, 15 Oct 2020 15:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 10/15/2020 01:45 PM, Sai Prakash Ranjan wrote:
> On production systems with ETMs enabled, it is preferred to
> exclude kernel mode(NS EL1) tracing for security concerns and
> support only userspace(NS EL0) tracing. So provide an option
> via kconfig to exclude kernel mode tracing if it is required.
> This config is disabled by default and would not affect the
> current configuration which has both kernel and userspace
> tracing enabled by default.

While this solution works for ETM4x, I would prefer if we did
this in a more generic way. There are other hardware tracing
PMUs that provide instruction tracing (e.g, Intel PT, even ETM3x)
and it would be good to have a single option that works everywhere.

Something like EXCLUDE_KERNEL_HW_ITRACE, which can be honored by
all tracing drivers ?
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/Kconfig                | 9 +++++++++
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 6 +++++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index c1198245461d..52435de8824c 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -110,6 +110,15 @@ config CORESIGHT_SOURCE_ETM4X
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called coresight-etm4x.
>   
> +config CORESIGHT_ETM4X_EXCL_KERN
> +	bool "Coresight ETM 4.x exclude kernel mode tracing"
> +	depends on CORESIGHT_SOURCE_ETM4X
> +	help
> +	  This will exclude kernel mode(NS EL1) tracing if enabled. This option
> +	  will be useful to provide more flexible options on production systems
> +	  where only userspace(NS EL0) tracing might be preferred for security
> +	  reasons.
> +
>   config CORESIGHT_STM
>   	tristate "CoreSight System Trace Macrocell driver"
>   	depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) || ARM64
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index abd706b216ac..7e5669e5cd1f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -832,6 +832,9 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
>   {
>   	u64 access_type = 0;
>   
> +	if (IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
> +		config->mode |= ETM_MODE_EXCL_KERN;
> +

Rather than hacking the mode behind the back, could we always make sure that
mode is not set in the first place and return this back to the user with
proper errors (see below) ?

>   	/*
>   	 * EXLEVEL_NS, bits[15:12]
>   	 * The Exception levels are:
> @@ -849,7 +852,8 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
>   		access_type = ETM_EXLEVEL_NS_HYP;
>   	}
>   
> -	if (config->mode & ETM_MODE_EXCL_USER)
> +	if (config->mode & ETM_MODE_EXCL_USER &&
> +	    !IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
>   		access_type |= ETM_EXLEVEL_NS_APP;

Why is this needed ?

Also we should return an error if the sysfs mode ever tries to clear the mode bit
for kernel in config->mode.

Suzuki
