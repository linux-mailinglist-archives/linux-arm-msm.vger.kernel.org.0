Return-Path: <linux-arm-msm+bounces-42420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4489F3E31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35E4216E1CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFD21D63E9;
	Mon, 16 Dec 2024 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxgCtd6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114241D63C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 23:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734391466; cv=none; b=Y4XPRfVy7eQXlJQclrhybifSxZ9mJxjIFJVS4KrY+3vGo/wghLt2IZcM/671bawAoyNGKHMzLTr/03MLnZFSpYvWARTQBfDyokJTSP5QGn0mXdLSQPxu5DvRBWmyNflylgYwQbr8LvK//jBBcIZIeDhzZrBYYA3ghbCbtTcxcFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734391466; c=relaxed/simple;
	bh=OiR4+hdWXzodg4IGgORqeJG6mdSFx0bVko7/1bKA8OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZa7s1zgfDtrtq02v1DG7F2eYb+L5ZB1q7naLQhslNm3IgdSIMx7H3BKq0n0spPQwZI8+AmvrPQdBROQpsjoumkU5Z3fXpcROCGHjeSCyiD2At7XUJQH3ZF/rkhPJInGtT94HC6tPi+t28p1bERrGp+IclR61lOGD/sDKfcJ2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxgCtd6N; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so4783464e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 15:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734391462; x=1734996262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d2rf2aNBycQkqqEpsH+XCLSNdixlru/WLCsKGG9aC4=;
        b=zxgCtd6NaPUwJptDm7GcmSadRdiQEYM47y7lbDINeOMnr+3hdA1Sra/JOBOzA1Hqrg
         9OrJBSs4fkvkhI3y2x0TN3Ejyvg0JoMtImAe/Ta9ovaLbgXfBOYTmrJRVRQRdoRUgosn
         +UEgB02B+jdtmlkZUNwCAzptBlfp3KhNDNlnOIT1UO79wpn037++BOTct/L5rCii6aTT
         n6AP+dHieSkwn7ag0x6xI8pvHi32L6SC5RSmAkgkZ0yFMXL/UUdjOqXuLdWhtV1jst2y
         9q2p391dB+RfZ54++oEwHTLJNsefOV35Hi+dxccE+1Gqt4V2vsowskYwqw5XxPywRb43
         b4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734391462; x=1734996262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d2rf2aNBycQkqqEpsH+XCLSNdixlru/WLCsKGG9aC4=;
        b=MREkWzSbI61098xPjKn3y8DTYVAjeI5lRcEfIP690+d49vzw4Xmfoc6Kp2FnoBMudV
         JwpFqMocr6DGvCZ/h34y1RI1efoCj6yFoQcPU6Lk1U8c5HWslAf5ebHoDEkRa1Oueirg
         LHJIK01EF6bgRGynMPperijaeDMoKEULoXqgqXJM3hwPF32qakks0/+CrBJ7IffWKqfX
         V/gHT3WGrOsCgbrhrOvovXe3yQUKFrozBqsqN9a6NbNWpYvfEN6Q2QNsukdrThKdHSPe
         9gOeNGuNaUscnNDDW3Mq3Q6M/nT81WSNrax6q4KxOOotgpkB9Zp8cMYcYySrsROXJ2rN
         BaJw==
X-Forwarded-Encrypted: i=1; AJvYcCVy5+B9sClJpJguOaGHGXQrnJH0xqxDdtvCyL+rhc9Nh4cnHJzMi3VIzNJ5C/t3f15sn3Hpg6PNLyStupa3@vger.kernel.org
X-Gm-Message-State: AOJu0YxdyNryxfr+sGMT0xsSKpTstomB+mw6Kxyx9Fb0JmcTxv9uT0hQ
	8P1191j1Ke8nZvuGa2Dgoso+j0BecOM1CK6bvRogAIVkVgYxWoHqssSRUb8Af4k=
X-Gm-Gg: ASbGncta7EhX+N1K2X4zH1zcWgTIOIQdUBVfSXlCF508qu+1gkzIgZeTDOhFMUfioFM
	i46cGUt9MXgRbKaL+EwhKk8JBGhzsvQVG/soCCZM2xyZsX6+CrMtfXpDCT4cxbAs35IWyFIpYMh
	PswIn4csPN5TGMtCVb1pkx8HKlt011puBvhL2ULt3L8fA/3l1jlAYmiq/6yckO4sxX03vMSeykg
	Ccik4gMHkWeITO/NR0ID8G2k/eVGCdsUi3HtFhU4BAlyuOnX67iS4bC3tLDSd3mwndGqeQ1R83L
	Xs6ircgQDL8ilZj7037BqymwwxaNg87o5dGH
