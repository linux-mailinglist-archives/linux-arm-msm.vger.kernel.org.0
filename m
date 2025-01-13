Return-Path: <linux-arm-msm+bounces-44863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108EA0B234
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8371D1888CC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D18E238748;
	Mon, 13 Jan 2025 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnxbHdXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A99623A57A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758887; cv=none; b=bvn4B7ldxnjfInEgk3KC1KaCGlSatSBv/KNylIp00IGU5McE/pk5JjvgXi3VgyQJJz4pm3w0eXNTh3biBy62/canAVKeQ36/G5ZwtzX/hrS9tGhGVx4ufII0i7w1FHceJ8hBoqbH+sGBYMGk8pYjpKsmdzNnf1AlV2kZiFIaa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758887; c=relaxed/simple;
	bh=jJG0xAhnRxrlqSXC0s8oK1s9WkQdQHBiigxYYy4CBv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXCTZd+PPQDvRdZ5bs6i79os00NvX7Q2YPqCedltuaPrAO9UAiAgFQbozYVuLZ6LRQeMR1LGQBXUZF0pyct5tAf5+alxJIzqFnSVg2/503dVRy1sDW4nBRI4upIsi7Enp2cfWPfo/h2yL2TsBxX2G5ggST3gWAmFH8oqqcvU2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnxbHdXJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-540201cfedbso3640578e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 01:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736758883; x=1737363683; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVmv06UiciOif9n0zEXjWMnBVceV6C66Mfpmv3QehtQ=;
        b=PnxbHdXJDba5Y67+s++EOnwDsSm/chgmEYXr0EtkHHJ3GkWIl3l/s2D9+FDdXcRfu6
         z/WVHVysxiTUxpD+r31+T5Fkl17/5Clr0/l4RCPuHwz6InzwrKdTScJ7eaghpmT9H3vE
         djcGwV6wJN14JfpiFcqJ/MsDqXK52g2v8TvgJEvz8sCtGrAtrqFVlHP0IuU/tvHNu52Y
         vIUDwWIow8+Bj5Ay+Xq2XuqS5i8zXiVeutzQqgdqasHF1iUqFbuWEdswB/KZ/jSwAuu5
         /oUb+gNrw60uhCfFLTDwXt+eojOYrZHaHNN18CQTzSjWNWba7qNQen6tkf0Q5fT/Y5el
         4zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758883; x=1737363683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVmv06UiciOif9n0zEXjWMnBVceV6C66Mfpmv3QehtQ=;
        b=B9VwjW5Kv3ukf5Nj7rFFxCxEwhfu8JLRJyhAK7g1lfv86qlxNzrSoZM03z5My0nnPz
         icvTspo8vydM6AhLVHPvkvgDHlMShEmlyDZzZp2NPUtO4XXO8RY8RSBDNrhCZxQiW4UA
         lKKJLskjmiQ2YSyJdktqsyamc1aDjze1ERM/2stYrgDP52beMnejm/8BnGa7BaQw5CNQ
         eo0d/SCLwBOavqy3TU6MHMoNR/ZzhcfPH/q/FOH8ZRFvMUI3B6NuvZ1YBDH9eqHLoUXs
         mgXJSA0U8m7KKXm/kWVBj3OnY7T4qx05/SfizicouL/8lo5gXXkCqahWPHKZttdlLV3K
         IkYA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3OoiEsVnWw07HUQgxZMkagG7U3vD4alrV5RNPlKedY3aJO87ndzvqx9oCSIN/3fIMwsFXioKjDbBdDVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74w5nrv7iRzGEII0hNV9Jfzw0PkMmPig4P1EwGAn0rZ3qe+Q/
	itQ5EbMa49jLW1VvR7GfGYCjw8LdVhAyNvC5s3Hrx5BHDgGnJm/yIqRQf2iMSsI=
X-Gm-Gg: ASbGnct8Q+Xzjssb8mcDH3wnKvXWe+BTG06cQCvnIn431soU7twkZUb+95c+fHuYM00
	CXNJeNUexZ8T6SEPpsIFfQQ6s5P5v4MphRTiigYmHkeh6wCybY+7NiH6SwLpV7OD3ITe6Ln3KYD
	4lHqAfEHjahMawNtOyLBrczZJb9dZOKyfXkhjkoo3gQk85TZo86snPKaLyYegDsavwqn+za5jwy
	zgQ/R9SHGnfsbxmgDXEKLu2KS0iFyjvsE/nskV0YOCPA3VALx79VKWWFHVUfPn5tS9u5v5F2vnm
	MnbX5/aFQzzNiVX5RBuXGwWjzr4+Ihn7upCx
