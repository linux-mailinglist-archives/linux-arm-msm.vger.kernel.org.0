Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C4F261887
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgIHR5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731572AbgIHQMs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 12:12:48 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869E4C0617AA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 05:15:02 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id v20so4985307ual.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JP5ABl/qB8z1t9ORLAQA+/JSalJwDSSlxl4YBrhJyRk=;
        b=PLnrTJ0hdvX/RLFzIJe95N6ZWOVasNl2pHn+rmILMDZHrxBzQhQ5DJrUQSNKLxnMct
         m4VKclZwkvCEzZCSuRuxj7A6yH5yAn1bPQ6bUBmQYD+QA8enAXn1/p8e6VfRStsXVQDi
         Z+KljRsXXdwS3sCizlNxFr8U9lrvxjXyuERrX7sC0UMs5uL+2/QSa7tYbZjJaqkViJij
         97fd2ZRI9oJgUllw/h5Oy8EXKHsrpI4RFdVlrrvliUzGBW/DTmzDJU2vWl5a4XyRJ8QG
         70c9/F0PNQn0q9wmTMdpzTx1NW+4ocohTaKl5t+tyNOD2TIFsUqDGXQgCX+nintoaCxv
         CRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JP5ABl/qB8z1t9ORLAQA+/JSalJwDSSlxl4YBrhJyRk=;
        b=TZU6GUTpAm/QPhaEeyEl8CJ2Fdicnv9LVb29gGvYebdEW+qDynibdln6U0mTe2qJ+e
         rHhowdbc+E+5uDTKDLoNIrKGNpVl+t3NEEo476UGg8CiNeC0ArgU3YwbBFIWJME+8qSj
         aXfMBwfry41+j1EKBGkilVVT1pZ2KMjsn39/MxS12Iqg4SM1e2f20pH7JPBQdkcinlAX
         43WQRCY7qmxWlVC1l+0T6BH2RYeSDIodlRkEaqlZ3C+sLu5B3Lib/0RyIPhylvnZwcIw
         PHcuSGNDhrxdxuU5hsgnaxTAIoyvFsZSHR+T2u/+b0NuGnvQagzNiycv17ysoayclvg5
         kBXA==
X-Gm-Message-State: AOAM533Ww6rjOM//P3C8Pupc4LWMm0DX3ikYSyW/4HJU3ARZdXe+Az2M
        vAbCHjWF2LALLT6dcTOoBtRynN2lpb/UvernQzEbUFPaL7FAIplp
X-Google-Smtp-Source: ABdhPJxo3gMKdzXcjGyQn5fW6DvzchcJXxBNn6iNKQFA7ZfaNDR7GleDHdOB1QCQw5E3cvxYEedzaCbJPIlPUm6Ey4U=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr4250187uae.100.1599567301004;
 Tue, 08 Sep 2020 05:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200902232546.31240-1-ilina@codeaurora.org>
In-Reply-To: <20200902232546.31240-1-ilina@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Sep 2020 14:14:24 +0200
Message-ID: <CAPDyKFr+nA-EwbN_sOCj=R0EEtMNEaqfMqB+uV5+uzMTjS4rMA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Better domain idle from device wakeup patterns
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Sep 2020 at 01:26, Lina Iyer <ilina@codeaurora.org> wrote:
>
> Hello,
>
> I was looking for an option to do better power management for some
> domains where the devices enter runtime PM in a predictable fashion. For
> example a display device that sends a vsync interrupt every 16 ms for a
> 60 Hz panel. These interrupts are not timer interrupts but tend to
> interrupt periodically to service the workflow and the devices and
> domains may go back to idle soon after. Two domains are affected by this
> - the device's PM domain and the CPU PM domain.
>
> As a first step, I am looking to solve for the device's PM domain idle
> state (and hopefully solve for the CPU PM domains subsequently). The PM
> domain could have multiple idle states and/or the enter/exit latencies
> could be high. In either case, it may not always be beneficial to power
> off the domain, only to turn it back on before satisfying the idle state
> residency. When the wakeup is known for the device, we could use that to
> determine the worthiness of entering a domain idle state. Only the
> device can tell us when the future event would be and that could change
> as the usecase changes. Like, when the panel refresh rate increases to
> 120 Hz. If this information was made available to runtime PM, we could
> use that in the domain governor to determine a suitable idle state. This
> is the idea behind these patches.

While striving towards entering the most optimal (energy and
performance wise) idle state, I think it's an interesting approach.

>
> In the first patch, I am proposing an API for devices to specify their
> wakeup as a time in the future and in the second patch, I am updating
> the PM domain governor to use this information to determine the idle
> state. I have not had a chance to test this out yet, but I wanted to
> know if I am on the right track.

I don't have any immediate objections - I think the approach seems
reasonable. Still, my first thought that this could be an extension to
the dev_pm_qos interface, but perhaps that isn't a good fit.

I also have a couple of comments to the code, but I will reply to each
patch separately about that.

>
> Would appreciate your thoughts on this.

When it comes to showing real results, other than in theory, I think
we need to make the genpd's cpu governor to cope with the next wakeup
event as well.

>
> Thanks,
> Lina
>
>
> Lina Iyer (2):
>   PM / runtime: register device's next wakeup
>   PM / Domains: use device's next wakeup to determine domain idle state
>
>  drivers/base/power/domain_governor.c | 87 ++++++++++++++++++++++++++--
>  drivers/base/power/runtime.c         | 31 ++++++++++
>  include/linux/pm.h                   |  2 +
>  include/linux/pm_domain.h            |  1 +
>  include/linux/pm_runtime.h           |  1 +
>  5 files changed, 116 insertions(+), 6 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

Kind regards
Uffe