X-Google-Smtp-Source: AGHT+IHdIjEdSsa2sUjJmegZv6cwUM/4it3l18LUo8lodNgP20ohJ/gjjjtjj/lKnZnU7r14iuee9A==
X-Received: by 2002:a05:6512:1094:b0:540:358e:36b9 with SMTP id 2adb3069b0e04-540905a6f6dmr5254157e87.45.1734391462045;
        Mon, 16 Dec 2024 15:24:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f5f3sm974050e87.21.2024.12.16.15.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:24:20 -0800 (PST)
Date: Tue, 17 Dec 2024 01:24:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
Message-ID: <u3763wvxpnbykwwgthrn5ubsi3p56wi7pketmuggjvgdgf5t4r@dud2t4bdivba>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org>
 <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
 <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
 <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
 <CAA8EJppyNceC+t-2MKqq1QhCj2cYb+jprc++cFEen8Cqhhbo0w@mail.gmail.com>
 <459e59b1-1212-4a93-89cd-f5a2e062543e@quicinc.com>
 <CAA8EJpqaigaJmHJB73doAxwWMWXDHS4Drs0R0w=YEtZ3iZkWcw@mail.gmail.com>
 <3be2e15c-9dfd-4521-a1cf-99a0c502686b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3be2e15c-9dfd-4521-a1cf-99a0c502686b@quicinc.com>

