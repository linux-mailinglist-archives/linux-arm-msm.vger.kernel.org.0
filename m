Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972D13D40DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 21:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhGWSwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 14:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbhGWSwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 14:52:04 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B645FC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 12:32:37 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso622943oot.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mtGZny5V99QqcAJ0uDVoe7oWhFPrK6XoIBWq1ikwK88=;
        b=CiNaxtOhxlf1vNJp/6JRh43u3y0AEOSudKiO6bPcBdKF4e4h4etWWNpiSVS5bPZkCL
         BxojTWKTAT+mGx7UmD0ih8w+XZZh9YSLXeO1QZiq6RUUWuvxCGjrJapk/9cJXeYYfis8
         TRcdA2v8YmPqBQyCKJuoV4C6hT21A0oceBnYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mtGZny5V99QqcAJ0uDVoe7oWhFPrK6XoIBWq1ikwK88=;
        b=DBoNXgqF7sewntQgW1SPEQvAHe1EKD2VWZcYICFC960fgRxpQ6HGB/kkRSCZRzh2xG
         xkrAqLUwweY2kRe0MGDS+BZe9uz4NB4OCXPA0Dl8y2ypfRPYkoejvnndKGdvLKU3To00
         VBkOWqfsmhwrlK5Cx+KwM7sIQJN4NNDcoJgAcXtcQ+liyLM6vcEpyoTUUUi51nGiu4Xl
         +VD0npKOScvf0xV4W3Fl6xXjjMcFCukwaEYsK3WrDEwwXS3QjgbVBrFEYSTkKYP+6zvm
         6z0Oqo+e9f5G4uTOFHTdrVbqW8cYIDcy6ZcNyUjA6gz7RLDNkoJppzl5i6f5VcLctVTa
         +doQ==
X-Gm-Message-State: AOAM531hS1bz/SoM1rfkpcSm87plztc/3gK5oeVSjpfUVMsnMJszVrOQ
        K8gCp5zCnmmZzUsYPlzjHMAsWTSZjXR8QVlgGFn9zQ==
X-Google-Smtp-Source: ABdhPJyKSmqlzGSzBOmwPDga9vmrov0I1vRpWPpo2l4wCn0t3AWAT6mqthEr/q5laKSa+3xe7ufS0pi7ewTIQREyILo=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr3693067oot.16.1627068757078;
 Fri, 23 Jul 2021 12:32:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 19:32:36 +0000
MIME-Version: 1.0
In-Reply-To: <3989990264ac3e110c5385ea09ac7b2e@codeaurora.org>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com>
 <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org> <CAE-0n522OEz8YwKRb8VZtSbwAdjXReEPCwvL8N7kWycGSrbvxw@mail.gmail.com>
 <3989990264ac3e110c5385ea09ac7b2e@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 19:32:36 +0000
Message-ID: <CAE-0n52g00+zcTskhr8x6jEASeO0agGpjU6DFD-88wSJNwVYpg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: add logs across DP driver for ease of debugging
To:     maitreye@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, seanpaul@chromium.org,
        dri-devel@lists.freedesktop.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye@codeaurora.org (2021-07-22 20:53:37)
