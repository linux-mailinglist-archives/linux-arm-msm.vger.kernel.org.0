Return-Path: <linux-arm-msm+bounces-16920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5489DD0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6576B280D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75191131734;
	Tue,  9 Apr 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvrAYalZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E03130AE5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712673583; cv=none; b=pQiT0zBPtzjHcVw05hGy6Z+ujg0htxWDQYQpnIyjGM0WloL5Wc35+SAaYhuzEH66cp+VyrLAGMaH2qq0T/YSNUFMGnv8OySLE3qQ7inWeRTv2BAAylK1yNIC9X4FzZDo5NeGLMd7Zte8RECTw7OUwMQ58pk8pc0UG/4uiv634Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712673583; c=relaxed/simple;
	bh=rYRdF5eSZvDHg6P/v4LaA4shStXXiArZZpKdGUCyTq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9n4LeJshxLPs6/pqdJmuHyhFx2ZvBWclBV0N28unSN/9iWWqXKzoe1FiwWJog1Qxc9dW6J6U8XQXPUqZxDSfT5x8ITwJjtGQ1wxEH/CXwOtZKr2gFfp4fW2rOcxUMJY6DI16MEEU4fWS4haE2Fsz5WaN8Sbj1KB8yJ7vkJyESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvrAYalZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so5951077e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712673580; x=1713278380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sr9qt0BbADGa89YCYwT+Bbk+dGM/AHSN1tyvYdeWW7E=;
        b=CvrAYalZ7tKWU+Xa7Lmfm7mkZmwJpyAkx1B/SBNTWIm/8HqvppMWwhg37j3mZ8DenL
         KfFnyMpw/gDbHkc9K4aY9snbI+30RqNdM5C9sN/Y9G06DTAW6sWHIJ1oQU2TVbIVc1AU
         MoPNFStgk3GF/rG6k97JR0bSBxI6C56EYjMft8vO1THw/h+6HAAdfh85Z1zywVmU4mZq
         icz8VA8P46qYN2xI+jmKRvbWUDrJCHTvexQv3d33Zq3P4m9R/TOsrSajdSGWOLFES5a6
         t4KMVHBPMg08qsbCf3LdiH68z/vWSUJrYQ+7i9XkH2oZrj1JG6KsAcsKUqLjLHPGsxn7
         qVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673580; x=1713278380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr9qt0BbADGa89YCYwT+Bbk+dGM/AHSN1tyvYdeWW7E=;
        b=c+klJX3XNQ4akQOi5zI0ZqwmEE9HM40YbubpcmdJJuW4Rs8KD3L6cQ5LqBCUMccZln
         szA3FlUd7IlVENQ6kU1CwM8nBomCxZkDSxUg/zSZe1CDDVQkXXUum0FLXOSL2JoBBEFx
         HRzMp3kEzQ3G8N7CXoDWQ0HfxndXB6ONdt5knE1vxH9eAEEFMlivU937yFByuEKA07Zr
         vpIN1fXALvUzkzo/Z+kBLSiKXXPxnXkv+9GGnPHNi1w4kxOa5Y1TN2tpNHHksi6D1Xx1
         Rg6KfCMFVpb/InL86/72gk3a43ymJP11jkVMZbbw4zq073O2/hLIs6HybVGpf9wN6nZf
         Tj/g==
X-Forwarded-Encrypted: i=1; AJvYcCW9L5ZxXSgtw/vLEPhevW/ZeJhCTUnI6Qx2sv8jMpL3DLBK6gM7sMpdghPT4YJB3IFvs0wKSDFEG7WitX/BCTq8l49XrRSFIUap/zIylQ==
X-Gm-Message-State: AOJu0YxrdceWfLJpz69abdHs7TmVu2p/GvyTP8uGFHgB2byQqHjcSlK+
	iiVVA2xT3w+OFosFTYnffz9PKcCXKrYCcAeqK+PtisMMIl0PUhCzTAMJprdpdvM=
X-Google-Smtp-Source: AGHT+IFhmq1jH49fs/wNDP2DWefgXDYDOHbmwLUoOSnTyawe10DQy5StJWx9djPeA8rjMN8setjnjA==
X-Received: by 2002:ac2:59d0:0:b0:516:cd83:71ce with SMTP id x16-20020ac259d0000000b00516cd8371cemr7651841lfn.31.1712673579685;
        Tue, 09 Apr 2024 07:39:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id i16-20020ac25230000000b00513d13ede82sm1561676lfl.147.2024.04.09.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:39:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 17:39:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <d4gcj4dg5vv5wd72kj7lpzs5cy7b2a4gh4t4lixuigwfkpwt3s@4toc3fpqycwi>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
 <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
 <CAA8EJpp6Lc7sc5fnKp+O8TYdaywiE+dZ=YJin351s=r5rxi+Kw@mail.gmail.com>
 <covjipaso7bhgiifb62vdh24dpadr7kdypl2dleg7a2vc4jwjd@s4ci5xc6qpa3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <covjipaso7bhgiifb62vdh24dpadr7kdypl2dleg7a2vc4jwjd@s4ci5xc6qpa3>

On Mon, Apr 08, 2024 at 09:33:01PM -0500, Bjorn Andersson wrote:
> On Tue, Apr 09, 2024 at 01:07:57AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> > > > On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > >> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
> > > >>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> > > >>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > > >>> [..]
> > > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> [..]
> > > >>
> > > >> I will need sometime to address that use-case as I need to see if we can
> > > >> handle that better and then drop the the DISCONNECT_PENDING state to
> > > >> address this fully. But it needs more testing.
> > > >>
> > > >> But, we will need this patch anyway because without this we will not be
> > > >> able to fix even the most regular and commonly seen case of basic
> > > >> connect/disconnect receiving complementary events.
> > > >
> > > > Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> > > > the driver has proper detect() callback, there will be no
> > > > complementary events. That is a proper way to fix the code, not these
> > > > kinds of band-aids patches.
> > > >
> > >
> > > I had discussed this part too :)
> > >
> > > I totally agree we should fix .detect()'s behavior to just match cable
> > > connect/disconnect and not link_ready status.
> > >
> > > But that alone would not have fixed this issue. If HPD thread does not
> > > get scheduled and plug_handle() was not executed, .detect() would have
> > > still returned old status as we will update the cable status only in
> > > plug_handle() / unplug_handle() to have a common API between internal
> > > and external hpd execution.
> > 
> > I think there should be just hpd_notify, which if the HPD is up,
> > attempts to read the DPCD. No need for separate plug/unplug_handle.
> > The detect() can be as simple as !drm_dp_is_branch() || sink_count != 0.
> > 
> 
> What is detect() supposed to return in the event that we have external
> HPD handler? The link state? While the external HPD bridge would return
> the HPD state?

It should return the same: there is a sensible display attached. Other
drivers (and drm/msm/dp internally) use !branch || (sink_count > 0).

> If a driver only drives the link inbetween atomic_enable() and
> atomic_disable() will the "connected state" then ever be reported as
> "connected"? (I'm sure I'm still missing pieces of this puzzle).

I don't probably get the question. Nothing stops the driver from
accessing the AUX bus outside of the atomic_enable/disable() brackets.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

