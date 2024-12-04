Return-Path: <linux-arm-msm+bounces-40168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2B9E31C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 04:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6D2BB27A89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 03:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427433A1B5;
	Wed,  4 Dec 2024 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VukSHNlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA3FC1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733281428; cv=none; b=TvdnEoj5v9od9etK3QjFuxw64vjpInqLe7TP+SEyWIf6nwusf/209O9t2AcCpQmxoQpZnlcQPVfaY0OWUHK2tesMa4iYd2h+il1UBe97CsLTtYr3ueBRLmtoKCeVF5CwPRInzbiEN0fqSiTsWy/IFsrBIKQduHYytn3yn2fCRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733281428; c=relaxed/simple;
	bh=fgTz9nUgN36pJrxvwLjwsa2qQatAA4azTOLT2xmXX8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndjQ0LGNbD2dkytgTR0sdbKQRNyNd3JOE7mgkiX+T/KcV55aCxdeH6cNa7AHNKPYhFD1ANsxSNe9b6SsyrxYIBAvqH1vIoqO64CtPMyfUiZqq8sB+0f29Ojw/RXaSdrlvf0bujwzpw9s68PuL07qhygVhebNl6c8olI+Wu+eQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VukSHNlT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de852a287so6963035e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 19:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733281424; x=1733886224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikLnrq2neiQXCnlo3R5J5faufHu5wG48WhuaguFzsfQ=;
        b=VukSHNlTy0CcJG2iNLVQziohKrgaT0WTK2Gqt8jVhP2RUf4AwI7mJoldgnWFqBp9YE
         KgIoV0ZYAzsoRq4BqAsKNAQiMDwkb0/IQKpmjDVWN8iImRcKIpxqq99YJx8S6Ry02O3P
         f2YmRzKDE4AwTRAiUjqBopW+4PZDX6f3d4+V3nFTzrpmjfZBvMqLm4IM/UD/IUynxsHc
         1mlmQRGVvRqgKKyiKRtebtLTCwDtUsCy9U5Qhnxarjr5ehJTisr8u7Obo4GysopxKGiG
         MJEslUOA3O/zRF4nG/cpKEHL2Qltb7nbozEm2ZHjqChnfOEd2NRGOyp0TS/7jGbnV9MC
         fO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733281424; x=1733886224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikLnrq2neiQXCnlo3R5J5faufHu5wG48WhuaguFzsfQ=;
        b=mxQFyWK/apZpur19mKJN+GKgSYCiCnLo2GKTgacZMYqfQG+qO/a7LJb22apk+EQ5j+
         Q146QEot1/eUPVSZdQ1L1eTthZm9t+aq4Up0Jjt5ECus9bzm4GBC3SEWi3uQefS2UWia
         eBlvwcmhewMh9PzZl1/day71vguWR4Y0DdMMQrzm20pL9/KYVwARlZL5BS6tbeRLjz8h
         AC4v9mJ72cuEZ6O5D4FX22u2eylzyVsROYtF/qvZdtuGqQD2x8PLLanSHcqA61Cke/SI
         E9p3Pt1Taa4iRfjTgeKRGneHgS8Ul71cZipqdYmSMniS+YIGTWkdXRjHrrSlQJg6+iG8
         GFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI1gVnbjuN5l7fTIV8cOmW8s5lnqci1WsdffDF4i1peii9ex3WNI/DLStksEbilwgXsEYc/FTE6O/Cabyj@vger.kernel.org
X-Gm-Message-State: AOJu0YzjXdt8rzj2uiECB2eirataFKRbBuV8Zh0JvoTAy4Hehw3Z8IBJ
	WCU9BIze3EIRt8Z5FJIEkBZi5rEP0kyYICEDIUEK+c7qEq7zXkNeiSYKhHLh9Ho=
