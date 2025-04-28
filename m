Return-Path: <linux-arm-msm+bounces-55877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE6A9EB75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 11:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF71B18955DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D26A25D53E;
	Mon, 28 Apr 2025 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIkVtC1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C724EAAB;
	Mon, 28 Apr 2025 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831214; cv=none; b=hqq4HYHEMbLJqtkKdVonzimGlePQhERkWH17aZ5R2IgXcNyrTSoHZ3wXS43y8dH5GJxoxzzLb3TPnha9qJLnOLvWxTU2Qc1/e47WLpkoOD1UHpChwtCfDhgRVErXROaVzuufvNngF2PlDohzp7dMOJbDpSHH40iPxupI1/dJA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831214; c=relaxed/simple;
	bh=ppIWNtOg1LXw8uMI8CjjeWX0CnxWw5y9RE1aVI9yQIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7djKVZvkXx1bhrAHHk+TFOQMyXxz+7dDnf5hVa4aNFwwLBHcUtAHZ20sPtfcedCdgOWth/ltLkLQ3y0z+4qmZFdQ1UT/sZv4tkylb7DXGfYEFLsyTnL2YJXQJx7exDFwXZtd9MXiYOe4B/lRlxfPEqktGP8x0OsgVVIySMZzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIkVtC1P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2569085f8f.0;
        Mon, 28 Apr 2025 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745831211; x=1746436011; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vrP2CkY7EdRWUrqip7eV8X83IUPU9ETL4wnHODJxb2w=;
        b=UIkVtC1Pt8H3/wUmvKVMK7uwkLwostuqdm50upH+jCCdJ2MapUoh/Ip6as9raylKgg
         EP+H25YK8plD42LrVl4bC98glYmpQqBlrryseYym06oFbGKhmLOukV1id6cMYNMBN088
         of0cyI+3MNGyDwn2NgLYNru5folRGnyVO0hhY4CCWdcqmbGCWO7pHeJlO1Jm+Pu/mO2+
         anCUSb0BVWGZbs7plvqTG/NKBqywdrIrhjB+H2a+TcuckXqe9W2ydi7mlVnSVgwda+y4
         vrzZBcQ3/Xr7iunjzx5bfBPcBY2fMn234eMFvRzU2/tNMBcIzpxI+IcuXM8cmQ9bs2Nc
         h0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831211; x=1746436011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrP2CkY7EdRWUrqip7eV8X83IUPU9ETL4wnHODJxb2w=;
        b=LzF8D5o5iuFc6+yjMLr5sDZZCDQjW5pctI0Im27bVt33eI9FaH9pnR6ix8oiO1KCCx
         YhGuJsdSGSpoJPWU7iB2knt+Gvo5PvP2dfc4cixGZ7SjbUJd3HqOcCqwvu7ba8Os50Pe
         JOnbtom0uzEBKDDZKL1BoeCl0luKbxDbwbAKW4qjcAV+iYFYvoR6FryW7/rozPU7Xi2h
         v24OMrl3BtnuQs6mcu4fqdEnDC3g896LV3kNtNbdYZ86xePshlGnZej2edWaNRkenRpz
         07lAg9Zaj/L8y1Lkv6g5XomHUnYavQ3Q0jtGtIQ2Dtsok/GaJHrFhk3hRPnDjRRcg7Ed
         jwXA==
X-Forwarded-Encrypted: i=1; AJvYcCXWi2SgUcvnKUxEcRMaZG3LvofHxXxN9OdA2Wfsgo+Ik65oYvOveHeGRhdj08EM7fDidGNV5zuLdaWA9uGM@vger.kernel.org, AJvYcCXfjp9lYgS++TUM4Cwym2/7lvlOxinCUaiiLtkmaUifnlFnb6MKuYMT7QunDoJ9fNgx86se0E0/GhQFODBT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj07EohaWSKwo97HCzVMNJIg+GG4ar/uoySf+x+kN6EknOyJ9l
	HWlQtt80/0Ne9iij92h1izCoPflyUfCK0FSgoCNnr80m5sZwhutUExVGttDjT+wYeVsMP+Je+tu
	0tZVGqFpFBt7qPtDJ4TKXPeDeCQ==
