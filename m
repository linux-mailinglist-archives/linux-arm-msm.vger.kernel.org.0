Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5B71ED0AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 15:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgFCNWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 09:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgFCNWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 09:22:33 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90083C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 06:22:33 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id mb16so2152240ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPwX4c4qU1Ibpfzn0AFffCVAQ4RDh1hSQFVaf4E4RKA=;
        b=uRBfH3yTtpCBYHHYqQw4B8u3acTPULDVQmRyZV1n6qGJuxks8v0rTqgXHPStIYYK1c
         N1rci9Zu9HZjsvIYicNlpOOnfBcUi+zs64OWNQwbegqFLg0w/F21FAtX/id2CiMthsJG
         IRW7xP9h9ez3MFslB17v9wycKadkDxXQcmNWzm72cLT31qCgnjt/fp0XWgPeoO81xINU
         Q0R/HsMG+7kVTVru2RvbGMitHKBUoUj1JBBUwzBI0MrUdpyfXLslhP5y1lqu+tKA0KPZ
         0vG0Muh4/YN4F6c9YSPxSVHnVMdKdbm07Bx2Tr6Ma/NBOqe+lTKepYWYWX48jQcg5joO
         hjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPwX4c4qU1Ibpfzn0AFffCVAQ4RDh1hSQFVaf4E4RKA=;
        b=FHwtn7SQFaAHrBLmtRDqNQjtiq6zad1dD6PkTZeeGw6GKQioZ0kx+qLoZjYuQobs2+
         2fzCukZXb/8N5/bReCfY3FCcUrswYkTMUfgVbfavg74gtO8rO2l+JH7o5ge3KALKwYTN
         cmVimAKjMYRAkKphiVa5jEAvoLyEFrLJzmT4aVPwNcJxjEKvPcHr+vRShTr1SdhUJjkd
         k8PT2whGqP+/P0XN8oSpGf2KXEqbnR+BBlc1nV79lpnoPjYLJbo7il9Cq1t+Qppt89VA
         oJAzYxrWKvBki2IKkZy4IOeIdw85HD09zCx54YBAExOMi24BPdIvZSTeOWv+pYuzS90e
         CS1A==
X-Gm-Message-State: AOAM530UIYsJs+CkPij7ErwMmqHvP2eLi5UKBYcoD+IrRVpjIxbeB1K4
        JbxuqT+pC0pkbCRPmnNfFPyk21VVZodf9hMQ+Lx+aw==
X-Google-Smtp-Source: ABdhPJy9GE7o2d5AINznqj2b0Dcu519109HaN+lBlE9eMUrNUbmd11s0xZ0qXKihtY+PyNILSWGbMMX9VHcpqTDjQ3s=
X-Received: by 2002:a17:907:9484:: with SMTP id dm4mr29506933ejc.56.1591190552082;
 Wed, 03 Jun 2020 06:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org> <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org>
In-Reply-To: <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 3 Jun 2020 14:22:21 +0100
Message-ID: <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
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

On Wed, 3 Jun 2020 at 13:14, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mike,
>
> On 2020-06-03 16:57, Mike Leach wrote:
> > Hi,
> >
> > On Wed, 3 Jun 2020 at 11:24, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> Hi Mike,
> >>
> >> Thanks again for looking at this.
> >>
> >> On 2020-06-03 03:42, Mike Leach wrote:
> >> [...]
> >>
> >> >>
> >> >> SMMU/IOMMU won't be able to do much here as it is the client's
> >> >> responsiblity to
> >> >> properly shutdown and SMMU device link just makes sure that
> >> >> SMMU(supplier) shutdown is
> >> >> called only after its consumers shutdown callbacks are called.
> >> >
> >> > I think this use case can be handled slightly differently than the
> >> > general requirements for modular CoreSight drivers.
> >> >
> >> > What is needed here is a way of stopping the underlying ETR hardware
> >> > from issuing data to the SMMU, until the entire device has been shut
> >> > down, in a way that does not remove the driver, breaking existing
> >> > references and causing a system crash.
> >> >
> >> > We could introduce a new mode to the ETR driver - e.g.
> >> > CS_MODE_SHUTDOWN.
> >> >
> >> > At the end of the block tmc_shutdown(struct amba_device *adev), set
> >> > drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
> >> > This new mode can be used to  prevent the underlying hardware from
> >> > being able to restart until the device is re-powered.
> >> >
> >> > This mode can be detected in the code that enables / disables the ETR
> >> > and handled appropriately (updates to tmc_enable_etr_sink and
> >> > tmc_disable_etr_sink).
> >> > This mode will persist until the device is re-started - but because we
> >> > are on the device shutdown path this is not an issue.
> >> >
> >> > This should leave the CoreSight infrastructure stable until the
> >> > drivers are shut down normally as part of the device power down
> >> > process.
> >> >
> >>
> >> Sounds good to me, but if the coresight_unregister() is the trouble
> >> point
> >> causing these crashes, then can't we just remove that from
> >> tmc_shutdown()
> >> callback? This would be like maintaining the same behaviour as now
> >> where
> >> on reboot/shutdown we basically don't do anything except for disabling
> >> ETR.
> >
> > No - the new mode prevents race conditions where the thread shutting
> > down the SMMU does the ETR shutdown, but then another thread happens
> > to be trying to start trace and restarts the ETR.
> > It also prevents the condition Mathieu discussed where a thread might
> > be attempting to shutdown trace - this could try to disable the
> > hardware again re-releasing resources/ re-flushing and waiting for
> > stop.
> >
>
> I do not think there will a race between SMMU shutdown and ETR shutdown.
> Driver core takes care of calling SMMU shutdown after its consumer
> shutdown callbacks via device link, otherwise there would already be
> bugs in all other client drivers.
>

I am not saying there could be a race between tmc_shutdowm and
Smmu_shutdown - there may be a case if the coresight_disable_path
sequence is running and gets to the point of disabling the ETR after
the SMMU callback has disabled it.

Mike

> Thanks,
> Sai
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
