Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B1C1EC4CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 00:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgFBWMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 18:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgFBWMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 18:12:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947CEC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 15:12:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so14309986ejm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rs5FX8yr8F2XCiZEbHfoUy6e6QfRwHSSUVkzIr/99n8=;
        b=PXZ3Ye+CqRNQtPKlmEvy11W37Mm7Dv3RSRYHNiaY7QXqqqGjprEoszJiYRYwoCkVjc
         +FTsxpBmlEEGYC/8sJEamatCJj04YTRz1/w4l8A1zkj9jqWg+DY3Zg2eB87sKr+UJh31
         9iHBbQPcTl/lHwlP//H46v8M93kgOSbWH6w5iscN3S7pAt3mBMu1/9IWBZxSwd1pVV/V
         8cBSVfs90sMy9VwkjkmO+0nEtgtAhXuuOh8Ek5uZQX80KR7etPr+VDJraFRIlp+gxreT
         fydtQqnE+FnNy17tV8iVuSY+1YYxTtst8o53NAMDiXFpRoGCROpVLJBNFmOsGC0gu4Zy
         JVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rs5FX8yr8F2XCiZEbHfoUy6e6QfRwHSSUVkzIr/99n8=;
        b=Z+Lw1Ydt6OIaDenVT0409iXk1VvsUVGkZxCrDWgurEuIQ1ER1dGO7vgpzEp+Ot4HHv
         M/4a3bipNmu5oxeFl0uoyNJ+5Guk68H4e15gSrKxl0OXLFlOdKZla3iYx3RX9qNb7Lt2
         XqKSELb+SyTsXJ3L8CdWp2u4IUnmpLxtW/8sWxCkkyEG7pK5+VasQ8Y+3PULtEBRQ+SE
         C6xbeoBb8Omyxsk7/Spri/B8m/wwUxr8pTuTvRgfRZQ/a7iV7b/ufnzUgdkz1yDt0tWv
         R9qrbA/1rF/S+mNwP7dElsaXbQUiPNXCPufpjESnrxDGTolv3ybxBoo+j0qMAxq1rqY/
         93lw==
X-Gm-Message-State: AOAM532gm9bDXTjLIzTeFFp3IaDwLSrt5iHTZ0tLXJDdrRmLQ3RVnxOT
        RrrhBIQb7ykZ3TWbGEMq/ilqrE4eeUCpNcvWO7NF7Q==
X-Google-Smtp-Source: ABdhPJwjiVD15IacnxpGUm68kBMkN3bWqA9RX615wyQ8deBfEWN1Wb6NnaV/refbySfK35t9Z/5bggLn+Nn96h90HjM=
X-Received: by 2002:a17:907:9d8:: with SMTP id bx24mr24813707ejc.517.1591135968133;
 Tue, 02 Jun 2020 15:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <6d759cc28628ea72767c1304883630eb@codeaurora.org>
In-Reply-To: <6d759cc28628ea72767c1304883630eb@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 2 Jun 2020 23:12:37 +0100
Message-ID: <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
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

Hi Sai,

On Tue, 2 Jun 2020 at 08:30, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> Thanks for taking your time for review.
>
> On 2020-06-02 02:58, Mathieu Poirier wrote:
> > Hi Sai,
> >
> > On top of the comments already privided by Mike, I have the following:
> >
> > On Mon, Jun 01, 2020 at 01:32:26PM +0530, Sai Prakash Ranjan wrote:
> >> Implement a shutdown callback to ensure ETR/ETF hardware is
> >> properly shutdown in reboot/shutdown path. This is required
> >> for ETR/ETF which has SMMU address translation enabled like
> >> on SC7180 SoC and few others. If the hardware is still accessing
> >> memory after SMMU translation is disabled as part of SMMU
> >> shutdown callback in system reboot or shutdown path, then
> >> IOVAs(I/O virtual address) which it was using will go on the bus
> >> as the physical addresses which might result in unknown crashes
> >> (NoC/interconnect errors). So we make sure from this shutdown
> >> callback that the ETR/ETF is shutdown before SMMU translation is
> >> disabled and device_link in SMMU driver will take care of ordering
> >> of shutdown callbacks such that SMMU shutdown callback is not
> >> called before any of its consumer shutdown callbacks.
> >>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> ---
> >>  .../hwtracing/coresight/coresight-tmc-etf.c   |  4 +--
> >>  .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
> >>  drivers/hwtracing/coresight/coresight-tmc.c   | 29
> >> +++++++++++++++++++
> >>  drivers/hwtracing/coresight/coresight-tmc.h   |  3 ++
> >>  4 files changed, 35 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> index 36cce2bfb744..cba3e7592820 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> @@ -85,7 +85,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata
> >> *drvdata)
> >>      CS_LOCK(drvdata->base);
> >>  }
> >>
> >> -static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >> +void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >>      __tmc_etb_disable_hw(drvdata);
> >>      coresight_disclaim_device(drvdata->base);
> >> @@ -118,7 +118,7 @@ static int tmc_etf_enable_hw(struct tmc_drvdata
> >> *drvdata)
> >>      return 0;
> >>  }
> >>
> >> -static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
> >> +void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >>      CS_UNLOCK(drvdata->base);
> >>
> >
> > Why do we care about ETB and ETF when they both use RAM internal to the
> > device?
> > Moreover, the system RAM they use is not dedicated and as such falls
> > back to the
> > kernel's memory pool.
> >
>
> Actually we don't, I added the disable for ETF/ETB for completeness
> since we are
> adding shutdown callback for TMC devices and not just ETR although this
> issue applies
> only for ETR and it doesn't hurt to disable these devices in shutdown
> path.
>

