Return-Path: <linux-arm-msm+bounces-7520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E02830E30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26D01F22D30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025DB250F2;
	Wed, 17 Jan 2024 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2SQHTgP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBF250EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705524601; cv=none; b=tUBFKAr/ngFjWxl7DVmQuxq4ZaWtkPgAMt4d2zJRizOkTixqt1kBYhysxydU9jsa+feXV0F3cpNtrbEQYSB4UgiUSu680Qhk3IYkiUtswhs8LQbqDkh83Brb16hIguOdBrw4svBKs0lps7f7GnxlgrmpsnvoyNY9RiP+TNOrAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705524601; c=relaxed/simple;
	bh=20iD6OBjlb6cJ7O/ya75A9onZtg0SMq1KOfKJJTL9zU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=phlymdjK1YBhWDcG1JTcPpljdFcuDqB0E7UKl8c3vRClXK9POY9AsM1Hjw/NRAVtFUJQ59ZAazI4M2dcszzDQC/cQVVfRx8tjCU0s6IvzMFHakTZgsFnEXKF/XG06vbJ/NBMMbn5FDExWt0/nEAG7BMY+P8yGtxSZ201Hb6J9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2SQHTgP; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc250cff65aso339503276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705524599; x=1706129399; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oOgLjW6oMidNjG/VSGLYhyD5eLZJxjjB9wMU1cNUdUY=;
        b=y2SQHTgPPueV+bhIQv98unXOrXpsQhQazJd0GmJeAtJY3shDfvbxqOfpRZ14vF11hI
         FT6R7DtCPKVEzyFldQFAtDRap11y9nl/g8ra8oQqVLETQ1SP5ak3RstOb5gIKCh8CPeO
         w8oUeqH8I8Z53SsD4G7b9kM90xRdoWFUIkMScJn2GhSWeTh8d+jcjVHbgiCVyA0AUs4D
         bC+BlTqdJu1E14zHH6EGH0riI3by/7QpYC6Wsob0tfFL2MAZs4keyXrsuGP1nbXU8wjK
         YyGraG9cjbf0JhsGYcxaAa54R0sskVQ9msaY4OI7mODIiOSKihcHIvGbqE4o8yK4+dsj
         Rblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705524599; x=1706129399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOgLjW6oMidNjG/VSGLYhyD5eLZJxjjB9wMU1cNUdUY=;
        b=MMwjLx5iWNL/fWQHsUPtkm2stjk9fCJSiNGaD/zkvVF1CsHGRjdttYfmt6krj9WiW8
         /pqfMDeQNSvxFzV/qEtwAnr+nySNqSvqydcGR2CumLqjUs+fMVImKv1CtAgUN/9mKlEu
         YTm6SJsQJfCtDXg6//HtsRoxXwKSSOLcF2B17yGs2gvjOsNu0zU0Lsppk26J2xDJuu6y
         23H1ewDVhyhwL/1KojPM2UlRqqyisrI97kBM7f/7RW+o0Dbx7uEn6Ri+KICgU/UqNh6L
         IFZrVnqLiwOUoy0enSAuNtSHWegNPwgTuKy6QGTh7D4XVS70Lm+DrbLLfDKWs4E3yQh/
         kLng==
X-Gm-Message-State: AOJu0Yx/ggAuZzMQ1hRwxos3rekI03ugcas4SY6Hvum3ZRjLC2CfYe1+
	bBMlauEqoVWPMTjZvnW85nZqworWjPfT1DuXqPVRJaLWygPj+g==
X-Google-Smtp-Source: AGHT+IFihrVH3fldA6xbmvIxlEjNgLwGjLfOCyD7CGXxUzVIOuychoqfZjc2YKXgcnLIYQLLqNOGDmj+MeRrPgGRWw4=
X-Received: by 2002:a25:b187:0:b0:dc2:4cf5:abf7 with SMTP id
 h7-20020a25b187000000b00dc24cf5abf7mr743558ybj.101.1705524599463; Wed, 17 Jan
 2024 12:49:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117194109.21609-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240117194109.21609-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 22:49:48 +0200
Message-ID: <CAA8EJprGU8E=kM3xqta794HjGAPp7ScuLv_us9KpjrELDKwNcA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> The commit 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> in case of YUV output") introduced a smatch warning about another
> conditional block in dpu_encoder_helper_phys_cleanup() which had assumed
> hw_pp will always be valid which may not necessarily be true.
>
> Lets fix the other conditional block by making sure hw_pp is valid
> before dereferencing it.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

