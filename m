Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065E225B1E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIBQlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIBQlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:41:03 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E392EC061246
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 09:41:02 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t16so150625ilf.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=be0fkBg5ElLxu/a+Oag6Gn7VN7vYuyP2CSyc9Hs838g=;
        b=VL3BZ24mU/87UGXDz9kWzW56TwM9CS+CdCdgliDLR+ral0B9rJWnX/W4uFdQsKt4or
         WXvG3BpWVxCctnmZsbfN0hFBVdnT2AO7Gh3etXKcrRz/TgMiJ/ZHC5f+Xr8RbDcO56mH
         Yr/icsuHXhzLlGcJDLKcDdo4TbyHgl7OQW/nlHRUClEbrYXDKvQQUYakVpsqEQqDQaje
         rwYVfrdLmyySB7yhYbrV6N2L3hVaj+sp3LHsDxkvMa9tKfv8Ex5HHCBoe1oSQL5b6VAA
         7OZLz/LrwZByNecckP+KsgcOdVLDLves9GOGDd7psz0/mvzNSr6+XFp0d5Ju4WtrxFhv
         q9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=be0fkBg5ElLxu/a+Oag6Gn7VN7vYuyP2CSyc9Hs838g=;
        b=q+GXUiUehrSAJQNELJimETtM1QutgRI9h5FeTCa4Z9sjFEMTKrsOL2YP2uv0ril9aM
         2zVJBmK0CTDzpV9MTbZP7CND2Kat7CHQU3PQR2+T2HuLexJ4C1Olh9upHytwpO/P2eux
         qkubtgEqJfDxJfB/UyX/cRFNCWJ4EA85bvyDqTTADUr8pvliIetKJZ90WwRLz6bjDZBO
         v7d6iVhTZpj5wIKS7OcEQGF/lctfUbCXvvs/3s6laaW9mYKZ7eMG+qvGfmNsKNawWu1V
         N/ClXT8v3YGLoobWwOxTx9rACysav8jFk1m6kX/rfhaSy9Y7VYRZVH4vbYD6125kXl9j
         5vbA==
X-Gm-Message-State: AOAM530hvasEBU8vnbeGbeiIItj1YVWTvHqp9G6yPJEF2jmHa988Kc5r
        +6dApt/3Fc8N2Fw8JoQCtFdYsSzLIW/0Ej4PaMlLEg==
X-Google-Smtp-Source: ABdhPJzZnBL0AuXm1caoH9heuNdH36VGsXc2BZS4cFJzfnTGuYHfq3Ycau4E0vHRm8S5ZWn1z0+9wSnkeA8w9ss1SiA=
X-Received: by 2002:a92:1597:: with SMTP id 23mr4191081ilv.58.1599064861900;
 Wed, 02 Sep 2020 09:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <1593182819-30747-1-git-send-email-deesin@codeaurora.org>
 <20200706180437.GB614737@xps15> <5ce032b8-6b26-d0a7-f92d-f8487d810f0c@codeaurora.org>
In-Reply-To: <5ce032b8-6b26-d0a7-f92d-f8487d810f0c@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 2 Sep 2020 10:40:51 -0600
Message-ID: <CANLsYkxMrKdC8BAeskpM=Wqd=SDXc4GK1J=ATf_EUnGpoAdjTw@mail.gmail.com>
Subject: Re: [PATCH V5 0/4] Signaling api support in glink/rpmsg clients
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chris Lew <clew@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Sep 2020 at 10:30, Deepak Kumar Singh <deesin@codeaurora.org> wrote:
>
>
> On 7/6/2020 11:34 PM, Mathieu Poirier wrote:
> > Hi Deepak,
> >
> > On Fri, Jun 26, 2020 at 08:16:55PM +0530, Deepak Kumar Singh wrote:
> >> Change from version 5
> >> [V5,4/4] rpmsg: char: Add signal callback and POLLPRI support
> >> Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
> >> warning.
> >>
> >> Change from version 4
> >> I am taking over these patches from aneela@codeaurora.org
> >> Fixed all the trivial review comments.
> >>
> >> Signal conversion to and from native signal as done in patch V4,2/4
> >> is intentional.
> >>
> >> Arun Kumar Neelakantam (3):
> >>    rpmsg: glink: Add support to handle signals command
> >>    rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> >>    rpmsg: char: Add signal callback and POLLPRI support
> >>
> >> Deepak Kumar Singh (1):
> >>    rpmsg: core: Add signal API support
> > I'm confused here - V5 (or what I think it is) was sent out on June 24th without
> > a cover letter.  This set has a cover letter but it is labeled V5.  So is this
> > the cover letter that should have been sent out on the 24th and the content
> > herein relevent to that set?  Or is it accurate and the label on the cover
> > letter of this set is wrong and should have been V6?
> >
> > I have little confidence in both sets and as such won't be reviewing them.
> > Please send a new revision that is properly labeled.
> >
> > Thanks,
> > Mathieu
> >
> Mistakenly i forgot to update label for cover letter to V6.
>
> I have uploaded patch set V7 with updated cover letter.

Thank you for doing that - I have added your set to my list of patches
to review.  Note that I have a fair amount of patches to go over
lately and as such getting to yours will take some time.

Regards,
Mathieu

>
> There is no change in patches.
>
> >>   drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
> >>   drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
> >>   drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
> >>   drivers/rpmsg/rpmsg_internal.h    |   5 ++
> >>   include/linux/rpmsg.h             |  27 ++++++++
> >>   5 files changed, 270 insertions(+), 3 deletions(-)
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>
