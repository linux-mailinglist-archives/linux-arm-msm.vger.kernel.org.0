Return-Path: <linux-arm-msm+bounces-2175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4C7FAFC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 02:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB721C20A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 01:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD02F1C30;
	Tue, 28 Nov 2023 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke+t8H77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F8A1B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 17:48:22 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-da30fd994fdso4545001276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701136101; x=1701740901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7vxz+tHNBNWZVc8EcJHObY+dUX9GxZl9+4l9Gmig2ak=;
        b=Ke+t8H77GWjan1ANOqmYjkwt+IHQneOYRt5eYQrku+xbtptGCn4kLyl8fiasD8UNcJ
         kJXIi4z/vr9/MBYJniziPs4FtPuMLCvra/vomwR8gLS6aC+q9JeXMl58kJzmx3ZKnq7I
         w6dZesURCQgRlxs00ARVFnyGFn6QhMD0wEVNZO5JOsE+24729SAD7OAn06nLCoWVNmnf
         Bqd8Ma49x0RJidD5DGfPfCqSYpHjXTuDPEttGqfm/LWaLq0N9Vbm62qPbc4DqlbTzxZo
         LkmW1CU4AtcF7N+0ukwjsAgKOMIjetDCqIFdSmJCR+0mlg9Suhqm6yc9WftaGLgcWYfw
         wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701136101; x=1701740901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vxz+tHNBNWZVc8EcJHObY+dUX9GxZl9+4l9Gmig2ak=;
        b=NwQzNM9dae6vO0nhqpJ8oRKLWrG1tSyX6C6nx9aXJNIkH31jxASbqxdZv/6mCgewKz
         skdZV3rCXX5H4x/000HP9uy6Zk501UZuJ5+saKFs9reQ2G2bZpwF+p7A9qcVegopoani
         wxOMHWidi26Y7EPClHqX8d3ESwtaFse+fiqdbSDRy9yNwv8E5H1EhJoQcUQbAI39k3EE
         L8zYx9J4Spv+cD0ibGa/diRYAWTHY14LB2pBU1WQYyLXtcb0+RSGdIJ0aGSff5577slm
         mbeGGw2S6pEpF2V2Bm+kcec0uvzrC20zPrxV6ni4yoYjUaXShddYeIypiII+tftwf70U
         tYuQ==
X-Gm-Message-State: AOJu0Yx1Iw7fV9SLT0zX+muhAZvig+pamarWlhrVfuLCd2hjDzTOliN+
	S5QLUhWoUKiBlDqF4qZDE3khZ6xA5oZCYYBzA7dpxA==
X-Google-Smtp-Source: AGHT+IGYQElil91O5cH+HFnOPnDGOe0frEhW3uvtQCLF5IPu3HSvzwR/Wc1fbGURrXChA9Dz45L784GG2VN/D75eRF4=
X-Received: by 2002:a81:6c82:0:b0:5cc:9ef4:b01d with SMTP id
 h124-20020a816c82000000b005cc9ef4b01dmr14954961ywc.21.1701136101408; Mon, 27
 Nov 2023 17:48:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128011122.14711-1-quic_parellan@quicinc.com>
In-Reply-To: <20231128011122.14711-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 03:48:10 +0200
Message-ID: <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Nov 2023 at 03:12, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1cf7ff6caff4..5cf7594feb5a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -191,6 +191,7 @@ struct dpu_encoder_virt {
>         void *crtc_frame_event_cb_data;
>
>         atomic_t frame_done_timeout_ms;
> +       atomic_t frame_done_timeout_cnt;
>         struct timer_list frame_done_timer;
>
>         struct msm_display_info disp_info;
> @@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>
> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> +
>         if (disp_info->intf_type == INTF_DP)
>                 dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
>         else if (disp_info->intf_type == INTF_DSI)
> @@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>         for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>                 struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>
> -               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
> +               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
>                                 phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
>                                 phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
>                                 atomic_read(&phys->vsync_cnt),
> -                               atomic_read(&phys->underrun_cnt));
> +                               atomic_read(&phys->underrun_cnt),
> +                               atomic_read(&dpu_enc->frame_done_timeout_cnt));
>
>                 seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
>         }
> @@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>
>         DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
>
> +       atomic_inc(&dpu_enc->frame_done_timeout_cnt);
> +       if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
> +               msm_disp_snapshot_state(drm_enc->dev);

atomic_inc_and_test(), please

> +
>         event = DPU_ENCODER_FRAME_EVENT_ERROR;
>         trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
>         dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> @@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>                 goto fail;
>
>         atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
>         timer_setup(&dpu_enc->frame_done_timer,
>                         dpu_encoder_frame_done_timeout, 0);
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry

