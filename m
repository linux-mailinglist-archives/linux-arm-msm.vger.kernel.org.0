Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36212192CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 16:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgCYPkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 11:40:21 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46882 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgCYPkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 11:40:20 -0400
Received: by mail-ed1-f68.google.com with SMTP id cf14so2875079edb.13;
        Wed, 25 Mar 2020 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVQBr/UYJMdab8jRg2zR24QImGiBviKI+Lqx/RV8Icg=;
        b=iM7fQags/yNx8RR2ehfaaLuUBoI2eC3ngDb/4LT7lEsOSVAPorZvL9vvcfzaiS579r
         pgFp1e+/ArquN9GvkHX9wxU90+sCMiWWybFbWUe00yHiHTdHFsutf3sq5PHLUx0JEJWK
         ck4Q8LpTpZQ3xd2pJEdZYJ/scZaUMf0DXBjEpWdWahv71/3HKMfYwqyZE9x1CylE0FtA
         lYiAm5qYpDgvG+qJMuPHYWCmkNOZJTw3UpvcMiNXXj3LZwXsTF+Kbf9uaZhGHfi6cbNX
         P9kq1JZiizjkbHXEhwwS0MQPu0HMt7xJ4FiUjJ9oPLUEPDLaCtnfOmZAgg1olxUPPlug
         ieXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVQBr/UYJMdab8jRg2zR24QImGiBviKI+Lqx/RV8Icg=;
        b=XyGgMVFy3IxJi8KSCkRe+fm5iv/vf/Sjqgh39fM93cDdq+arGRZUpsXkdIulaWeDF4
         8ghkrlNvrgkRB0/C8eHfVKygf+yhL3fIkbcKPRF5ELspSJAlXWGwudaALq45Hs9nomNV
         2Wz6MPtkwajW9mZ8Nufji6Z/GyJ8zy4QOEuDuumCfkepvNWI51KYaD0/r0ifXrr0qah2
         I9mmKDjZ0/02TfoQhqHaWMqE+IHJsNTLJJheSM4BID4EcFoa3X9gDEZ4VTAn3BBXhmdT
         lZJ/z/WFvn+mPY5zfAC1Yihc/HKxTfgVMERvLMENuRQ6dFopsXuivEoHfcleYw93QB7w
         fnMw==
X-Gm-Message-State: ANhLgQ3zcoGpnn7rxqburlF3Tl0rHPAJlhfTO9HezwSjV9fzlom1Gl9W
        wRbZ3Mj9EH/SS37SQ7vtx2gQfgP0AfqcxjUBznw=
X-Google-Smtp-Source: ADFU+vvti2A9QZho9Id7sZ6hCv38ZZx7DwFDLQbnZuOsJZY6bJU+aLt9MOUecd3kZZiKiatZ3p4eVZ3oEbpz1o8iDmo=
X-Received: by 2002:a50:d712:: with SMTP id t18mr3467606edi.151.1585150817053;
 Wed, 25 Mar 2020 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org> <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
In-Reply-To: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 25 Mar 2020 08:40:14 -0700
Message-ID: <CAF6AEGs5saoU3FeO++S+YD=Js499HB2CjK8neYCXAZmCjgy2nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Doug Anderson <dianders@chromium.org>
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 24, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > "The PM core always increments the runtime usage counter
> > before calling the ->suspend() callback and decrements it
> > after calling the ->resume() callback"
> >
> > DPU and DSI are managed as runtime devices. When
> > suspend is triggered, PM core adds a refcount on all the
> > devices and calls device suspend, since usage count is
> > already incremented, runtime suspend was not getting called
> > and it kept the clocks on which resulted in target not
> > entering into XO shutdown.
> >
> > Add changes to manage runtime devices during pm sleep.
> >
> > Changes in v1:
> >  - Remove unnecessary checks in the function
> >      _dpu_kms_disable_dpu (Rob Clark).
>
> I'm wondering what happened with my feedback on v1, AKA:
>
> https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com
>
> Maybe you didn't see it?  ...or if you or Rob think I'm way off base
> (always possible) then please tell me so.
>

At least w/ the current patch, disable_dpu should not be called for
screen-off (although I'd hope if all the screens are off the device
would suspend).  But I won't claim to be a pm expert.. so not really
sure if this is the best approach or not.  I don't think our
arrangement of sub-devices under a parent is completely abnormal, so
it does feel like there should be a simpler solution..

BR,
-R
