Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00052875ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 16:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730508AbgJHOWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 10:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730491AbgJHOWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 10:22:14 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44288C061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2020 07:22:12 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dg9so3676064edb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=35UfDI+Bzrgv8X0r0fXb2LPGQ+M8xEfVinYZbb+UCGY=;
        b=lk59TJxawTAJWohsWv9sDk9lMJTrdQxDw9eQUGT1lLy88vUm3vOTGnkFCk+0scfPBE
         7PZDVoe9nebCsB/ClSZOkjmfcpr1K+IznZu8K5UOYUCbSXWL3xYnjKfJIW83s58L0b8w
         DfZUga/jEI/obDt/ULhm6x0eWCUQt4Z/FCXd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35UfDI+Bzrgv8X0r0fXb2LPGQ+M8xEfVinYZbb+UCGY=;
        b=pNbACzNSnRV//9Nq+szQedklyFhegWBRaA5e3qbRPA+K/p4wVT9MUFUsMaF4kHGDUO
         AK8h1Yqb+JOznPyagS0nJZQmpoWgJVQ+pnh3thT9pN51ErqIKWxjOfnpiwu5O1mwH3G8
         EAr/bySu2JD2Tr6B8vN4Fgrwa6eUoSMnd/4EfTSFQEqH1QERrKquTvNYkwQIcNnFr2Id
         wRn3d6uHFk9ruNxXEv0l8DYZ0iFm8kQt+S40q+WYQBQ4fQ8qfuRSIm/5yGR+we+GvaRU
         sXYJC66xtsIocQkvaDVL1CRI4a/KRKHZwEUkTKDluavxu6g93sDQSBzT9pfp908atFue
         Qj+g==
X-Gm-Message-State: AOAM5317vqWQxg/wttFVFyAPUjMkEHPliU8JVfG5Ajtwas5fXRXHB5mv
        HgYIgdebhTTWBBXkfHdGAlX/JGoW1QFkxQ==
X-Google-Smtp-Source: ABdhPJx55yAChOFnsbztuRPzpa3o1G7Y7VQOFrVXLvRE4TBoHmHzgoc0wE2imxOblUZ2vx16A2nlDQ==
X-Received: by 2002:aa7:d783:: with SMTP id s3mr9485518edq.214.1602166930124;
        Thu, 08 Oct 2020 07:22:10 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id q14sm4230197ejo.53.2020.10.08.07.22.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 07:22:08 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id y12so1446974wrp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 07:22:08 -0700 (PDT)
X-Received: by 2002:adf:82e5:: with SMTP id 92mr9271111wrc.192.1602166928002;
 Thu, 08 Oct 2020 07:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
 <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org> <CAAFQd5BdeG44SmT4xhrarsmgnFc-1LCdoFwz=XXYsLdHcMyz-Q@mail.gmail.com>
 <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
