Return-Path: <linux-arm-msm+bounces-15574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5606E890276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A4E28BB02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 14:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F26712BEBE;
	Thu, 28 Mar 2024 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLQ1kzBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD57E78B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637941; cv=none; b=JiawoH+Gn38fBTkXufmE5Cn3ych3GEP1vBQx8LJgTSixGvaG0vw86KaHPUa5rClczgKGMxyWIC0gikvPUto341wrsWIkAqn3q5IuIhHTg2/QVrZ8pvnF0EKGEtbDzMvTP/Eq/Ewbn6L/qJj7sbrDWXgdHBmaniXh5pEgNjF3++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637941; c=relaxed/simple;
	bh=S07WbAKWwFFlgqynVgWzUcXXhp61OG6T360LNk25blE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5N2PZy5RQUNS7prrq95tzxR1UmoeQJhvXeeZFe0ZgYMRRIiAHseIIBFB+LEm7w3ZPaKLRJy+4auIQxBxRL/4GME8fhZTlb1yXzsPaJJgqXgEksRFqhv1yxy8afGN5PGynpccZGQxjpx/pva9zqG53+/4TnJHcl2fZMIFZWVrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLQ1kzBs; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso1074542276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711637938; x=1712242738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
        b=sLQ1kzBsTmHL5IfhfKnUNn0TSOLyPnK8sKWIsbcr3wbpf9N9OOb1ZxoqQ+b13lO35T
         HPR6ErZpFcWiPi3msAZoOtWKCkzaxK3jot9yAEFsgY8YvgFVzrZzSOmAKEQLaGnBa2gK
         XPT9TWZ4vmCaQyvEr3CY5aGhO9e0jnBlss7ChJH/UlZ1IfkMOE+i+0Dp21O2Q+4vTrbB
         byKMtdazigPmGuEGhWfB3AnFHSyEp9xyj1QPf/Bj333AfLfJuW/iSSGcskdE9Rf3rX+f
         2tIcuv6ONoNAJxro5QuY7FCZauOYjErrU109LIj9CoNKaO1OlAJAxxzV7JOAKOENzDlf
         QjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637938; x=1712242738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
        b=X1f3q1qn8gi4Sqf9gT2ijGRle8PC9FIIOebrbx2DlD23vykYhfZFyBtI/j2m+km9r1
         diQXZPlugz4v/hOJ3w6Msyjarp/YdvDfzRhNNukVTSn9BlHKmAfRjhW/1w1keiPK1FSc
         xqnrhbqV0b376gUF0imaxjze2Dn/5g29M9kSFhvBjSVP6xVAy8gqz+Ii72KXMClSViq2
         Xep6/5OVe0rS5zJxGTXsyRGK015L0zGDBFG/qJw0dLat+C4gtsdAr9Vbn+oCkTwX1bhz
         CJEzd7vq4Z8yldx/M6L/QV4D4oIeSLGzAb09Q7uT4RJm3fG0DT6+sWAGLxN7sBusYBtu
         sn3A==
X-Forwarded-Encrypted: i=1; AJvYcCXpKAV9GAwi0MYnkOMYpRMHoy0NbnllshAk/2CYsGcIai9SCV1OYc73f2YEnfPmrx7bKTteLPzb57NKgvFSO75wHYHr9Nail/DkMsFKzQ==
X-Gm-Message-State: AOJu0YwVPZKxu5xSMFRJc7+0rnWa78L3KV3vpEGqz4WgZAvWhu98xmWU
	1728ELhPwSWak3/WjxP1f6vIpsIS+R6ErBqQVp/nPD/uQSbl0Lw0DcdPqdAPf+1OUlEsA790dD0
	OLuVb9rpJPHeSmj/80vDI4fu1RWLiC8A//YWBTA==
X-Google-Smtp-Source: AGHT+IF+BfSq3vmTR71It1RsEmYi9x9S3nf8WUR4Z19wo3uyG6m3RAGGX4yROeCZyzIC+VlGw62uQlxPCj6DGfxVw0Y=
X-Received: by 2002:a25:ddc6:0:b0:dcb:38d3:3c6a with SMTP id
 u189-20020a25ddc6000000b00dcb38d33c6amr3189252ybg.46.1711637937782; Thu, 28
 Mar 2024 07:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com> <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
In-Reply-To: <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 16:58:47 +0200
Message-ID: <CAA8EJpqr=SE_-9JMNd+QksTkVsPJGk-F2tJcAyH95t4RAW5aoA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dp: Drop unused dp_debug struct
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 16:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The members of struct dp_debug are no longer used, so the only purpose
> of this struct is as a type of the return value of dp_debug_get(), to
> signal success/error.
>
> Drop the struct in favor of signalling the result of initialization
> using an int, then merge dp_debug_get() with dp_debug_init() to avoid
> the unnecessar boilerplate code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 59 +++++++++++--------------------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++-----
>  3 files changed, 31 insertions(+), 76 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

