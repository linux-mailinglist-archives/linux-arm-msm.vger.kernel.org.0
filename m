Return-Path: <linux-arm-msm+bounces-8286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B083CAAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873661F27CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 18:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D1A1350CE;
	Thu, 25 Jan 2024 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DAuVUQIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5C81350E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706206647; cv=none; b=hh0e5CMJu4PRRZIg13pR1JEQmnAPFIbeqmZx6kMcg34BuEbcP/srCWdcnVTsXUh+C8HVc7tGaJ9UxwDidaUGTU9tfA59pYF/rgq0NP/Y2FKtMD2BwEGaf/WBg+Zs3jiHjWSXbyYhKRZKNB1zmd+rxdq2MI6Lv3NmIWb98CvduQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706206647; c=relaxed/simple;
	bh=fTH89TljylnA1PFABuOshml81dj6cKrkIPb4PGGYlC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciVbjeUdCGjoi2+kEeEuPWwWCvlpsk8FBFl0D5aVJAZmn3e13Gy8iQISp0a7WP22I6FImsjJUgSibAos4eJONPA7L+6+PwEnuMncoU0TT/0GipaDY4q6MklGJ5EwitFwKoEuWP3Z4Hm53pBOKg9CB/J36FW6xCjcF6mNdTT5wF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=DAuVUQIo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a27e7b70152so186490666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706206644; x=1706811444; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
        b=DAuVUQIooh7k9SH4DjCLVVGnJGB7h7IAArZMSV32YaaSfOYdF6U+o2Bi8S01iVuN+H
         O5Ni/NsmY/brjIPSrvB/Sx5KM/vXbEchMV7euTsAn9PVyeMqxqYY6Up3Qb/oFodVhuSu
         hmmcWUgC+NaAdCEo3swZPzvRJZhAsg94uXr+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206644; x=1706811444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
        b=jBcITqsHAEA/MsPctPIhY5LBNfKgTcn25H1jX1eyEA5y1ll80nItOCROkm204xVF4U
         qBJ6PSy7T+J1EvbOn4jvwruPmrEyIFsnVkxZszspaL2/EZv6uhVDSD+068555ywgtdPY
         qjqTd8KSqJbJKIQVwHCtGQJ6Otlpbdv2en0ilES1hluZ4tHLl+1FSfAy73PjNBhSGzHo
         kh0PiEKcwDuNKnpiBr2CbqjwNlXUok0Y1lRdPXUTHTqXbcG5mO6TBoonZWaXAAyM2lSb
         CgZVNiX2VOkn4f3lzMLc6b+WdvBu6OAjO0Mf75MA4HK1m9CJU1k34DGk4HPucaLfTR9N
         lT+w==
X-Gm-Message-State: AOJu0YxNsSj6K0jPFey9DbqKR9KZ1s4CCSd2+6iL0JJu+EcBQfBvtlom
	i0SiRYb3DEPpzfe5TlcemUvKSfaVRnTCymV4lrl2C63mGlfaybZsDRxJd52fujI=
X-Google-Smtp-Source: AGHT+IFFgR3FnuKNaxcbSF/D45iFGEkVO7DwIYkEGMWwJWTauy+SOrnz8WOVHQePtLtXFKX663PQaQ==
X-Received: by 2002:a17:906:a2d6:b0:a31:7e9c:60bf with SMTP id by22-20020a170906a2d600b00a317e9c60bfmr23085ejb.0.1706206643807;
        Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id tl15-20020a170907c30f00b00a3186c2c254sm765083ejc.213.2024.01.25.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Date: Thu, 25 Jan 2024 19:17:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "maxime@cerno.tech" <maxime@cerno.tech>,
	"daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michel@daenzer.net" <michel@daenzer.net>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>,
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
	"sean@poorly.run" <sean@poorly.run>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jani.nikula@intel.com" <jani.nikula@intel.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
Mail-Followup-To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"maxime@cerno.tech" <maxime@cerno.tech>,
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michel@daenzer.net" <michel@daenzer.net>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>,
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
	"sean@poorly.run" <sean@poorly.run>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jani.nikula@intel.com" <jani.nikula@intel.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> Hi Maxime, Daniel,
> 
> We encountered similar issue with mediatek SoCs.
> 
> We have found that in drm_atomic_helper_commit_rpm(), when disabling
> the cursor plane, the old_state->legacy_cursor_update in
> drm_atomic_wait_for_vblank() is set to true.
> As the result, we are not actually waiting for a vlbank to wait for our
> hardware to close the cursor plane. Subsequently, the execution
> proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> buffer. This can lead to use-after-free issues with our hardware.
> 
> Could you please apply this patch to fix our problem?
> Or are there any considerations for not applying this patch?

Mostly it needs someone to collect a pile of acks/tested-by and then land
it.

I'd be _very_ happy if someone else can take care of that ...

There's also the potential issue that it might slow down some of the
legacy X11 use-cases that really needed a non-blocking cursor, but I think
all the drivers where this matters have switched over to the async plane
update stuff meanwhile. So hopefully that's good.

Cheers, Sima
> 
> Regards,
> Jason-JH.Lin
> 
> On Tue, 2023-03-07 at 15:56 +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> > > The stuff never really worked, and leads to lots of fun because it
> > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > things.
> > > 
> > > For async updates we now have a more solid solution with the
> > > ->atomic_async_check and ->atomic_async_commit hooks. Support for
> > > that
> > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > routines, doing something similar.
> > > 
> > > For everyone else it's probably better to remove the use-after-free
> > > bug, and encourage folks to use the async support instead. The
> > > affected drivers which register a legacy cursor plane and don't
> > > either
> > > use the new async stuff or their own commit routine are: amdgpu,
> > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > > vmwgfx.
> > > 
> > > Inspired by an amdgpu bug report.
> > 
> > Thanks for submitting that patch. It's been in the downstream RPi
> > tree
> > for a while, so I'd really like it to be merged eventually :)
> > 
> > Acked-by: Maxime Ripard <maxime@cerno.tech>
> > 
> > Maxime

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

