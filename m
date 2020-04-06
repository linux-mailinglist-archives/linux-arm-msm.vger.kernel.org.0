Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1553719F3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 12:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgDFKzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 06:55:35 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42095 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDFKzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 06:55:35 -0400
Received: by mail-qk1-f196.google.com with SMTP id 123so2821762qkm.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+wdEtajVoyLqgAvqGqYNiCNXOxg9qyO5Ddu4EUSO/4c=;
        b=CBPXCgQUCkx4unuFWcuwTweKM3yOZzDcvOXw5OWfMxMcyJpW4DYoNd9TM+OMHULyRa
         iLVgasY9iJoEM+qDkmLrYSgyy5LuXUOmnw/LYFuJxKk/wTfE9Dr99l/dUAs7rZSwyopY
         thQPyAx1RGipfvma4oEtCh3A+iPAbxYA62+RMqKeNXUoHu0LcgLOonZtfib5D4a0JoHn
         fYj43xC1kD/ZnlwkNdSbvrAve3qTzU/XidkGvoXVWZkcGm5SpWN/fk+ixNaJijIFMeCg
         lxbECGe2SyDOqjf7zsZC2R7xYtJFBZVyeLFJg9h5CoDntumGdea6xJlwC8i+hgkg/twz
         sB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wdEtajVoyLqgAvqGqYNiCNXOxg9qyO5Ddu4EUSO/4c=;
        b=Wx44+Mbj5DhSFci2DtOSFEAWehICuOhbHDVXWGikrU75vSPN0YmzBMdYGlyUn6O3Ln
         cpM5q5XcZsI1twXxomgyfGaC5PY3fGjjwLse4YZLE9E70da5C8aq7ygYRqJpK7lmYH8B
         5uP+TNVlZvUgIPL/E9g+811AUtQHLR5rzJwS7VWVYck8x+Uj8C0XBfNQ7ybt83qJLoQZ
         BFPLvJxX8ayGiJtXT6tbSSsLmsuh85sMetjTah8aQregR7CSd8gGELL79HDmq+EZWDdd
         SrYXNjywWFDv2b7Z3wCfLO3Gdh8yty4WcwNdlf5j+6SaxPmqZ29/ogtMPfvWDavR2edu
         lPjA==
X-Gm-Message-State: AGi0PublEqhXxWmVdxAfH3ehMhX/N8/D0UgHfrhzHvb1AwFZ0uTQinch
        CZmtjL5sbGYBVo6Bmb+UrpSh967It0NMtrowr0515Q==
X-Google-Smtp-Source: APiQypIYaZCTcQvxndKYkKUeNWKytaqjjq7JBOSystgiXQFPuY/nWdK+EIURYPa5E2CAjQ8kOoNcEAowYWqqUSC48NQ=
X-Received: by 2002:a37:9c8b:: with SMTP id f133mr21160222qke.482.1586170531983;
 Mon, 06 Apr 2020 03:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 6 Apr 2020 11:55:21 +0100
Message-ID: <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The programmable replicator hardware by design enables trace through
both ports on reset. (see 1, section 4.4, 9.11)  The replicator driver
overrides this functionality to disable output, until the Coresight
infrastructure chooses a path from source to sink.
Now given that the hardware design is such that we must be able to
allow trace to be sent to both ports, a generic patch to prevent this
does not seem appropriate here.

I think this needs further investigation - to determine why this
appears to be failing in this particular instance.

Regards

Mike

[1] CoreSight System-on-Chip SoC-600 TRM, r3p2, 100806_0302_00_en

On Sun, 5 Apr 2020 at 11:28, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Since commit 30af4fb619e5 ("coresight: dynamic-replicator:
> Handle multiple connections"), we do not make sure that
> the other port is disabled when the dynamic replicator is
> enabled. This is seen to cause the CPU hardlockup atleast
> on SC7180 SoC when enabling ETM with ETR as the sink via
> sysfs.
>
>   Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
>   CPU: 7 PID: 0 Comm: swapper/7 Tainted: G S  B             5.4.25 #100
>   Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
>   Call trace:
>    dump_backtrace+0x0/0x188
>    show_stack+0x20/0x2c
>    dump_stack+0xdc/0x144
>    panic+0x168/0x370
>    arch_seccomp_spec_mitigate+0x0/0x14
>    watchdog_timer_fn+0x68/0x290
>    __hrtimer_run_queues+0x264/0x498
>    hrtimer_interrupt+0xf0/0x22c
>    arch_timer_handler_phys+0x40/0x50
>    handle_percpu_devid_irq+0x8c/0x158
>    __handle_domain_irq+0x84/0xc4
>    gic_handle_irq+0x100/0x1c4
>    el1_irq+0xbc/0x180
>    arch_cpu_idle+0x3c/0x5c
>    default_idle_call+0x1c/0x38
>    do_idle+0x100/0x280
>    cpu_startup_entry+0x24/0x28
>    secondary_start_kernel+0x15c/0x170
>   SMP: stopping secondary CPUs
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../hwtracing/coresight/coresight-replicator.c    | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index e7dc1c31d20d..f4eaa38f8f43 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -66,14 +66,16 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
>                                      int inport, int outport)
>  {
>         int rc = 0;
> -       u32 reg;
> +       u32 reg0, reg1;
>
>         switch (outport) {
>         case 0:
> -               reg = REPLICATOR_IDFILTER0;
> +               reg0 = REPLICATOR_IDFILTER0;
> +               reg1 = REPLICATOR_IDFILTER1;
>                 break;
>         case 1:
> -               reg = REPLICATOR_IDFILTER1;
> +               reg0 = REPLICATOR_IDFILTER1;
> +               reg1 = REPLICATOR_IDFILTER0;
>                 break;
>         default:
>                 WARN_ON(1);
> @@ -87,8 +89,11 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
>                 rc = coresight_claim_device_unlocked(drvdata->base);
>
>         /* Ensure that the outport is enabled. */
> -       if (!rc)
> -               writel_relaxed(0x00, drvdata->base + reg);
> +       if (!rc) {
> +               writel_relaxed(0x00, drvdata->base + reg0);
> +               writel_relaxed(0xff, drvdata->base + reg1);
> +       }
> +
>         CS_LOCK(drvdata->base);
>
>         return rc;
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
