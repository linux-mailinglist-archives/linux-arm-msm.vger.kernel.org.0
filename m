Return-Path: <linux-arm-msm+bounces-47226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE06A2D37B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 04:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF3E3ABA4E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1037416A395;
	Sat,  8 Feb 2025 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQuxsSbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B4A23
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985080; cv=none; b=BCWdMY/X65RUrYYBpWr8uSYD0fageWINCufM3J4cTU+zEZIchuYyg27PhB0yp+J4jOUBbkCyw63eCpylj9POenfWrwVXS/5RqCofMAzaqFccF5BzpZV91FRqC6yTxboG5hcQcyWNYnxfpVuB9xxv6JuSrwqYLJ+1qxX7sTlfFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985080; c=relaxed/simple;
	bh=thhMImcNjkBOZVN3411pEW3GYeb5l0VTXUUDiUnUpWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYBC0QaVjOIwXFnP/Uxgx5iRkl40vJRemKu1WidMdmFA+vMOKqAV49AJZk4ofrV7V4oL58jBbQIh9mZg/jKNg/Dng3dwnXikEkGgYSIJFkcJhpx8vfM3ogGwdPh09uBkI/jlC2pcOn0qXhB8OD5sGumS3rpscOvaCNESVg5NmKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQuxsSbU; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30229d5b21cso24505441fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 19:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738985075; x=1739589875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
        b=cQuxsSbUWSrGstyhWVkvDQ3KY2mQklY0+3v6MsbxbmMj8o9MBgViEIO6/YSIjaASnb
         HF1xmFtWamH2BPMk9Nmt0dnbioq9M3sSTB8Ec8sAFA0+F9WGX2DopJXG1wH2RXD2TSk+
         /u4SnctOF4HMvefgQ42H3NUaVaCNM2Q3L93KO1dRF/xfUMDUh6U/91JI56YELPSlp4ny
         7vnH7BBomWjGDAkSAA7a7ymqZGM339E5KQeBR6y6LZuKs2gR2R6nJpJ7Llsa16aZmAWn
         FehRxru9O2DOX9wXMcTYuNPLx/Qwg51nNU/Xx1Ty3exVNTG23Qstl4mLc3oqYxe1mWR2
         2Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738985075; x=1739589875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
        b=aFW306oMVQC7kXOuKk1hOrbV2D2YanCV4stONnkjNt8ikCTX2F+3qb+1ThTVEeQRCf
         FrvxS4+D7ICWCZpBV8nVR8XVeC0iBuiEOczyDoMCTCyZLOpPWKZ3rcvlYWQNRb1aisST
         6tpl8Q1xvH/0bBwRMF8P8TGaZdk5My26S+06D82lzkPZkL2nIyijxS4ZlsltWmBlKB4Z
         FJW89zL2HDUqzsjB05u0s/x9t0zpfs5Aepy0MiOvQJf3eEuCijIjVsiWM1o4W8uXvmnY
         ZBQZO72qKWq7x6741XzGNBQoZNsrGWmbZgTJAN7GndUFLj/K2nNoSLoHAc7IEjj/mj5k
         CWiA==
X-Forwarded-Encrypted: i=1; AJvYcCWpb4Kw1Q2HkiaKNlsMswq7Z5aaoY1ch73uLU8qXiWsXJtoTzcGPi21WIJSFmfd8eZljB/A6rj6JY6jHcv4@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5Ms7FU/19/hri1i1r3A+KyeUC0zcN/przt1Qh8EemMcCk3lQ
	mCwabaPlXiZNeZi9/flLWnzmJp+TmjhQ/Pys45dSNdqv4ZZE9ulz1JibcMjw7hY=
X-Gm-Gg: ASbGncsFG4TixI+KmlcWb+vBVK+xEalTng/FaPBoi94GGarnFcC7ydXukKTHmCzO2p9
	OhTgDfUHbO/QK/q9/5k+wHclMpXeRCZ9T1r8MuD4ZeW+J6xuvYD525yaifHK/qTw7wDGcDJ/kUW
	/WN2Llrkqvn/GMHf6NAN6KC99M2Jbq1AT05M5OyX2SE7jCSejc8b4b6oTGqn0LkAhrVoXS3zd01
	4t7BrnRJugzchz5EdDfHVtf+Sz6aqpVqzBTAzdKg9ft5gCRPnVofMlgufcjdcoPBR2EzL6TIPV6
	lE5WG4k7+ZWyAqkSEjDGqKJh9qpZ4CCxqLkRMdNQt1f+NdyxfDKStgYws1vkKYEgq3cIPYE=
X-Google-Smtp-Source: AGHT+IFydtUFynrK2gRpKzEKvd+/uEV8NSFd5so2WMhom1ky7+A67a+p0tJRz+0pk2ZePPqPbJ3Tsw==
X-Received: by 2002:a2e:a550:0:b0:306:1524:4a65 with SMTP id 38308e7fff4ca-307e57fed91mr19942481fa.20.1738985074455;
        Fri, 07 Feb 2025 19:24:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm6260441fa.48.2025.02.07.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 19:24:33 -0800 (PST)
Date: Sat, 8 Feb 2025 05:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <ry2jfdxhbogl42wbiajll5et5n2puvu46fn25v25qwpac7bbyu@wvhz3ijtfd56>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
 <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
 <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>

On Fri, Feb 07, 2025 at 07:05:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > > > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > > > 
> > > > While the HDMI block has special block to send HVS InfoFrame, use
> > > > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > > > that requires manual repacking in the driver, while GENERIC0 doesn't
> > > > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > > > HDR InfoFrame which we do not at this point anyway.
> > > > 
> > > 
> > > True that GENERIC_0/1 packets can be used for any infoframe. But because we
> > > have so many of them, thats why when there are dedicated registers for some
> > > of them, we use them to save the GENERIC0 ones for others.
> > 
> > True
> > 
> > > Lets take a case where we want to send HVSIF, SPD and HDR together for the
> > > same frame, then we run out as there are no HDR specific infoframe registers
> > > we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> > > HVSIF when we add HDR support?
> > 
> > Most likely, yes. That would be a part of the HDR support. At the same
> > time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
> > HDMI 2.x (once Linux gets support for that). At the same time we can not
> > use VENSPEC_INFO to send those.
> > 
> > I can imagine that the driver will have to switch GENERIC1 between HDR
> > (if required) and SPD (in all other cases).
> > 
> 
> We dont have to use GENERIC0 for HFVS infoframes. We have dedicated
> HFVS_INFO registers for those.

Ack, I have been checking the old (apq8064) chipset.

> 
> > > 
> > > Also from a validation standpoint, I guess to really validate this change
> > > you need an analyzer which decodes the HVSIF. So was this mostly sanity
> > > tested at this pointed to make sure that the sink just comes up?
> > 
> > Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
> > been validated (validated SPD, AUD, HVS and AVI frames).
> > 
> 
> Yup, vertex2 validation is perfect for this!
> 
> Overall, I am fine with this,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