X-Google-Smtp-Source: AGHT+IGcTFUXjIwHW9lpVqJAyyIcRCFXMgiGOEb3ziE970UiReLi1TBQykdVRRw2foBrKdh4TrGJCQ==
X-Received: by 2002:a05:6512:2214:b0:542:29e5:731c with SMTP id 2adb3069b0e04-542844f649cmr6246866e87.11.1736758883364;
        Mon, 13 Jan 2025 01:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49d7esm1279018e87.19.2025.01.13.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:01:22 -0800 (PST)
Date: Mon, 13 Jan 2025 11:01:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "maxime@cerno.tech" <maxime@cerno.tech>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "michel@daenzer.net" <michel@daenzer.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, 
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "sean@poorly.run" <sean@poorly.run>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, 
	"fshao@chromium.org" <fshao@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jani.nikula@intel.com" <jani.nikula@intel.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <4getu2xtlxudcy53emipvtfxjnxg2mrupwfcekdjizjdtbk3k7@nlii76skfuh4>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
 <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
 <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
 <20250113-melodic-cuckoo-of-experience-bb6ac7@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-melodic-cuckoo-of-experience-bb6ac7@houat>

On Mon, Jan 13, 2025 at 09:28:36AM +0100, maxime@cerno.tech wrote:
> Hi Dmitry,
> 
> On Wed, Jan 31, 2024 at 12:28:59PM +0100, Daniel Vetter wrote:
> > On Wed, Jan 31, 2024 at 12:26:45PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > > > > >
> > > > > > External email : Please do not click links or open attachments until
> > > > > > you have verified the sender or the content.
> > > > > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > > > Hi Maxime, Daniel,
> > > > > > >
> > > > > > > We encountered similar issue with mediatek SoCs.
> > > > > > >
> > > > > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > > > disabling
> > > > > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > > > > drm_atomic_wait_for_vblank() is set to true.
> > > > > > > As the result, we are not actually waiting for a vlbank to wait for
> > > > > > our
> > > > > > > hardware to close the cursor plane. Subsequently, the execution
> > > > > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > > > > buffer. This can lead to use-after-free issues with our hardware.
> > > > > > >
> > > > > > > Could you please apply this patch to fix our problem?
> > > > > > > Or are there any considerations for not applying this patch?
> > > > > >
> > > > > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > > > > land
> > > > > > it.
> > > > > >
> > > > >
> > > > > Got it. I would add tested-by tag for mediatek SoC.
> > > > >
> > > > > > I'd be _very_ happy if someone else can take care of that ...
> > > > > >
> > > > > > There's also the potential issue that it might slow down some of the
> > > > > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > > > > think
> > > > > > all the drivers where this matters have switched over to the async
> > > > > > plane
> > > > > > update stuff meanwhile. So hopefully that's good.
> > > > > >
> > > > >
> > > > > I think all the drivers should have switched to async plane update.
> > > > >
> > > > > Can we add the checking condition to see if atomic_async_update/check
> > > > > function are implemented?
> > > >
> > > > Pretty sure not all have done that, so really it boils down to whether we
> > > > break a real user's use-case. Which pretty much can only be checked by
> > > > merging the patch (hence the requirement to get as many acks as possible
> > > > from display drivers) and then being willing to handle any fallout that's
> > > > reported as regressions for a specific driver.
> > > >
> > > > It's a pile of work, at least when it goes south, that's why I'm looking
> > > > for volunteers.
> > > 
> > > I can check this on all sensible msm generations, including mdp4, but
> > > it will be next week, after the FOSDEM.
> > > 
> > > BTW, for technical reasons one of the msm platforms still has the
> > > legacy cursor implementation might it be related?
> > 
> > Yeah, msm is one of the drivers I had to change with some hacks to avoid
> > really bad fallout. It should still work like before, but that's one that
> > definitely needs testing.
> 
> Since it looks like you're in a mood to deal with kms reworks vs msm, we
> still have this one to address too :)

And of course this has falled of my radar into the memory blackhole. I
will take a look in one of the forcoming weeks, thanks for the reminder.

-- 
With best wishes
Dmitry

