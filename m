Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6AB3D150B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhGUQni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 12:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhGUQni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 12:43:38 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431EDC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 10:24:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id d17so3910509ljq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/geap+n06qADP8bUUkTvJg1+GbqYMe8lt6RpcUMxI18=;
        b=Hdt2KFh5xvg+QlcJKKcwzWITxdiB3zzWrNsSCi3yAmz5xkPmKzqnF9Vf88sIJjyPDe
         Ja3BG8LkZkNqMVYCmyfVmPjbmoWDHNC6HgfHZY9miAffsE8USRj45txPlXOHFqcKntP3
         JjG7JeL0LVCQRQFaqy6JOIaGkcz2XECZ3STKTmPSSK0EKewRHEkllDmMhuIPT0uEdT52
         UwELbIZsRCf9PI/reTR9o+ZG02ZzwTKnr65Pk5ZvQwTvMOL5yV5Q6QklhTuJftyhkSuM
         MNeB8hArE2/Uhg1XW/oqWLr9/271h+/O24cYDoBKJOPLkn+OgMrJxb73TsB4kCB0PkhA
         PB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/geap+n06qADP8bUUkTvJg1+GbqYMe8lt6RpcUMxI18=;
        b=P227H8xIY4LLXJKMsFQAmpXaWvq0x48c0pL8DzvQfbYvKOgHHeBa4Je+qyWykwo82k
         QyIckSCgFu/vXNKf84amJHI0n2zNyaL1mP3/BE+qz59FyK/b7bTbxr+ijS8xtMm4WSjo
         B2C+c58AtwMEwO5zYYsyxJ+jMwCscyWyKe8QENKkSXRDJXv1Pz8hmvaPUzAIqxF2HDYy
         Zq2WxrhYm3ma25imtl5RsRrzEMN0ik+1N3mc3M7w1/VJ878mo0PmOSF+DzizwY1/Fsd2
         0UcmmXsyYL3rqp/MGGLDNR9A4LE5DTNdC4k1eyd2aWSFB6g7UGwbvaQkHYc7f2qluYh+
         3FDQ==
X-Gm-Message-State: AOAM532UngezMbQ0XC5p6xjfcBzdYOCQxl9YaZh8K0XgGIRkOMY03zO9
        kiwEQGI39tx5jihR/A88amFJpV/LxiUctvVPM23I0g==
X-Google-Smtp-Source: ABdhPJws9ZMve7X1DBmsQqOrLOBnsRl56RypIYvLQcQu3Pn14yEsYIeMebFKy7cEHM6l5RgopE5mNsBgOpWsXYjmmQY=
X-Received: by 2002:a2e:a54b:: with SMTP id e11mr24488402ljn.503.1626888252628;
 Wed, 21 Jul 2021 10:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210707045320.529186-1-john.stultz@linaro.org> <YPgK50dmV7Z69WsL@kroah.com>
In-Reply-To: <YPgK50dmV7Z69WsL@kroah.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 21 Jul 2021 10:24:01 -0700
Message-ID: <CALAqxLUVgUT+1DyDGsFbF0138S0OYzpKADk__PsYbR4B4mbMhw@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 21, 2021 at 4:54 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 07, 2021 at 04:53:20AM +0000, John Stultz wrote:
> > Allow the qcom_scm driver to be loadable as a permenent module.
>
> This feels like a regression, it should be allowed to be a module.

I'm sorry, I'm not sure I'm following you, Greg.  This patch is trying
to enable the driver to be able to be loaded as a module.

> > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > ensure that drivers that call into the qcom_scm driver are
> > also built as modules. While not ideal in some cases its the
> > only safe way I can find to avoid build errors without having
> > those drivers select QCOM_SCM and have to force it on (as
> > QCOM_SCM=n can be valid for those drivers).
> >
> > Reviving this now that Saravana's fw_devlink defaults to on,
> > which should avoid loading troubles seen before.
>
> fw_devlink was supposed to resolve these issues and _allow_ code to be
> built as modules and not forced to be built into the kernel.

Right. I'm re-submitting this patch to enable a driver to work as a
module, because earlier attempts to submit it ran into boot trouble
because fw_devlink wasn't yet enabled.

I worry something in my description made it seem otherwise, so let me
know how you read it and I'll try to avoid such confusion in the
future.

thanks
-john
