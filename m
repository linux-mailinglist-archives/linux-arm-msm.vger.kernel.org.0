Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E949C2903D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 13:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394611AbgJPLLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 07:11:54 -0400
Received: from foss.arm.com ([217.140.110.172]:34678 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391033AbgJPLLy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 07:11:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12107D6E;
        Fri, 16 Oct 2020 04:11:53 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E7A43F719;
        Fri, 16 Oct 2020 04:11:50 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
To:     Denis Nikitin <denik@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <fcfd6a92-de94-e318-5715-23b97fb9724e@arm.com>
Date:   Fri, 16 Oct 2020 12:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/20 7:40 AM, Denis Nikitin wrote:
> Hi Mathieu,
> 
> I think one of the use cases could be VMs.
> Is there isolation between EL1 guest kernels which we can control from 
> perf in a system wide mode?

The proposed solution doesn't solve this for VMs anyway. It only
excludes EL1 *OR* EL2, depending on the host kernel's running  EL.
We cannot support Virtual ETM access for VMs with memory mapped
accesses.

Unforutnately, trace filtering is the solution for preventing tracing
for EL1 guest/kernel (available from v8.4 Self Hosted extensions). Other
option is to add support for "exclude_guest" support for CoreSight for perf.
But again this can't be controlled by sysfs. And it can't be enforced 
for perf, if not specified. Again it all goes back to the root
permission hammer lock which Mathieu pointed out.


With the v8.4 Self hosted trace extensions, Guest and Host both could
control individually if they can be traced (both EL0 and EL1/2).

Suzuki

> 
> Thanks,
> Denis
> 
> On Thu, Oct 15, 2020 at 9:03 AM Mathieu Poirier 
> <mathieu.poirier@linaro.org <mailto:mathieu.poirier@linaro.org>> wrote:
> 
>     On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
>      > On production systems with ETMs enabled, it is preferred to
>      > exclude kernel mode(NS EL1) tracing for security concerns and
>      > support only userspace(NS EL0) tracing. So provide an option
>      > via kconfig to exclude kernel mode tracing if it is required.
>      > This config is disabled by default and would not affect the
>      > current configuration which has both kernel and userspace
>      > tracing enabled by default.
>      >
> 
>     One requires root access (or be part of a special trace group) to be
>     able to use
>     the cs_etm PMU.  With this kind of elevated access restricting
>     tracing at EL1
>     provides little in terms of security.
> 
>     Thanks,
>     Mathieu
> 
>      > Signed-off-by: Sai Prakash Ranjan
>     <saiprakash.ranjan@codeaurora.org
>     <mailto:saiprakash.ranjan@codeaurora.org>>
>      > ---
>      >  drivers/hwtracing/coresight/Kconfig                | 9 +++++++++
>      >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 6 +++++-
>      >  2 files changed, 14 insertions(+), 1 deletion(-)
>      >
>      > diff --git a/drivers/hwtracing/coresight/Kconfig
>     b/drivers/hwtracing/coresight/Kconfig
>      > index c1198245461d..52435de8824c 100644
>      > --- a/drivers/hwtracing/coresight/Kconfig
>      > +++ b/drivers/hwtracing/coresight/Kconfig
>      > @@ -110,6 +110,15 @@ config CORESIGHT_SOURCE_ETM4X
>      >         To compile this driver as a module, choose M here: the
>      >         module will be called coresight-etm4x.
>      >
>      > +config CORESIGHT_ETM4X_EXCL_KERN
>      > +     bool "Coresight ETM 4.x exclude kernel mode tracing"
>      > +     depends on CORESIGHT_SOURCE_ETM4X
>      > +     help
>      > +       This will exclude kernel mode(NS EL1) tracing if enabled.
>     This option
>      > +       will be useful to provide more flexible options on
>     production systems
>      > +       where only userspace(NS EL0) tracing might be preferred
>     for security
>      > +       reasons.
>      > +
>      >  config CORESIGHT_STM
>      >       tristate "CoreSight System Trace Macrocell driver"
>      >       depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) ||
>     ARM64
>      > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>     b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>      > index abd706b216ac..7e5669e5cd1f 100644
>      > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>      > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>      > @@ -832,6 +832,9 @@ static u64 etm4_get_ns_access_type(struct
>     etmv4_config *config)
>      >  {
>      >       u64 access_type = 0;
>      >
>      > +     if (IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
>      > +             config->mode |= ETM_MODE_EXCL_KERN;
>      > +
>      >       /*
>      >        * EXLEVEL_NS, bits[15:12]
>      >        * The Exception levels are:
>      > @@ -849,7 +852,8 @@ static u64 etm4_get_ns_access_type(struct
>     etmv4_config *config)
>      >               access_type = ETM_EXLEVEL_NS_HYP;
>      >       }
>      >
>      > -     if (config->mode & ETM_MODE_EXCL_USER)
>      > +     if (config->mode & ETM_MODE_EXCL_USER &&
>      > +         !IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
>      >               access_type |= ETM_EXLEVEL_NS_APP;
>      >
>      >       return access_type;
>      >
>      > base-commit: 3477326277451000bc667dfcc4fd0774c039184c
>      > --
>      > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is
>     a member
>      > of Code Aurora Forum, hosted by The Linux Foundation
>      >
> 

