Return-Path: <linux-arm-msm+bounces-4473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DC80F96D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2FB8B20E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 21:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA4264141;
	Tue, 12 Dec 2023 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hBz2agZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F735B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:32:51 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5cbcfdeaff3so62626757b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702416770; x=1703021570; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nAMCWPmOAEyI7QnHbEVFzQzgfOnlTbYbwwq0iE7QXzY=;
        b=hBz2agZPHmFoCNfkYwLxe49dfn7WI+3JZZM6PBOJzHQcyXBlEsBGUFciDGneuIHqOq
         MrVgLNCfiYw4IpZg5Bh/MykT7+7R1zEOVGtc8yAr5y5Q5QDa6vY9xO7Wr5ExaM3ltp2D
         IAl6NMUNrDX+etN1vh1X1ogQobiHojiVe6Sf+Y2B8rKdR1ZTI+t5ZU4+nuyKhjwNKQjD
         kA6h0i8I5UCogjp+Ypu/sWHXmlQAFdzPzi1P7wt7LRkFmA9WnS9ri9DI0yTkB9gvPgit
         vjXQL3mBUi0EoLFXBmojcIw3oX8ji+TkFjO1S6ucP7SSyOB0rVgHYsNbhE1IckY9/OBl
         gI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416770; x=1703021570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAMCWPmOAEyI7QnHbEVFzQzgfOnlTbYbwwq0iE7QXzY=;
        b=A8qCoYLHQ2LVppRyoR7GeFfuxbyeamKq/92ttcSv9BdmN/h9ZZI0y604amdyrMkL3u
         sebNqnteB476hdAwItPP5sdIYFhyVzPAE3U3gpIKkAzzkbscufqkfgSgmKUC7yMWvXun
         UBWSNl4YumZRXDSWId3Kui0qC239nkNmEB6+f3IiFL5IJBnFo4JW29rKyQH9qzKltAat
         W9N15xGHq5CYsVdOQdpY9aJ4A5FXcRlFX92gQSA2ud/R/SV0kX8pPhCoYsp9S4Y8w54W
         T3Hc9IpzpaYVdzMVHB5E8nzmgzcjl+x2z4Joco8bsLU8wsbJ6jyFVZWIVpR9/y99SXSl
         3hjA==
X-Gm-Message-State: AOJu0Yxu4KM8FOBeQS2b4m0g3NtpOxuN3PJVCKZ3iX5xd55USjdBEAmA
	MPhpbQCSDrxQZKDnScfGHh094yIhgjVzakop/f7caA==
X-Google-Smtp-Source: AGHT+IHwhm79zg1o8Twrfkas2RbpxztHXKT11jxCktgcQzXvIJ4yp5ZwLauwclFvKaPNojWCQqYq1B6yvcIm7JME4n8=
X-Received: by 2002:a81:8305:0:b0:5d4:4bb:2090 with SMTP id
 t5-20020a818305000000b005d404bb2090mr5961876ywf.17.1702416770167; Tue, 12 Dec
 2023 13:32:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-2-quic_abhinavk@quicinc.com> <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
 <59304cf8-33b7-bf27-f9e2-a15e323c869a@quicinc.com>
In-Reply-To: <59304cf8-33b7-bf27-f9e2-a15e323c869a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:32:39 +0200
Message-ID: <CAA8EJpr3Gjd-5cw=15g9TNcs1q30_eSzFYpD0_-0fc43VBof1g@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: add formats check for writeback encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 19:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2023 10:40 PM, Dmitry Baryshkov wrote:
> > On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> In preparation for adding more formats to dpu writeback add
> >> format validation to it to fail any unsupported formats.
> >>
> >> changes in v3:
> >>          - rebase on top of msm-next
> >>          - replace drm_atomic_helper_check_wb_encoder_state() with
> >>            drm_atomic_helper_check_wb_connector_state() due to the
> >>            rebase
> >>
> >> changes in v2:
> >>          - correct some grammar in the commit text
> >>
> >> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index bb94909caa25..425415d45ec1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>   {
> >>          struct drm_framebuffer *fb;
> >>          const struct drm_display_mode *mode = &crtc_state->mode;
> >> +       int ret;
> >>
> >>          DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >>                          phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> >> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>                  return -EINVAL;
> >>          }
> >>
> >> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> >> +       if (ret < 0) {
> >> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> >> +               return ret;
> >> +       }
> >
> > There is no guarantee that there will be no other checks added to this
> > helper. So, I think this message is incorrect. If you wish, you can
> > promote the level of the message in the helper itself.
> > On the other hand, we rarely print such messages by default. Most of
> > the checks use drm_dbg.
> >
>
> hmm...actually drm_atomic_helper_check_wb_connector_state() already has
> a debug message to indicate invalid pixel formats.
>
> You are right, i should perhaps just say that "atomic_check failed" or
> something.
>
> I can make this a DPU_DEBUG. Actually I didnt know that we are not
> supposed to print out atomic_check() errors. Is it perhaps because its
> okay for check to fail?

There are no messages by default there, because otherwise it is so
easy for the user to overspam the dmesg and thus syslog / journal. DoS
on the plate.

>
> But then we would not know why it failed.

Think about the user of X11. They don't see the console. And by
default in the contemporary distros they won't be able to check dmesg.
So if a commit fails, they have to deduce anyway, why did it fail.

>
> >> +
> >>          return 0;
> >>   }
> >>
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry

