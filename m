Return-Path: <linux-arm-msm+bounces-2822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E637D800477
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4CC1C2087C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B51125A8;
	Fri,  1 Dec 2023 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sVytQP6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A0510FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:14:25 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d3d250aaedso9010097b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701414865; x=1702019665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
        b=sVytQP6rvUPUia+SwYjKet+G2cfBoqn3sYqKPjerZyGM76hXzxYG1OZeq6FWckjB9j
         0QLsQzFLuwBn6TKP3em4ggSAiHol1ewbgabEC4ViH+jELx7ABugFI4A26teKqoLzCFIA
         2lXQ4cpG886ymJF0DHz4wUymoLR3jDcZuaypK39YupCvG/h6oNSvDHLj6vqOvxBm3fj7
         nz6Rg4k03I+p3/mJrsBfQwvi/cBm1HkLv7hmT72V2wgHexx/0sxxuOHBeloZ+LW/3jNC
         wjiTrl5qm2JFfbDPYEHYNl1CWGVgrlMaKD46HuTCEi/6FbWcGK96boKmcrxO4EHDtVsk
         zNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414865; x=1702019665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
        b=NzmM9S9O2d/8yP/9wrMMgIguSk5uHy97+oCP+h2So6G2jVKT0Mvu7dKz5s68xmhR69
         5GbRUiOtE8jYVcTWpNKh9WBlYd/BhIxQU0gPEJvmemI/L0t5chprzQyk4k6xLueLlr42
         r0TJqdqcuu2NjSqoHDwvCxhs8EzQnkXQDxS0l0RYDrTY98HpaRC7lyXlyoUAJaCSeGVP
         sfJ+GD7oESfm2dhFZpHRHc2BYbWRyJb84Sddz7S8qeOQ9hSoByo0LgYjzaAur1n5NSfA
         q1j3dUAMbY1QqckQDrrKUiHTETx+la7XlmCgx3AahcI57EY2J+lSvZt6MkKj3Q42FwDY
         Z7Ug==
X-Gm-Message-State: AOJu0Yxl/4i+P9HuMCZ+QwAMGGpJ1o5ynTPha0v/JwPlBrdSthh5MwST
	Jn+QnDTO0iFU+KwSGh/jGYuH5myP727q06lwntt5mw==
X-Google-Smtp-Source: AGHT+IH1zrA0sedjaTZM9ZUB1Xj3rWiOnVGBxUse/78AVWt2GLivnKjlJLa6tr6P49ZKi6Z6HiLTYSJNGyzwhMUczKg=
X-Received: by 2002:a0d:fa05:0:b0:5d0:55c:382c with SMTP id
 k5-20020a0dfa05000000b005d0055c382cmr16611927ywf.10.1701414865131; Thu, 30
 Nov 2023 23:14:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-15-quic_abhinavk@quicinc.com> <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
 <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
In-Reply-To: <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:14:14 +0200
Message-ID: <CAA8EJpp4XNCwRzF=Lo4_oV7Gj1yDDcEQn5YJ5vXEx=HiJvByWA@mail.gmail.com>
Subject: Re: [PATCH 14/16] drm/msm/dpu: do not allow YUV formats if no CDM
 block is present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, quic_khsieh@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 02:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:24 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> On chipsets where CDM block is not available OR where support has
> >> not been added yet do not allow YUV formats for writeback block.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index 7fc174b33ae2..d8edca9bc964 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>                  return ret;
> >>          }
> >>
> >> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
> >> +           !phys_enc->dpu_kms->catalog->cdm) {
> >> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
> >> +               return -EINVAL;
> >> +       }
> >
> > Can we have YUV formats in wb_formats if we do not support CDM? That
> > would be an error.
>
> I can drop this one once i address the comments on the next patch.
>
> Yeah the reason for this change was we had one formats array for wb and
> were using that for all chipsets. We can have two arrays : one only rgb
> and the other rgb+yuv to address this.

Yes, this sounds fine to me.



-- 
With best wishes
Dmitry