> On 2021-07-22 15:09, Stephen Boyd wrote:
> Thank you for the comments .
> > Quoting maitreye@codeaurora.org (2021-07-22 14:33:43)
> >> Thank you Stephen.
> >>
> >> On 2021-07-22 13:31, Stephen Boyd wrote:
> >> > Quoting maitreye (2021-07-21 16:19:40)
> >> >> From: Maitreyee Rao <maitreye@codeaurora.org>
> >> >>
> >> >> Add trace points across the MSM DP driver to help debug
> >> >> interop issues.
> >> >>
> >> >> Changes in v4:
> >> >>  - Changed goto statement and used if else-if
> >> >
> >> > I think drm likes to see all the changelog here to see patch evolution.
> >> >
> >> Yes, I will fix this
> >> >>
> >> >> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> >> >> ---
> >> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> >> >> b/drivers/gpu/drm/msm/dp/dp_link.c
> >> >> index be986da..8c98ab7 100644
> >> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> >> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link
> >> >> *dp_link)
> >> >>
> >> >>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >> >>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> >> >> -               return ret;
> >> >>         }
> >> >> -
> >> >> -       ret = dp_link_process_ds_port_status_change(link);
> >> >> -       if (!ret) {
> >> >> +       else if (!(ret = dp_link_process_ds_port_status_change(link)))
> >> >> {
> >> >>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> >> >> -               return ret;
> >> >>         }
> >> >> -
> >> >> -       ret = dp_link_process_link_training_request(link);
> >> >> -       if (!ret) {
> >> >> +       else if (!(ret = dp_link_process_link_training_request(link)))
> >> >> {
> >> >>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> >> >> -               return ret;
> >> >>         }
> >> >> -
> >> >> -       ret = dp_link_process_phy_test_pattern_request(link);
> >> >> -       if (!ret) {
> >> >> +       else if (!(ret =
> >> >> dp_link_process_phy_test_pattern_request(link))) {
> >> >>                 dp_link->sink_request |=
> >> >> DP_TEST_LINK_PHY_TEST_PATTERN;
> >> >> -               return ret;
> >> >> -       }
> >> >> -
> >> >> -       ret = dp_link_process_link_status_update(link);
> >> >> -       if (!ret) {
> >> >> +       }
> >> >> +       else if (!(ret = dp_link_process_link_status_update(link))) {
> >> >
> >> > The kernel coding style is to leave the brackets on the same line
> >> >
> >> >       if (condition) {
> >> >
> >> >       } else if (conditon) {
> >> >
> >> >       }
> >> >
> >> > See Documentation/process/coding-style.rst
> >> >
> >> Yes, I will fix this
> >>
> >> > Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
> >> > apply this patch before?
> >> >
> >> > ----8<----
> >> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> >> > b/drivers/gpu/drm/msm/dp/dp_link.c
> >> > index 1195044a7a3b..408cddd90f0f 100644
> >> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> > @@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link
> >> > *dp_link)
> >> >
> >> >       if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >> >               dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> >> > -             return ret;
> >> > -     }
> >> > -
> >> > -     ret = dp_link_process_ds_port_status_change(link);
> >> > -     if (!ret) {
> >> > +     } else if (!dp_link_process_ds_port_status_change(link)) {
> >> >               dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> >> > -             return ret;
> >> > -     }
> >> > -
> >> > -     ret = dp_link_process_link_training_request(link);
> >> > -     if (!ret) {
> >> > +     } else if (!dp_link_process_link_training_request(link)) {
> >> >               dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> >> > -             return ret;
> >> > -     }
> >> > -
> >> > -     ret = dp_link_process_phy_test_pattern_request(link);
> >> > -     if (!ret) {
> >> > +     } else if (!dp_link_process_phy_test_pattern_request(link)) {
> >> >               dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> >> > -             return ret;
> >> > -     }
> >> > -
> >> > -     ret = dp_link_process_link_status_update(link);
> >> > -     if (!ret) {
> >> > +     } else if (!dp_link_process_link_status_update(link)) {
> >> >               dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> >> > -             return ret;
> >> > -     }
> >> > -
> >> > -     if (dp_link_is_video_pattern_requested(link)) {
> >> > -             ret = 0;
> >> > -             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> >> > -     }
> >> > +     } else {
> >> > +             if (dp_link_is_video_pattern_requested(link))
> >> > +                     dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> >> >
> >> > -     if (dp_link_is_audio_pattern_requested(link)) {
> >> > -             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> >> > -             return -EINVAL;
> >> > +             if (dp_link_is_audio_pattern_requested(link)) {
> >> > +                     dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> >> > +                     ret = -EINVAL;
> >> > +             }
> >> >       }
> >> >
> >> >       return ret;
> >> The reason I did this was to preserve the value of ret as the caller
> >> of
> >> the function checks it. Some functions return -EINVAl like in here:
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dp/dp_link.c#L972
> >> , so to check that it would be necessary to get the ret value.
> >
> > ret is overwritten multiple times. The logic seems to be if ret is
> > not-zero, reassign it, until we get to the end. How about this
> >
> > ----8<----
> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> > b/drivers/gpu/drm/msm/dp/dp_link.c
> > index 1195044a7a3b..e59138566c0a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > @@ -1027,41 +1027,27 @@ int dp_link_process_request(struct dp_link
> > *dp_link)
> >
> >       if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >               dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_ds_port_status_change(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_ds_port_status_change(link)) {
> >               dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_training_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_link_training_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_phy_test_pattern_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_phy_test_pattern_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_status_update(link);
> > -     if (!ret) {
> > -             dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> > -             return ret;
> > -     }
> > -
> > -     if (dp_link_is_video_pattern_requested(link)) {
> > -             ret = 0;
> > -             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> > -     }
> > -
> > -     if (dp_link_is_audio_pattern_requested(link)) {
> > -             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > -             return -EINVAL;
> > +     } else {
> > +             ret = dp_link_process_link_status_update(link);
> > +             if (!ret) {
> > +                     dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> > +             } else {
> > +                     if (dp_link_is_video_pattern_requested(link)) {
> > +                             ret = 0;
> > +                             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> > +                     }
> > +
> > +                     if (dp_link_is_audio_pattern_requested(link)) {
> > +                             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > +                             ret = -EINVAL;
> > +                     }
> > +             }
> >       }
> >
> >       return ret;
> I do agree, this will solve the issue for over writing ret variable. But
> I can see two potential problems with this, if we get two events at the
> same time or one of the other we might end up processing the two events,
> which won't be the expected behavior.

The code isn't written to handle this. Does it need to handle it? If so,
please update it for that new feature in a different patch than this one
that adds logging.

>For example, if we get
> dp_link_process_link_status_update and it gives a non zero result and we
> go to the else statement, and get the event for video pattern request,
> we will  end up processing two events.


> The second problem, is currently
> we only have APIs that return 0 or EINVAL as return values, but if we
> ever in future add an API with a different return value it wont be easy
> to add the behavior.

Agreed. Fortunately it's just code and it can easily be rewritten in the
future when it changes.

> But if these issues seem like they can be ignored ,
> then we can go ahead with your suggestions.

I think they can be ignored if we're not supposed to handle two events
at the same time.
