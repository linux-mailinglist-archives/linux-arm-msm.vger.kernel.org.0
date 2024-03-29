Return-Path: <linux-arm-msm+bounces-15797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF38927A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 00:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 645F41F24D58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 23:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CE513E893;
	Fri, 29 Mar 2024 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwRtPzMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073E913F426
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 23:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711753658; cv=none; b=gJydKcq9lWWpQsT40RYonLUNOAWzOd2q9gbbvgTEqLfHr2KfUqaTiXQAEk+DtXilVyT6aTUYE1p8taBr91ayMF47y5DsBOsv3vRzSp6n54fQhBC2nsTsGXPDp+mEKS8UHui45/+b7ysYjaapfwEHEvorXca9MUO9z+X/I7vsUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711753658; c=relaxed/simple;
	bh=GOG9nQkJ3j4XMjXWBRs3++Jv3kNj4yHvRlPiPEOjmxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsvuSHzXkCc1jl1K4QHylNfSS1eWVa4r8fN2w+pOQGmURMtmmUryf2l07KdF0mRy8KY/TgkSnIpnShQeqbhpmzdrAFMqUQsxaNxqrxDeC6Xp1iLKr6v0egLocwWSbMOdTZgXlCY1uVrMbDtSZbJZNCTUkukEsYwF3pe51Y/PF1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwRtPzMU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513da1c1f26so2771204e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 16:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711753653; x=1712358453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
        b=dwRtPzMUp9PxwdikHGD6o8e2TEicDtLSQcKSfENEh/IEYixfmjnXyEl1dE/f5fPYpf
         tsvt4H22dVtE35EXqtKMnzRg447FGZLrVfEt/QMvxgGEGgx48Tk9LYq7TgxTMR9o7vpm
         BDHcrk8C1fUYQDhq5BrOvO6vDe/V9aWCch/7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711753653; x=1712358453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
        b=KZehSWEexwerckYRadJDaD4lnYkiJsUgeLGZO+Yt0WPMHakYSC54YX8UHD59ZInAhe
         0G9z+HqC0NAyp+ykSCNZoF2KLvU24gX2jhmHdiyDO5QlvNUQIOZlGFN/gGpV+NHR6OTY
         j8W8jEGkO2SuaJ4S5gcUxtPp4lNGaVmBYmwIkzKRTYWsR7lOzuBl4fYznVLDShKwcixB
         N8VdT8UhGxFjSfB9UlT+FJ0xhN2EBa0lA+chPYoVsWHUFZ2FL8kem6iqT6/GSKGuhGt3
         uoUgpFA4R5OcmIrxlVzPvAxE6SBLx1vQMKWp9YEqMV9+Vyf5BveZ563BFvUYneSfytp1
         Fuyg==
X-Forwarded-Encrypted: i=1; AJvYcCVb55IzdLh6aZylSYGS8HrN3iMkh8mJfwgYT1VcU7vj/9Ord0c98HcCx7DiqFrjsBOYOYH7O1TpAcSkIKcb7Z9z6OpttP/9j2cKmu5PJA==
X-Gm-Message-State: AOJu0YxFc4+fB0PrYgC1cvr/3BaxocvylVTf1KsrR9S/wlhZ1N4cyOB9
	OjOOtyw3iBAWFRIEvFE5TlZazle/KldRuEWDx60NaoNSwOonHeWYWCTY/6VYiL43iSKRGS4Ehfb
	Xpg==
X-Google-Smtp-Source: AGHT+IHQvesFvpzWKSgwwopmVNp1AN72yj4ddBj4jIiSXr54nZPhjFs35+VK0esLlhamrGMTfDPJWA==
X-Received: by 2002:ac2:4830:0:b0:515:ba14:a466 with SMTP id 16-20020ac24830000000b00515ba14a466mr2195996lft.18.1711753652850;
        Fri, 29 Mar 2024 16:07:32 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00a4733982ba9sm2378663eje.160.2024.03.29.16.07.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 16:07:31 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c63f4a468so12255a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 16:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKlJwwJMURGqiFjakmUamdWjv9cz49mIl6DNVriU/B4wAUuHKcldiyS3lTJjAfgBe8NT5D6hBogaHx4oNIE2tHT5uE2FZ6YEDwy/wIuw==
X-Received: by 2002:a05:6402:389:b0:56d:c058:79d with SMTP id
 o9-20020a056402038900b0056dc058079dmr2456edv.5.1711753651272; Fri, 29 Mar
 2024 16:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
In-Reply-To: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Mar 2024 16:07:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 3, 2024 at 5:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
> pre-emphasis to 2, while the real maximum value for the sum of the
> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
> limitation.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
>  3 files changed, 15 insertions(+), 27 deletions(-)

What ever happened with this patch? It seemed important so I've been
trying to check back on it, but it seems to still be in limbo. I was
assuming that (maybe?) Abhinav would check things against the hardware
documentation and give it a Reviewed-by and then it would land...

-Doug

