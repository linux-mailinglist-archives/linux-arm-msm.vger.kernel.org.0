Return-Path: <linux-arm-msm+bounces-2294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85057FC013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 18:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B115B21444
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029FC59B72;
	Tue, 28 Nov 2023 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO0ba6G7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1464310F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 09:12:41 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db37c6a4d48so5580769276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701191560; x=1701796360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mgBZ8Y+rNOoLuSl7x3moNxTVYzOfvoDEGWK6S2+IbSQ=;
        b=yO0ba6G7PERYWwnOipYftnrlMUBpIL0l+XmZWDk1E1LWoJSC+4vjQGOs8zyl2idxbY
         RWVSrWDJ4XfUdTNdkCqNfHsyZC3cG89OBgflC6oYIIUuZohyE1TMmFhtTHCnyDtPKN/L
         p70PSkkCGHP8NQU7fcdYhSqXbS7SSESt2n1pJKvMHMBnSQSeLMy/a9kCehGbSUq2FIbz
         ADG3lPXxhy1084l6w/xc7ICo4gTqsN+H3bT6Mr0UCbonAa949g1BP5zu9wOTLjdw2AUo
         vu0xBRx5Q//omZWDa85WmrLo5RTpGT31Opf/tRuzYIA2ey6fnJOjjMHfOHtncmlTwuiw
         WosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191560; x=1701796360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgBZ8Y+rNOoLuSl7x3moNxTVYzOfvoDEGWK6S2+IbSQ=;
        b=nr4oHQmVTPQ4goK6To4nBPDjQWRQ3Zf6MmsN5vL6eEcOlkc7E2FxgxYLv9OEx2iuk+
         AYpMRgmi+gVKZ3Jklp5vr7ym9JGpR3ETGi7GIuaJJgmNhzY6G1bwNOxYqoZlpKhhxqCN
         Npe4mZFO5DzkR21UoIp90vqk2Wch/H3xMFfXydQmNRIywxewH9WFbjstD0rAFor76sLb
         zraDFtfr+lIPs5zeYMTZTFtTN0N+86Jb/kb7X09AF+AmQM7Hq+yq5S2r01pqlOxYcMO6
         vq0zUvzCNqxtr6JTr5secEi9ov8LD+scZxRMxdW9DfwdqOquojhyS9ozad1FmEjRbiso
         kXsw==
X-Gm-Message-State: AOJu0YygGQ+2eqIufZ+uWUJaOKXALYC5Ppx2kL3Fk4eXxsvtTMX4RQVK
	fmeFCu5UBbUf9Zlk6VNzzpMivu8mH9DFoBQFpizhWA==
X-Google-Smtp-Source: AGHT+IGeEkp7jRoTTCguYASiA5X3yJvWFiHTpeQCCzm04ulwl10C5sz2jB4Pa75elxnx/YrTQRyoZ1k8B5sJyf3OsLA=
X-Received: by 2002:a25:fc04:0:b0:d9a:6855:14cd with SMTP id
 v4-20020a25fc04000000b00d9a685514cdmr16604075ybd.39.1701191560067; Tue, 28
 Nov 2023 09:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org> <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
 <dce76a6e1321a6374ad39125bead56b3@kernel.org>
In-Reply-To: <dce76a6e1321a6374ad39125bead56b3@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 19:12:29 +0200
Message-ID: <CAA8EJpr9PDgSrTpP2-joQ09fxmJKZB1B+ESbDbMjkLNiqZ1m3A@mail.gmail.com>
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

On Tue, 28 Nov 2023 at 18:56, Michael Walle <mwalle@kernel.org> wrote:
>
> >> > DSI device lifetime has three different stages:
> >> > 1. before the DSI link being powered up and clocking,
> >> > 2. when the DSI link is in LP state (for the purpose of this question,
> >> > this is the time between the DSI link being powered up and the video
> >> > stream start)
> >> > 3. when the DSI link is in HS state (while streaming the video).
> >>
> >> It's not clear to me what (2) is. What is the state of the clock and
> >> data lanes?
> >
> > Clk an Data0 should be in the LP mode, ready for LP Data Transfer.
>
> Then this is somehow missing
> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>
>    A DSI host should keep the PHY powered down until the pre_enable
> operation
>    is called. All lanes are in an undefined idle state up to this point,
> and
>    it must not be assumed that it is LP-11. pre_enable should initialise
> the
>    PHY, set the data lanes to LP-11, and the clock lane to either LP-11
> or HS
>    depending on the mode_flag MIPI_DSI_CLOCK_NON_CONTINUOUS.
>
> So I don't think these three states are sufficient, see below, that
> there
> should be at least four.

Which one is #4?

>
> -michael
>
> >
> > I don't think we support ULPS currently.
> >
> >
> >>
> >> I'm facing similar issues with the tc358775 bridge. This bridge needs
> >> to release its reset while both clock and data lanes are in LP-11
> >> mode.
> >> But then it needs to be configured (via I2C) while the clock lane is
> >> in enabled (HS mode), but the data lanes are still in LP-11 mode.
> >>
> >> To me it looks like there is a fouth case then:
> >> 1. unpowered
> >> 2. DSI clock and data are in LP-11
> >> 3. DSI clock is in HS and data are in LP-11
> >> 4. DSI clock is in HS and data is in HS
> >>
> >> (And of course the bridge needs continuous clock mode).
> >>
> >> > Different DSI bridges have different requirements with respect to the
> >> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> >> > bridges (ps8640, tc358767 require for the link to be quiet during
> >> > reset time.
> >> > The DSI-controlled bridges and DSI panels need to send some commands
> >> > in stage 2, before starting up video
> >> >
> >> > In the DRM subsystem stage 3 naturally maps to the
> >> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> >> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> >> > the DRM call chain.
> >> > Earlier we attempted to solve that using the pre_enable_prev_first,
> >> > which remapped pre-enable callback execution order. However it has led
> >> > us to the two issues. First, at the DSI host driver we do not know
> >> > whether the panel / bridge were updated to use pre_enable_prev_first
> >> > or not. Second, if the bridge has to perform steps during both stages
> >> > 1 and 2, it can not do that.
> >> >
> >> > I'm trying to find a way to express the difference between stages 1
> >> > and 2 in the generic code, so that we do not to worry about particular
> >> > DSI host and DSI bridge / panel peculiarities when implementing the
> >> > DSI host and/or DSI panel driver.
> >>
> >> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> >> drm_bridge_funcs which is supposed to be called by the DSI host while
> >> the
> >> clock and data lanes are in LP-11 mode. But that is rather an RFC and
> >> me
> >> needing something to get the driver for this bridge working. Because
> >> it's
> >> badly broken. FWIW, you can find my work-in-progress patches at
> >> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
> >>
> >> -michael
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

