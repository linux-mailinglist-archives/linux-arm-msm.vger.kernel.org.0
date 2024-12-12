Return-Path: <linux-arm-msm+bounces-41861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6F9EFFDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691322870E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6E81DE88E;
	Thu, 12 Dec 2024 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7WH40rX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1B1D63E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734044958; cv=none; b=Y/3/CRm4NYJW/y28FrlxsAehLr6LPknItiOmxEtDtUaEjskpV9aEYdL7AOi/xgcW++9oCLt5X2tTqX38JMgU0M84xJfUFfbRrchNspnWYEh5WEp6MkWryS7d1gkRw4t6PWJxnHqtC71TDDIboXpaPfLhDtBizP8KIxfNO77to7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734044958; c=relaxed/simple;
	bh=ZtGRVjWu7hIuyLA1YVHzxJL4fJb2ycJLPtR85i4lkXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjxxTLkXkgslgVTEoqPjtxbWTXJ8j5mgoExa8d6xW37HspJJ3mhVNqBLjwCu9QgqmUZdWwUYvGZCXY7i/bZuBrxqXJBusUzOwxJ8jNDBA1q+bA5/L3e1eHavLdL8Czm77cZn1cgkhnTV0+NqQTRgJpZHe0rXhB/pv0EC35UbnuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7WH40rX; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f26c517979so9241277b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734044955; x=1734649755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M2mAuDdfqzmhuIxLZhpZDU5e13JDY/yUDIGNA64wKaQ=;
        b=c7WH40rXlOqKWPVxKRtv0tNFyn0rJfpn+WAHfUQr4HAP8zJCn4HMHJIU/10qbkbdaC
         qcBvP6EoRe/5n3/0GdlpJaD3+BIMhrPu3O54A14++1GdTGlNaY412dSnyKA/xGws8xLO
         I58Y6WQTY2JpwifYHj7Bek/s3oa/NdAZ2K8GP/kNItvKKiL60JbGy3BThG4UjBG/tUGo
         nGtXaqKRaGj3F/ad079J50l7acHOfmhYvhdLeJ07cUnI3LrHg6343FFuw4hI1M7LU9uW
         ejXLs3bWaMo53VLApuUhLt+iVqOICCLbMQk0eEF2c7j2Fvp0CB8eAzM27+135bStBm2Y
         /vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734044955; x=1734649755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2mAuDdfqzmhuIxLZhpZDU5e13JDY/yUDIGNA64wKaQ=;
        b=j0hBejUG6JUcYOgmt+RLrTaLLFOluGQD3o2wtpjP833e4LPXh/K0noQ9jJfpDL/Z1J
         p/Ppxvij6gybMuZcn4jkkDAh9qB8JiRWQYUkYj8KTkxVAI6V2MkmUgyd+xpoBjyEdaof
         a53ChcpFbf6a074UfrqN6ZfGG1im+nvP5ChWNkCFuuADlmuz36P/TIZvM7GoKJbnXZsF
         mOVdw9ZMnVAcTtUgqI6zMkZh4tbk4/uNbdHZ++10TKkihwEitSCkBNHmcEZ4iwyIPXM9
         7qaY8iSMnFO2cswFux0qS3yLze4z/DoKM3wtMeZojYKjP3IX7S3jshXO2pCl4u8HRCjl
         DzxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUYKMc75AZuIasOE48UWa64MlLYP0LEUc6mZTwIgYm5dbMYhtt2JnadJnp/s88dFi5jrycMmwJVfbWcNlc@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVbICWU7LqqDSmj1RS/QtV4kcWWDOHjxoydknROLX3PAMXFtV
	eXnvTnw3CuUcQRS4CstVGtpH5xavu58X5Pw7jkx72Z6wpn5Yah4jHIPfw9xu3THK5znj6ny/8oI
	j3BKHhcW+fnHomKtNwb76c/UDO650KPYWo0lTPQ==
