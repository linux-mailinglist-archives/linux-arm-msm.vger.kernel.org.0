Return-Path: <linux-arm-msm+bounces-23468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F491157F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452ADB20EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4EE7E799;
	Thu, 20 Jun 2024 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZMydTXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC93A1CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718921827; cv=none; b=A37+EjOFepKimUATO9qInV2jSXslU6IvQmELkEaKFa2kPFFGjjasUfCg5srPiXcpnYGjGrMYxeFd+kyl+fBBl6szcE56lHnnqT0MUALbyIuWXQjAUlbuc+Ym/kuCY2gjhD1TS0IffiQk8mUZYtgJ4yyeJHNyhgrafphuCeR47ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718921827; c=relaxed/simple;
	bh=kfw1yLN+QRSOwj3b9gkGVMCB9C1YIzlL/GDA9CWAVxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKk1L4ouyxUuzL1VbdgaUIahxEk806d8z9eMwNPnsPAHX4W6yYyznrZt4ReZNR/ck2it5ix9C78e/S6g8kuYPe4IOUK0nU51yg9lmctXye+o2XBYk8FnfTqqvAaFRECIASjMxJnApyP6sxg4LOYoR8q5zRBwsLNEyhYY/jM1RdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZMydTXX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec10324791so15474161fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718921823; x=1719526623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgRdH6j7DUCb+zgLlAkqo1mbZKrdFkN7NmGemmI69Mo=;
        b=LZMydTXXliVSSdHz91VcJJ3/p5yzIeiLsKOXtHHdzADHDjh0JgK9DmhOiFiO0qy56o
         0sKkWrg927SZabE3Jz/cRgvrZ4JBXK/a4T3hRscziQdicAoP71yLZ1Rxk1cq2g+TrfZq
         uKPH03Gv+YkObN2w4I4rAC68rx9kLwbckBbnqTgp0FtQRSGIbXRJ0sofbADcmJ4D0KAS
         FemFpxyYfe6YYB/2ldH2MTg/2w1G/sG1zUWTyYLgR3QjHr4zm5C4UhnXCXcyz56Jvr6T
         6OLP++oI6CMXnPFNaskUoPOkZVGKRqzG76XKfH280qNyf3V1W4wqqaJyyGgXEYdL9Cws
         GVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718921823; x=1719526623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgRdH6j7DUCb+zgLlAkqo1mbZKrdFkN7NmGemmI69Mo=;
        b=O7ImWCZVqQLHTOjX7jDP253TC/B+MzH6k2R7lJOxrnUCXAE+qH8EKPLO+8CY1ZHPnW
         UyIVAfgYmBbMRadzgkbBupuZ7YiU1uZr0CR7IopitBzQrkqz+p9W88hqcWhIFzqRf92z
         S5PWgh8k44wCe9vD7yXWMznLlHIGLlYikXONcvxU7s9TGRPKA++LTFJiU2mgcgBRT1hT
         laGVxR1nKL/ESDvVPdwzWXc6tsrEXHE8UtBRpkW/SH6Lj1vwNnU3Ke3eWVuj2w02r90F
         +tadHG7A2RN6qZrw+1kIyLmUjFSt40X8YTDX7Hk9LuNH4mLMxcq3mTMKYj3Ef2xgEUS0
         yzTw==
X-Forwarded-Encrypted: i=1; AJvYcCVYG0K4GBCDf6qS1TbP4JRFcUc5iXxmDta8NqHJ0fnUksPw7EVHrFgbCG3Rf17jBkTIdBpqSgheHbAxllHpV8wvbJ6RLQajzwt0p8n6TQ==
X-Gm-Message-State: AOJu0YwBSs2Avv0FHAs1aGr91Q40Pxc0ScWldyirdmE+DaekqQ8YLUDr
	/0EARrxMPwUXg99U+3XKaGafxqh93ykFQZcBgeGpGvSCSqrtHVi5Z8K7hFJqUKEO7apTlpuWWEG
	itDI=