On Mon, Dec 16, 2024 at 12:45:13PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/14/2024 2:05 PM, Dmitry Baryshkov wrote:
> > On Sat, 14 Dec 2024 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > Hi Dmitry
> > > 
> > > On 12/12/2024 3:09 PM, Dmitry Baryshkov wrote:
> > > > On Thu, 12 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 12/12/2024 12:52 AM, Dmitry Baryshkov wrote:
> > > > > > On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > > > > > > > Having I/O regions inside a msm_dp_catalog_private() results in extra
> > > > > > > > layers of one-line wrappers for accessing the data. Move I/O region base
> > > > > > > > and size to the globally visible struct msm_dp_catalog.
> > > > > > > > 
> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
> > > > > > > >      drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
> > > > > > > >      2 files changed, 197 insertions(+), 272 deletions(-)
> > > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Fundamentally, the whole point of catalog was that it needs to be the
> > > > > > > only place where we want to access the registers. Thats how this really
> > > > > > > started.
> > > > > > > 
> > > > > > > This pre-dates my time with the DP driver but as I understand thats what
> > > > > > > it was for.
> > > > > > > 
> > > > > > > Basically separating out the logical abstraction vs actual register writes .
> > > > > > > 
> > > > > > > If there are hardware sequence differences within the controller reset
> > > > > > > OR any other register offsets which moved around, catalog should have
> > > > > > > been able to absorb it without that spilling over to all the layers.
> > > > > > > 
> > > > > > > So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
> > > > > > > 
> > > > > > > Then the reset_ctrl op of the catalog should manage any controller
> > > > > > > version differences within the reset sequence.
> > > > > > 
> > > > > > The problem is that the register-level writes are usually not the best
> > > > > > abstraction. So, instead of designing the code around dp_catalog I'd
> > > > > > prefer to see actual hw / programming changes first.
> > > > > > 
> > > > > 
> > > > > So thats the issue here. If we did end up with registers and sequences
> > > > > different for controller versions, the ctrl layer was expected to just
> > > > > call a reset() op for example similar to the DPU example you gave. And
> > > > > as you rightly noted, the dpu_hw_xxx files only expose the ops based on
> > > > > version and the upper layers were supposed to just call into the ops
> > > > > without knowing the register level details. Thats pretty much what
> > > > > dp_ctrl tried to do here. We did not want to expose all the register
> > > > > defines in those layers. This series is doing exactly opposite of that.
> > > > 
> > > > We don't have the issue up to now, even though we support DP
> > > > controllers since SDM845 up to SM8650 and X1E80100. The SDE driver has
> > > > v200 vs v420 catalog files for PHY programming, the rest of the
> > > > functions are common. So, for me it looks like a preparation for the
> > > > imaginary case that didn't come to existence up to now.
> > > > So, yes. I want to get rid of extra useless indirection and I want to
> > > > expose register sequences in those layers.
> > > > 
> > > 
> > > Yes because PHY programming is managed in the PHY driver today and does
> > > not go through catalog whereas in SDE driver it does, I do not have any
> > > other concrete example to give you which exists in the current code
> > > where sequence changes across chipset variants for DP controller and
> > > since I certainly cannot discuss how things can evolve moving forward,
> > > as usual, I have to accept it as one of those things which is not used
> > > today. So yes, I guess the register sequencing point changing across
> > > chipset variants, does not have a good example which I can really share.
> > > 
> > > But exposing register sequences within the same file, I am not too sure
> > > about that. For example, you can take a look at
> > > dp_catalog_panel_config_hdr in the SDE code OR even
> > > msm_dp_catalog_panel_enable_vsc_sdp in the current upstream code. Why
> > > should this entire sequence be exposed to the dp_panel layer?
> > 
> > Why not? The dp_catalog_panel_config_hdr() is a bit tough, we don't
> > implement similar functions currently. For
> > msm_dp_catalog_panel_enable_vsc_sdp() this is also a logical sequence:
> > configure GENERIC0, write the package to GENERIC0, indicate presence
> > of the VSC SDP. I really don't see why this should go to a separate
> > file.
> > 
> 
> We have to plan for hdr for sure. its not an imaginary use-case.
> 
> msm_dp_catalog_panel_enable_vsc_sdp() does a bunch of things, packing the
> size, programming the SDP and triggering the update. dp_panel does not need
> to know all these details.
> 
> There are many other examples. Take a look at
> msm_dp_catalog_ctrl_mainlink_ctrl(). from the dp_ctl standpoint, all it
> needs to know is it needs to program the mainlink_Ctrl() at some point, it
> really does not need to know the full sequence of doing that. Thats the
> abstraction getting lost with this.
> 
> > > For smaller functions which are one-liners the redirection seems
> > > redundant but when the sequence is bigger like in the examples I gave,
> > > the logical Vs register sequence separation grows. Thats where the
> > > dp_catalog came from.
> > > 
> > > 
> > > > > 
> > > > > > > 
> > > > > > > We do not use or have catalog ops today so it looks redundant as we just
> > > > > > > call the dp_catalog APIs directly but that was really the intention.
> > > > > > > 
> > > > > > > Another reason which was behind this split but not applicable to current
> > > > > > > upstream driver is that the AUX is part of the PHY driver in upstream
> > > > > > > but in downstream, that remains a part of catalog and as we know the AUX
> > > > > > > component keeps changing with chipsets especially the settings. That was
> > > > > > > the reason of keeping catalog separate and the only place which should
> > > > > > > deal with registers and not the entire DP driver.
> > > > > > > 
> > > > > > > The second point seems not applicable to this driver but first point
> > > > > > > still is. I do admit there is re-direction like ctrl->catalog
> > > > > > > instead of just writing it within dp_ctrl itself but the redirection was
> > > > > > > only because ctrl layers were not really meant to deal with the register
> > > > > > > programming. So for example, now with patch 7 of this series every
> > > > > > > register being written to i exposed in dp_ctrl.c and likewise for other
> > > > > > > files. That seems unnecessary. Because if we do end up with some
> > > > > > > variants which need separate registers written, then we will now have to
> > > > > > > end up touching every file as opposed to only touching dp_catalog.
> > > > > > 
> > > > > > Yes. I think that it's a bonus, not a problem. We end up touching the
> > > > > > files that are actually changed, so we see what is happening. Quite
> > > > > > frequently register changes are paired with the functionality changes.
> > > > > > 
> > > > > 
> > > > > Not exactly. Why should dp_ctrl really know that some register offset or
> > > > > some block shift happened for example. It only needs to know when to
> > > > > reset the hardware and not how. Thats the separation getting broken with
> > > > > this.
> > > > 
> > > > Yes. And I'm removing that separation very intentionally. If one is
> > > > looking for AUX programming, they should be looking into dp_aux only,
> > > > not dp_aux & dp_catalog. Likewise all audio code should be in
> > > > dp_audio. By using dp_catalog we ended up with a very very very bad
> > > > abstraction of msm_dp_catalog_audio_get_header() /
> > > > msm_dp_catalog_audio_set_header() / enum
> > > > msm_dp_catalog_audio_sdp_type. Just because reads & writes should go
> > > > through the catalog.
> > > 
> > > No, I think this is where there is some correction needed. the
> > > get_header() / set_header() was done not because all writes need to go
> > > through catalog but because the audio headers were thought to be written
> > > only one header at a time and we had thought that read-modify-write had
> > > to be done to preserve the bytes. And when we have to do only one header
> > > at a time and because two headers map to one register, catalog had to
> > > end up managing an audio_map. Now, after checking where it came from as
> > > I commented on that patch, this requirement was not a functional one but
> > > was just trying to preserve the pre-silicon validation scripts sequence,
> > > this part of it can be dropped. So no need of get_header() /
> > > set_header() and an audio_map. Now all registers going through catalog
> > > is another thing which we are still discussing here.
> > 
> > You've skipped the msm_dp_catalog_audio_sdp_type enum (which was
> > explicitly mentioned). It is an abstraction which in my opinion also
> > isn't required, but it clearly comes from dp_catalog.
> > 
> 
> msm_dp_catalog_audio_sdp_type was needed only till the map was needed as it
> was made with an intention of trying to re-use the sdp_map layout for
> different packets. So its still tied to the fact that we needed a map. After
> dropping the map, this can be dropped too as you already did.

