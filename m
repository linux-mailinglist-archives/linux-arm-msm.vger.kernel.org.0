Return-Path: <linux-arm-msm+bounces-38027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B449CE176
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EB88B38348
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D391CEE92;
	Fri, 15 Nov 2024 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nR05r7Nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55E1CD1F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731680340; cv=none; b=kadXXZLp+DLZOeHiI4zXB6E6kOyxA4S25sdoonijlb4kPTx9TmBLC1haoALrP1G5qTEJv20i5ulQ0pP8W+V4DqostT9mPb2wIY3J8ZcK6Vm1IXKlbyZpCqtC8up/+Mf7Et1/x6utTgNfeF6SA0/lmQYcyuotxK1XyV6Y7TGXOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731680340; c=relaxed/simple;
	bh=ZIPyT8dx+eHreBugSxOn3Ptl0BOPxKH7//P+XwhpvVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6avy59Uz1beSqVf9NjUgrNVcVJt7iJ1QsQohkK2E8Dl/D5zDmxgHkU87mam63A45HUQg3JKSGOChfe6bhdvE6djibwhHHuy9zvRpr8pp0Z3yO+au4lu1fJdI7qT8wuTIkbt0prxwieI8Gd1wFUE2ykE2mfZj+b9TQBYnXhZp4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nR05r7Nv; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea8419a57eso20570647b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731680337; x=1732285137; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rhxBFTVLr9CXs7yVyXnjqOaOGkDhEtwnjzGXMrCkuoY=;
        b=nR05r7NvBkkADilYRK6uzNCYjpnUGZtXbIkOVJsZT2VzuneOW/jJcogANkkNvUkN+v
         FMm7JwgAeQg6tIVVqBLfSa7QhJp3iSk7de0l8/Hg9zlrVi6UQjdK78W0rgLMM3Xja9le
         FWYp4n10nzWu1DHldcMiN5jcUKsrqbej5hAuPJ8DinZl99LHZBwjTzOlP7DSer85eCfi
         Aorc4daP4kvr1+tyqXn9gOGbYDauDaXhG37D2KmcQhQa4YuCrnBtPm3VFiRJB7E98eZv
         uBNcpodd0ill9fUDH/fbLmVZkF0gcaAyyxf4ITVmVmJkfaebtBibnwDhJB2gCYHxDicj
         6oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731680337; x=1732285137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhxBFTVLr9CXs7yVyXnjqOaOGkDhEtwnjzGXMrCkuoY=;
        b=VHaiCdMTonMPdra5W656q1DLaU+eaNEH+zKev25ectLddgSULWgJ/0ydzrh+x1ME7t
         UWFl1PwPe9Z3Nerke9moFvc6UBrve5qDrKwaacpq5LmXVMLp3HNBH9713uxGdIkZV+mt
         7eEOOuk53j1NxQ5a/WVyq6JTbCc7xf9cKcIDGvuI12ClizICZ/BEzThgjtRKQk2QmrjF
         DCApY71xmuQJhJRpFB9DbLxwmXWosehnFET9Yqq7RDXpfhc5FlJFH+fttY9SgiwNk82U
         wDmyWB+FK0TrtZkpOd0Q1+xlkm17a8JRmX0moQdhYQtJ4uLyk1olikVN4HycXXzj+3XL
         8q3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/kx+Frigg0G0QvvgbPindE5XmcZGxkv0m9/9qy62XCh74gyMgGY3A0kiX2tXv/8ZiQzrO1IYHxRtACMx2@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0nT8QxlNrpb0OmX3nLnJ1Vcly2hcUheEcbRJox15qWAbYk7d
	NIoNQPFLs+tTDgBXyx14i5Bh8BQ5h59EtJGzNImXqXh6NdWlllZ1AphKQa1Fh8XbxZEJoVnUP/S
	Z2HMXMri1E+eZTvXhA27SLc1aAYF4dA6bOfZjOw==
X-Google-Smtp-Source: AGHT+IHAutNFbQIYrWEa7iEgXdJ0MlhAPiCQSjQjzOFudXA+GpwEclomXP7Hjrwzw+jQnjMyfUPPdwlemfoRMd5mMNo=
X-Received: by 2002:a05:690c:7309:b0:6ee:36be:64b0 with SMTP id
 00721157ae682-6ee55bf0725mr36374547b3.16.1731680337418; Fri, 15 Nov 2024
 06:18:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
 <sgz4h6rlmekiwypaisjbnej326wv4vaqt3mgspp4fs4tg3mdfx@cwmdqcu6gwbf> <63a2b391-8b71-41cb-bed2-3bc7fd2154ab@linaro.org>
In-Reply-To: <63a2b391-8b71-41cb-bed2-3bc7fd2154ab@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 16:18:45 +0200
Message-ID: <CAA8EJpoFm8EjfBq70RTPtwR7Y7Rm24kHO20NukGiLGRYD0p9Tg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] drm/msm: adreno: add GMU_BW_VOTE quirk
To: neil.armstrong@linaro.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Nov 2024 at 11:21, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 15/11/2024 08:07, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 04:48:28PM +0100, Neil Armstrong wrote:
> >> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> >> along the Frequency and Power Domain level, but by default we leave the
> >> OPP core vote for the interconnect ddr path.
> >>
> >> While scaling via the interconnect path was sufficient, newer GPUs
> >> like the A750 requires specific vote paremeters and bandwidth to
> >> achieve full functionality.
> >>
> >> Add a new Quirk enabling DDR Bandwidth vote via GMU.
> >
> > Please describe, why this is defined as a quirk rather than a proper
> > platform-level property. From my experience with 6xx and 7xx, all the
> > platforms need to send some kind of BW data to the GMU.
>
> Well APRIV, CACHED_COHERENT & PREEMPTION are HW features, why this can't be part of this ?
>
> Perhaps the "quirks" bitfield should be features instead ?

Sounds like that.


-- 
With best wishes
Dmitry

