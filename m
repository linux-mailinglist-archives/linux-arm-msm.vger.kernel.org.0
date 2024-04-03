Return-Path: <linux-arm-msm+bounces-16303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233D897298
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C361D1C21154
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3047317F;
	Wed,  3 Apr 2024 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuyS5YZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F34149C64
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712154471; cv=none; b=bFgPyh2Yl8cRLoPKFCK5cOcP8OpX7t/LM0ygIpOZCaRLQ4kgfoJIm1OvkgVKHlsdWOczVUEYNc3/E88MkTp9nsNHRd87ZfW6VxuyhKRA4TeLda122H3FElOqJmbhcjDJBpW7m0AEeeaQ0zugMl0/YN0zLHnVfPC0kP5xRDjNW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712154471; c=relaxed/simple;
	bh=Eutrql+GlPZcdJFbU2brNFZQB6i9u54izTUbQcxkXp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3WxsFFH3DXvnhVKkezT7+N4YH4g2ITWvzYMrT1Xc+PHAXcDNESUSwqYRXWJOS5twdMpQz2JG2NCvs6A/ey6VVg+9qqhO7zu7oMXqyJt8/eHwEieQ3pBl3zIGy8OD02dFodewFK3Yo/jRymVWYP0QODHsmmkwQ8gSqcLZ2TfZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuyS5YZe; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so85698961fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712154467; x=1712759267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m6TCoiwkZCsl/n4EpXjK7y7a9dk5gfjSvv4CStXcsg=;
        b=uuyS5YZe1g9JtQEz0cq6f4+oNtlcNdOYtq9UuCHvnkh/2IR/ZYKzntrHGJ63bc12dz
         0iC5lpBbWhWIsHTtz4q4nEqdduadHF8Tz100PgVcZfZ0E7ug2AgTS8PuphQxKesV2/er
         A5zRS8fhqEQPF/mKSKgPSXJrXOsXPFEpmja1O3wt4vOPGM1VTJ7gtqaPOUIir6FS5D1G
         mZ5Ia5nKnINaRITK6CZ2oyVfWkHbe5SX4aHHj1LH5T4sSlwdXjlIl1BovI8rWeeV6FzR
         s0iBaHKCCCSUuTOYuUfDJm2nleiyU3cEPBVeJFeFVnezQk50DxrA6pTXcS+9nATBQ2E/
         PkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154467; x=1712759267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m6TCoiwkZCsl/n4EpXjK7y7a9dk5gfjSvv4CStXcsg=;
        b=tJkZhvKDhmTFf+/39/m+loiD1DRMsqu1wmGB/rzG3zIARNcO5X7S8kjlpL6teOuJZO
         xSm5W/E51tzQds47vWrPJx2L4Udi1cuWU8vl07aX9yRzRGD6KM/hORphlDs+iHoLi/pS
         jkMsObcxU2WQHk+qreR+fzgbbtbss8oHbgDq+BgiQMZSgDrOlpDtWa5UKPIaeQtV4b9x
         fQvWiZU8FEQBKGgnVmTac6w9uXLzI6JA8Zbb3dfjVedNMlWQkxvYVEqnNT9KPFvSpamJ
         LWh018vYSdRA3a5sl1wWrVIBAMnl2EoD0vCXq7//ziAlSVsdyQTPdi8wcasWkOBsnPew
         SLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVCbBh37A2l393qYoCkumKuQuliZYovDm/nmeaYHW6UTHM3+VRjeTRtm/GvUAXVEvcEwmAgyCib/6E4rZTwqwaM0OEm5kHS5dGdt+RdSA==
X-Gm-Message-State: AOJu0Yx8ZgFCWvqcRRR0POnvJuLxVrqsfZNghTKwI97DXBAWCkXt/z2E
	KIXQIouPiuraDHT2j/p+IzGwoe8DX3m4/khQcmkfa/cQkyYRY4Q2fGNU7kAnwCDQ/JTcifMnVwh
	YM6C33J0kkENJmzc7Cg07nvBEebhO+FxIcbWplg==
X-Google-Smtp-Source: AGHT+IEPAVO44UCTaAtdIqZQgD+gNk8dgJ4zsNMB6zzisxd38jmSZ/cwbjAX1C0jxryJk/DzTLmE9V9LXVSnHkltjtU=
X-Received: by 2002:a2e:a58c:0:b0:2d7:7bb2:7afc with SMTP id
 m12-20020a2ea58c000000b002d77bb27afcmr11035945ljp.3.1712154467493; Wed, 03
 Apr 2024 07:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
In-Reply-To: <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 3 Apr 2024 22:27:36 +0800
Message-ID: <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add DSC support to DSI video panel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > This is follow up update to Jonathan's patch set.
> >
> > Changes vs V2:
> > - Rebase to latest mainline.
> > - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> >     latest mainline code.
> > - Drop the bonded DSI patch as I do not have device to test it.
> > - Address comments from version 2.
>
> Which comments? "Adress comments" is the worst case of changelog.
Adopted. Will add more details in next version.
>
> Also, what do you consider as version 2? Jonathan Marek has only sent v1.

It's wired. I see v2 in patch title of below link. Just notice that
there is v1 in the link address.
https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=3D1

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> > Jonathan Marek (5):
> >       drm/msm/dpu: fix video mode DSC for DSI
> >       drm/msm/dsi: set video mode widebus enable bit when widebus is en=
abled
> >       drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode D=
SC)
> >       drm/msm/dsi: add a comment to explain pkt_per_line encoding
> >       drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
> >
> > Jun Nie (1):
> >       drm/display: Add slice_per_pkt for dsc
> >
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  9 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  8 +++++
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 42 +++++++++++---=
--------
> >  include/drm/display/drm_dsc.h                      |  4 +++
> >  5 files changed, 44 insertions(+), 20 deletions(-)
> > ---
> > base-commit: b1e6ec0a0fd0252af046e542f91234cd6c30b2cb
> > change-id: 20240403-msm-drm-dsc-dsi-video-upstream-1156d110a53d
> >
> > Best regards,
> > --
> > Jun Nie <jun.nie@linaro.org>
> >
>
>
> --
> With best wishes
> Dmitry