X-Gm-Gg: ASbGncv8JYtHuTtwvvUvPBa6LIBOYCU2c0jlyAou9kq6PKQ/09BKRJfG6E9Xv+sSZHl
	SCFj9dsNFHQBr361aeioZZdnHmg6MpL2Ny2xl5g==
X-Google-Smtp-Source: AGHT+IFKUAXxa88JQH4JGbekPkCmlZeZiyClOGnz/LKQS8V8q+s7v0QnjiNirPoM726x+yvYkFyKFBjTEjqFdm6cVIg=
X-Received: by 2002:a05:690c:6303:b0:6ef:4a57:fc98 with SMTP id
 00721157ae682-6f279b018b3mr4806717b3.16.1734044954669; Thu, 12 Dec 2024
 15:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org> <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
 <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com> <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
In-Reply-To: <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 01:09:07 +0200
Message-ID: <CAA8EJppyNceC+t-2MKqq1QhCj2cYb+jprc++cFEen8Cqhhbo0w@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 12:52 AM, Dmitry Baryshkov wrote:
> > On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>> Having I/O regions inside a msm_dp_catalog_private() results in extra
> >>> layers of one-line wrappers for accessing the data. Move I/O region base
> >>> and size to the globally visible struct msm_dp_catalog.
> >>>
> >>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
> >>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
> >>>    2 files changed, 197 insertions(+), 272 deletions(-)
> >>>
> >>
> >>
> >> Fundamentally, the whole point of catalog was that it needs to be the
> >> only place where we want to access the registers. Thats how this really
> >> started.
> >>
> >> This pre-dates my time with the DP driver but as I understand thats what
> >> it was for.
> >>
> >> Basically separating out the logical abstraction vs actual register writes .
> >>
> >> If there are hardware sequence differences within the controller reset
> >> OR any other register offsets which moved around, catalog should have
> >> been able to absorb it without that spilling over to all the layers.
> >>
> >> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
> >>
> >> Then the reset_ctrl op of the catalog should manage any controller
> >> version differences within the reset sequence.
> >
> > The problem is that the register-level writes are usually not the best
> > abstraction. So, instead of designing the code around dp_catalog I'd
> > prefer to see actual hw / programming changes first.
> >
>
> So thats the issue here. If we did end up with registers and sequences
> different for controller versions, the ctrl layer was expected to just
> call a reset() op for example similar to the DPU example you gave. And
> as you rightly noted, the dpu_hw_xxx files only expose the ops based on
> version and the upper layers were supposed to just call into the ops
> without knowing the register level details. Thats pretty much what
> dp_ctrl tried to do here. We did not want to expose all the register
> defines in those layers. This series is doing exactly opposite of that.

We don't have the issue up to now, even though we support DP
controllers since SDM845 up to SM8650 and X1E80100. The SDE driver has
v200 vs v420 catalog files for PHY programming, the rest of the
functions are common. So, for me it looks like a preparation for the
imaginary case that didn't come to existence up to now.
So, yes. I want to get rid of extra useless indirection and I want to
expose register sequences in those layers.

>
> >>
> >> We do not use or have catalog ops today so it looks redundant as we just
> >> call the dp_catalog APIs directly but that was really the intention.
> >>
> >> Another reason which was behind this split but not applicable to current
> >> upstream driver is that the AUX is part of the PHY driver in upstream
> >> but in downstream, that remains a part of catalog and as we know the AUX
> >> component keeps changing with chipsets especially the settings. That was
> >> the reason of keeping catalog separate and the only place which should
> >> deal with registers and not the entire DP driver.
> >>
> >> The second point seems not applicable to this driver but first point
> >> still is. I do admit there is re-direction like ctrl->catalog
> >> instead of just writing it within dp_ctrl itself but the redirection was
> >> only because ctrl layers were not really meant to deal with the register
> >> programming. So for example, now with patch 7 of this series every
> >> register being written to i exposed in dp_ctrl.c and likewise for other
> >> files. That seems unnecessary. Because if we do end up with some
> >> variants which need separate registers written, then we will now have to
> >> end up touching every file as opposed to only touching dp_catalog.
> >
> > Yes. I think that it's a bonus, not a problem. We end up touching the
> > files that are actually changed, so we see what is happening. Quite
> > frequently register changes are paired with the functionality changes.
> >
>
> Not exactly. Why should dp_ctrl really know that some register offset or
> some block shift happened for example. It only needs to know when to
> reset the hardware and not how. Thats the separation getting broken with
> this.

