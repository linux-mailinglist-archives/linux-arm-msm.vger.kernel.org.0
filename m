Return-Path: <linux-arm-msm+bounces-4477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1280F9E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 23:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F16B20E8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B790164CD4;
	Tue, 12 Dec 2023 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWZqK1nS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A03B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:04:09 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e282ec7537so3928207b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702418649; x=1703023449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
        b=vWZqK1nSJ/ndzZnbSOaNrhi5bXQ6HGdV2Qc+EK/t3eIrPXK3NhLEZBYxfqJEoQe9AV
         U2V7UMNIsEb45n3VHHPLali6WlE8cy9D+Sw8POHX/5ST8XZPHkPcDvxfK9EazoKlY3ru
         HffOTO7zDZxHIY4PTKvv6Z0AjXhNf5tkBttNIknshWGfSZ9KmhVMjzJM4mBDU1hKrenI
         kSfwOnH2ufq8tjZVpAuz+lgWbbVaGh7j6IwPqfBaQxypBXcGW7TP8vapY4Z1YSlwS6Gy
         DveZ/ohhFqRY/0FMRpiBuLCr/+FreWyANWbgr9iLoBX9s4OaUwkTTd1GIA6/hUizDdnO
         YUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702418649; x=1703023449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
        b=IOHwijfBRD8yLxvGVLNu11gtblFT8ELWAlM+h/u963IHEumlWdQNJslSHIKJkIybl0
         PiNUrKyMkdJzbpRlf6XWDiRukoZLnLNVZjmsUg6X5k/kyfgJ9J3ebEGAqU1/QI1PEUWm
         tsFbuY81OTDueVN8CYqprcOznJAa9vpNeRYgFtPRA6j2ZW2MhQba/oW14qBWuPghKOk6
         XUv/2DRJ2KN3Xo6c4pLDZDtRMjE4u/qtZENUsGG0ee08tA7p26vCI0r2Xsmc5sPcoxyr
         /BrsrX3fSBW7sgY/4gqdf13apdICmgVeqE3drLBbEVxW+cH51mqUuyr/bqwEJbypljzo
         hQPw==
X-Gm-Message-State: AOJu0YxfCV7w4X01PhJb0X85iAUHZ50cjlu0aNHR6cjTBZsomXSaBMF4
	eJF0A4bBVDpCZb8xRQ01+NBBHBnPeNwefxCjHV4mqA==
X-Google-Smtp-Source: AGHT+IEc9UlLnCrtenTjOxWpVWAwvAo/nKTuRt+2QrFiV7c4g5vWp+h3pcwwc+ssUoUZ+HBsOHFMUA722GrCgvfWqSg=
X-Received: by 2002:a81:52cd:0:b0:5e2:834e:7f76 with SMTP id
 g196-20020a8152cd000000b005e2834e7f76mr441125ywb.41.1702418648867; Tue, 12
 Dec 2023 14:04:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-2-quic_abhinavk@quicinc.com> <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
In-Reply-To: <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 00:03:57 +0200
Message-ID: <CAA8EJpooSO3vR+Kp+XHgwOwQy43CKdUsOJOD3LiQ1LxbyW_39w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 23:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > In preparation for adding more formats to dpu writeback add
> > format validation to it to fail any unsupported formats.
> >
> > changes in v4:
> >         - change the failure message of the API
> >           drm_atomic_helper_check_wb_connector_state() to a generic
> >           one in case it checks more errors later and moreoever it
> >           already has debug message to indicate its failure
> >         - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
> >           other atomic_check failure messages
> >
> > changes in v3:
> >         - rebase on top of msm-next
> >         - replace drm_atomic_helper_check_wb_encoder_state() with
> >           drm_atomic_helper_check_wb_connector_state() due to the
> >           rebase
> >
> > changes in v2:
> >         - correct some grammar in the commit text
> >
> > Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index bb94909caa25..4953d87affa1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
> >  {
> >         struct drm_framebuffer *fb;
> >         const struct drm_display_mode *mode = &crtc_state->mode;
> > +       int ret;
> >
> >         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> > @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >                 return -EINVAL;
> >         }
> >
> > +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> > +       if (ret < 0) {
> > +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);
>
> We already have a debug message in
> drm_atomic_helper_check_wb_connector_state(). Can we please drop this
> one?

If you don't mind, I can just drop it while applying

>
> > +               return ret;
> > +       }
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.40.1
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

