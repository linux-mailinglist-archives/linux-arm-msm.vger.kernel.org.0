Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B08405A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 17:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbhIIPWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbhIIPWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 11:22:16 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B339FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 08:21:06 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q11so3093619wrr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvwve1JVv7qCtcua8E5GzDzzsYSmvS/kJBQKySmuWws=;
        b=NppwK7rUCgUe0chvs65SWbif95sBaqTzuKm3NJR4VG+y8fY2LrGNPEo2y49NP8WThD
         CeojhHJaiYraWKKswlUe03y65jSZEHcAQNSDM6RjaesHs0372O5jY/gZlkbuiIkK0fL+
         RyKuJ0X6YGfuOgsUJoPFIIhFHxAsL9sKRaKsMyIqI1rPqwQQbfcXcWdQyryC24VLBhEl
         KJXB5+F17qCWEqj8R4KeqXOQ1mxoXfPJHjRxAcjQlsTjrQtsPuipkVGdOhxYXQ3uRUQX
         2pi0OmeS7s+9AkEaH2/N0Fofq6bPldWph2yBE9Z8jnQBGWHPQkynwfi4Z4btMbdfhqxv
         1ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvwve1JVv7qCtcua8E5GzDzzsYSmvS/kJBQKySmuWws=;
        b=lKetRRRZfdjNShxU0mJCriR60lKCTgLFhxLaEfMWXs2lsutO2YAueNZ4lM0Ry6t0vy
         PVqnPrglCa3ugSO0b3Sd2gsNaLinbA3+ONod+aFnp2djdJ7cXdnEX37qS7AaLTwD+uUz
         g7KICoJ+Ge4+foCw5pdV82+Oh5VSwGNc5yyqISqTD553J0w80NdeWzkqZqMPfJy5WGrv
         KglwgBX4wBzaccUX0QG945aEHjSQti23NtY0qNXm8NpGZ4ujRlPm1y22UXICpmCvzty5
         Wwsh2kWKW3Y4xwGv5tn521kyVnTIHgRtOVWCIINYRkCgZ8U+7Xj7SoaOX6C11wTmKY2x
         RC2w==
X-Gm-Message-State: AOAM531biPgWBbnAY6ev4/gB/Hpo0q1Dq8mnBN8S3V9MAoiB8y1NRsXg
        1NE5Y7y1GCFiFqvS7SvJ18jm1oKV+B3RhC2An5M=
X-Google-Smtp-Source: ABdhPJztlwrv7ry+m1wiT/dRKecbPi6idR0Qddi85pJxJlf9bK8wOtbZGXS8VjHlLFucQa4yKPBfzIO2KHchZcutc24=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr4251841wrn.251.1631200865258;
 Thu, 09 Sep 2021 08:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210830162232.1328594-1-robdclark@gmail.com> <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
 <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YTmb/3jxCUwXOp9K@platvala-desk.ger.corp.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Sep 2021 08:25:32 -0700
Message-ID: <CAF6AEGv5gJrs8PX6tKg8uMxMmCTvVgTqSvqA0dWrFdm2nCwVRg@mail.gmail.com>
Subject: Re: [PATCH igt v3 0/3] Initial igt tests for drm/msm ioctls
To:     Petri Latvala <petri.latvala@intel.com>
Cc:     igt-dev@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 8, 2021 at 10:27 PM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Sep 08, 2021 at 11:02:42AM -0700, Rob Clark wrote:
> > On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> > > plenty more we can add, but need to start somewhere.
> > >
> > > Rob Clark (3):
> > >   drmtest: Add DRIVER_MSM support
> > >   msm: Add helper library
> > >   msm: Add submit ioctl tests
> >
> > If there are no more comments on this series, could somebody push it?
>
> Ah, I was expecting you to do it yourself. Merged now.
>

Thanks.. and actually now that I've checked, I realized I had
developer access to push.  Sorry, I didn't realize that before

BR,
-R
