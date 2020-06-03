Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FA11ECE41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 13:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgFCL1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 07:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCL1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 07:27:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F15C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 04:27:22 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z5so1780976ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhM8iRgNfKXTRDBRqXeuzDbN65/0jN44+ax6ZdEs4fk=;
        b=Vixa1y6m9+WDzkngcpJBP+uAE5NShW65DCij0lq7OcG/MUuNdYYkyg1QTZToihhT2h
         62WrnM1VQkR8J8Zlwc3XwLcHKw4Wxujx2qeAmz+Apd4N6O0cOdsS44QWo6N7sTUzy8jI
         GdSmwrGsPhaLF+XWO/ILT0EgywDUg4Oi5+orh/bizrEbd4H52R7ZwvnpjZH5uO3DTSRz
         2PAmM+4mvxz2qZz4Z4mkO9HUh2Ta/JvtIXtnXjT9c0Q9IUk2LPxIlk79ZjYBLzxwahC8
         MHGfCdvrX7hEZmC40QL/ApzYDUBgY4/N43TQJPLJ75cLtoqhhuzwTSTrl2B3T3P42qKU
         ftCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhM8iRgNfKXTRDBRqXeuzDbN65/0jN44+ax6ZdEs4fk=;
        b=eHLneNarHBO1bz0ibJ/3DvhAUGHqmT6nTVGMJAcjy6qItwth/hk/XoUAYTxSANiHJf
         Do5hQUlccPkC5D/YQk2gGNosb38ZfBrrUfhn2OXcL56qg9FzGCNYGOnTszoCHY8I+5Im
         KjAT0IH7Ib5xTE+zN98C6KsUoKXZ9J6c0DV+N34AkoP8HSFHzd3ZWgPmqiUehy+r4LZU
         2Vsl7Ly7iQTJVEDexGl4NWU0Ytrtdk+3+SF0xusI5JMDKisIhLpug5P0apvbuaxN9glJ
         8kdElSjD5D0RnB5L90+gAu88W0CnIRlsv7KswjN8uwiWVfD3fj2c0XJaKNFQaYvROb8f
         P7qg==
X-Gm-Message-State: AOAM533CZqI/16igGnyMxU2ldHMl4CkNyAE1s2CIrxkoLKAb3WuJIN25
        v7rVUFBI9RSkGY3cul9oLEa2PcgkDFTS06zG7yAxEg==
X-Google-Smtp-Source: ABdhPJwzV9kd/HCF1oD01x9Grj16lQwV3iVe8y14F3DJkr+IwzeR9WEmSBci4EZtlieIwAtnoimTUdsNubGx8NTIJtk=
X-Received: by 2002:a17:907:9d8:: with SMTP id bx24mr26823421ejc.517.1591183641240;
 Wed, 03 Jun 2020 04:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com> <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
In-Reply-To: <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 3 Jun 2020 12:27:10 +0100
Message-ID: <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 3 Jun 2020 at 11:24, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mike,
>
> Thanks again for looking at this.
>
> On 2020-06-03 03:42, Mike Leach wrote:
> [...]
>
> >>
> >> SMMU/IOMMU won't be able to do much here as it is the client's
> >> responsiblity to
> >> properly shutdown and SMMU device link just makes sure that
> >> SMMU(supplier) shutdown is
> >> called only after its consumers shutdown callbacks are called.
> >
> > I think this use case can be handled slightly differently than the
> > general requirements for modular CoreSight drivers.
> >
> > What is needed here is a way of stopping the underlying ETR hardware
> > from issuing data to the SMMU, until the entire device has been shut
> > down, in a way that does not remove the driver, breaking existing
> > references and causing a system crash.
> >
> > We could introduce a new mode to the ETR driver - e.g.
> > CS_MODE_SHUTDOWN.
> >
> > At the end of the block tmc_shutdown(struct amba_device *adev), set
> > drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
> > This new mode can be used to  prevent the underlying hardware from
> > being able to restart until the device is re-powered.
> >
> > This mode can be detected in the code that enables / disables the ETR
> > and handled appropriately (updates to tmc_enable_etr_sink and
> > tmc_disable_etr_sink).
> > This mode will persist until the device is re-started - but because we
> > are on the device shutdown path this is not an issue.
> >
> > This should leave the CoreSight infrastructure stable until the
> > drivers are shut down normally as part of the device power down
> > process.
> >
>
> Sounds good to me, but if the coresight_unregister() is the trouble
> point
> causing these crashes, then can't we just remove that from
> tmc_shutdown()
> callback? This would be like maintaining the same behaviour as now where
> on reboot/shutdown we basically don't do anything except for disabling
> ETR.

No - the new mode prevents race conditions where the thread shutting
down the SMMU does the ETR shutdown, but then another thread happens
to be trying to start trace and restarts the ETR.
It also prevents the condition Mathieu discussed where a thread might
be attempting to shutdown trace - this could try to disable the
hardware again re-releasing resources/ re-flushing and waiting for
stop.

Regards

Mike

> This way, we do not have to introduce any new mode as well. To be exact,
> in
> tmc_shutdown() we just disable ETR and then return without unregistering
> which should not cause any issues since this is shutdown not the remove
> callback which is a requirement for making coresight modular like below:
>
> static void tmc_shutdown(struct amba_device *adev)
>   {
>           unsigned long flags;
>           struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
>
>           spin_lock_irqsave(&drvdata->spinlock, flags);
>
>           if (drvdata->mode == CS_MODE_DISABLED)
>                   goto out;
>
>           if (drvdata->config_type == TMC_CONFIG_TYPE_ETR)
>                   tmc_etr_disable_hw(drvdata);
>
>           /*
>            * We do not care about coresight unregister here unlike remove
>            * callback which is required for making coresight modular
> since
>            * the system is going down after this.
>            */
>   out:
>           spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   } from disabling the ETR again - potentially freeing up memory twice.
>
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
