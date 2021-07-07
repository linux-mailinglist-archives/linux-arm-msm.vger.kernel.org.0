Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEA03BEBB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 17:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhGGP7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 11:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhGGP7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 11:59:22 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C047EC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 08:56:40 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so2691968otl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WClwSt7qahvqLc8S6VDs1WktQFeBcnd4I5Z/KAvSJ6Q=;
        b=GyPnJFzj+FIqG12dqeMSz1D9H82hgXeeY6o8amJ/3QfGWrTW4vSslOfhmU4s265og4
         4a/phVm7uLymyPOgZEKrAo2pPTxZY6KiABRTT2K2Oe5eBRkr13AjCK0pJbiCNf1mxUf8
         K11PfK+ll5Wy5zOuGyUA2tNVUdswfBDDzCPMVy7clx4q4/HT71MYtctP1wx116Lr/mbS
         1RLYuxFd7FEDvT1nfoSi6tSYf/KSTz/skS0EUZtfgnXMIva00UiLerPqpuCV+IuHeDyU
         +OzLVycLqe0kBai9Lyf3DoVqTJ/eNbhNzlenLDXJWml9pZb6MlCatuNQ63CG2liw/PLe
         RhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WClwSt7qahvqLc8S6VDs1WktQFeBcnd4I5Z/KAvSJ6Q=;
        b=Cki4AnexvLD2xTkxRrc//cOlvuvriNWfpX2FrOU7CCp4jg/1RaII4ueblt+lDtr2ro
         yFKzRJ5HcVnBbGvgNZffrOmLiKd0jjCRZv4VvMyReJowjlCj7YA30qxkOnti5y6EsM0/
         3le40apJnLK0G7ScQXzwS8HMNZAqsl6vehms9oNcPbT2WWMHLzOhUhZDE2HsZ9IKvW4X
         xKyTof5mu9is1Kd3KzvCq3NEV3RQ35MiCSDmQ1O+f7HrLYh1a3W6c38Qx3vpXOMFjSGf
         vQh+rNuhPL4fHU5FjGtHP9R/FYsV7f3zOjeT8Lw0VRQE5JjQW++i8gEpRvHJITq13BnZ
         C9Xw==
X-Gm-Message-State: AOAM532qZrocTR/AJX0TpTwpMbJMfaw24JyfWE6PNvlSQ5tg7HjJtYi6
        aITZxbP14l+dTb7j6RPA7jwTJQ==
X-Google-Smtp-Source: ABdhPJw0G2ZxbJQpJmRGIvwWpv4+5espexq+AeG21C4eJk5hnEYITZ0VBJFViyGAMDy2IV7iwV+cwQ==
X-Received: by 2002:a9d:6c07:: with SMTP id f7mr14025619otq.50.1625673400158;
        Wed, 07 Jul 2021 08:56:40 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o20sm3504649ook.40.2021.07.07.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:56:39 -0700 (PDT)
Date:   Wed, 7 Jul 2021 10:56:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>,
        Mathieu <mathieu.poirier@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V7 0/4] Signaling api support in glink/rpmsg clients
Message-ID: <YOXOtRSpKO5WdlHZ@yoga>
References: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
 <CAF2Aj3gAqjVbcMayR7yYBb6UxY5ekC9gdhpmNdz1-zLwo10yLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF2Aj3gAqjVbcMayR7yYBb6UxY5ekC9gdhpmNdz1-zLwo10yLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 10:27 CDT 2021, Lee Jones wrote:

> On Wed, 2 Sept 2020 at 17:25, Deepak Kumar Singh <deesin@codeaurora.org>
> wrote:
> 
> > Change from version 6
> > In last series(v6) i had put wrong version(v5) for cover note.
> > Which led to confusion for patch set series.
> >
> > In this series i have updated the label for cover letter(v7).
> > There is no change in patches. Only cover note label is updated.
> >
> > Change from version 5
> > [V6,4/4] rpmsg: char: Add signal callback and POLLPRI support
> > Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
> > warning.
> >
> > Change from version 4
> > I am taking over these patches from aneela@codeaurora.org
> > Fixed all the trivial review comments.
> >
> > Signal conversion to and from native signal as done in patch V4,2/4
> > is intentional.
> >
> > Arun Kumar Neelakantam (3):
> >   rpmsg: glink: Add support to handle signals command
> >   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> >   rpmsg: char: Add signal callback and POLLPRI support
> >
> > Deepak Kumar Singh (1):
> >   rpmsg: core: Add signal API support
> >
> >  drivers/rpmsg/qcom_glink_native.c | 125
> > ++++++++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
> >  drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h    |   5 ++
> >  include/linux/rpmsg.h             |  27 ++++++++
> >  5 files changed, 270 insertions(+), 3 deletions(-)
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
> >
> Any idea why this died at v7?
> 

I had some concerns about the actual users of this and wanted the API to
be more generic. Deepak brought this up again recently and I think we
have a common understanding of how v8 should look like.

Regards,
Bjorn