If they don't affect the issue you are fixing, there are good reasons
for leaving ETB./ETF running.
If a system is not completely powered down, then the static ram in
these devices can sometimes be used for post-mortem diagnosis after
re-start.

> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> index 625882bc8b08..b29c2db94d96 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> @@ -1110,7 +1110,7 @@ static void __tmc_etr_disable_hw(struct
> >> tmc_drvdata *drvdata)
> >>
> >>  }
> >>
> >> -static void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >> +void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >>      __tmc_etr_disable_hw(drvdata);
> >>      /* Disable CATU device if this ETR is connected to one */
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c
> >> b/drivers/hwtracing/coresight/coresight-tmc.c
> >> index 5a271ebc4585..7e687a356fe0 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
> >> @@ -540,6 +540,34 @@ static int tmc_probe(struct amba_device *adev,
> >> const struct amba_id *id)
> >>      return ret;
> >>  }
> >>
> >> +static void tmc_shutdown(struct amba_device *adev)
> >> +{
> >> +    struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
> >> +
> >> +    if (!drvdata->enable)
> >> +            goto out;
> >> +
> >> +    /*
> >> +     * We do not care about the active trace sessions here
> >> +     * since the system is going down unlike remove callback,
> >> +     * just make sure that the hardware is shutdown.
> >> +     */
> >> +    switch (drvdata->config_type) {
> >> +    case TMC_CONFIG_TYPE_ETB:
> >> +            tmc_etb_disable_hw(drvdata);
> >> +            break;
> >> +    case TMC_CONFIG_TYPE_ETF:
> >> +            tmc_etf_disable_hw(drvdata);
> >> +            break;
> >> +    case TMC_CONFIG_TYPE_ETR:
> >> +            tmc_etr_disable_hw(drvdata);
> >> +    }
> >> +
> >> +out:
> >> +    misc_deregister(&drvdata->miscdev);
> >> +    coresight_unregister(drvdata->csdev);
> >
> > If a session is active when tmc_shutdown() is called, unregistering the
> > ETF/ETR
> > will result in a kernel crash if the session is stopped before the
> > kernel has
> > had the opportunity to shutdown.  It is the problem as trying to make
> > coresight
> > drivers modular.
> >
> > For this to really work the ongoing session would need to be stopped.
> > That
> > would teardown the path and stop the sink.
>
> I have tested this with and without active trace sessions multiple times
> on 2 devices
> and did not observe a single crash. The crash should be easily triggered
> as per
> what you are saying if we have active sessions but I do not see any
> crash.
>
> >
> > That being said I'm sure that dependencies on an IOMMU isn't a problem
> > confined
> > to coresight. I am adding Robin Murphy, who added this commit [1], to
> > the thread
> > in the hope that he can provide guidance on the right way to do this.
> >
>
> SMMU/IOMMU won't be able to do much here as it is the client's
> responsiblity to
> properly shutdown and SMMU device link just makes sure that
> SMMU(supplier) shutdown is
> called only after its consumers shutdown callbacks are called.

I think this use case can be handled slightly differently than the
general requirements for modular CoreSight drivers.

What is needed here is a way of stopping the underlying ETR hardware
from issuing data to the SMMU, until the entire device has been shut
down, in a way that does not remove the driver, breaking existing
references and causing a system crash.

We could introduce a new mode to the ETR driver - e.g. CS_MODE_SHUTDOWN.

At the end of the block tmc_shutdown(struct amba_device *adev), set
drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
This new mode can be used to  prevent the underlying hardware from
being able to restart until the device is re-powered.

This mode can be detected in the code that enables / disables the ETR
and handled appropriately (updates to tmc_enable_etr_sink and
tmc_disable_etr_sink).
This mode will persist until the device is re-started - but because we
are on the device shutdown path this is not an issue.

This should leave the CoreSight infrastructure stable until the
drivers are shut down normally as part of the device power down
process.

Regards

Mike



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