X-Gm-Gg: ASbGnctXn/U3LNNGzs3OVDruXGMS/+4SYms9z4WSyLPqHkuFPJOlRn3UqsiAV+qaZOf
	f0ajbZ/VoJTcxDWrT6RiyRf+8E8NMk1RKCyNCAicxqHj2sKSi5Oh4UiIzrz6T1a02m0eMjabfKT
	kZ6/gXFRjjXcfdgx8XTCZgsBn1oSyViYECHcI4SKJsDvMfMftBYaZylFUKj0JLDt+gzTJUaWJqt
	+4Dt0NG+GfwqcQnG1XWligwvu/q18AYrijrrqKANK2cxf0+J5PV1u+5dbrYiXFNUh6ZKzCe3e+f
	iqYiDCeAiHX57pX/vFrfmdx8d5J8XQ==
X-Google-Smtp-Source: AGHT+IHvj3GK9mvvHsYxtJ/AYW0XXXhWSJ/ZzMycuoNBeFIBdIFiRzpwHVHkl0tRH7tUUn0ZNFCc4A==
X-Received: by 2002:a05:6512:2209:b0:53d:a264:f25a with SMTP id 2adb3069b0e04-53e1b8c11e5mr907942e87.47.1733281424214;
        Tue, 03 Dec 2024 19:03:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646efd9sm2067551e87.143.2024.12.03.19.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:03:42 -0800 (PST)
Date: Wed, 4 Dec 2024 05:03:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Message-ID: <evnnydsvr5ur7sl2lnahqo7ni6y5bwbdfkajhrmbues5uyeb2c@zym27uj553yy>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
 <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
 <41725f98-5c23-47d2-966b-ebd5f4e1c532@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41725f98-5c23-47d2-966b-ebd5f4e1c532@quicinc.com>

On Tue, Dec 03, 2024 at 06:36:45PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:50 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:39:00PM -0800, Abhinav Kumar wrote:
> > > In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
> > > checks were introduced to avoid handling any plug or irq hpd events in
> > > ST_DISPLAY_OFF state.
> > > 
> > > Even if we do get hpd events, after the bridge was disabled,
> > > it should get handled. Moreover, its unclear under what circumstances
> > > these events will fire because ST_DISPLAY_OFF means that the link was
> > > still connected but only the bridge was disabled. If the link was untouched,
> > > then interrupts shouldn't fire.
> > 
> > What about the link being untouched, but the monitor being toggled
> > somehow, which might generate HPD / attention events?
> > 
> 
> To confirm my understanding of this, I tested this case again with and
> without a dongle on sc7180.
> 
> Without a dongle - When the monitor is powered off and powered on, without
> physically disturbing the cable, it still generates a hotplug disconnect
> event when powered off and hotplug connect event when its powered on again.
> 
> It gets handled the same way as a user would hotplug it using the cable.
> 
> With a dongle - When the monitor is powered off , nothing happens and it
> stays in connected state. When the monitor is powered back on, it generates
> a hotplug disable followed by hotplug enable event. This behavior is
> consistent with or without this series with this dongle.
> 
> So from the DP driver point of view, for both these cases, its just another
> hotlplug disconnect/connect.
> 
> Both these cases still work fine with these changes.

Thanks for the confirmation!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > > 
> > > Even in the case of the DP compliance equipment, it should be raising these
> > > interrupts during the start of the test which is usually accompanied with either
> > > a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
> > > to handle these anyway. In the absence of a better reason to keep these checks,
> > > drop these and if any other issues do arise, it should be handled in a different
> > > way.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
> > >   1 file changed, 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index aba925aab7ad..992184cc17e4 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
> > >   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> > >   			dp->msm_dp_display.connector_type, state);
> > > -	if (state == ST_DISPLAY_OFF) {
> > > -		mutex_unlock(&dp->event_mutex);
> > > -		return 0;
> > > -	}
> > > -
> > >   	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
> > >   		mutex_unlock(&dp->event_mutex);
> > >   		return 0;
> > > @@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
> > >   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> > >   			dp->msm_dp_display.connector_type, state);
> > > -	if (state == ST_DISPLAY_OFF) {
> > > -		mutex_unlock(&dp->event_mutex);
> > > -		return 0;
> > > -	}
> > > -
> > >   	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
> > >   		/* wait until ST_CONNECTED */
> > >   		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

