Return-Path: <linux-arm-msm+bounces-16851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90189CE43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 00:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2C71C219A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 22:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329814B082;
	Mon,  8 Apr 2024 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPWkWxYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945361494B8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 22:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712614091; cv=none; b=LLhEfgfHl5vHh/Jxt5AIe3XmlEf4T4QCC8GAdwtkqMbYgw1cZbVYFSyIqGLWIgYrr+g8SyMBXhorYPq6mp5u64TlHuqH2fPxCfIP2C3vMddUfhLooEidA5ZSyzLvVw3OOVdbfNkdFkir1Miaz0cIYYLzD7SAukxapG6NF1ZeRso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712614091; c=relaxed/simple;
	bh=xxk1gyjbeyUL4zHAyBUPW/iHNjor9ToFngoeLDD2W4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7/XRuW/6iIOc6+qc8lI6Ae5Ub3kO3u/MltXIG792vV5GXG2gUGx3ky9aAiW4VvmqHDVkVU3v43ICooGev97V/LOFndBzFQsKmhE6qcAtTLoisfykzOSKpB3pw6hXI5vMUKak65Dq7PCN2u/nsf0hSiBqrHKSqcIctQG2/ul4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPWkWxYP; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so4413552276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712614088; x=1713218888; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMPTa7YZG9SFezIxNc9hWe537aXkTHEaz4nODnhs3/4=;
        b=WPWkWxYPUGqy5S1EXVgropEHY/dP5eKtu32DDDXQE8knDID7VcPhk/5d1dSv/VUtPs
         pfda3hFZGzHo5hU50IPE3qN7gsdnz4SXfd6U+wFq2IGj1og3zh1k/KHK99FasFXgyrYM
         cHvSHT1fuh6rLEQyWAJEAZDYBp5lhuGiSNpsXZushk9ubvLe5HgDyQOfyoDuJUfkE8zd
         qQ1vs8sEGzP86C5Kg8U81QJ+HyBf/YvsBL5Z6mP9gH4GJRY6odfT2McaV1miLAxjLY6F
         jL8P30quyCY+qPLokhxTtfqJBOBf6VABqtc8JMiAAgsVN2pexn3thtq+5+bOXZwYrVsS
         4XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712614088; x=1713218888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMPTa7YZG9SFezIxNc9hWe537aXkTHEaz4nODnhs3/4=;
        b=tZ95p/LUSuLaF6Dz+uOWWVCVGON0P6/+xNtXAMcvvzopw7CVhez/bEqOK2SEGRMter
         FbAAkGNz+DXY/9Q2mgT8oELlA4nBOm0thpTQKIxptH7ZCaabhtyCjrxd0lZ/TYVHHd5x
         PYMtd3lSp91BW0uOdsfe5PtJtJ9G5pbKsr12w45JbJNGayTT9A9M9bwBnjLa7q/Eyxtu
         3pgUvfHrNjQKtXScwAQn9cENu7dHchA5DjzfxZD+vMMEmhKdKizmAPbqcjYVzXb5/Hoc
         ia6Z1oopcuA6BBd1HTQv47yUO4MApcgx2IZ6L0+sJUaxgpHt2N37S5jOLGCJkkRnneyb
         Rgtw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Dk1KnqgiJzePbzRw2guwXk1jS6WvO7xUDZ2iV+gF0aeKJXGM+737orZ/NLHwCGQIeA8FU+BcqnwWsVMr/lBnUFzGp7BVyJhvdKfqSg==
X-Gm-Message-State: AOJu0YxbE8VDEGqJirHjAVvSoA7B0KtsRqUAK2AQBZeTW4Ni1qs3hEyd
	iIfQtIcKZQ/oky8WhjHxvuQBoITdYvOdaDIqAw7Zkwy0qTZXa8XOgPrNvUR3M9QtAUljnwiqcCc
	QXJTII174KAG6mOXrByPj73r9xHQ1co9vz/kKzw==
X-Google-Smtp-Source: AGHT+IHnwDBFmtmInPRd6q4lnmrUf3qgd9ZdW3vy7JyOs/HLpkeABlYPfLgTMEPSv4mYhPXpglVRbif+gfL2zsRQTqA=
X-Received: by 2002:a25:48ca:0:b0:dc6:9daf:35c7 with SMTP id
 v193-20020a2548ca000000b00dc69daf35c7mr7528021yba.28.1712614088530; Mon, 08
 Apr 2024 15:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com> <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
 <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
In-Reply-To: <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 01:07:57 +0300
Message-ID: <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> > On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> [..]
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index d80f89581760..bfb6dfff27e8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>>>               return;
> >>>>
> >>>>       if (!dp_display->link_ready && status == connector_status_connected)
> >>>> -            dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >>>> +            dp_hpd_plug_handle(dp, 0);
> >>>
> >>> If I read the code correctly, and we get an external connect event
> >>> inbetween a previous disconnect and the related disable call, this
> >>> should result in a PLUG_INT being injected into the queue still.
> >>>
> >>> Will that not cause the same problem?
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
> >>
> >> Yes, your observation is correct and I had asked the same question to
> >> kuogee before taking over this change and posting.
> >
> > Should it then have the Co-developed-by trailers?
> >
>
> hmmm, perhaps but that didnt result in any code change between v2 and
> v3, so I didnt add it.

So who authored v0 of it? From your text I had an impression that it
was Kuogee. Please excuse me if I was wrong.

>
> >> We will have to handle that case separately. I don't have a good
> >> solution yet for it without requiring further rework or we drop the
> >> below snippet.
> >>
> >>           if (state == ST_DISCONNECT_PENDING) {
> >>                   /* wait until ST_DISCONNECTED */
> >>                   dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> >>                   mutex_unlock(&dp->event_mutex);
> >>                   return 0;
> >>           }
> >>
> >> I will need sometime to address that use-case as I need to see if we can
> >> handle that better and then drop the the DISCONNECT_PENDING state to
> >> address this fully. But it needs more testing.
> >>
> >> But, we will need this patch anyway because without this we will not be
> >> able to fix even the most regular and commonly seen case of basic
> >> connect/disconnect receiving complementary events.
> >
> > Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> > the driver has proper detect() callback, there will be no
> > complementary events. That is a proper way to fix the code, not these
> > kinds of band-aids patches.
> >
>
> I had discussed this part too :)
>
> I totally agree we should fix .detect()'s behavior to just match cable
> connect/disconnect and not link_ready status.
>
> But that alone would not have fixed this issue. If HPD thread does not
> get scheduled and plug_handle() was not executed, .detect() would have
> still returned old status as we will update the cable status only in
> plug_handle() / unplug_handle() to have a common API between internal
> and external hpd execution.

I think there should be just hpd_notify, which if the HPD is up,
attempts to read the DPCD. No need for separate plug/unplug_handle.
The detect() can be as simple as !drm_dp_is_branch() || sink_count != 0.

>
> So we need to do both, make .detect() return correct status AND drop hpd
> event thread processing.
>
> But, dropping the hpd event thread processing alone was fixing the
> complimentary events issue. So kuogee had only this part in this patch.

I'd prefer to wait for the final patchset then. Which has the HPD
thread completely removed.

>
>
> >>>>       else if (dp_display->link_ready && status == connector_status_disconnected)
> >>>> -            dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >>>> +            dp_hpd_unplug_handle(dp, 0);
> >>>>    }
> >>>> --
> >>>> 2.43.2
> >>>>
> >
> >
> >



--
With best wishes
Dmitry

