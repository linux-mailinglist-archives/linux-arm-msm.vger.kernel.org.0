Return-Path: <linux-arm-msm+bounces-41587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4309EDA65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D4A11669E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7CD1BC085;
	Wed, 11 Dec 2024 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iU9Xxl49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A91DC9AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733957470; cv=none; b=tDv51YIKEX3W5zYVkf3LxqIHtAt58ARHJEBx5TlVuxWI3/bqr3MPCIdNRia9nX2LrTxpGaFH9cYHVrjkDYz+C+M62LHlRsjVpcod7Z3yYCrIOCkvvbq7HrZijFx68hA5kA9K5AiT8xOYVsJLJvaDXbrAkkR8RRRUSaGawsmWHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733957470; c=relaxed/simple;
	bh=FPSw2nF/lJm2UWC2sCJezAEzDmgl9FQYGt/yXj/bTk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAeCG4cS9USBx4Ep7bdRFvXjSntQ6ky+3ex+7TX3VrqZfllTQ1SM0S6zGPZrEd5tz5HbeEDOpNxhGRp2ek0jmhf2ozUTg09EgeK1lOe+6ABYbyDsnVPBkQmZiQjcM2F+uBh5ld5akyvF+kkrLRUS98hYJXJdVQM3KxDCM7QUEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iU9Xxl49; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f757134cdso4619759e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733957464; x=1734562264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
        b=iU9Xxl493hysYPMVPysCY4wlvqY+HDMPazsuv+2v30qc1WJEHmCQE3KRq2R8xw2lF4
         1PFNZNME3iSXOE7wAVOApZ5vbJckRkZng2eFhDLtRUYjv00s+P5g56db2xOJ0dxtxg7k
         Jp39XJcBmzaF4CSNH4C4c9EyiKOovfkf6D4v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733957464; x=1734562264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
        b=bgvsiKLyTu+UsyynNJy6po1bdBR7WgkIbaoWazeX/GvhUnVAaiRjIVSshBKBcLIyK6
         ClzRVs3kO+vilfyHJCwz2dZtCNAUhreJvY7up5PXza97b3cDXVtElFLJOmtYU5GFxfbF
         4ty0/0OV5KB5a9ARdlKLMFcOy43vZuBjvoxVPY7Zk5VcwqBGbWBZ6epaGo3z0JVJ73+K
         bwi2GN8wLxjAeslK10GjN9ZM5yNpEsWDbmwYXcMJCjki7Kfkl0pqRadF67Zi3caTmrTD
         k3oZuPhNOc+ZsOOI3Hr8a3seQzCLjbaITzQiaC16ozOxRN5V7sYOuduhDOaHn6Mu2HXP
         KHkA==
X-Forwarded-Encrypted: i=1; AJvYcCXpD8FfnR4Qo8H6c/Bhb5Y9zUfZpEkazhxYgyB3QfO8wdJ1NcHuIpCGor6/8eZQ2OsnMAgbpY5Me1UBb50H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CCJZLl8hids/BHxpbMQMUHSbdV0EH8jyU1O6fkZh9tfqT/7K
	0Wxz0tmLm4msZ6yACpzniOV/i1f53YIMw5SJ9+tIogJjS2/xhWdTssfkERp7Xn43irBhVIZkZ8D
	zRcDU
X-Gm-Gg: ASbGnctO2cKpIecgAdUEfLIMZYsIkC+ZUNxMsOtH9HIqxw42orb30uXKkbVGZcLoNVk
	cpX1I1tShuyq+Ar8z1kfdqzXwwqeBJbrbY6zxc9nedfxAXtr0Vm1Y+w7Pgx7dA6imbL0vdD21qj
	tz/0Fen7Ejsiv76Ml/gUACICSE357/E1/VspzcjlI2lo/PtHGBldpGrAZ4+dZPEPV85hinTjpyo
	yPHexdqPWy/7thohHvwyMRSp8l+/0c+8fzkSfJ6k93DdnchtRXRZ3i8feI3JPiu0eJwLGl1SzFq
	apbZMHQJjFIPtdI1xw==
X-Google-Smtp-Source: AGHT+IEJFF4CpN8L0F57H1CYm26969MAPLJz/hL+oWayZlo9x2PpdKsqx0X9EFQnMAMtlsdxqycKyA==
X-Received: by 2002:a05:6512:3990:b0:53e:38fd:750a with SMTP id 2adb3069b0e04-5402a605b3fmr1599521e87.47.1733957464198;
        Wed, 11 Dec 2024 14:51:04 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020269fdasm1036771e87.182.2024.12.11.14.51.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 14:51:03 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so5049524e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4yc0wSA2O9vyScSSMXHfbGQfmh/LbzoltEAMxCpWGMnE8Vjq5zJBvWam/KjiGMhznibEl5B3EvPdqzuJ6@vger.kernel.org
X-Received: by 2002:a05:6512:3d11:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5402a5e5682mr1002664e87.25.1733957462810; Wed, 11 Dec 2024
 14:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Dec 2024 14:50:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
X-Gm-Features: AZHOrDlpR97b9ybDcxqzZ165UcoKpL_oopMC2BgdmlXON_-hpEKkrEAlm1wccLg
Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 11, 2024 at 11:51=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dp=
u_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-=
v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>

