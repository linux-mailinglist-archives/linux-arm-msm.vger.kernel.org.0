Return-Path: <linux-arm-msm+bounces-40200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45129E37EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87BEDB2F1E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF7E1AB528;
	Wed,  4 Dec 2024 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaCj/k8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB81632FE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308383; cv=none; b=oTsAa1vGEvPhzQKg41p1dskKyTD1WgRgtaqldFD9A4RWmZ4HXjC9uNkonCzK7x2cfzz6m9HMnblOKMmLZ65ZQuwjYXf45MTvKn1Qi6HgJIVo0W1T0OzSA8+lEYZeHaXyFGE53VyfcmUWnJuceo32Z4WSShfzSdPE0EKlFaHb0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308383; c=relaxed/simple;
	bh=N9zmOLCtd5wgwmofhHJKLRez0ufVZISaYiD568RkQWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Okh3heq2b2XIuhZqA1hlk5E1oIrD2qESJjiteKJDEFgjfzj6+Dr5YjoMAuaVflfFPt4JA8D6Nvun+oUKCoG0qslYhMvbA9OEw3HeDGU8fiwzjjFIMhJ5gDqsrRa9ezlI/5D0Y3c9XHOnCFpuqMPoiMaLj9WYE3JloOJTqlLz9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaCj/k8i; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6767677e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733308379; x=1733913179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppe03tUIW7WD8Jqhkp0U/tHsYLrNjJSJ37fXxnlfNqg=;
        b=UaCj/k8iFdO94LSP+swkAsBdEKHcEWw+/ZP99KesvvZ3izRrMowaGFxPSmuCk4Z4DR
         vgmczWXh5gXtWl0Vu6+/ZkGm9rqbUwap+9XA+N8FyK2LIEWZRIQUcGrULrnhCisvmeJC
         qIGiLpElLw5rsdTjebPLAIxG0WM4HSomku9JD3U+CmlzKx7J+6y8JrNVPDsxf0IVkJr1
         xj3cX+9GJ/dSt8M+SxsASCEMQIPfsw34wJIeAOBK5hbO3BO801QPaoDKDWvIHVYyNG8A
         KLkRZYGIlWK3VYImnrULLQ5V+h1kPJU324OUXJjRUaws6vsMRZ+yN20S60nfYh9+vi2n
         bAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308379; x=1733913179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppe03tUIW7WD8Jqhkp0U/tHsYLrNjJSJ37fXxnlfNqg=;
        b=o9Qi+SIO6QWrVVZSYAXCyzdiwaEzcCoDsFAk7g8fDSGSDC+0jQostTen9ZRLGUU1es
         jRsYnAQtWYLRBtAzCqHBaKXt5Iztkgp20fegyGxj/NYWYNKMAx0yaGsMfGmx5q21MOzw
         TbGGR5P7j3AzG1TYI+IWIkqu/VNJwtRZxAk/FAuEoR4wY9+DyghM1/9RzbSub4iE8/5m
         4ZNFC1J1l9g6Cgt5qvYYM1SQv6Nn/yyYx9BMJux3zm5u+AAF/nTRBqGLjBk1uo8Z2TpB
         WwBJTz9uRWo1UYcpKU41XTACD0sWeVsDLJ9wptZkWy3R8YLtKMtTyFBLg2aG7JtMBAvU
         TlMA==
X-Forwarded-Encrypted: i=1; AJvYcCWjyxs9wqR5pKgFBIxmqMzyW5kyGuPO23ngpnEdjKbBrcJuzYehvgkkZN9cYm/TqIrK4Zx7Ehp/VnVZhxMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+P/TQ3IHcpV1e6dji/eqba5l8V+KTuhEjj8sN1bHiDQIGx7N
	KN9MelKRO+D0V/2La+Tue0IowN5jyqLlJf70umnOO8kR4r/p9nVo32NFXzDnaqc=
X-Gm-Gg: ASbGncuLeU8wvcY8jmhj+GcgvVQIqJKMIA2DWLHDSJPae/iNSiZUxAHfVUfcjv8XgbD
	J1vB4jBRX7RYqTgj8ZwCeyVr1gQTdf+5FOFHfVQcYGDeeSB3GWIlwnbWeXO9oo5hW3HzbdIy82q
	Wg5M23q7UQYOhpcfDYWA8esbsIoNcEGnDOnztfIJ66N6ACl6ZaGZ0OpZWUSr6kK/AXu39Z7IVVL
	Yp46UFyPksWMZsEOWBqXiqu+sl9Pwp/wGv/Go3bGknFV7GYSHVFr+yGe2RR1jUcH6899dqDZaPA
	r3pY75quIGcVXu/RigmmVYBabjMhSw==
X-Google-Smtp-Source: AGHT+IHL92KqbDealhWN0qObA87bFxVW8RNuX5axtUU6JP1euGlIEGb+VzsyjLdTqiD4pqMh1UTrHg==
X-Received: by 2002:a19:5f05:0:b0:53e:12dc:e805 with SMTP id 2adb3069b0e04-53e12dce857mr2063012e87.45.1733308379303;
        Wed, 04 Dec 2024 02:32:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1cbef3a9sm190560e87.222.2024.12.04.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:32:58 -0800 (PST)
Date: Wed, 4 Dec 2024 12:32:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>

On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> > > The checks in msm_dp_display_prepare() for making sure that we are in
> > > ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> > > 
> > > DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> > > msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> > 
> > Can the state change between atomic_check() and atomic_commit()?
> > 
> 
> Good question.
> 
> I cannot deny that such a possibility does exist.
> 
> From what I can see in the state machine today, the only possibility I can
> think of here is if a user very quickly removes the cable as soon as they
> connect the cable like so fast that the connect was not yet processed before
> disconnect.

If the cable has electrical issues, it is possible even w/o user
intervention.

> 
> Similarly, if an irq_hpd fires after atomic_check but before
> atomic_enable(), and moreover if we hit the sink_count == 0 case in
> msm_dp_display_handle_port_status_changed() during this irq_hpd,
> 
> In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
> 
> Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
> case.
> 
> But other than this, I cannot atleast think of a case where a different
> state transition can happen between atomic_check() and atomic_commit()
> because for other transitions, I think we should be still okay.
> 
> But this is purely based on theoretical observation and hypothesis.
> 
> Is it better to add a check to bail out in the DISCONNECT_PENDING case?

I think so, please.

> 
> OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
> even if I add this check, I dont know if can make sure this can be validated
> as the check could never hit.
> 
> 
> > > 
> > > For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> > > there is an atomic_enable() without a prior atomic_disable() which once again
> > > should not really happen.
> > > 
> > > To simplify the code, get rid of these checks.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 992184cc17e4..614fff09e5f2 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		return;
> > >   	}
> > > -	state = msm_dp_display->hpd_state;
> > > -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > -		return;
> > > -	}
> > > -
> > >   	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > >   	if (rc) {
> > >   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

