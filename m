Return-Path: <linux-arm-msm+bounces-50641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E3A56D07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C153B7118
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 16:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6B7221701;
	Fri,  7 Mar 2025 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb/UDfeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B722156A;
	Fri,  7 Mar 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363319; cv=none; b=OLzNbeXipJzckMqksGxX2aT4UiXjKrgmrzS2y4GSv7B8UvAj9vlsXt425zrvW5ORRQss9KUWf7ILyViQCqTJHbQ4YvAd8IpQXLfLWYhJy549PW1x7PRkIn+H3Pr/xNO2C2o1YMI7VaqJuejT0mZ2CH9jRbV+RmnH097pFKCs3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363319; c=relaxed/simple;
	bh=sDYrqSLQwQmSZUEM2jqyh4n0GSf28H5kR5EpLD9dgx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oo0ommlt7bXvqpX7RkCbnauW13654nSoXOl0NTxz/7tNZe4hdFT8ppitajuy524Fz4U0rCQVo3YYZuYRzls4h0r2gl6sKsKhAXPgTnL2Pszes0oRGzTgfsLi7nHrwE6QGHz1koq02GRZJp4yqyF//oWOlpUB+b5Tq0l6LI0F10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb/UDfeo; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso6444665ab.3;
        Fri, 07 Mar 2025 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741363317; x=1741968117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyzCZ6tPew94XfiS+4OSnxV4WHqqsy2FInPHfaV1vig=;
        b=Bb/UDfeocA4lblPPDYJ2jysvMs9TxfQ5J3uj1zsEhr7e+gg9lZC0uu1O9l/C5DiHF6
         e+Grm47Mw8NpOsjDpicp4oSvKabFu3ih8SB6awOHCxyt+/fXBODi8oFIVJSEUTvSif7U
         jjPjPz8g2mC1deW4sc4ZFiMJg0YQ6iXwlBxnPJrKeIkMptd9f9HsRaLfAzsvsKrhPuTT
         n0n7/nWgcDC6GlaCZLs8v9y+DLoiOd45yndj44REnl1o/OMdpyHi30/tddaEd3Br5iLv
         y0WEcUYVXmYTkSTTMGK2EPR2PNFNDY/00KSdxTUnvKZ3xYVdMTn3A4+ssKXnt+6smTn5
         fE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363317; x=1741968117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyzCZ6tPew94XfiS+4OSnxV4WHqqsy2FInPHfaV1vig=;
        b=U4O0A2oXSxIyK5PqPg4Fp2IFt/xEtvFo3okYvTIeMiuyNY9DMrhLCaqBxs6VDBmeUj
         KUGAC2X0iAMfGvmOehf445mxzccFPqBueEqCowhXKGkTLmlkWgWqTR16ADyoy2E1p71m
         Gc/dWrfCv43wOfpRhwUJQZ8Zw7MxBBhjwe5GSv8hc/sf3vLYOoZZ67UszTU3rSK+xoo3
         qn7SCbfEqosiklGmlEEVQtdaYdfYzUS1CoWI8JAfcGFjb5odAM1IIsOKdoKunmpj6GzW
         yzejYkd/sKkZg7uqTHZz37ma3ID02bI1m6jJU6GNGJPc/Vr+b+igcWqfj25xh1K1uynJ
         /mMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/yf3w1qHT0l2bl4n/Ik8kepT/22iDG5fQsnpqNs32UirrQ70eCj4D0iiwRELYmm2Ig3tk6tidchQIorNr@vger.kernel.org, AJvYcCWTW7AGjMP5GT0U7FoYCJR6o6WCgeYs2p4yU3UYUtc8v+gbKAGFkclcv9ny20SworTVQ5cPBiNFfiUv2F+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DNJVg0lc32ieqNM4n+F1Dzf9VztwSBXadvOf76yERI0P4iKq
	CXbThSXm7aYyWZpcJDWpa3ttfqjZPv4QCwwcBzqB3H9Hh6ZZ3Il8A3/3e55NciQdk6E8+rB4a7U
	lZmE4CRwtaa4ukaAC1ojZGa9Mlyo=
X-Gm-Gg: ASbGnctKG2CoJ8H+EEU4GRNRNInXp5Jqcb0kcSQkGUssifdHn87N2yPmFBwqB1vmfj6
	8zOVZ015PjaK7xQibhAr5pnF1mDgouvOvxUVscaxq2UH1skK3TFa6CGCdlM2P+C+/g540/nv3vD
	CHEyOuPwufM0PQ57L/0rXRC3MSgw==
X-Google-Smtp-Source: AGHT+IEqkZPqqdSckRO+B/IhTs42SUAvVrOyCHyKIDGjAnzV0O98IKKaPcGzJ9vvbFiyM8RlpzW+Mc3ryp1hFh9MUp8=
X-Received: by 2002:a05:6e02:1a0a:b0:3cf:f844:68eb with SMTP id
 e9e14a558f8ab-3d4419712b4mr45334665ab.4.1741363317257; Fri, 07 Mar 2025
 08:01:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org> <20250306-dpu-fix-docs-v1-1-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-1-e51b71e8ad84@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 08:01:44 -0800
X-Gm-Features: AQ5f1JqcVpnB0n6If-cKi8SOKwKukooOgmurcZp1EWDwVWSRGs12k5HWlnnV4MI
Message-ID: <CAF6AEGv9ViJtvnYM-n-+oHY_Ky7KvBtng_2EOBDtyTL53SB_hA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:22=E2=80=AFAM Dmitry Baryshkov <lumag@kernel.org>=
 wrote:
>
> Correct commit 20972609d12c ("drm/msm/dpu: Require modeset if clone mode
> status changes") and describe old_crtc_state and new_crtc_state params
> instead of the single previously used parameter crtc_state.
>
> Fixes: 20972609d12c ("drm/msm/dpu: Require modeset if clone mode status c=
hanges")
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index b0a062d6fa3bf942ffd687a91bccac3aa4f06f02..536d15818ba24f8b11f24e3bd=
9726d31c57ef531 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1395,7 +1395,8 @@ static int dpu_crtc_assign_resources(struct drm_crt=
c *crtc,
>
>  /**
>   * dpu_crtc_check_mode_changed: check if full modeset is required
> - * @crtc_state:        Corresponding CRTC state to be checked
> + * @old_crtc_state:    Previous CRTC state
> + * @new_crtc_state:    Corresponding CRTC state to be checked
>   *
>   * Check if the changes in the object properties demand full mode set.
>   */
>
> --
> 2.39.5
>

