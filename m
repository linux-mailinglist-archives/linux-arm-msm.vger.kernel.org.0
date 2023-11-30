Return-Path: <linux-arm-msm+bounces-2643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F817FE817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 05:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B509DB20C87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 04:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025D9156E5;
	Thu, 30 Nov 2023 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3vZUl3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52DCCA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 20:03:48 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5cc642e4c69so5498817b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 20:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701317028; x=1701921828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jxl8V7SoUueHtisey+knlKp1RuXYZdbFzSs7V8BWyIE=;
        b=g3vZUl3OHu9f49CbbNcBR2wtWnRkeml0cMJ4vD6r6oUG8JXUrAhfz9vplKBRYw/QRS
         xs4GA+pUyNIOWkLLYzKTO/4QUfT/KKglMX04SoP46gV8AzGlNrYxF7n+LuV176/0FdR0
         BwuljykVSSstX4HsipCqYWTHFXH7Y7j//eDOsc4qr1DpikHCoh/lB41cgVA8Hv8K+M6A
         4yys0TocqXjQ7D38uH9LeEGCK5rFOglreC6BVdJySWCQhu4mdjjrKupwGDAcsGGSq6ve
         +AYsvlBtG129A8KWY4dYRzAB3fnlVgy3OZ3fKQUEDbiaMraWv3sx9PzX3UhdOBSaH2Pq
         KyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701317028; x=1701921828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxl8V7SoUueHtisey+knlKp1RuXYZdbFzSs7V8BWyIE=;
        b=LICr4sxuMGHLhU4/eCK79s7cfgU6guUcOZDaSk7o99irVZQQJdI9ux1FpKNxjdjAWR
         2XuBIxSNNSDnuG4PrpKMboSqfvWWMDVH+bS9nJBQXwGTFY7v3TItwY+KmLxfcU5C02PT
         UxYKPB7CimmRePgBSTmWP/JhixSQMmkSx5v9auZp60HtcHHuZEpfQlhPpGcl0yJV/D0y
         ah8iokEYLLRAGzby/t5eM2C99cuFEVQB7HGquZXz6kxdg2kMrWBwknak4lt/nhzuq03H
         T5/k3tNZnPmFtdptvXejWdpYEkgafAhtVwB4sS7Me/w90QFnGV7Lqc4nknkWxnRRBZl4
         /TBA==
X-Gm-Message-State: AOJu0Yy+lN73Ml+22xBHBEW/DLZzD5bPX1P3PXHM/3264NAT7zjy/S7o
	TNCqpFE0sckQAre+ytyyyByGGCejnI5HD81St8CpuQ==
X-Google-Smtp-Source: AGHT+IEwWLHqph3JGgHycFzt1NMlSK3FF6ZkBFWeALtSzoO9O/ZiigKO6lVXvEx4s2H9Pp71up9RUvjDqtMEhNaWtmY=
X-Received: by 2002:a81:93c6:0:b0:5ca:71fe:4dbc with SMTP id
 k189-20020a8193c6000000b005ca71fe4dbcmr19556613ywg.49.1701317027922; Wed, 29
 Nov 2023 20:03:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com> <20231027-solid-fill-v7-2-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-2-780188bfa7b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:03:36 +0200
Message-ID: <CAA8EJpoKvufcKvkYCBY2XoLVkbdNK_O1TFEGe889ETXeqR=dpg@mail.gmail.com>
Subject: Re: [PATCH RFC v7 02/10] drm: Introduce solid fill DRM plane property
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, quic_abhinavk@quicinc.com, 
	ppaalanen@gmail.com, contact@emersion.fr, laurent.pinchart@ideasonboard.com, 
	sebastian.wick@redhat.com, ville.syrjala@linux.intel.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	wayland-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
	Sebastian Wick <sebastian@sebastianwick.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Oct 2023 at 01:33, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>
> struct drm_mode_solid_fill {
>         u32 r, g, b, pad;
> };
>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 26 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 36 +++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h               | 24 +++++++++++++++++++++
>  6 files changed, 126 insertions(+)



-- 
With best wishes
Dmitry

