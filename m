Return-Path: <linux-arm-msm+bounces-7885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1683874A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 07:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D5F21C222B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 06:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF80E5024B;
	Tue, 23 Jan 2024 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDFAXC7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A66FB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705991030; cv=none; b=e6uqL7YQjkNa+okzOMqB1WCxDHti5FIs4K88BO03gjV/p2DN1dUy/7wTU++8pQbu6HuAMYr7wQdrDs6z6PQ5G6p/FkpIfgsiOHIDmAC/fh/6FFilVNj5Dl3lVA756LBpDbDwy1YIB3+hIPHalcWLpEk4R8TiOV8xu8TAvokacGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705991030; c=relaxed/simple;
	bh=7WuyaHlE5zXhuxVaWnpwdo70Vp81yukPfArs5DsxNak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWb9K6IRLIhkGA7Zy9Bcddt1XYLK3Pjts7Qwwb1DJsedxXrzoCc2WBgMaKZ3rnqkA3lDhkqNOdxdluoHLqZ45H/EQEfg7/MeLNmyRAcM74AmwOWarUxPZLc/tU3e4WvtK3bm8RY7hPrNPBbU91BeDXhJZasREn+f6zX8YtszWRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PDFAXC7I; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff9adbf216so33077107b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 22:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705991028; x=1706595828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q10a65nOeuzWQYq/rqdY1dYbV4U7Emp0GE7K5TT2nbU=;
        b=PDFAXC7IGP3RYfEpgW/4mkMtM2GNKuIMHo6gEtOJa4iU+4IyvTx6AmyLLBOC8R1kBG
         gnSOJ9Enfi5MDnBQiosCN4XOdvuG43MGD0H73nsggnoWDnZUtXT1jK5OVH9RDyNyePZK
         XQS7O+c0ksbA+OSMpoAg0JrJ6fmGc4nCvl627NbdIRrI0guhm9P1Kdx7pzBBQg5ozZkI
         hWDJA/132cvzNYayvoHNqsz+sKOhkx4m/SsMpUmkrCWpE6fbIYXaS5JaVuslZu2NEs26
         1GfwpKRsN0CDI2B6lmgpMauZYfsp0KTMBbbPnEr7XcstHNpguXKcU7AK0G4Rjf9Pl228
         mrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705991028; x=1706595828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q10a65nOeuzWQYq/rqdY1dYbV4U7Emp0GE7K5TT2nbU=;
        b=wKtsE0JRUvyRhfHMaGWvOQO/GYrl81yLRrrHnkAI8Q2xp7KlifWTHE9b8iQHPqF7Oj
         omSh+pPtnEd7Zcwe2FUtPtYeTfLodYJ3xD1D5MBKSFhxa1XfXdFU9p5MFNByWhm8wkGV
         veyvuswy8Ew+GOjEeLCtqqZNHnnnpqoW33XQKybliQnD7Lps/uP7OCrnxOHKrFetB4S0
         9M9e6DkQO4cJjrP7YHoGMFoX5zmye4RQtmSkBdI24ID1NqA3Ox0yfzy5/EeWzGOxf8uR
         DCIHDI3DZvkBvH5xE5+j4knOfwybo6cWd+UQ95uGL2O+1QPgeVhDc6nZ9zXuQmJ1CPms
         Sw5Q==
X-Gm-Message-State: AOJu0YxguDb2+oWoQIkFZKthcMX3NG5sC4okcb8pwEOk8QPENog6kdvL
	HwSjPkW16e9FsS5WH5hBgSM40oSScg+5xG89quhiyjYiLSCyigbvbd7Oan87Snmmtx00+qq8I1/
	bcV7EjxMAB5VE5oEU08WMEovE0x2Owg5TpE2srQ==
X-Google-Smtp-Source: AGHT+IHojWdQNPRMKYfO/m1tZ+9E0Y2EjyizhhfEpvdUBqP/U5/pjTMhSJnd52qL/JRMfFvx3PuFRCMxfthbn17acP0=
X-Received: by 2002:a81:89c1:0:b0:5f7:d06c:7464 with SMTP id
 z184-20020a8189c1000000b005f7d06c7464mr4514994ywf.61.1705991028091; Mon, 22
 Jan 2024 22:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com> <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1> <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com> <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com>
