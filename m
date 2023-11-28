Return-Path: <linux-arm-msm+bounces-2333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342337FC549
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 21:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50788B215E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 20:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD8840BFC;
	Tue, 28 Nov 2023 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Og8A0rW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442D910F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 12:24:54 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5ce8af1eab9so43912087b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701203093; x=1701807893; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TSLF7Ad3i79H/glaQ3o9WJ/hGDQy8pGfVG+aH4loN/s=;
        b=Og8A0rW5EeWpJ0hS6lqgLJAxf4jbV+gWjZgQsF67qFiB25gel8n3F52cLWYi4xBb0N
         zW1qySCwR16UIlsHAkmh1UcCP8II8QuK0DEdZXbQOWc8yDA6LNd0g/qhl05VO8s0X5u7
         xm17t6NwYoHhkjl+PjXd6uoMqg7DFlaCDpas/syY5risDgnOKOKl4ufoMEQMn8Gvhlbt
         CNDf1nAhpE5oqESpMEhpzZIiLwbQ5stwKHl1cAjiOeh4JJ+QyvJZqvl8JVR0NfUuJ+kV
         T9AAR1M9ws/aSfSe3jGoUk86rI1btF7y3CYNnbq+Srwj+lnn70sIwttqFl1re5+AFs59
         3xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203093; x=1701807893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSLF7Ad3i79H/glaQ3o9WJ/hGDQy8pGfVG+aH4loN/s=;
        b=naIiKgcihtRKOpPVnH5cJfYq+4hxkKBRgZJ1JRbu0RXci2WJSpI1RHOPWlWpBn4SyE
         X1CzZ+q25Sg0GbjcC7foiHy+z8chAtujATI8DfiZ+ZP9jOjGnG6oytogHj6ZmGlP8iRR
         G6aRVsUuu9K/plfcqaaRdQBf5LtUfRurXO8yE8h/aMnQtaMeFpEVfvJ+RmmUn4yaUNa+
         cm0qzktRL/GiFkhpjtOMC9VMIF4bKuxNs8zGfxGOjzXBNgd/hjsZPHFX5a4t5tYiRXSZ
         HiTneElORGfw3CM7jnYGmnqUyqg391nKjz4bAhCe9kvuhHybjPzriCVJWY0s0n33HB2G
         16iQ==
X-Gm-Message-State: AOJu0YykUm2TK5P/I441B3G5tSqxlEJt1J0VgG8T6WetuwEt3SyG/mT9
	0DHMf5zzSFXkpnokTvwGUGt7NlyFMYdVgh2wl3VAZw==
X-Google-Smtp-Source: AGHT+IEjE9OF/yo6DxBMtu+TRHRqrD+boNuuR8j23dQKjHPPl/zDpBoSt2BEETEQWEUnSFsO0rH65ODxy+Smgd4XLu0=
X-Received: by 2002:a0d:dec2:0:b0:5cd:c7a3:6cb3 with SMTP id
 h185-20020a0ddec2000000b005cdc7a36cb3mr16364581ywe.37.1701203093370; Tue, 28
 Nov 2023 12:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128011122.14711-1-quic_parellan@quicinc.com>
 <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com> <cf850520-0906-0291-fd21-be8cd687bcde@quicinc.com>
In-Reply-To: <cf850520-0906-0291-fd21-be8cd687bcde@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 22:24:42 +0200
Message-ID: <CAA8EJpqj5nPPxK=AzS=owURRZEgO3zdQZEMcJ8XjHOJfQrUEwg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Nov 2023 at 19:43, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 11/27/2023 5:48 PM, Dmitry Baryshkov wrote:
> > On Tue, 28 Nov 2023 at 03:12, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> >> state when the frame_done_timer timeouts.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
> >>   1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 1cf7ff6caff4..5cf7594feb5a 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -191,6 +191,7 @@ struct dpu_encoder_virt {
> >>          void *crtc_frame_event_cb_data;
> >>
> >>          atomic_t frame_done_timeout_ms;
> >> +       atomic_t frame_done_timeout_cnt;
> >>          struct timer_list frame_done_timer;
> >>
> >>          struct msm_display_info disp_info;
> >> @@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
> >>
> >>          dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> >>
> >> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> >> +
> >>          if (disp_info->intf_type == INTF_DP)
> >>                  dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
> >>          else if (disp_info->intf_type == INTF_DSI)
> >> @@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
> >>          for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>                  struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >>
> >> -               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
> >> +               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
> >>                                  phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
> >>                                  phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
> >>                                  atomic_read(&phys->vsync_cnt),
> >> -                               atomic_read(&phys->underrun_cnt));
> >> +                               atomic_read(&phys->underrun_cnt),
> >> +                               atomic_read(&dpu_enc->frame_done_timeout_cnt));
> >>
> >>                  seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
> >>          }
> >> @@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >>
> >>          DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
> >>
> >> +       atomic_inc(&dpu_enc->frame_done_timeout_cnt);
> >> +       if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
> >> +               msm_disp_snapshot_state(drm_enc->dev);
> > atomic_inc_and_test(), please
>
> Hi Dmitry,
>
> We only want to create a snapshot for the first instance in which the
> timer timeouts. atomic_int_and_test() increments the value and then
> returns whether it has a value of zero or not. FWIW I think I should
> change it to 'atomic_add_return(1, &dpu_enc->frame_done_timeout_cnt)' so
> that we can check only when this value equals one.

Works for me too.

I suggested atomic_inc_test() because then we can let devcoredump take
care of duplicate events.

>
> Thank you,
>
> Paloma
>
> >
> >> +
> >>          event = DPU_ENCODER_FRAME_EVENT_ERROR;
> >>          trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> >>          dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> >> @@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >>                  goto fail;
> >>
> >>          atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
> >> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> >>          timer_setup(&dpu_enc->frame_done_timer,
> >>                          dpu_encoder_frame_done_timeout, 0);
> >>
> >> --
> >> 2.41.0
> >>
> >



-- 
With best wishes
Dmitry

