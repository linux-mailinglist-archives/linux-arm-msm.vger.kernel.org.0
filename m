Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA893BF5CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 08:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhGHGyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 02:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhGHGyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 02:54:22 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7282C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 23:51:39 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l17-20020a9d6a910000b029048a51f0bc3cso4853917otq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 23:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HVD5y86eZda4zsbe0B5h51p+U8LmjsDcgy/cp1cHfiw=;
        b=maO7t2jNZuoibZMBU8a+fE5saykw+uyETAlE6DBaxuGJWyKbRsLkQniBtfYnTMUpU7
         soWO4Hzh+XJ2IxeklQU4q2ciYvv2J+reQ+i4U94xFKK5M5BgmU22TTB4jfHqOL8BWHNC
         FX7Pur7coMrSF3RK2+8c0bOxNdQnwCX7QaN6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HVD5y86eZda4zsbe0B5h51p+U8LmjsDcgy/cp1cHfiw=;
        b=ClmCdnPg8b6CZ70vQg4JpaXVkRiw8+wKi8Qwow5FzpajPOfTiC3DIIhTQ9W/LLeoAn
         SL1HpPYY5BQbGLBzrCoqyGxjL7YYtuNIBvY6RJnIeq9A1hczSYlL9IJFIOC+j6dDbmgy
         Qjfn5k8VxKDWP9QGqbcGInB0nfdoVzNJAn1yKIB05jKZ33JIdqBMQ54gr7x+GLRR2Qk/
         ysSPeKMg5pH+xuQYlM7lyka9hy7WpQ8dpjqnSxSvXZ9H/8JvPOiDd5n9BzBl/k59HOyi
         P/HiMMuDgpBzwpBc34rE6Ud5fOSmPly0utUsx05lIaVMWgzu9AkOjNKYRKsL5He4YiL8
         PAYw==
X-Gm-Message-State: AOAM532sqPkTaotve/w2cCnJpTUmXjw35QZCH8nmaSB6D76xOZy8PEZ1
        k1hKBVX8iRNF5NNdN+0Drdi3vd96kVSGLL9+SOAt28nSgHk=
X-Google-Smtp-Source: ABdhPJzjxc7AbuyTBSxQVRlFe8tgvyY2EhHa2gKQ9gHMn+8kCgwJU6QlGzVsTvjV1C0NxrHMTo3r6RYo4HUQnRkpuX0=
X-Received: by 2002:a05:6830:1353:: with SMTP id r19mr22942548otq.233.1625727099195;
 Wed, 07 Jul 2021 23:51:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 06:51:38 +0000
MIME-Version: 1.0
In-Reply-To: <8da6e99f-ae80-b9a5-4fe9-6cc467ea65d0@codeaurora.org>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
 <20210703005416.2668319-2-bjorn.andersson@linaro.org> <CAE-0n50EvG4qV0n+Ag+dvFxKKasnUzwH=MA+f-jsgDdBqaqziQ@mail.gmail.com>
 <YOaAqAqldq3Hyiva@yoga> <8da6e99f-ae80-b9a5-4fe9-6cc467ea65d0@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 06:51:38 +0000
Message-ID: <CAE-0n50NciURowskkFg2-1emtotdprL_Ns8C_mAFVSAKQ-Dx7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-07-07 22:03:53)
>
>
> On 7/8/2021 10:05 AM, Bjorn Andersson wrote:
> > On Wed 07 Jul 19:21 CDT 2021, Stephen Boyd wrote:
> >
> >> Quoting Bjorn Andersson (2021-07-02 17:54:15)
> >>> rpmhpd_aggregate_corner() takes a corner as parameter, but in
> >>> rpmhpd_power_off() the code requests the level of the first corner
> >>> instead.
> >>>
> >>> In all (known) current cases the first corner has level 0, so this
> >>> change should be a nop, but in case that there's a power domain with a
> >>> non-zero lowest level this makes sure that rpmhpd_power_off() actually
> >>> requests the lowest level - which is the closest to "power off" we can
> >>> get.
> >>>
> >>> While touching the code, also skip the unnecessary zero-initialization
> >>> of "ret".
> >>>
> >>> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> ---
> >>
> >> I think this is why qcom folks talk about "virtual corner" and "physical
> >> corner" because there's the one in command DB and the one in hardware.
> >
> > I think the driver uses "level" and "corner" to denote the two different
> > number spaces, so I think we're good...now that we after this patch
> > don't pass a "level" as "corner" during power_off ;)

Alright then nothing to do. Yay?

> >
> >> Maybe we should change rpmhpd_aggregate_corner() to call the argument
> >> 'vcorner'?
> >
> > So "virtual corner" is "corner" and "physical corner" is level? I.e. 256
> > is a "physical corner"?
>
> I haven't heard of anything called a 'physical corner'. These were always
> referred to as virtual corners, on older platforms it was just one contiguous
> number space, on newer ones we added another higher level sparse number space
> just for more fun :)
> Command DB refers to these as hlvl and vlvl, I haven;t yet figured out what their
> full forms are :/

Ah maybe I'm mixing up CPR terms with this stuff. I suspect hlvl is
"hardware level" and vlvl is "virtual level", but probably should have
been "software level".

As far as I remember, the command DB layer was stacked on top so that
they could insert more levels in between two levels in the hardware
number space and not have to change all the rpmh clients out there (of
which there could be many considering all the independent operating
systems running on the SoC). For example, [0, 128, 256] maps to [0, 1,
2] and then they realize they need to jam another level between 1 and 2
so they remap 256 to 3 so everyone keeps considering 256 as the previous
vlvl to clear the way for 2 to be reused as 198 or something like that.

I don't think this ever really changes after the device ships, but it
lets them decouple rpmh firmware updates from the rest of the system. As
long as they're kept as far apart in vlvl space as there are numbers in
hlvl space they can easily do this remap trick and hardware can treat it
as levels that bounce around physical voltages that are monotonically
increasing.