In-Reply-To: <89783dd42e698593d30dc0f37b52cf73@codeaurora.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 8 Oct 2020 16:21:45 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
Message-ID: <CAAFQd5B8_=ikPoX9s8s8mqibBMGiOkQTio+Os+OfJncFcZm_5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and G_SELECTION
To:     Vikash Garodia <vgarodia@codeaurora.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 7, 2020 at 9:33 PM <vgarodia@codeaurora.org> wrote:
>
> Hi Tomasz,
>
> On 2020-10-01 20:47, Tomasz Figa wrote:
> > On Thu, Oct 1, 2020 at 3:32 AM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> On 9/25/20 11:55 PM, Tomasz Figa wrote:
> >> > Hi Dikshita, Stanimir,
> >> >
> >> > On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
> >> > <dikshita@codeaurora.org> wrote:
> >> >>
> >> >> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> >>
> >> >> - return correct width and height for G_SELECTION
> >> >> - if requested rectangle wxh doesn't match with capture port wxh
> >> >>   adjust the rectangle to supported wxh.
> >> >>
> >> >> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> >> >> ---
> >> >>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
> >> >>  1 file changed, 12 insertions(+), 8 deletions(-)
> >> >>
> >> >> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> >> >> index 7d2aaa8..a2cc12d 100644
> >> >> --- a/drivers/media/platform/qcom/venus/venc.c
> >> >> +++ b/drivers/media/platform/qcom/venus/venc.c
> >> >> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >> >>         switch (s->target) {
> >> >>         case V4L2_SEL_TGT_CROP_DEFAULT:
> >> >>         case V4L2_SEL_TGT_CROP_BOUNDS:
> >> >> -               s->r.width = inst->width;
> >> >> -               s->r.height = inst->height;
> >> >> -               break;
> >> >> -       case V4L2_SEL_TGT_CROP:
> >> >>                 s->r.width = inst->out_width;
> >> >>                 s->r.height = inst->out_height;
> >> >>                 break;
> >> >> +       case V4L2_SEL_TGT_CROP:
> >> >> +               s->r.width = inst->width;
> >> >> +               s->r.height = inst->height;
> >> >> +               break;
> >> >>         default:
> >> >>                 return -EINVAL;
> >> >>         }inter
> >> >> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> >> >>
> >> >>         switch (s->target) {
> >> >>         case V4L2_SEL_TGT_CROP:
> >> >> -               if (s->r.width != inst->out_width ||
> >> >> -                   s->r.height != inst->out_height ||
> >> >> -                   s->r.top != 0 || s->r.left != 0)
> >> >> -                       return -EINVAL;
> >> >> +               if (s->r.width != inst->width ||
> >> >> +                   s->r.height != inst->height ||
> >> >> +                   s->r.top != 0 || s->r.left != 0) {
> >> >> +                       s->r.top = 0;
> >> >> +                       s->r.left = 0;
> >> >> +                       s->r.width = inst->width;
> >> >> +                       s->r.height = inst->height;
> >> >
> >> > What's the point of exposing the selection API if no selection can
> >> > actually be done?
> >>
> >> If someone can guarantee that dropping of s_selection will not break
> >> userspace applications I'm fine with removing it.
> >
> > Indeed the specification could be made more clear about this. The
> > visible rectangle configuration is described as optional, so I'd
> > consider the capability to be optional as well.
> >
> > Of course it doesn't change the fact that something that is optional
> > in the API may be mandatory for some specific integrations, like
> > Chrome OS or Android.
> >
> >>
> >> I implemented g/s_selection with the idea to add crop functionality
> >> later because with current firmware interface it needs more work.
> >
> > I suggested one thing internally, but not sure if it was understood
> > correctly:
> >
> > Most of the encoders only support partial cropping, with the rectangle
> > limited to top = 0 and left = 0, in other words, only setting the
> > visible width and height. This can be easily implemented on most of
> > the hardware, even those that don't have dedicated cropping
> > capability, by configuring the hardware as follows:
> >
> > stride = CAPTURE format width (or bytesperline)
> > width = CROP width
> > height = CROP height
>
> Assuming the bitstream height and width would be configured with capture
> plane
> setting (s_fmt), configuring the crop as height/width would indicate to
> venus
> hardware as scaling. To distinguish scaling with crop, firmware needs to
> be
> configured separately indicating crop rectangle.

The V4L2 encoder API does _not_ configure the bitstream width and
height currently. Scaling is not defined in the API at the moment. As
per the spec [1], the CAPTURE width and height fields are
ignored/read-only.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#initialization

Currently there are following parameters configured by the V4L2 API:

OUTPUT format width: the number of pixels per line of the input
buffer, including any padding pixels, i.e. stride in pixels,
OUTPUT format height: the total number of lines of the input buffer.
including or not, any padding lines (for NV12 non-M format any padding
lines must be included, as plane offsets are calculated based on
this),
CROP left, width: horizontal position of valid pixel data in the
buffer; left is typically 0 and width can be less than OUTPUT format
width,
CROP top, height: vertical position of valid pixel data in the buffer:
top is typically 0 and height can be less than OUTPUT format height,

>
> > I believe Android requires the hardware to support stride and AFAIK
> > this hardware is also commonly used on Android, so perhaps it's
> > possible to achieve the above without any firmware changes?
>
> Yes, the hardware is used and also supported in android. The interface
> to configure
> crop rectangle to firmware is via extradata. This extradata info is
> passed from v4l2
> clients via a separate plane in v4l2 buffer. The extradata payload is
> passed to
> firmware as is and the firmware parses it to know if crop, roi, etc.

Okay, so do I get it correctly that without extradata, the firmware
can only handle the case where width == stride?

If so, it sounds like this extradata should be generated by the driver
internally based on the selection CROP rectangle. In fact, the driver
already seems to have a definition of struct hfi_extradata_input_crop
[2]. So perhaps it wouldn't require much effort to implement the crop
properly?

[2] https://elixir.bootlin.com/linux/v5.9-rc8/source/drivers/media/platform/qcom/venus/hfi_helper.h#L817

Best regards,
Tomasz