I'm not sure if I understood what you've meant by the sdp_map layout
re-use.

> 
> 
> > > 
> > > > For dp_panel likewise there is no need to look into some other source
> > > > file to follow the register sequences. It can all be contained within
> > > > dp_panel.c, helping one to understand the code.
> > > > 
> > > 
> > > > Last, but not least. Code complexity. dp_catalog.c consists of 1340
> > > > lines, covering different submodules. It is hard to follow it in this
> > > > way.
> > > > 
> > > 
> > > Its just a question of spreading up the functions all over, not reducing
> > > code complexity. So yes, it reduces the file size of dp_catalog whereas
> > > increases that of others. Code complexity impact due to that is subjective.
> > 
> > The main issue is that dp_catalog now contains unrelated sets of
> > functions. That's code complexity.
> > 
> 
> dp_catalog was never meant to be a place where we have related functions. It
> was supposed to provide the register space abstraction and hiding away the
> details from rest of the layers. Going by what you are saying even the APIs
> in dsi_host.c should be related but they are not because of the same reason.
> I think this series went too far in terms of what it was trying to achieve
> trying to clenaup even useful things. Audio map removal was a problem tied
> to the fact that that read-modify-write behavior was preserved. That was
> removed after we identified its background. No issues with that. but beyond
> that, this is too much of a rework. I will let other developers chime into
> this. But I am not too fond of this one.

Sure. It seems the important parts have been reviewed in the next
iteration, so we can land those. Stephen, one of DP reviewers / expers,
seems to like the remaining patches.

> 
> > > 
> > > > > 
> > > > > > For example (a very simple and dumb one), when designing code around
> > > > > > dp_catalog you ended up adding separate _p1 handlers.
> > > > > > Doing that from the data source point of view demands adding a stream_id param.
> > > > > > 
> > > > > 
> > > > > I have not checked your comment on that series here but if your concern
> > > > 
> > > > This is really a bad cadence. I have provided most of the feedback
> > > > almost a week ago.
> > > > 
> > > 
> > > Yes, was a very tight week trying to enable upstream developers to land
> > > their platforms such as QCS615 by fixing platform specific dpu things
> > > and had the fixes cycle this week too so as a result my own feature took
> > > a bit of a hit this week :(
> > > 
> > > > > is stream_id should not be stored in the catalog but just passed, thats
> > > > > fine, we can change it. stream_id as a param is needed anyway because
> > > > > the register programming layer needs to know which offset to use. This
> > > > > series is not mitigating that fact.
> > > > 
> > > > No, my concern was that you have been adding separate _p1() functions
> > > > which are a duplicate of _p0() counterparts. When one looks at the
> > > > dp_catalog.c it is logical: there are two different register areas, so
> > > > there are two distinct sets of functions. If one starts looking from
> > > > the dp_panel point of view, it's obvious that there should be a single
> > > > msm_dp_write_stream() function which accepts stream_id and then
> > > > multiplexes it to go to p0 or p1.
> > > > 
> > > 
> > > Your multiplexing suggestion of adding a msm_dp_read_pn/msm_dp_write_pn
> > > by passing a stream_id can be done even with current dp_catalog intact
> > > as it will help reduce storing the stream_id in the dp_catalog. So its a
> > > valid suggestion and can be implemented even in the current code and not
> > > tied to the fact that register writing is done in dp_catalog or dp_panel.
> > 
> > It can. The point was about the implementation logic, not about the possibility.
> > 
> > > 
> > > > > 
> > > > > > In the DPU driver we also have version-related conditionals in the HW
> > > > > > modules rather than pushing all data access to dpu_hw_catalog.c &
> > > > > > counterparts.
> > > > > 
> > > > > The dpu_hw_catalog.c and the dp_catalog.c are not the right files to
> > > > > compare with each other. dp_catalog.c should be compared with
> > > > > dpu_hw_xxx.c and as you noted, DPU version dependencies are handled in
> > > > > those files only and not all over the files like what this series is doing.
> > > > 
> > > > Not really. dpu_encoder_phys_cmd_init() checks for the core_major_ver.
> > > > Let me see if other files check for the version under the hood.
> > > > 
> > > 
> > > Well, thats because only cmd mode panel cares about TE. No other files
> > > from what I checked.
> > 
> > I've sent a series which refactors feature bits into core_major_ver.
> > Now HW revision is being checked inside dpu_encoder_phys_wb.c,
> > dpu_kms.c and dpu_rm.c. And I didn't refactor SSPP, which would bring
> > similar checks to dpu_plane.c and possibly dpu_vbif.c
> > 
> 
> We will evaluate it on its merits / demerits as usual and decide.

Sure :-)

