Return-Path: <linux-arm-msm+bounces-42761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC509F7660
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F704169FCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28DD217F3A;
	Thu, 19 Dec 2024 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gofrs9+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA29216E34
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594832; cv=none; b=UacEdQJ8mkH/PnY2iNVroo+bQerUMEiGvalasRAtZcyYZoevJ3WFN7DdpBkAN+Z/c9VDUGfCzyigwJRMeXO/nf137TRDbz6rkY0nyz+EUUjtCnQppY+Ev/OHULqF1fUnHBzQ9dtfrAS9w0iRH1MNseFdEY9UkwF15j1aP9Ed4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594832; c=relaxed/simple;
	bh=IhMQnUDLDr5heZ61EmLxlYZ9KRx/+za22q0Bk0JUr1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3aTGcg+ZQdf5pv/erGg0HzqxDZdHwFNc15rcQO0/wE8Ff8r/hm7lJcWsJPXIdm0pGfUmdEg71skljTEbIKamnxyr7rS9bSnnjutBwJ+z3FeEhCRbjitJK3Wi4NA5Wn2cbMqFMMheeaosTUhlz2RNf2wveMm21Am7zgyufLDU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gofrs9+o; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6efea3c9e6eso3766627b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594830; x=1735199630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZhKlO/IptDE5jyqk3Xmfuu5iUOAfV8BaMvi98b0zJY=;
        b=gofrs9+oGQq3iQdtAbapasVfJBVdA+sHMenw6BvB4EGWexFRWTq5jMiQhe6GLnF2ws
         UqGVioxtD15oxdOit1AKQUVFRLXMkZn8/OxBgll1DK5cDencT/pyalvNlEM/cgF0RI6G
         BcR/73f+wxfuJ5NOz3fCfVdnMryhO06mhW8OoGTrQA106KXfglWNzd4xO+CxhUDN4sAo
         RSwdfGGw9Fjc+ML2rhc6Gma1VDiOiOYs+zjWUVsZCYw1spni2U3VU1X28JEsR4K31gAf
         v0lxRRirTX3wBbyDikRGbnqr8RBvCAEqHPhUwlxsxVw58cLlA7Pwo/RbVno83MkaUNRZ
         CeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594830; x=1735199630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZhKlO/IptDE5jyqk3Xmfuu5iUOAfV8BaMvi98b0zJY=;
        b=Tm3s7NsAXiRTntalwcdLVjQWUOnmQsEFGem4iSfnJqcAC6xn0hVJOXfHoj6HMJWeNm
         3U59/Dw0h/1cg98QPOXhVG1OHSvkyyxSwhMaRq7BbWbY5qcl0c8CL2ONtMX372GTgN/9
         kwvXsMslFeO/zzNaPwq38XuaKJR2I6aDflwcxeNKex94WLKGVwlW0uoGfTVFJKOo7r2C
         TQWn0t9xrKkT1OozL6unhFrPdQVCs94yOqTBIHoFG0ZvdZeuR7gJiOsqUZIiLMQlxPln
         g0P5O45kFTjkeJh1CJWPX2RoUVH+f00hsMQ/vjTtbD7qsqCflLB92dDLA5G4cpVlldru
         I7NA==
X-Gm-Message-State: AOJu0YyZH69rzY8LvXMxk9UHiSue4dtjGe0/AptwgfyW4GUavtOu/A2+
	oTech7hcKm/+tl+cgZhix1ElSJMbbTtX1XGZrxpcZtcDthbBlQ9fjZogqvZghYzb+uG/kPtjMUw
	4U3SPgDCz9qLC4PoV5/0o7WDzD1gMlwIrR0eYEg==
X-Gm-Gg: ASbGncuQBqEtMLvW1gua6m9TETFVKYa+wDVupdxofWVyBotwrvuw6X8hJ/Kxs9i3wdl
	ZZlttr2rgjMHfN/Hw2KV+EOu4Ikrlr49KMG9D+Js=
X-Google-Smtp-Source: AGHT+IHWrLjcvkgONZ+j/BKJ3YumZP/eZvJ2y2xElKYDKii2UHE9RCFq3yxovVi3IZ6O2JaUt8yiyGK5pHM15WJDTq8=
X-Received: by 2002:a05:690c:6404:b0:6ee:a81e:6191 with SMTP id
 00721157ae682-6f3d11239d9mr51702047b3.22.1734594829867; Wed, 18 Dec 2024
 23:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:53:39 +0800
Message-ID: <CABymUCN_17o7xpvv1DjfAe+o07-Ns85G+d4W-8bmz=t9hWS6NA@mail.gmail.com>
Subject: [PATCH v3 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=9C=8819=E6=97=A5=
=E5=91=A8=E5=9B=9B 15:49=E5=86=99=E9=81=93=EF=BC=9A
>
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> drm/msm/dpu: Support quad pipe with dual-DSI
>
> 2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
> And 4 DSC are preferred for power optimal in this case. This patch set
> extend number of pipes to 4 and revise related mixer blending logic
> to support quad pipe.  All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
>
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
>
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
>
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>
> This patch set depends on virtual plane patch set v7:
> https://lore.kernel.org/all/20241130-dpu-virtual-wide-v7-0-991053fcf63c@l=
inaro.org/
>
> Changes in v3:
> - Split change in trace into a separate patch.
> - Rebase to latest msm-next branch.
> - Reorder patch sequence to make sure valid flag is set in earlier patch
> - Rectify rewrite patch to move logic change into other patch
> - Polish commit messages and code comments.
> - Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd=
-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/
>
> Changes in v2:
> - Revise the patch sequence with changing to 2 pipes topology first. Then
>   prepare for quad-pipe setup, then enable quad-pipe at last.
> - Split DSI patches into other patch set.
> - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-=
mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jun Nie (15):
>       drm/msm/dpu: Do not fix number of DSC
>       drm/msm/dpu: configure DSC per number in use
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: fix mixer number counter on allocation
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for alloca=
tion
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: handle pipes as array
>       drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
>       drm/msm/dpu: Add pipe as trace argument
>       drm/msm/dpu: blend pipes per mixer pairs config
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  77 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  74 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---=
------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 219 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
>  13 files changed, 511 insertions(+), 348 deletions(-)
> ---
> base-commit: a9b9ea7b45d661fff0f3fd2937703a536f528cd2
> change-id: 20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-2bdbc2=
2f5131
>
> Best regards,
> --
> Jun Nie <jun.nie@linaro.org>
>

Sorry to have no title for cover due to miss handling the b4 tool . So
reply to this thread with the title in it.

- Jun