In-Reply-To: <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 08:23:37 +0200
Message-ID: <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Brian Masney <bmasney@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 04:58, Trilok Soni <quic_tsoni@quicinc.com> wrote:
>
> On 1/22/2024 12:02 PM, Bjorn Andersson wrote:
> > On Mon, Jan 22, 2024 at 08:45:51AM -0500, Brian Masney wrote:
> >> Hi Dmitry,
> >>
> >> On Fri, Jan 19, 2024 at 10:35:43PM +0200, Dmitry Baryshkov wrote:
> >>> This kind of change sets a very bad precedent. This way old kernels
> >>> become incompatible with the updated firmware. For me it looks like
> >>> Linux kernel suddenly being unable to boot after the BIOS upgrade.
> >>> Generally memory map updates should be disallowed after the board hits
> >>> the production and the DT is published and merged. There can be other
> >>> users of DT. BSD systems, U-Boot. We spend sensible efforts in making
> >>> sure that DT is an ABI: newer kernel remain compatible with older DT
> >>> files. We expect the same kind of efforts from device manufacturers.
> >>>
> >>> I think unless there is a good reason, the memory map update should be
> >>> reverted on the Qualcomm side as a breaking change.
> >>> If this kind of update is absolutely necessary, it might be better to
> >>> define a new set of board files utilising the new memory map, marking
> >>> existing DT files as legacy.
> >>
> >> This is on a development board that's not in production yet, so
> >> personally I think this change is fine. It's in all of our best
> >> interests to have SoC vendors push their code upstream early, even if
> >> it means that later on we need to make memory map changes like this.
> >>
> >
> > The problem I have with the patch is that I don't know which precedence
> > it sets, because the commit message indicates that we have a new
> > firmware version, while Eric's report lacks this information.
> >
> > As long as everyone with access to the hardware agrees that breaking
> > backwards compatibility is the right thing to do, I'm not against it.
> >
> > But then again, if the support is under active development, why would
> > anyone run a stable@ kernel on this thing?
> > Or are you asking for it to be included in v6.8-rc, so that you guys
> > have a "stable" tree to do further development (with this patch) on?
>
> I agree with what Bjorn is mentioning here. Why we are freezing the kernel version
> here/commit of it here. Memory map can change during the active development
> and this target is under active development.
>
> New board file approach doesn't work - since how do you select the new
> board file? Both old and new board file will still point to the same
> platform type and version.

The developer knows which firmware version is used. So the user can
select the correct DT file manually. There is no need to pack all
files together.
Also it might be nice to bump the platform version when performing
such drastic changes.

>
> We also saw recently that IOT SOCs which are similar to in some
> sense Mobile SOCs are having the different map. The same almost
> same SOCs used in the different product segments like Chrome
> and Mobile and IOT can have different memory map as well. The good
> part there was that they had different soc-id and it will be easier
> to differentiate them.

Having device-specific memory maps is also fine.

>
> As Brian M mentioned earlier, we want soc vendors to submit the support
> for their SOCs and platforms on top it as early as possible and it means
> such memory map changes will continue. Even memory map changes
> continue even few months after the commercial s/w release in certain cases
> due to critical bugs were found in some usecases which warrants the changes.

So, can one handle such changes? Are we going to publish a list of
kernels to be used with the corresponding firmware images? Then what
if the developer wants to update just the kernel? Just to get this or
that non-platform-related feature. Or vice versa, what if the user is
stuck with an older kernel because some driver gets broken in the main
branch (which unfortunately happens sometimes)  Or what if the memory
map patch gets backported via the AUTOSEL process?
Unlike the Qualcomm binary distributions, the firmware and the kernel
version are no longer connected.

That's why I keep on saying that memory map is an ABI. If it gets
changed, it is a completely new, incompatible platform.

-- 
With best wishes
Dmitry