X-Google-Smtp-Source: AGHT+IE93loPZY8t+qpr1EOLX6L8UuNIadiY+NRCLEISi9+lkOYFgSNULvv5TbnvPEp081aaMmtqTg==
X-Received: by 2002:a2e:b0f6:0:b0:2ec:1f9f:a879 with SMTP id 38308e7fff4ca-2ec3cecae0fmr43261131fa.31.1718921823111;
        Thu, 20 Jun 2024 15:17:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d708862sm409371fa.35.2024.06.20.15.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:17:02 -0700 (PDT)
Date: Fri, 21 Jun 2024 01:17:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Message-ID: <hj5xktzlbcrrbqsz2l3men5gmawzeszusixryhjbhm4g7gej7q@tcqvslat4wy4>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
 <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
 <6d416e1a-1069-8355-e9f3-d2732df081a3@quicinc.com>
 <il2bg6bsu4nu4lpztzwo2rfonttiy64grxcsn7n4uybn3eui77@jxyzd744ksva>
 <8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com>

On Thu, Jun 20, 2024 at 03:05:16PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/20/2024 2:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 20, 2024 at 01:49:33PM GMT, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 6/20/2024 1:32 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> > > > > > The mode_set callback is deprecated, it doesn't get the
> > > > > > drm_bridge_state, just mode-related argumetns. Turn it into the
> > > > > > atomic_enable callback as suggested by the documentation.
> > > > > > 
> > > > > 
> > > > > mode_set is deprecated but atomic_mode_set is not.
> > > > 
> > > > There is no atomic_mode_set() in drm_bridge_funcs. Also:
> > > > 
> > > 
> > > Please excuse me. I thought since encoder has atomic_mode_set(), bridge has
> > > one too.
> > > 
> > > > * This is deprecated, do not use!
> > > > * New drivers shall set their mode in the
> > > > * &drm_bridge_funcs.atomic_enable operation.
> > > > 
> > > 
> > > Yes I saw this note but it also says "new drivers" and not really enforcing
> > > migrating existing ones which are using modeset to atomic_enable.
> > 
> > Well, deprecated functions are supposed to be migrated.
> > 
> 
> Along with rest of the pieces of the driver :)

Step by step :-)

> 
> > > My concern is that today the timing engine setup happens in encoder's
> > > enable() and the hdmi's timing is programmed in mode_set().
> > > 
> > > Ideally, we should program hdmi's timing registers first before the
> > > encoder's timing.
> > > 
> > > Although timing engine is not enabled yet, till post_kickoff, this is
> > > changing the sequence.
> > > 
> > > If this really required for rest of this series?
> > 
> > No, it was just worth doing it as I was doing conversion to atomic_*
> > anyway. I can delay this patch for now.
> > 
> > Two questions:
> > 
> > 1) Are you sure regarding the HDMI timing registers vs INTF order? I
> > observe the underrun issues while changing modes on db820c.
> > 
> 
> Yes this is the order I see in the docs:
> 
> 1) setup HDMI PHY and PLL
> 2) setup HDMI video path correctly (HDMI timing registers)
> 3) setup timing generator to match the HDMI video in (2)
> 4) Enable timing engine

Thanks!

> 
> This change is mixing up the order of (2) and (3).
> 
> > 2) What should be the order between programming of the HDMI timing
> > engine and HDMI PHY?
> > 
> 
> Mentioned above.
> 
> > What would be your opinion on moving HDMI timing programming to
> > atomic_pre_enable? (the exact place depends on the answer on the second
> > question).
> > 
> 
> So
> 
> -> bridge->pre_enable() : Do HDMI timing programming
> -> encoder->atomic_enable() : Do timing engine programming
> -> post_kickoff() does timing engine enable
> 
> This matches the steps I wrote above.
> 
> Hence this is fine from my PoV.

Ack, I'll skip this patch for now and repost it separately (moving the
code to pre_enable function).

> 
> > > 
> > > > > 
> > > > > I would rather use atomic_mode_set because moving to atomic_enable() would
> > > > > be incorrect.
> > > > > 
> > > > > That would be called after encoder's enable and hence changes the sequence.
> > > > > That was not the intention of this patch.
> > > > > 
> > > > > NAK.
> > > > > 
> > > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
> > > > > >     1 file changed, 26 insertions(+), 7 deletions(-)
> > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry

