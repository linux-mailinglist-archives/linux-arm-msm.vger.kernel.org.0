Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039762AB774
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 12:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgKILq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 06:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgKILq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 06:46:29 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4589CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 03:46:29 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id o21so11806131ejb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 03:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vfDiOIThHlvV9mjihXI70yuyLfKZI+j+gNbZW4PCAPg=;
        b=N+3DP68M/depWbf4qFbiSCvUoi8mSsWyadfZKzTdPydZBaQTfjp719U2T7nG3Kb7UL
         UXb8DULcb5NpJ9xRtCxD/yJR2ccFkWIac0MJ2IutVP85Y3SO/KnUy8FSrgyiAlSh66+z
         LgMrU/qJtB/6uOTE+W0EG5rdwRypm9K5vjqgN5/6DbB2bTfwiMfFMdwd+7nexSIivwBq
         nwTVRSP1hXmKmBU3GQQnz7mN5i2/rz6b4XwK5uDY5yw3xgu4dFALcdthpqIfuuNpFJg9
         9rpXah5qlzPM1JkHG8ajD6PE9WzvAE0AKN72OL46LCb7qL0mL8GJQx+UrSCvtmVJ+3WP
         OhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vfDiOIThHlvV9mjihXI70yuyLfKZI+j+gNbZW4PCAPg=;
        b=g9BD1mLUADzxfRI7mvSoD7/ULmyq8j1V4FTXtU3yCnsJpjvgw/CPnfDb5WC6Ki3oty
         MHjwLS14+ulIVOvXGzEOXfiH1P1pFS5sFr6NDckoqdbWo0QmhIgdBPitNyuXtr+oDZRq
         I4TuuYf0AihBWINwUKIOBjiXw3pN0KOVEaRs6EYyCj56fQuuZHdMYitq2oDJn2usQ5Zu
         JIgEcoKp8jC1At9EkIFVPADINxUoEmyYuUrCndma1Pd0MGZKz65mHG+9NqZCe+MH0QtB
         6VVR5+Knuu20cxyJMHetUPUWqsRrkZFQEkO+zEN0qb69uioVY7oeLHhNUbz5eIX7h2Uf
         i6Gg==
X-Gm-Message-State: AOAM533xNVHtp13ktxV2+X3RVHupUvbIksXpKUP9Ib8/+sLusWQKcnAt
        CLhhIbA5vcHfhM+ptYJcux97AXjOLAY1UDXsLVTvGwSgNNL+GA==
X-Google-Smtp-Source: ABdhPJzT1k1lZiDlL3d0Ap5myAeUlGc7KrMPnjthZY9wgh3687XuORwpojUNz+jnABlxPb67bHUA4WbWNBu1W6tINIc=
X-Received: by 2002:a17:906:b0d7:: with SMTP id bk23mr14997929ejb.103.1604922387903;
 Mon, 09 Nov 2020 03:46:27 -0800 (PST)
MIME-Version: 1.0
References: <1600874218-10815-1-git-send-email-loic.poulain@linaro.org>
 <CAMZdPi9EvP-umfpmS-yTK+5Snx-qDcpfkkq_dtExKZjXG4atMg@mail.gmail.com> <20201109103554.GC24289@work>
In-Reply-To: <20201109103554.GC24289@work>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 9 Nov 2020 12:52:18 +0100
Message-ID: <CAMZdPi_0bjawznJV8-q3P+WDRiOL5sA6Xcfmdz7C7VmHh5jHVg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Add inbound buffers allocation flag
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Mon, 9 Nov 2020 at 11:36, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi Loic,
>
> On Tue, Sep 29, 2020 at 03:37:12PM +0200, Loic Poulain wrote:
> > On Wed, 23 Sep 2020 at 17:11, Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > > Currently, the MHI controller driver defines which channels should
> > > have their inbound buffers allocated and queued. But ideally, this is
> > > something that should be decided by the MHI device driver instead,
> > > which actually deals with that buffers.
> > >
> > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > if buffers have to be allocated and queued by the MHI stack.
> > >
> > > Keep auto_queue flag for now, but should be removed at some point.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > >
> >
> > Please, discard this one, since it will request ath11k and qrtr update as
> > well.
> > I'll send that in a new series.
> >
>
> Is this part of any series?

I need to rebase and submit a new one.

Regards,
Loic
