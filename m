Return-Path: <linux-arm-msm+bounces-46470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F0A2186B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9A7162326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 07:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE221991BF;
	Wed, 29 Jan 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ab44/QRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405182F30;
	Wed, 29 Jan 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137540; cv=none; b=AyDX+ooJ4aRJjLBWFvq2QgrgJvpvdPbEZs9vXlrG8AIBGMkAgZ+TDU9QBnGV4HFqpgfsiMFisQMXA4HtPeYbbtvY1KQ4cWwYvjHk58WR9oeTqNSMjjzrIVDvP3jMIBsHQaaqeqNTMqD+e+KAwR4zVnry4c/iL4aBX0WPJlOjUKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137540; c=relaxed/simple;
	bh=NZcYTTflykbwqFY7VoG7TnqLUPokxneceMj3DEGcL0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOIB8G5QLq1alBaIgkrG+FgByLXhk4naKrdHhlkfKeAWVWra9D+opfyx/qCMyDkqZ4zS71nt7wYtXtIS8wSgZ7r+5gCKan6S+R2NJJk340wlXkdlfTQTbqscRPyGmMV+iRZlaBn6/pCBbgnAfSia9L3OOYrQY3Mh8KLGZXGPWYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ab44/QRU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2efded08c79so9140942a91.0;
        Tue, 28 Jan 2025 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738137538; x=1738742338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBHIAN7JpxixHgHVdW3YNOvZJZHJ6etB6CsRRxzIqFo=;
        b=Ab44/QRUHbW4B3L2Aa1dUzhqBq8/9SpPtpf+AY9ApMNZ7IzD6FS6cR2cbiar3hZpP9
         93MJhSPxIWLFnaKxr4M5DqyrQpoa2rUSONmt80XHieU4igxUFDsmR9bHpmJr03w4iPyt
         42cpG86KrXGl1N/FKVB2QmKQGUfQCVKIxjKAfN6Suol4daEd/FAhAHGjt7slkN4y7Tw8
         TDSndgtZWA6jzsEozRgJThJOzmKXk2ocpD4jvLw9TWQADY96vTmyQhW7NV32FV9MIoyw
         CHl4cK/hAUHW+nldN8EJ4eW1mQUnetaRYZfYRdnUgjPwZH0sBCI1LFmJr1H4rFcFS/jN
         c46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738137538; x=1738742338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBHIAN7JpxixHgHVdW3YNOvZJZHJ6etB6CsRRxzIqFo=;
        b=HnGFvF1aB2RcnNdYrqraMwrumulx+wohwD9RH96dNuiBHWA51uXbLzHDbsVBByA5XC
         nE6xRlnbtay7T9bGmP1w6Z9Vz7MjcW3M2TmR4DZUGfFsqTKd9lK+bnJiennEMVjognZO
         e73iJOdl6RVZChJcB7XThWuZsKVYcWJ/xPwLkQPQm7Pr2Ge5UHiWkNlcccp52JsSnbZf
         AnIwVswx2zZRz1ZF4Mcw//OsZ2bZqATxmq3QbEh2rgprgYT4LEXEe53RA2vcLpn0/1a3
         hWifoyn9NhZv9/xnlM18342FNJJvdBtQQtTXa8SGbaaOCLeZaXgEHpC/tINS2XQzib2h
         qKTA==
X-Forwarded-Encrypted: i=1; AJvYcCX7pubKdTneDqHt515FcBcqwGGhzQ2Lq1UqVp3ma3vfB/SEeaL3zfTqbA+oIdeVF4PWwH/5JnjzdiD1C7TK@vger.kernel.org, AJvYcCXXJqgRmjaGc3n9yaFn4CmvrDLiJnnU4j+E5DsUpZXML5ZEdZrXQo83LXwtEq4vDYR8A3B61CCY445/Wqpc@vger.kernel.org
X-Gm-Message-State: AOJu0YzYotvM5CwQku/hDcg7HaZWrnurdadIQ0nw2qtJa50BsHh7ivq3
	DGbNrxJyaM3zfv6pJZ52TTxAcoGMij07I80naWO1sec6+CC36Nwta3+wYtXx04rhtbDkoOLjUqi
	v8NmHlTCpBiJrraHgHiADfg+WXOU=
X-Gm-Gg: ASbGncuU4At0cbJaRwj2FEmodUEos9OlFahYokJMcTbdrJ7UaCLI98/2bWOT6+940lJ
	goUK5sG721y1Si94V6q51QnqwA3VpHKF+PGEW4qvOIzUo6T43DOnNqxa9AvxcOFcJCDPSeHc=
X-Google-Smtp-Source: AGHT+IG3r4vUiKlWHwTQkZvS7+VVNNq+4vIcWf1DrOqg/M9EOigTA4eFhbCTA0u2oYA8j4fsp5P00rPgbnSpKao2ckA=
X-Received: by 2002:a05:6a00:4b9a:b0:72f:d4eb:48ee with SMTP id
 d2e1a72fcca58-72fd4eb492emr1158389b3a.12.1738137538327; Tue, 28 Jan 2025
 23:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128142927.103290-2-phasta@kernel.org> <CAH9NwWeTVv3kABmADJD8mNcE1Psq2ToLfzjO4HzbSfJ4+gkxDw@mail.gmail.com>
 <20250129085625.502ab114@collabora.com>
In-Reply-To: <20250129085625.502ab114@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 29 Jan 2025 08:58:46 +0100
X-Gm-Features: AWEUYZmAfGxLzIZNC3w4bsXkufJYOdKgnDes_maHi6cPE_lb4PoKfKm-HgqiaWw
Message-ID: <CAH9NwWdaAyPXbUmR=65uC0RTNB4rvKJxXi0DMhjC2F1fKRYA4g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rob Herring <robh@kernel.org>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
	Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

>
> > >  int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > >  {
> > > -       int ret;
> > > +       const struct drm_sched_init_args args = {
> >
> > Why not declare it as static const struct drm_sched_init_args args = { ?
>
> Because some bits in there are not static, in this particular case,
> gpu->dev is not static for instance.
>

Ah.. yes - thanks.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

