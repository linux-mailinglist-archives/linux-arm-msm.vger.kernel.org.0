Return-Path: <linux-arm-msm+bounces-15241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E688CAE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C94E1F6597D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE811F944;
	Tue, 26 Mar 2024 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJBmIaUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683F20B35
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474166; cv=none; b=NK/p2uoKFgbZyD/qUaQJjidby9llgj+bsyALwL59WI8u2teB4amZi+Bcsrp74IbVqvyNMc82fpCl2T0e9hb3xXCDpCaR2igEpZx0jNheb+v0knAflMsIt4JfPCenOKggZ/I8Oy0EBqcUpQi+4GGgLwkS7J2D5yCwp9ATRB+zG+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474166; c=relaxed/simple;
	bh=dHAy3DwfdrKuyZt4hmgGEpXz9cl+D2CijNaa+rzyADA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOqdRLKvJqFdq2wIwK7enDBUvZx576G98kekI8ln962Hcjx1cEmOfDE2FWL5osxBgr3BPtc+68TgOvM4In780N+4TuIPc3zrmEWSgsp3jiHU/f/fp5iuDJLgxDICyz2oDOwnLeGxodR7yQoDU9LZhjxM7DBCtLnu6qymL03yZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJBmIaUa; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db3a09e96daso5404038276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474163; x=1712078963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=11p0UMmKH1MnLtrO/gYwy55UQmZhc7eSQzB1zZ0+1Y8=;
        b=aJBmIaUaE9mwcj3Sa0fx2b46aKJ25XoZcBEaiP1KmTmXq82plw9MFuklP8QdVQXibJ
         DNTpFgZvlAm6eMHN8CFrju2K0bu/6NFbbDynzUVIrVPrmgRHRhl/sdDn8kYqVzTZA0pd
         WgXDOePQlQPM1ArD+klUau+OUjJdujKPPXR6pR7l9x3MMC5HhnyZffgMh/Z7fSK9x9aY
         TgtkKfLgwSwsceKIKikpeqL+4wu5E4yQ2ZS0nb9mM4YWeV82FxnUJQVR0xdByMdYtVwA
         YT4ehlogpda2QemYWgbthJ6qHnbqut0bv7/oIMxWsABa+H6c0fA2M4LmD15zuq3a0cW+
         CBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474163; x=1712078963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11p0UMmKH1MnLtrO/gYwy55UQmZhc7eSQzB1zZ0+1Y8=;
        b=gzABIMa4NXpxSTPHP8e7uUluKku2oQZWCbFHlRxcy6qOFyrxf7i7AVpaxAkj4AuPne
         8mdF3OEdy1j06/VJMds1sFU/9tNZMOisKaS9OFViQHixrY5/gTDYBr8naIgdVaZL0GPS
         9vKc0hSZ3S4MgTBG874POjxjKWlZKrRb7FQtA6qoSce+Ko/j7jZvuHNFQwwH60IKuZEI
         nP26B2X1o6q7Zg3CGCE8U3c3NcVjCWLdyiNsqkXsW6G0911kYSdgVLHU+7kYxR/QtPDW
         wJIU2PFzMHKoOa5rTz1Nsi2Xqsg9eRyjD5ubUnQ9FkMWGXp8qTy277suXWWKPFsg3/A7
         /JYA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSyuR4WY3T+iGU2DSfwt8rJIglg6JjyR13/t5h17BmAjL2DJqIuT5J70vFCN5tsut4cwkZswG80k/q6jRzHkGqHyEVDEXbUmqUc00Rw==
X-Gm-Message-State: AOJu0Yz5YCYzwI8/PWh0jI2qz/+uFjQ9w+kV8nZL3yct9M006JQ6CGGH
	XR+v6oXKpwKQzbnl7jlFQlqIkGgciNR+aXSZLXMF1YEJYE91DDUSHc2O3Ce5i/nj4nbPwVqUPTa
	aCzaF/4reJG2pBmMCEIBmSX8Pyi0TV6ExVQeDWg==
X-Google-Smtp-Source: AGHT+IEOabZ1Kz0WgVjOqqWDaky7HSvouC3ZuU/CFz3IlxB6Zt/5TpK+icVIpdKPsEQ3pgI240eYE6V09+ITV2S47Yg=
X-Received: by 2002:a5b:98f:0:b0:dc7:42b8:2561 with SMTP id
 c15-20020a5b098f000000b00dc742b82561mr9218122ybq.34.1711474163590; Tue, 26
 Mar 2024 10:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com> <20240326-msm-dp-cleanup-v1-2-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-2-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:29:12 +0200
Message-ID: <CAA8EJpqeV-GCizJ5t-BvLDt_O0k6qQ+omma+8KkwFtX3PP_uxw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/dp: Removed fixed nvid "support"
To: Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The "desc" member of struct dp_panel is zero-initialized during
> allocation and never assigned, resulting in dp_ctrl_use_fixed_nvid()
> never returning true. This returned boolean value is passed around but
> never acted upon.
>
> Perform constant propagation and remove the traces of "fixed nvid".
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 +----------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
>  4 files changed, 3 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Kuogee could you possibly comment, why was this necessary at all?

-- 
With best wishes
Dmitry