Yes. And I'm removing that separation very intentionally. If one is
looking for AUX programming, they should be looking into dp_aux only,
not dp_aux & dp_catalog. Likewise all audio code should be in
dp_audio. By using dp_catalog we ended up with a very very very bad
abstraction of msm_dp_catalog_audio_get_header() /
msm_dp_catalog_audio_set_header() / enum
msm_dp_catalog_audio_sdp_type. Just because reads & writes should go
through the catalog.
For dp_panel likewise there is no need to look into some other source
file to follow the register sequences. It can all be contained within
dp_panel.c, helping one to understand the code.

Last, but not least. Code complexity. dp_catalog.c consists of 1340
lines, covering different submodules. It is hard to follow it in this
way.

>
> > For example (a very simple and dumb one), when designing code around
> > dp_catalog you ended up adding separate _p1 handlers.
> > Doing that from the data source point of view demands adding a stream_id param.
> >
>
> I have not checked your comment on that series here but if your concern

This is really a bad cadence. I have provided most of the feedback
almost a week ago.

> is stream_id should not be stored in the catalog but just passed, thats
> fine, we can change it. stream_id as a param is needed anyway because
> the register programming layer needs to know which offset to use. This
> series is not mitigating that fact.

No, my concern was that you have been adding separate _p1() functions
which are a duplicate of _p0() counterparts. When one looks at the
dp_catalog.c it is logical: there are two different register areas, so
there are two distinct sets of functions. If one starts looking from
the dp_panel point of view, it's obvious that there should be a single
msm_dp_write_stream() function which accepts stream_id and then
multiplexes it to go to p0 or p1.

>
> > In the DPU driver we also have version-related conditionals in the HW
> > modules rather than pushing all data access to dpu_hw_catalog.c &
> > counterparts.
>
> The dpu_hw_catalog.c and the dp_catalog.c are not the right files to
> compare with each other. dp_catalog.c should be compared with
> dpu_hw_xxx.c and as you noted, DPU version dependencies are handled in
> those files only and not all over the files like what this series is doing.

Not really. dpu_encoder_phys_cmd_init() checks for the core_major_ver.
Let me see if other files check for the version under the hood.

Also as you wrote, there are multiple dpu_hw_xxx.c files, each
handling register issues on its own. We don't have a single file which
keeps all such differences in one place.

Last, but not least, in the DPU driver there are actual differences
between generations, which require different code paths. In the DP
driver there are none.

>
> > I think it's better to make DP driver reflect DPU rather than keeping
> > a separate wrapper for no particular reason (note, DPU has hardware
> > abstractions, but on a block level, not on a register level).
> >
>
> Thats the issue here. DPU hardware blocks are arranged according to the
> sub-blocks both in the software interface document and hence the code
> matches it file-by-file. DP registers are grouped by clock domains and
> the file separation we have today does not match that anyway. Hence
> grouping link registers writes or pixel clock register writes into
> dp_ctrl is also not correct that way. Let catalog handle that separation
> internally which it already does.

I'd say, dp_panel, dp_audio and dp_link are already pretty
self-contained. I was hoping to look at dp_display vs dp_drm later on,
once the HPD issue gets resolved. Only dp_ctrl is not that logical
from my point of view.

-- 
With best wishes
Dmitry

