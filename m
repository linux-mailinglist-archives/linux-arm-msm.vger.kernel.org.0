Return-Path: <linux-arm-msm+bounces-2644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD687FE822
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 05:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8132281ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 04:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0A0156E5;
	Thu, 30 Nov 2023 04:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpik/YcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D0610E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 20:06:21 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5cd3c4457a0so5287377b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 20:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701317181; x=1701921981; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
        b=gpik/YcZQs3CpgTa0jfYPa+AGxuqwHvIUOP8WBzkQCkPg/6cCcaGT+KNAcSHTr+/Nq
         ibrEho5U2TOU1ytTLarpzjyjKla38BGAqKrrbBIFvgdjdEt2an64rBiHiLM6wDJwvnbK
         mPJrOlURVDdUSmGxOMOQccQcS1z8D8TH3LlBAE6qn4FkjYKrZRgzrvB3pkz3QRprjY0r
         Uj+azWQyiZWc2ODcgAOiTHKYnsO0j4OV0Hrfla6rWbsfM7IphlD16GoSNVqnxyCJoFN4
         Om9ogEecASouztJQIqhurSibsMtY3PHCy5cxsupxlolgiTFudVfF4wzBTJssOeFWGQXX
         fErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701317181; x=1701921981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
        b=lheu2N79FMI50HCIDxYV0M95a2jgun+IOx5ZlzZSGWh/EWR3ky7yop1ecNalAKbxQ+
         JbYRt9y0lQoZE6cJe012KzxJfW1DVUFSclP0xV3M0iQ/fq+XqQH1Z8Y3XarccyNHQFsq
         Gh7oO940wMVoeYDogy1/NziAR5WhGNjfymcWn99W8foDQEurR4MhCz+4t3YiCCMFGUO4
         xFGA1qUxpEhpV1Cjq2TjFQ3LO4NAY63pYjGSDfnTEFkqVFvk2PK4bN/kTxxHdeWLQBbM
         kDHCRS8KyZP0u1Ut0A/IwMmy86ElAMwYaDdg1P2fNPQJHdseWA4bouUo57NaB/xmD2cj
         AzIw==
X-Gm-Message-State: AOJu0YxVryZklMYckgVWO3BRwmOZVgC7AHsZr/zRaHhnubrs3cBFOhv3
	rivkBvx8QoWiV8VUGfYteFqHyLIYbxlNJzmoMQ4tyQ==
X-Google-Smtp-Source: AGHT+IH5VqWkIJEXkSlzehGjOyCBp+myDPhrn3B4acVuNRIw/JkoNdioljfuRcqvXowZACNims6bGNNgqho9TQqZ5ow=
X-Received: by 2002:a0d:ef47:0:b0:5a7:b481:4dd2 with SMTP id
 y68-20020a0def47000000b005a7b4814dd2mr21943989ywe.47.1701317180853; Wed, 29
 Nov 2023 20:06:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com> <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:06:09 +0200
Message-ID: <CAA8EJppjVcP3YbBLG2vaZrRP2FAVfVM4WvLieLpV3z1VQ2exAA@mail.gmail.com>
Subject: Re: [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic checks
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, quic_abhinavk@quicinc.com, 
	ppaalanen@gmail.com, contact@emersion.fr, laurent.pinchart@ideasonboard.com, 
	sebastian.wick@redhat.com, ville.syrjala@linux.intel.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Oct 2023 at 01:33, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source != FB, the commit can still go through.
>
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source == FB.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 21 ++++++++++----------
>  drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++++++++++----------------
>  include/drm/drm_atomic_helper.h     |  4 ++--
>  include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

