Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703091ED170
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 15:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgFCNv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 09:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgFCNvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 09:51:24 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBBAC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 06:51:22 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g1so1817278edv.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HT6Jc3j2wV7RmXXPBI9xBKNNCNks3guHWgmY6UH0Bes=;
        b=TnMhhLK/LjZa4U+b57SZZcXBGH9KbG3fKuIyMZ+4ULLTlthdnE1uS8UF/P8KS5SGpU
         PqdbHle2YSIuqs9ZzCbKjdr7fdmZlUAveUrmiU7EdOu/coIuttGQ3cKRmONakytLalOv
         XKK/rkX3xa1/m3TCYYcNwXGHtyTOpNb8SCUER1XcJVSJnKf/iTI/nruI5xBlv2/mQO0Z
         F/sBstOe57JrH77McxzpfDsa7ENLEpt+GAl0KABK/XptanScNbgIrB5yTpArSCz0EAGU
         Kn0PAg2HIQypjsIXc/kPkyQ7ewST6SJjJwpjCiXAw308PEXYjgn++N9ozS8EFMr9QGb9
         7P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HT6Jc3j2wV7RmXXPBI9xBKNNCNks3guHWgmY6UH0Bes=;
        b=r0qUb0AMHRz4Qz3VHUrgLUil3TFBt6jZ2y5ygrbR5uE1z+6ONTTmTAJMFa61TecFrW
         X8qrsl7AeYbpOh3lw1eXISTofWmYe/qnMpkn+S/Qo+J63BQr6ubNyjZvBvM0prTN08JJ
         3jfXpuGlo7woOfQ/8jC34LIRzr47C2sAOOutlFYECeKESZVzpfh2uO0cZRfAD8Eo1qfX
         rPJyNR5K+OXBOv/GAWsJzTmW0vHQsDO+sBa68XhxvGRAZEPW56Ir/p0G3BB8B9Ov40Do
         OOloKehvCQaJVCBF8Hx25Wct2/X/V60ovL0KFI9XmvyYr3CTFOC3vqKRH4Gaxi6vPr5A
         2u1A==
X-Gm-Message-State: AOAM533vN2L2rgMFkQ+3X1y5PIRdXSYxRmk40XtbpGt05C0QZedlKuhP
        XRCQss1hUxYJgCb3xWxZtRONY/9bJCSQC+m7//QtdA==
X-Google-Smtp-Source: ABdhPJwR2vjJry78FpxUk8oMC0I8QgflKiFfnUU3O2YO1V0+Cgkk0EEZfk46wQLVk0jJWhT7WOgQcXIVpsmYLhauAP0=
X-Received: by 2002:a50:f289:: with SMTP id f9mr20683380edm.188.1591192281579;
 Wed, 03 Jun 2020 06:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org> <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org> <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
 <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com>
In-Reply-To: <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 3 Jun 2020 14:51:10 +0100
Message-ID: <CAJ9a7Vj3sL=4O3DU+aJWYLhue1UxQmX4Ba5JdEnmxKDEYo_z4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Wed, 3 Jun 2020 at 14:34, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-06-03 14:22, Mike Leach wrote:
> > Hi Sai,
> >
> > On Wed, 3 Jun 2020 at 13:14, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> Hi Mike,
> >>
> >> On 2020-06-03 16:57, Mike Leach wrote:
> >>> Hi,
> >>>
> >>> On Wed, 3 Jun 2020 at 11:24, Sai Prakash Ranjan
> >>> <saiprakash.ranjan@codeaurora.org> wrote:
> >>>>
> >>>> Hi Mike,
> >>>>
> >>>> Thanks again for looking at this.
> >>>>
> >>>> On 2020-06-03 03:42, Mike Leach wrote:
> >>>> [...]
> >>>>
> >>>>>>
> >>>>>> SMMU/IOMMU won't be able to do much here as it is the client's
> >>>>>> responsiblity to
> >>>>>> properly shutdown and SMMU device link just makes sure that
> >>>>>> SMMU(supplier) shutdown is
> >>>>>> called only after its consumers shutdown callbacks are called.
> >>>>>
> >>>>> I think this use case can be handled slightly differently than the
> >>>>> general requirements for modular CoreSight drivers.
> >>>>>
> >>>>> What is needed here is a way of stopping the underlying ETR hardware
> >>>>> from issuing data to the SMMU, until the entire device has been shut
> >>>>> down, in a way that does not remove the driver, breaking existing
> >>>>> references and causing a system crash.
> >>>>>
> >>>>> We could introduce a new mode to the ETR driver - e.g.
> >>>>> CS_MODE_SHUTDOWN.
> >>>>>
> >>>>> At the end of the block tmc_shutdown(struct amba_device *adev), set
> >>>>> drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
> >>>>> This new mode can be used to  prevent the underlying hardware from
> >>>>> being able to restart until the device is re-powered.
> >>>>>
> >>>>> This mode can be detected in the code that enables / disables the ETR
> >>>>> and handled appropriately (updates to tmc_enable_etr_sink and
> >>>>> tmc_disable_etr_sink).
> >>>>> This mode will persist until the device is re-started - but because we
> >>>>> are on the device shutdown path this is not an issue.
> >>>>>
> >>>>> This should leave the CoreSight infrastructure stable until the
> >>>>> drivers are shut down normally as part of the device power down
> >>>>> process.
> >>>>>
> >>>>
> >>>> Sounds good to me, but if the coresight_unregister() is the trouble
> >>>> point
> >>>> causing these crashes, then can't we just remove that from
> >>>> tmc_shutdown()
> >>>> callback? This would be like maintaining the same behaviour as now
> >>>> where
> >>>> on reboot/shutdown we basically don't do anything except for disabling
> >>>> ETR.
> >>>
> >>> No - the new mode prevents race conditions where the thread shutting
> >>> down the SMMU does the ETR shutdown, but then another thread happens
> >>> to be trying to start trace and restarts the ETR.
> >>> It also prevents the condition Mathieu discussed where a thread might
> >>> be attempting to shutdown trace - this could try to disable the
> >>> hardware again re-releasing resources/ re-flushing and waiting for
> >>> stop.
> >>>
> >>
> >> I do not think there will a race between SMMU shutdown and ETR shutdown.
> >> Driver core takes care of calling SMMU shutdown after its consumer
> >> shutdown callbacks via device link, otherwise there would already be
> >> bugs in all other client drivers.
> >>
> >
> > I am not saying there could be a race between tmc_shutdowm and
> > Smmu_shutdown - there may be a case if the coresight_disable_path
> > sequence is running and gets to the point of disabling the ETR after
> > the SMMU callback has disabled it.
>
> I'm confused now - there is no "SMMU callback", we're talking about the
> system-wide cleanup from kernel_shutdown_prepare() or
> kernel_restart_prepare(). As far as I'm aware userspace should be long
> gone by that point, so although trace may have been left running ||
           ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7)), the
> chance of racing against other driver operations seems pretty unlikely.
>

Sorry - bad choice of terminology. I was referring to the SMMU
ensuring that it had all its clients shut-down before if shut down. To
quote Sai...

>>>>> SMMU device link just makes sure that
> >>>>>> SMMU(supplier) shutdown is
> >>>>>> called only after its consumers shutdown callbacks are called.

I agree it is unlikely, but if removing the device from the CoreSight
infrastructure via coresight_unregister() is a potential source of a
crash, it would seem that there is a potential path where some
CoreSight driver side work might be possible. therefore a mode to
prevent this crash, and ensure that the device hardware remains off
and not sending trace to SMMU until such time as shutdown / reboot
restart occurs, seemed prudent.

Mike

> Robin.



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
