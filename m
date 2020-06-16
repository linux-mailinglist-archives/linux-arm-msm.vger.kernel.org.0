Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FE51FBC05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 18:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730507AbgFPQmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 12:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPQmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 12:42:49 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E91C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 09:42:48 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id k11so22239660ejr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U75s1/DgVO31tjDRbi+5x+wK5V8qYOvXMAdqETFOy+8=;
        b=m20kWeThV5U50KSLAH60Q7FYz2TxFl5Lvk3qa4535j3W+aHdHFOr2Bu+bfnmNgWHR7
         USp7buT/tEQSy9Trxn/viSzNwtHyNT1cMzSwIkN2JVX7ffMYaXVUbpzF7CbdIbMuQ8cx
         PxNL+TQBcwD4fC5bCtyJzApCfOheWx5tW2c43cPFGYv22y3lIctKMMG91QInIhSkjpOE
         6nnZ8CnNXhAV41CjihZ/3mUBl+bHa2YvrZI46T06PcgN845nIiLkFYptyAOYYb+ny20/
         WX8qA4nZEDTkNCfrvu8MQTI8+1Dqzsgjri0/8JzPfyMIjzqa34CJAld/n0kSg0Ie06qB
         FpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U75s1/DgVO31tjDRbi+5x+wK5V8qYOvXMAdqETFOy+8=;
        b=rW6u2KE+MQrRqifSZ6XN0qNmLuzLvro1mTZp7y/G4i5OnQMlDLxrFh1qkP1fPFZ/8D
         wxGPdB4OQpVALqf/43XzFxoFNCEOE6kx3dhd+ICLU+rjYANoFV7w4WwkRwM8GOF0U5yh
         on2uXFcVesgC7JkGbFykAgYmU/+zILdQwnZho+penshlqWZxNf4drTeEuSBF1uxJFU23
         cR1xZ0F6K1lRo6aQEQwvYNgfuITGlblU4aBUe8Cc2qlTG9dzWyX1QqJGCPUIN6Kt4umB
         8z+0wr+V0mkJxTfqHnCFhEgKRkDrKBgNWGoXfKhmOUo2qMUj2mTioBvW8lu8NqxgXJV5
         9JpA==
X-Gm-Message-State: AOAM5318pS1q/R0k7ymPIIK3ULchejdkuN5JfZvqYd7TJWgv0sqdXivZ
        sVCvxW7Lgjz+a0tyMIUOzgZ0f+Qds2HdvuuWpXacLw==
X-Google-Smtp-Source: ABdhPJwCnYD5APW+4OhftsoUEnqH4u2IIvwCJwNK3HU5Xk9oC/d3BgxB0PRH9PKNQV2Fzo/00CDI2vQC2aYcKk8xvCg=
X-Received: by 2002:a17:906:1d41:: with SMTP id o1mr3732247ejh.477.1592325766712;
 Tue, 16 Jun 2020 09:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045441.27483-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200616045441.27483-1-saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 16 Jun 2020 17:42:35 +0100
Message-ID: <CAJ9a7Vgh-WTC1cBi8VLCWcwgT2w=uaXQcGO-J_iAExgiZaaGxA@mail.gmail.com>
Subject: Re: [PATCH] coresight: tmc: Fix TMC mode read in tmc_read_unprepare_etb()
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Jun 2020 at 05:55, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Reading TMC mode register without proper coresight power
> management can lead to exceptions like the one in the call
> trace below in tmc_read_unprepare_etb() when the trace data
> is read after the sink is disabled. So fix this by having
> a check for coresight sysfs mode before reading TMC mode
> management register in tmc_read_unprepare_etb() similar to
> tmc_read_prepare_etb().
>
>   SError Interrupt on CPU6, code 0xbe000411 -- SError
>   pstate: 80400089 (Nzcv daIf +PAN -UAO)
>   pc : tmc_read_unprepare_etb+0x74/0x108
>   lr : tmc_read_unprepare_etb+0x54/0x108
>   sp : ffffff80d9507c30
>   x29: ffffff80d9507c30 x28: ffffff80b3569a0c
>   x27: 0000000000000000 x26: 00000000000a0001
>   x25: ffffff80cbae9550 x24: 0000000000000010
>   x23: ffffffd07296b0f0 x22: ffffffd0109ee028
>   x21: 0000000000000000 x20: ffffff80d19e70e0
>   x19: ffffff80d19e7080 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000
>   x15: 0000000000000000 x14: 0000000000000000
>   x13: 0000000000000000 x12: 0000000000000000
>   x11: 0000000000000000 x10: dfffffd000000001
>   x9 : 0000000000000000 x8 : 0000000000000002
>   x7 : ffffffd071d0fe78 x6 : 0000000000000000
>   x5 : 0000000000000080 x4 : 0000000000000001
>   x3 : ffffffd071d0fe98 x2 : 0000000000000000
>   x1 : 0000000000000004 x0 : 0000000000000001
>   Kernel panic - not syncing: Asynchronous SError Interrupt
>
> Fixes: 4525412a5046 ("coresight: tmc: making prepare/unprepare functions generic")
> Reported-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index 36cce2bfb744..6375504ba8b0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -639,15 +639,14 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>
> -       /* There is no point in reading a TMC in HW FIFO mode */
> -       mode = readl_relaxed(drvdata->base + TMC_MODE);
> -       if (mode != TMC_MODE_CIRCULAR_BUFFER) {
> -               spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -               return -EINVAL;
> -       }
> -
>         /* Re-enable the TMC if need be */
>         if (drvdata->mode == CS_MODE_SYSFS) {
> +               /* There is no point in reading a TMC in HW FIFO mode */
> +               mode = readl_relaxed(drvdata->base + TMC_MODE);
> +               if (mode != TMC_MODE_CIRCULAR_BUFFER) {
> +                       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +                       return -EINVAL;
> +               }
>                 /*
>                  * The trace run will continue with the same allocated trace
>                  * buffer. As such zero-out the buffer so that we don't end
>
> base-commit: 3d439a6c349778f129de19595db564a8366c3634
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

Tested OK on my DB410c / Linux 5.8-rc1

Tested-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
