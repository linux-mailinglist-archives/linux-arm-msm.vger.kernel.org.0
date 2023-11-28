Return-Path: <linux-arm-msm+bounces-2290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C137FBFC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 17:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E773E1C209EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE7E4412;
	Tue, 28 Nov 2023 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+zuPUTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361D3D9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 16:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADB1C433C7;
	Tue, 28 Nov 2023 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701190560;
	bh=1/vAPR7lExHewwrt4YPc68Q6LJPmxu5gmOul2lvJVzA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d+zuPUTIO3bYfTQI4QyUZ91Mlnlso/RZ3PL/AjXCTMjuDLetnv7buSrxhhqVxNuiD
	 94MaNGJO4HeS4ANrmr0ROiio456pnMxdOgFCAeuhQb4ud1zj3djWrGPOjWPIxGEp/u
	 Vi3fKOUMMH6q7yIn9dAuEQAXmZ6fsJVUQaGcglHMbasqSW8PS015GOEpyPVWRKv+OX
	 b8Yn5iYoAPvqhVGz5fdZl1DWvOiL33R7bynp192P3e4I2ToVFhXKLWjh8bbtATVAsD
	 7LWknf0Uc0xmWZBUP+R4EsmnqihPFkfbqF/N1AyhbFd+0UUuWVjosOVTX901N4+1UX
	 R+8dfkg4hh3Bg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 17:55:53 +0100
From: Michael Walle <mwalle@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 dave.stevenson@raspberrypi.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, marex@denx.de,
 marijn.suijten@somainline.org, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, sean@poorly.run,
 tzimmermann@suse.de, tony@atomide.com, alexander.stein@ew.tq-group.com
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
In-Reply-To: <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
 <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
Message-ID: <dce76a6e1321a6374ad39125bead56b3@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

>> > DSI device lifetime has three different stages:
>> > 1. before the DSI link being powered up and clocking,
>> > 2. when the DSI link is in LP state (for the purpose of this question,
>> > this is the time between the DSI link being powered up and the video
>> > stream start)
>> > 3. when the DSI link is in HS state (while streaming the video).
>> 
>> It's not clear to me what (2) is. What is the state of the clock and
>> data lanes?
> 
> Clk an Data0 should be in the LP mode, ready for LP Data Transfer.

Then this is somehow missing
https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

   A DSI host should keep the PHY powered down until the pre_enable 
operation
   is called. All lanes are in an undefined idle state up to this point, 
and
   it must not be assumed that it is LP-11. pre_enable should initialise 
the
   PHY, set the data lanes to LP-11, and the clock lane to either LP-11 
or HS
   depending on the mode_flag MIPI_DSI_CLOCK_NON_CONTINUOUS.

So I don't think these three states are sufficient, see below, that 
there
should be at least four.

-michael

> 
> I don't think we support ULPS currently.
> 
> 
>> 
>> I'm facing similar issues with the tc358775 bridge. This bridge needs
>> to release its reset while both clock and data lanes are in LP-11 
>> mode.
>> But then it needs to be configured (via I2C) while the clock lane is
>> in enabled (HS mode), but the data lanes are still in LP-11 mode.
>> 
>> To me it looks like there is a fouth case then:
>> 1. unpowered
>> 2. DSI clock and data are in LP-11
>> 3. DSI clock is in HS and data are in LP-11
>> 4. DSI clock is in HS and data is in HS
>> 
>> (And of course the bridge needs continuous clock mode).
>> 
>> > Different DSI bridges have different requirements with respect to the
>> > code being executed at stages 1 and 2. For example several DSI-to-eDP
>> > bridges (ps8640, tc358767 require for the link to be quiet during
>> > reset time.
>> > The DSI-controlled bridges and DSI panels need to send some commands
>> > in stage 2, before starting up video
>> >
>> > In the DRM subsystem stage 3 naturally maps to the
>> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
>> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
>> > the DRM call chain.
>> > Earlier we attempted to solve that using the pre_enable_prev_first,
>> > which remapped pre-enable callback execution order. However it has led
>> > us to the two issues. First, at the DSI host driver we do not know
>> > whether the panel / bridge were updated to use pre_enable_prev_first
>> > or not. Second, if the bridge has to perform steps during both stages
>> > 1 and 2, it can not do that.
>> >
>> > I'm trying to find a way to express the difference between stages 1
>> > and 2 in the generic code, so that we do not to worry about particular
>> > DSI host and DSI bridge / panel peculiarities when implementing the
>> > DSI host and/or DSI panel driver.
>> 
>> For now, I have a rather hacky ".dsi_lp11_notify" callback in
>> drm_bridge_funcs which is supposed to be called by the DSI host while 
>> the
>> clock and data lanes are in LP-11 mode. But that is rather an RFC and 
>> me
>> needing something to get the driver for this bridge working. Because 
>> it's
>> badly broken. FWIW, you can find my work-in-progress patches at
>> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
>> 
>> -michael
>> 
> 
> 
> --
> With best wishes
> Dmitry

