Return-Path: <linux-arm-msm+bounces-12242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272C860479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCC01B29710
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D01473F1B;
	Thu, 22 Feb 2024 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pep7f0Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46212D1E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708636248; cv=none; b=SXZJ7BmzBJMCwW6Uz93vIFaZWS5pMfrAlYpcunWaMPCNBYwJr9vGD7Iwolc7847wDhi2hM3uVRCFzKfjhU3K0Ei2fad6gSPDeTQasZf2ffbXtE3QNnO5f6ocmwUq34CxRJuMd47DxEMC8+OIm/lMRiXpQOKQccIcB/vJ6qFFMCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708636248; c=relaxed/simple;
	bh=Y7aa4EPdQeDb/k5BX8LnNG73kjPd5qiN00vjE6nM2RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U54gYML3+GW4rMWi4Ym2kIp6QIv35GzllcwA9KX8TppHoJIN8nPxZ+ztYhQKkRjyEHb2VtYi3Hqobdk0F3E1AHCWfGOWDB48EjmuLIclux5fua+Y0LO9/swXrEd8GRhqUmJRylPMdNbTprP6Ao5ye0Dpao/HS2MqmIc2KjRGV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pep7f0Zl; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so157276276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708636222; x=1709241022; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KISjjhinzIu3kIcQRpPQsw9fHAQrHUvQiIbfDFbxHeA=;
        b=Pep7f0ZlR80pDJXadhbCse5Qn0egw+++lgbATNgSL6evXNjeaqMctvxpkr3t0JbVDX
         XddISI1lj6IxtqS3Wl09G5HLRhbiFsDWAIEJ/xbiaZ2dfnu/ZfB9vjXZKmGgI909rZM6
         m+AyAXcZo8cxDeyKJd6LUJzs08XAMwlUG5gBjaE+jLhycUxGYs7n1+PnXsoGZMm2itGh
         4sOg+hm2ew7n9q8FKnhV3LzbKszZe0ZnJgxlebUO17I8qGDYT3dZF7pbNteialiFkXpS
         Oy166qxxbyrTz8d0APfzThbM7y3l8EHCSaNUnFjPsGkzb8qSM8AGIFuPppwyeDZCWSSR
         uZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708636222; x=1709241022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KISjjhinzIu3kIcQRpPQsw9fHAQrHUvQiIbfDFbxHeA=;
        b=ei0J5UZTslu8Tms96tBdtoX9ogcY8+s0a+U0XPACTD8E4nGEV0W1gXJx8NvZcqwY6x
         nBL0naxx/s8cEJI6M8UmAVURVGuOecTh6NMe5EDyWQBJMGdb7nV2XPJP82CGoq13rYWx
         liN/BNZ3A4Gtydte+3VyFOcDIKyXGVStS9+ab9uPtKzzBG1TbMSQcfwPEvmAiWhFj5rN
         Ns1TBu5XVrBupDKS5nxsIy5Y2g0JphjMPFo6FTNZRtTqZTf/kbXgDg8pG3EqQ24+pIOI
         4HT2/A6klq9sVk16gTGGjPT8CXjNha1ebG8mAGzy7y0uRbeyT5vvLFh54CveZtDiz0BD
         lXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzHpvykCG72gv1wQDcMNzsyIn6sg5lmZwHoT8wOU6OJZ0s0K8qm9t6wqelSSSPT1klL/Pr0T0cgtyHe46cWMWGbtWfImeUISC9I1bsIA==
X-Gm-Message-State: AOJu0Yw3KKMj7mtV1huYtaLYSyPan1k69ancDNCSRJuyzIdgM0t14mID
	gAmqk8lTFBPt0KoP98FMValfj44AK4gIm+WqLQ16e39gxDvm0s89xpYaEnzNS8U0N94sxHZ8qQo
	3gTnG4BEfvuAtuGLE+zXBo0tb7VIkbo9Q8sdqZA==
X-Google-Smtp-Source: AGHT+IEBy/FkALInxvThzqnKOPLYZgoL5uV+k6buUGcPqG2FwQZGtnq6q8rWdEVgVmBapKjqMXBdOJ9HXitiHUCL6FU=
X-Received: by 2002:a25:888f:0:b0:dcc:aa1f:af3c with SMTP id
 d15-20020a25888f000000b00dccaa1faf3cmr366027ybl.40.1708636222326; Thu, 22 Feb
 2024 13:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org> <20240217150228.5788-4-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:10:11 +0200
Message-ID: <CAA8EJpoPaknqPUEg8p37Nh1MV62Cr8fH+MxE-1b+T-8h3BmO9Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> A recent DRM series purporting to simplify support for "transparent
> bridges" and handling of probe deferrals ironically exposed a
> use-after-free issue on pmic_glink_altmode probe deferral.
>
> This has manifested itself as the display subsystem occasionally failing
> to initialise and NULL-pointer dereferences during boot of machines like
> the Lenovo ThinkPad X13s.
>
> Specifically, the dp-hpd bridge is currently registered before all
> resources have been acquired which means that it can also be
> deregistered on probe deferrals.
>
> In the meantime there is a race window where the new aux bridge driver
> (or PHY driver previously) may have looked up the dp-hpd bridge and
> stored a (non-reference-counted) pointer to the bridge which is about to
> be deallocated.
>
> When the display controller is later initialised, this triggers a
> use-after-free when attaching the bridges:
>
>         dp -> aux -> dp-hpd (freed)
>
> which may, for example, result in the freed bridge failing to attach:
>
>         [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
>
> or a NULL-pointer dereference:
>
>         Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>         ...
>         Call trace:
>           drm_bridge_attach+0x70/0x1a8 [drm]
>           drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
>           drm_bridge_attach+0x80/0x1a8 [drm]
>           dp_bridge_init+0xa8/0x15c [msm]
>           msm_dp_modeset_init+0x28/0xc4 [msm]
>
> The DRM bridge implementation is clearly fragile and implicitly built on
> the assumption that bridges may never go away. In this case, the fix is
> to move the bridge registration in the pmic_glink_altmode driver to
> after all resources have been looked up.
>
> Incidentally, with the new dp-hpd bridge implementation, which registers
> child devices, this is also a requirement due to a long-standing issue
> in driver core that can otherwise lead to a probe deferral loop (see
> fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
>
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Fixes: 2bcca96abfbf ("soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

