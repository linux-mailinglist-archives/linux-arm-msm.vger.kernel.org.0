Return-Path: <linux-arm-msm+bounces-2289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F37FBF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E8CB20D95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22E058AD2;
	Tue, 28 Nov 2023 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YE4TZ7dK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCF41988
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:49:49 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-db510605572so666400276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701190188; x=1701794988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
        b=YE4TZ7dKjl7RDciYHKnpDYRuo3v3LkESmGNFvmNdIJr97utst1ZF0A8ey2wU891vtN
         bVojvgZCYqTyZvFTbg7O3Wu6zkUuRGimTJLki30Kd3Dzwi85DLCzPzYMyLhU6IaYWMzz
         H+zT19rWtoZxKmklAZFYvCGv8erYSYOgGXo548tEFLMltPKrD1P4RHOLTMbwNgdmOmLu
         /6BpLcuhwtZ6/+KEjGGhklRKd+xC7a2+cj7prOimVpEI4RARrrUWWowj10j7FoyaUuKa
         Bjv6xZVxgOGSorrD/cGnuGS0fhiprA+ZPhqQCpeuZaYSElu/JnZNtmuJbbWIScvi7xlO
         la+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190188; x=1701794988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
        b=D0kvwtcXGv3R2hvYlcDhoFawC48WI2SCdWyZfi3CBQ7tklOSqADO6wU0OG4NUGJSep
         Ht035xDKv6M7X1ma5uUbSwq4722OhPpPK/euKmqStUw7ImXNbqZoAddui3HT/6noovFm
         Boe9LmRkFCPWQc9xQEkX4GPVeiKElaPwnaMALG4Mnv18laxsz1Cr2EEYD8KNEY1iy1LZ
         hCJN7cP+zR7MZ1iMYEiNCFGngcn8cCwZdrHc9u52xNzTlUNi4KeNqBlsFul/nxT2fvvH
         lozvQ3hUnS0Ak6nGMqf6kVV1/udyfBCzYbxu3khlxQp/D4y0NRcrcnj0QM0HfGAyvGWs
         5jeA==
X-Gm-Message-State: AOJu0YwjyqYpKXnvSBQ3DHpagF9dJBzBLwbUmoosKvUDIkcrwqSAesQK
	QLTMEfG+VMfmuOjY0zrwYLzWPiDJctJpeWp1axzAoA==
X-Google-Smtp-Source: AGHT+IHvWlPlRTUJ/I2oNwEaIU1VT4yRPgec2UooToA0iRvEqgCTansBlFO5MCgGr8obm68fHQ3hfvqtxUtgQALcFMs=
X-Received: by 2002:a05:690c:3383:b0:5d0:57a6:5f21 with SMTP id
 fl3-20020a05690c338300b005d057a65f21mr7997955ywb.2.1701190188094; Tue, 28 Nov
 2023 08:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
In-Reply-To: <20231127160658.2164612-1-mwalle@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 18:49:36 +0200
Message-ID: <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Michael Walle <mwalle@kernel.org>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	dave.stevenson@raspberrypi.com, dianders@chromium.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marex@denx.de, 
	marijn.suijten@somainline.org, mripard@kernel.org, neil.armstrong@linaro.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, rfoss@kernel.org, 
	sean@poorly.run, tzimmermann@suse.de, tony@atomide.com, 
	alexander.stein@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 18:07, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> > DSI device lifetime has three different stages:
> > 1. before the DSI link being powered up and clocking,
> > 2. when the DSI link is in LP state (for the purpose of this question,
> > this is the time between the DSI link being powered up and the video
> > stream start)
> > 3. when the DSI link is in HS state (while streaming the video).
>
> It's not clear to me what (2) is. What is the state of the clock and
> data lanes?

Clk an Data0 should be in the LP mode, ready for LP Data Transfer.

I don't think we support ULPS currently.


>
> I'm facing similar issues with the tc358775 bridge. This bridge needs
> to release its reset while both clock and data lanes are in LP-11 mode.
> But then it needs to be configured (via I2C) while the clock lane is
> in enabled (HS mode), but the data lanes are still in LP-11 mode.
>
> To me it looks like there is a fouth case then:
> 1. unpowered
> 2. DSI clock and data are in LP-11
> 3. DSI clock is in HS and data are in LP-11
> 4. DSI clock is in HS and data is in HS
>
> (And of course the bridge needs continuous clock mode).
>
> > Different DSI bridges have different requirements with respect to the
> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> > bridges (ps8640, tc358767 require for the link to be quiet during
> > reset time.
> > The DSI-controlled bridges and DSI panels need to send some commands
> > in stage 2, before starting up video
> >
> > In the DRM subsystem stage 3 naturally maps to the
> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> > the DRM call chain.
> > Earlier we attempted to solve that using the pre_enable_prev_first,
> > which remapped pre-enable callback execution order. However it has led
> > us to the two issues. First, at the DSI host driver we do not know
> > whether the panel / bridge were updated to use pre_enable_prev_first
> > or not. Second, if the bridge has to perform steps during both stages
> > 1 and 2, it can not do that.
> >
> > I'm trying to find a way to express the difference between stages 1
> > and 2 in the generic code, so that we do not to worry about particular
> > DSI host and DSI bridge / panel peculiarities when implementing the
> > DSI host and/or DSI panel driver.
>
> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> drm_bridge_funcs which is supposed to be called by the DSI host while the
> clock and data lanes are in LP-11 mode. But that is rather an RFC and me
> needing something to get the driver for this bridge working. Because it's
> badly broken. FWIW, you can find my work-in-progress patches at
> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
>
> -michael
>


--
With best wishes
Dmitry