> 
> > > 
> > > > Also as you wrote, there are multiple dpu_hw_xxx.c files, each
> > > > handling register issues on its own. We don't have a single file which
> > > > keeps all such differences in one place.
> > > > 
> > > 
> > > Thats because of the way the registers are laid our in the SW interface
> > > document aligns nicely with the file split we have in the DPU even when
> > > the first DPU post happened.
> > > 
> > > But I still dont think its a fair comparison.
> > > 
> > > If you really had to go deeper into this thought, then even dp_reg.h
> > > should be broken down into smaller headers because the offsets in
> > > dpu_hw_*** files are relevant only to those files but after this change
> > > all DP files must include dp_reg.h even though they will not be using
> > > all of the offsets. Since current code was already doing that, which it
> > > didnt have to as dp_Catalog was the only one writing all registers, this
> > > went unnoticed.
> > 
> > Well... I had a thought about reworking DP into using XML files to
> > describe registers. It will make it slightly cleaner and
> > self-documented, but it most likely will be a single file.
> > 
> 
> It being in a single file is leaning towards the same model we have right
> now. If dp_regs.h is remaining one unified file, I dont see why dp_catalog
> can stay as well.

It is typical to have a single file with the full register information.
MDP5 for example also has a single register file.

> 
> > > 
> > > 
> > > > Last, but not least, in the DPU driver there are actual differences
> > > > between generations, which require different code paths. In the DP
> > > > driver there are none.
> > > > 
> > > > > 
> > > > > > I think it's better to make DP driver reflect DPU rather than keeping
> > > > > > a separate wrapper for no particular reason (note, DPU has hardware
> > > > > > abstractions, but on a block level, not on a register level).
> > > > > > 
> > > > > 
> > > > > Thats the issue here. DPU hardware blocks are arranged according to the
> > > > > sub-blocks both in the software interface document and hence the code
> > > > > matches it file-by-file. DP registers are grouped by clock domains and
> > > > > the file separation we have today does not match that anyway. Hence
> > > > > grouping link registers writes or pixel clock register writes into
> > > > > dp_ctrl is also not correct that way. Let catalog handle that separation
> > > > > internally which it already does.
> > > > 
> > > > I'd say, dp_panel, dp_audio and dp_link are already pretty
> > > > self-contained. I was hoping to look at dp_display vs dp_drm later on,
> > > > once the HPD issue gets resolved. Only dp_ctrl is not that logical
> > > > from my point of view.
> > > > 
> 
> Not from the point of view of the register separation of what belongs where.
> Its just a subjective opinion of what belongs where. Different developers
> can view it differently.

Even from the register separation point of view: it's better to separate
the AUX and p0/p1 functions rather than keeping them in the dp_catalog.c
together with the rest of the unrelated functions.

Note, that dp_link.c also uses dp_reg.h though it doesn't use dp_catalog
at all.

-- 
With best wishes
Dmitry

