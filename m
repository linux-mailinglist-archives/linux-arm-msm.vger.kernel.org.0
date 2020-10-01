Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BBC28025F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 17:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbgJAPRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 11:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732342AbgJAPRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 11:17:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C15C0613D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 08:17:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w1so6065880edr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+CuSbWcGM2/Qd+9ER9Dz6b9GN8ltVla+ip6oPSoq7yA=;
        b=asQXqF6EWzCUzXqxbcDXbt9m4zzm/5boX5W4/LzPP5T4J4uRzRwdxLLZF7aIP/yGd2
         qnD7xHSuOVI3mb9vo2B8rB15ug0PX7qCe2rL5ruqcWJaBF70TH4dJgLINsnLwqRsL94I
         im/ruZ1vDoa0IdAY+BwQ4F8IMdQUCpXt8Jjd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+CuSbWcGM2/Qd+9ER9Dz6b9GN8ltVla+ip6oPSoq7yA=;
        b=tNz71xH8X6xz52awLUnkHAUBr4T9UC0c/UnbjtI9zu0K5bDwY+5j9lYoPHwidE7npN
         oQwwyquhpdTos27otmpmX83ZJ44oZCG/aorWBWmrjTd6ClJ4zPJTw2A2NADkd/gq0Hkv
         dUfzZJdpR5m9IkSLZlkTKa4AVscnOhgiP9nKLmhW/cZ7j3fX73DMwg4tAoxP6l+Lk4Jw
         hnb0DHX2Edx06ape5EHaLJc51E1dQSXD/upuD8lrByvD5WSu544fSh49nv+dUv+vnKir
         OGERAfWMrLW4a5l2y3KWdoaD6twsNxnihzEMVPvH8cdf76nfY3yPIY45B8g3GOnoKT4x
         SprA==
X-Gm-Message-State: AOAM532GPMiLfja6hduHs+jxcXmLX1rjkyKoA9aQ/6kggYUy/cUaFEp5
        DrdXkapWIUGIoPwkzBZHlVzkEWmeYFFVQw==
X-Google-Smtp-Source: ABdhPJwQU/S8NgbptBzJVn1UvZNLTrk9p0309Tr9nX/s8cUlqj7P58QPSso/cAhTYaMzh9PDoIu8uw==
X-Received: by 2002:aa7:c054:: with SMTP id k20mr8818270edo.224.1601565470983;
        Thu, 01 Oct 2020 08:17:50 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id g20sm681335ejz.88.2020.10.01.08.17.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 08:17:49 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id s12so6245936wrw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 08:17:49 -0700 (PDT)
X-Received: by 2002:a5d:6552:: with SMTP id z18mr9352555wrv.32.1601565468929;
 Thu, 01 Oct 2020 08:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com> <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
In-Reply-To: <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 1 Oct 2020 17:17:27 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
Message-ID: <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and G_SELECTION
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Tomasz,
>
> On 9/25/20 11:55 PM, Tomasz Figa wrote:
> > Hi Dikshita, Stanimir,
> >
> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
> > <dikshita@codeaurora.org> wrote:
> >>
> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>
> >> - return correct width and height for G_SELECTION
> >> - if requested rectangle wxh doesn't match with capture port wxh
> >>   adjust the rectangle to supported wxh.
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> >> ---
> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
> >>  1 file changed, 12 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> >> index 7d2aaa8..a2cc12d 100644
> >> --- a/drivers/media/platform/qcom/venus/venc.c
> >> +++ b/drivers/media/platform/qcom/venus/venc.c
> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >>         switch (s->target) {
> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
> >> -               s->r.width = inst->width;
> >> -               s->r.height = inst->height;
> >> -               break;
> >> -       case V4L2_SEL_TGT_CROP:
> >>                 s->r.width = inst->out_width;
> >>                 s->r.height = inst->out_height;
> >>                 break;
> >> +       case V4L2_SEL_TGT_CROP:
> >> +               s->r.width = inst->width;
> >> +               s->r.height = inst->height;
> >> +               break;
> >>         default:
> >>                 return -EINVAL;
> >>         }inter
> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >>
> >>         switch (s->target) {
> >>         case V4L2_SEL_TGT_CROP:
> >> -               if (s->r.width != inst->out_width ||
> >> -                   s->r.height != inst->out_height ||
> >> -                   s->r.top != 0 || s->r.left != 0)
> >> -                       return -EINVAL;
> >> +               if (s->r.width != inst->width ||
> >> +                   s->r.height != inst->height ||
> >> +                   s->r.top != 0 || s->r.left != 0) {
> >> +                       s->r.top = 0;
> >> +                       s->r.left = 0;
> >> +                       s->r.width = inst->width;
> >> +                       s->r.height = inst->height;
> >
> > What's the point of exposing the selection API if no selection can
> > actually be done?
>
> If someone can guarantee that dropping of s_selection will not break
> userspace applications I'm fine with removing it.

Indeed the specification could be made more clear about this. The
visible rectangle configuration is described as optional, so I'd
consider the capability to be optional as well.

Of course it doesn't change the fact that something that is optional
in the API may be mandatory for some specific integrations, like
Chrome OS or Android.

>
> I implemented g/s_selection with the idea to add crop functionality
> later because with current firmware interface it needs more work.

I suggested one thing internally, but not sure if it was understood correctly:

Most of the encoders only support partial cropping, with the rectangle
limited to top = 0 and left = 0, in other words, only setting the
visible width and height. This can be easily implemented on most of
the hardware, even those that don't have dedicated cropping
capability, by configuring the hardware as follows:

stride = CAPTURE format width (or bytesperline)
width = CROP width
height = CROP height

I believe Android requires the hardware to support stride and AFAIK
this hardware is also commonly used on Android, so perhaps it's
possible to achieve the above without any firmware changes?

Best regards,
Tomasz
