Return-Path: <linux-arm-msm+bounces-13542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558358740DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870C61C20B14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E821113E7E7;
	Wed,  6 Mar 2024 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnMYL8c8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE91350DB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754782; cv=none; b=ShcBLJHykADHGICF3WYau3IbGk5nOyZNXoxE1ZQyd3Artj+5+EliOzM8C5CMUutFRLvlL0sH4enrfbiM9w5LQr+yRh/wx3mo2e33t0HYprSgUsZ7jd9ky/L9BPO+c9iwVzCS2fK+YOyodKn72tDtxdHtlmwmE9sI+D9se7HdOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754782; c=relaxed/simple;
	bh=zA6b2D7k6EWEqApIOQnoeySCJz/6P755dOue36qffME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jq1Pqi1KStGubMFnzUiopbemOxFGHnZIxT4Z2OzN2QUVtm1MY/ok1ZU3DQY8UJJUpKXYacBTIknMzIzddPfSEn+slLQCxjouchVSFmH48MWca3k+4sBiJaCmZiqoOD0SC4P9kgOehXAFfwhRtIhADZvWonkv1AOd7wdHe84g5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnMYL8c8; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so42955276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754780; x=1710359580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d27KImFrNXS8TH5Uy9ti36RCHItgUnUBpBlO5w+2ibI=;
        b=VnMYL8c8BqsEm0MxumNfTmtMnhSEhMcpH1WmiRk6EKlfEVwTIE7JhRB3XRFveIq2RL
         JKZxfBDuD0N34Pj/cGLYlDFJ3Q2dzpK9LrzWTR7GIMOtWrhfSa/TAp3H1KnDj76oaLRV
         2gSszhtUNSVzED3V21baw7xNHsfYHhqQ+PTY1Ulugh8C/0u5wGlp28eu2Ob1kbDcARxb
         u8YLB78sTeZy0jLyjxUa0UKZDa+uQOUtuS+BJKYdQFbsnhHtkr0ITGJQAqbFq9vW+KzL
         N9kKaGymUJpm75xpf7V9o3PPA1E5+LjUspoYeHucgg42x9wnRbotInsdqHgUr2BY9YWO
         D0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754780; x=1710359580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d27KImFrNXS8TH5Uy9ti36RCHItgUnUBpBlO5w+2ibI=;
        b=kCiQbCTjDZ9QBQFRDgx5z3IsXNe5d+qHoH0OZkOfKPCkbP06Jj4kXoJ+aQXRzcye0l
         jVLQgIoAu7Mx4bEgdpMHpvpX8zzm9ePxAbaZ3x490UquJj2GDDUWIKGShSmgcYe7fk3X
         Lt5fJfx+t0KaLkmT7ZtVvFfHMXGkZTIuU1aXgil0393le0mEmOOph89YE1Di4BK+jVew
         xlgo9egB+SkLceiR2zg0AX1TqAU48549Rp9q7wZNKr1BdXjc5oCHPQLffq6SHyKW1QSh
         /i5h1Zd+YjsiZAwE099Pq2zWGo+xOCuY2WQLCiKoVftAXFiFHP1bP6aueZ7aoqYQbhr0
         yFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEUVJHbsu1DcDMdCP8ThxcJUKosAW7K4YTD7mH/YJVrusuHDMVzWuAfqc6hkY1GO6AhBqRRp5NTHgzYKLKzi95BSa2eKt7pkIb7zIouA==
X-Gm-Message-State: AOJu0Ywt+76gNFhTA4b6PMprc2NX64S1BbGTvnXs0Fi7UKtdSTwJYdwP
	9BR6A6yaXnDnoIwe6b+fOxLUzXdTn/C09RwNS/E6o69CsnGDuJfRm3pWpLIkVw4Sq8Na1lUZ05Q
	HFUYdY1AAFcvKixFzAF3l/NVY56vzmN6OR5bb5o0UcizilcwK
X-Google-Smtp-Source: AGHT+IGHfNDjfh7hFs/ZwG4KT9lA9AimK6yKN74rJTfSS+TfmaWUA5IQ4eiis9rUmiQWP7vtu12pPVkJnV3wZTUiXuk=
X-Received: by 2002:a25:8a08:0:b0:dbe:4f15:b5cf with SMTP id
 g8-20020a258a08000000b00dbe4f15b5cfmr12953825ybl.15.1709754780141; Wed, 06
 Mar 2024 11:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:52:48 +0200
Message-ID: <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dp: move link_ready out of HPD event thread
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 21:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> There are cases where the userspace might still send another
> frame after the HPD disconnect causing a modeset cycle after
> a disconnect. This messes the internal state machine of MSM DP driver
> and can lead to a crash as there can be an imbalance between
> bridge_disable() and bridge_enable().
>
> This was also previously reported on [1] for which [2] was posted
> and helped resolve the issue by rejecting commits if the DP is not
> in connected state.
>
> The change resolved the bug but there can also be another race condition.
> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> link_ready will also not be set to false allowing the frame to sneak in.
>
> Lets move setting link_ready outside of hpd_event_thread() processing to
> eliminate a window of race condition.
>
> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 068d44eeaa07..e00092904ccc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>                                                          dp->panel->downstream_ports);
>         }
>
> -       dp->dp_display.link_ready = hpd;
> -
>         drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>                         dp->dp_display.connector_type, hpd);
>         drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>                 goto end;
>         }
>
> +       dp->dp_display.link_ready = true;

Do we need any kind of locking now?

> +
>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>
>  end:
> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>  {
>         struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
> +       dp->dp_display.link_ready = false;
> +
>         dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>
>         return 0;
> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
>                 drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>                 if (dp->hpd_state != ST_DISCONNECTED) {
>                         dp->hpd_state = ST_DISCONNECT_PENDING;
> +                       dp->dp_display.link_ready = false;
>                         dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>                 }
>         } else {
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