X-Gm-Gg: ASbGncvAuN5K0bYEA6goKLoiBpXpZqmDwyG1hfN1igKVJn93UjUxPBOiGTn79/TRZHC
	x2qZ20b+RNPVrONxkCrii5Rvbsh5cZ0vsPbqeVVVApbHOGwE7ObsLSVk98WT6n0jnlUajNpQ5pL
	zQtPR3OTDLGZKnVX0cFFDZeg==
X-Google-Smtp-Source: AGHT+IHd5cOvjdSZ4jvtyMnwviGdePLYjYKhf+NbtpduvF+uiSPCjh2ycn+8lgcJGcQkuWFGpwfb0lxDvsulR2tTh74=
X-Received: by 2002:a05:6000:22c2:b0:399:71d4:a9 with SMTP id
 ffacd0b85a97d-3a074f7f22amr8908857f8f.52.1745831210949; Mon, 28 Apr 2025
 02:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com> <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
In-Reply-To: <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 28 Apr 2025 11:06:39 +0200
X-Gm-Features: ATxdqUE21e2Yp75-k_wyhiJlMRQ-z3ZtLT7itOJ8xGoFly7x2Ai_IKkUtx-RkD4
Message-ID: <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com, 
	abel.vesa@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > to non-transparent mode to enable video output on X1E-based devices
> > that come with LTTPR on the motherboards. However, video would not work
> > if additional LTTPR(s) are present between sink and source, which is
> > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>
> Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> adapters or docks with retimers in transparent mode?

I am actually not 100% sure.
- If without LTTPR initialization, they default to transparent mode,
then yes, incomplete LTTPR support sets them to non-transparent
without per-segment training and breaks docks with retimers, while it
would've worked if LTTPR(s) would've been left in default transparent
mode. Note that in this case, X1E devices with ps883x are somehow an
exception, because without LTTPR initialization at all the training
always fails.
- If LTTPR has to be initialized either way, and explicitly set to
transparent mode if we do not want non-transparent, then no,
incomplete LTTPR support in 6.15-rcX did not explicitly break docks
with retimers, as those never worked in the first place. As per my
understanding, this is the case, unless something (firmware?) has
already placed LTTPR to transparent mode before the driver takes over
- then 1st case would be applicable.

Docks with retimers do not work in 6.15-rcX, but I am unable to verify
if it did work before, as I do not have a Qualcomm based device
without LTTPR on the baseboard.

> You describe at least one of this patches as a fix but I'm not seeing
> any Fixes tags or indication that these need to go into 6.15-rc to fix
> a regression.

You are right, I will add Fixes tag to the 1st patch to make it clear:
Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)

Or should I mark the entire series with Fixes, so that the docking
stations with retimers can be fixed in 6.15 already? Landing only the
1st patch will fix inconsistency with DP spec, but will not fix
docking stations with retimers. I guess this comes down to whether
existing LTTPR (but not multiple LTTPRs) support is considered a bug
(and patches 2,3,4 are a fix) or lack of functionality (and patches
2,3,4 are a new feature).

>
> > Changes in v3:
> > - Split 1st patch into 3
> > - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> > - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
> >   are link related, not panel related)
> > - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> > - Droped Abel's R-b tags from 1st patch that got split due to high diff
> > - Fixed alignment issues, initialization of variables, debug prints
> > - Moved lttpr_count to avoid ugly pointer
> > - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/
>
> I tested v2 due to the dependencies in msm-next and DP altmode still
> works on my X13s and T14s (while not using any docks):
>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks,

Alex

>
> > Aleksandrs Vinarskis (4):
> >   drm/msm/dp: Fix support of LTTPR initialization
> >   drm/msm/dp: Account for LTTPRs capabilities
> >   drm/msm/dp: Prepare for link training per-segment for LTTPRs
> >   drm/msm/dp: Introduce link training per-segment for LTTPRs
>
> Johan

