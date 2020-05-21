Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449431DD2C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgEUQIW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728450AbgEUQIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:08:22 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D40C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:08:21 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l21so9485819eji.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/lJE4jLHbbeHy9SYo6zuw/2TSWZ5aZ/0UMTVBF2YCM=;
        b=fYeLrq91quQesoERuZPsz/Ps4qkrIkmowKFI0B/ZhRqAPrmHO09OkSYMD+RAZDQixU
         aCGCKMDpEKVKJq1rw9auco0YbvpR8PVNmqjyAiHjQ6SISqoIhFkyPRFDzPGtB4wv1Uo6
         kvbd8g0VtMRObCORqfbMnoYv5I6nvtChcWU5QL6xNLxtxcKYV/eSpZxSMmA0kJx2q2qP
         ZKCXqP6d5rANy6v6jOZ6W4lLTEvDciRdWBmOcOdCtmZk4oC2tfo7zN2Dz8sl2mmu7lXD
         hTnADtxtYPH21HlpduhXIqTiyo+L4o8QnW03GDu0/+HPK97bwNao3CfHROyeGCiaGMoK
         np/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/lJE4jLHbbeHy9SYo6zuw/2TSWZ5aZ/0UMTVBF2YCM=;
        b=fZySgnPpllVP9wrKqE76zOxQmtOzIsP9fp1UK9d0ZYV1tflVVCQhaoDWjz818lEIo0
         FmN7WuSxX3AH3PkivB4SoeDfGihy6fXjIuHDGqI/SYospJo4VnP7hPtIIVDXk6mbw82E
         Le3GDN9I06Douzu9wwA8pUUDKQguIHPUw7oYGQDUcO6zO0QkFQXydRzJH5LIFmh4DaVU
         14kRcNsQ4KmqE/kMgbxwV0OozCA2QFuURx9Bv3LVS3lsQWFGg4HKe40VXAiAKPAVmd/M
         9BGjvOlMwnj1tX+/W+thZfoy5eU3wFbLlCu3Dy/2f9ESAg4cIjCyvexK1/2k/3zaSOBz
         CRqw==
X-Gm-Message-State: AOAM530AIfVeaXb4pgvrpIcZ+P/0oP1D9aGOdXmulyzIOE0BvtiEUC4i
        FAXAK+L8mAoRa0r0VG0TYOdNRZiZX9NvjkpkhahuqA==
X-Google-Smtp-Source: ABdhPJyFdE5SlV3DmqLLNA1YVjp8NUcII49o3lvYKjNS94r0EBsgKE8zBb0qyErcyZhYRXTzs5T/bifZ5hpPmMcacow=
X-Received: by 2002:a17:906:ce39:: with SMTP id sd25mr4333973ejb.477.1590077300428;
 Thu, 21 May 2020 09:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org> <c2e02d0c92b081c05b91d07ec17e648c40af3897.1589894597.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <c2e02d0c92b081c05b91d07ec17e648c40af3897.1589894597.git.saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 21 May 2020 17:08:09 +0100
Message-ID: <CAJ9a7ViRLzicR3tu8q4X5dEnYUCo-Tz6fi=baU0CVQTofvMV+w@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] coresight: replicator: Reset replicator if context
 is lost
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On Tue, 19 May 2020 at 14:36, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On some QCOM SoCs, replicators in Always-On domain loses its
> context as soon as the clock is disabled. Currently as a part
> of pm_runtime workqueue, clock is disabled after the replicator
> is initialized by amba_pm_runtime_suspend assuming that context
> is not lost which is not true for replicators with such
> limitations. So add a new property "qcom,replicator-loses-context"
> to identify such replicators and reset them.
>
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>
> Added Mike's suggested by for parts other than the DT property.
> Perhaps I should add Co-developed-by Mike since the full skeletal
> was given by Mike. I can add that if required on the next version.
>
> ---
>  .../coresight/coresight-replicator.c          | 53 +++++++++++++------
>  1 file changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index c619b456f55a..ba66160c8140 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -38,6 +38,7 @@ struct replicator_drvdata {
>         struct clk              *atclk;
>         struct coresight_device *csdev;
>         spinlock_t              spinlock;
> +       bool                    check_idfilter_val;
>  };
>
>  static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
> @@ -66,29 +67,43 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
>                                      int inport, int outport)
>  {
>         int rc = 0;
> -       u32 reg;
> -
> -       switch (outport) {
> -       case 0:
> -               reg = REPLICATOR_IDFILTER0;
> -               break;
> -       case 1:
> -               reg = REPLICATOR_IDFILTER1;
> -               break;
> -       default:
> -               WARN_ON(1);
> -               return -EINVAL;
> -       }
> +       u32 id0val, id1val;
>
>         CS_UNLOCK(drvdata->base);
>
> -       if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0xff) &&
> -           (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0xff))
> +       id0val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0);
> +       id1val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1);
> +
> +       /*
> +        * Some replicator designs lose context when AMBA clocks are removed,
> +        * so have a check for this.
> +        */
> +       if (drvdata->check_idfilter_val && id0val == 0x0 && id1val == 0x0)
> +               id0val = id1val = 0xff;
> +
> +       if (id0val == 0xff && id1val == 0xff)
>                 rc = coresight_claim_device_unlocked(drvdata->base);
>
> +       if (!rc) {
> +               switch (outport) {
> +               case 0:
> +                       id0val = 0x0;
> +                       break;
> +               case 1:
> +                       id1val = 0x0;
> +                       break;
> +               default:
> +                       WARN_ON(1);
> +                       rc = -EINVAL;
> +               }
> +       }
> +
>         /* Ensure that the outport is enabled. */
> -       if (!rc)
> -               writel_relaxed(0x00, drvdata->base + reg);
> +       if (!rc) {
> +               writel_relaxed(id0val, drvdata->base + REPLICATOR_IDFILTER0);
> +               writel_relaxed(id1val, drvdata->base + REPLICATOR_IDFILTER1);
> +       }
> +
>         CS_LOCK(drvdata->base);
>
>         return rc;
> @@ -239,6 +254,10 @@ static int replicator_probe(struct device *dev, struct resource *res)
>                 desc.groups = replicator_groups;On HolidayOn Holiday
>         }
>
> +       if (fwnode_property_present(dev_fwnode(dev),
> +                                   "qcom,replicator-loses-context"))
> +               drvdata->check_idfilter_val = true;
> +
>         dev_set_drvdata(dev, drvdata);
>
>         pdata = coresight_get_platform_data(dev);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

Suggested-by is just fine - I didn't actually try out my suggested
code after all!

Reviewed-by Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
