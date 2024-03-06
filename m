Return-Path: <linux-arm-msm+bounces-13544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C8874135
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 21:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40EA71C216A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA60146E8F;
	Wed,  6 Mar 2024 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qETGOlQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793A1448C1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709755564; cv=none; b=V+q6GgAuN3fnJoelvXH7KkUrvpkzD0fLciBNsuYjUTmIdjClY7utiVtynhqqN1JM6FVqeBHX0Oq365m7fLsQGDcJ6IiZhNeA3l+gVTD5Ln6S0P+yfLPZWhPZYhXkmRUJa64GahlDtDVUbV/dtJtsEKXlFr27pfPESeBqgtSxJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709755564; c=relaxed/simple;
	bh=iN4rIsai6hci6NstOJ0K84kEfNVKXcecwbATxpKYiuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyvoSxbymC7GY5LzoTnOLLRJJGUeSG5fx/syvGsmnD9XAc1z94AiSHV+1Dr8ETiIy88T7QzUE/c2007z5tU+W/skTK47Efx2Wk9+vuybwRzQ1XuJdcn5B0Xhwb2P8gB11zlaVsk6LF7Gs+BQxyEUJeR25wKP/lriLxubW5GA9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qETGOlQv; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60989ecd10fso1157807b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 12:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709755561; x=1710360361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PXujBSZ8FvLDvY0K2TIfDzAysZgYZ9VK/ikeWwgFec=;
        b=qETGOlQvF1pw6ugodZiZK1yVSY4D8J+d1Wbt0GibuHZ8QpkrskgIFTA8mEAOZp+6hU
         bcVOmM5RMhij5P0735nCT/Gscrt+KwY3hdBUHArp04BSEDMHk0DbUriCalXq5UrwE/hz
         jqSxczpuJZp+ssIthq3vd58F2/HB/n5dWQFpCdXpY8XIU+13pRtl5TbrB49CTgeudmqy
         3quAPXVHxPMogXCNFckdbdQZVyGZvouop58Anu374/1sfeg4p0UtMbibNyEEzNswC/rD
         pXP4OWVyGP8OPaUSSwERM9bO/Xs8KiNtP+HqNuMc/Iq++m+cgNAHomJbcWKsoB5IckYF
         +vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709755561; x=1710360361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PXujBSZ8FvLDvY0K2TIfDzAysZgYZ9VK/ikeWwgFec=;
        b=YuRfqwbp/NU070YB3PONvfKj3iwDQTo73ymVtFYySYbAnO13RnUzfFKz+VGXwZe7DH
         gCJ/vQ45P/1jXUYBTXjrwQiEMLWm1LkG7913KW0wKfa+V52Hdeoeqg8U/JvgimjPsuVA
         DVS6iTtFcV48q7j8g9/f4eQEJxOcOs8PAt7U2rhqHSAGjGfq8TbN4QVrDRja527n7ME7
         4m6epDshm0v96+YqsKZkFa3kOEaMhG9c7nGpTaiCt94lY5xz1SwmjGgHFBdZt+KFsIym
         I4A6Wz06mdc28yRU/ghLbWXht/NeDTrzKRGjtnlvn+1JH3fCJViVYG85E4x10HEM9JB8
         6bXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3yTs/QXUfw/jlZHfTNHzC5ZywiFYwZTJ6a9XsXB4iqQd2+vOrCrKNh0wa1nGCQkUCLJMKi+hhNWgnP44wFzSJ51pQmr+sH2HAYJEzpg==
X-Gm-Message-State: AOJu0YwhGzfpFEzjt45b+DZrhaB7Orf5oZTDJ8wBfOwomjwBw1qt+bHE
	WPsSXI7/p2cOG+MW1KIuS4NIONxge2VP4zTz0LBA8YB91aW5tggKYmYHFM0RsThoOuXgBpq0aPK
	RxWXuoEB0Jlm/NBO+qUNN72d+JsmLQWbc+cc/6A==
X-Google-Smtp-Source: AGHT+IFa2jOmW/7Mnfj4IRBnhnTPN2y+PfXCBXlkHor2t9o+1xiC2eXXMGaB2T0SmxSappk79AgqFwvOpB0iTT+ziZU=
X-Received: by 2002:a05:6902:1b88:b0:dcc:c279:d2fa with SMTP id
 ei8-20020a0569021b8800b00dccc279d2famr15505206ybb.30.1709755561553; Wed, 06
 Mar 2024 12:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
 <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com> <2295092e-355b-4ebf-f630-14623cf7d9a3@quicinc.com>
In-Reply-To: <2295092e-355b-4ebf-f630-14623cf7d9a3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 22:05:50 +0200
Message-ID: <CAA8EJpovNX31rWS_TdBTQiDmk0+kGBPdax6JncZupbXL0iUZhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dp: move link_ready out of HPD event thread
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 21:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/6/2024 11:52 AM, Dmitry Baryshkov wrote:
> > On Wed, 6 Mar 2024 at 21:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> There are cases where the userspace might still send another
> >> frame after the HPD disconnect causing a modeset cycle after
> >> a disconnect. This messes the internal state machine of MSM DP driver
> >> and can lead to a crash as there can be an imbalance between
> >> bridge_disable() and bridge_enable().
> >>
> >> This was also previously reported on [1] for which [2] was posted
> >> and helped resolve the issue by rejecting commits if the DP is not
> >> in connected state.
> >>
> >> The change resolved the bug but there can also be another race condition.
> >> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> >> link_ready will also not be set to false allowing the frame to sneak in.
> >>
> >> Lets move setting link_ready outside of hpd_event_thread() processing to
> >> eliminate a window of race condition.
> >>
> >> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> >> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 068d44eeaa07..e00092904ccc 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>                                                           dp->panel->downstream_ports);
> >>          }
> >>
> >> -       dp->dp_display.link_ready = hpd;
> >> -
> >>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> >>                          dp->dp_display.connector_type, hpd);
> >>          drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> >> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
> >>                  goto end;
> >>          }
> >>
> >> +       dp->dp_display.link_ready = true;
> >
> > Do we need any kind of locking now?
> >
>
> hmm ... correct me if I have missed any flows but I think all paths
> where we will set link_ready are already protected by event_mutex?

I didn't check the source code, that's why I was asking. If it's
protected by event_mutex, then it should be fine.

>
> >> +
> >>          dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >>
> >>   end:
> >> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
> >>   {
> >>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
> >>
> >> +       dp->dp_display.link_ready = false;
> >> +
> >>          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> >>
> >>          return 0;
> >> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
> >>                  drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
> >>                  if (dp->hpd_state != ST_DISCONNECTED) {
> >>                          dp->hpd_state = ST_DISCONNECT_PENDING;
> >> +                       dp->dp_display.link_ready = false;
> >>                          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> >>                  }
> >>          } else {
> >> --
> >> 2.34.1
> >>
> >
> >



-- 
With best wishes
Dmitry

