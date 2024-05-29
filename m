Return-Path: <linux-arm-msm+bounces-21035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030B8D4226
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2FD3281EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F3228E8;
	Wed, 29 May 2024 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogjXyX93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E541C2339
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717026965; cv=none; b=moAHisNPboPyJJ80Jv24GSjY4aw9/bG3rhXAmhTgxqIh/xLWjg55eN2J2aeJQniYhbiHoXxmV1uNdPm/IryCL25W8qTS5WXDVc+Pj0GGZYGI2YZM83+BvkdaknL+v2EQcfJlx1EHHkbLiuRAJH4EplTz37CxPaEr/eQGPPDLdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717026965; c=relaxed/simple;
	bh=brdGs7+pb8sC2FXk2RnoimKfHdjShHGj3gOYEkEmG+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJ2RAJZ9GyljwvtOYNeJ0vWr4LV02KMsg8UlraimzFpVXAw0BrQ0erNxM04iXP60OLLCnnW/2swYJCDadAAdURMVG+45Xw5yCFeYfcldXWrqW9wgg1EIfO3HDj8Ie0GLV5B12FBv2kciWVpLQ+hHKh4ffzydleWwhFcG3IZSz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ogjXyX93; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df78b040314so310259276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717026962; x=1717631762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f7L392EnXrVzvTNd9aY5ubW45gbNxK2/4AAEq4fHMB4=;
        b=ogjXyX93nIoLt8px7MgoVpQKaWDdcHe1jH9qkM7FX4CUhpi8mN7cSK4MaHaAhUnanj
         ZkalXdv0QnTWBC5wFRMoYNvqy+xEfX/YaCKMax8UP4vKCdM0mrl3LJPmu97vFqAz8L0y
         n98vhvwna6WEHKwadldxcvjeHLvLMkprCHouxtxlwVvqGJSA39frNsJO+XIvvH3Tc64e
         wykWhXqZMzdCw3FJd9tIihk2hoGmg0eyIpz9B8wp7wdY5j4sOrJYPOyZe2GntxgKFXAq
         ZkEn6V1sVAlYaYj7s4dKxoM+t9W/R8+5s/zaTEe2B2usM/FsWaxi2y+B6oHFXd2porij
         0LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717026962; x=1717631762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7L392EnXrVzvTNd9aY5ubW45gbNxK2/4AAEq4fHMB4=;
        b=AmX/oQWZDAxT3LGhl9vzFmp9IZ0v9/Av4hK3yE3LfbRTXy05tA9FTEV8zC9KYkVbmj
         nPz+U+krJZb2hlIrHmfaucKl5r5Ei+4olmb2jC1QZQegSusyp10/3V5OQ/OD+F04fYIM
         4SHmzE8wDdx21wpeCNKvGnjMa+ApC5CpU4cNbfuyOxV8HpmyT98PxKFEsSA9dOvOvSOU
         84kkCFWLHQMvHz76fmg9hehtPccZLj6JRVBYEPMaxMdGByRE9CzdTXR/9Zfp9oBXnnCR
         luBVzRzBL3noOhM7NANoNSDHyLavzzwnoPWjVLVnKfVtREVjcgvW/dNeO1GfeqjrcdmJ
         PmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVncoYW2dKuTUQbE0zbJd907UwLDK1RQFww/ooXASUPqnDE7JeAcIWb9I5aXZydoNaGWa9C4ZRBJR0RIoEazGEEgQfeqMBAlJfL7HBZHg==
X-Gm-Message-State: AOJu0Yzem8rSbsDxtHF4fyfOkcn581Qiu2xS/G7JvUHLGHLbjmdZtk73
	HDPBiXzpPjOCOkGdCUAzIydhTF09vVs3925TJ6U9TamC7Urj/bAoFg3/rPXNtrhh29t1j6VbaKI
	iZ1Mx2a1llDjLLrygrdV2wJ2pgTa7bjYBR8lTIA==
X-Google-Smtp-Source: AGHT+IH/NUIgBB0ReBSpD1tKmhU+t/VSQ1Q6ntm3hWL/Kgf547FVO4mO787dHVCZtSDZ+DYEbaAEHhngmUOMr9u4H+A=
X-Received: by 2002:a25:ae68:0:b0:de1:1b21:4f8 with SMTP id
 3f1490d57ef6-dfa5a7ff5e2mr754001276.62.1717026961783; Wed, 29 May 2024
 16:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com> <CAA8EJpoWUEGX8fq5qxXUebA-E25ONycm4NXscFhXAhFwcJGf0w@mail.gmail.com>
 <1ac17233-61ee-6eff-1e28-bd2d74bbc5cc@quicinc.com>
In-Reply-To: <1ac17233-61ee-6eff-1e28-bd2d74bbc5cc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 01:55:51 +0200
Message-ID: <CAA8EJpod-Zdea2AM_frsLUZ4symFuVCY0BU-6nyj8+jahifH0Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 01:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/22/2024 12:59 PM, Dmitry Baryshkov wrote:
> > On Wed, 22 May 2024 at 21:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> >>> Command-mode DSI panels need to signal the display controlller when
> >>> vsync happens, so that the device can start sending the next frame. Some
> >>> devices (Google Pixel 3) use a non-default pin, so additional
> >>> configuration is required. Add a way to specify this information in DT
> >>> and handle it in the DSI and DPU drivers.
> >>>
> >>
> >> Which pin is the pixel 3 using? Just wanted to know .. is it gpio0 or gpio1?
> >
> > gpio2. If it was gpio0 then there were no issues at all.
> >
>
> Got it. Instead of asking gpio1 or gpio2, I mistyped and asked gpio0 or
> gpio1.
>
> While reviewing the code , I think the function
> dpu_hw_setup_vsync_source is poorly named . It really doesnt configured
> vsync_source. It actually configured watchdog timer.
>
> Can you pls include one more patch in this series to rename
> dpu_hw_setup_vsync_source ---> dpu_hw_setup_wd_timer()

Ack, sounds like a good idea.

>
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>> Dmitry Baryshkov (7):
> >>>         dt-bindings: display/msm/dsi: allow specifying TE source
> >>>         drm/msm/dpu: convert vsync source defines to the enum
> >>>         drm/msm/dsi: drop unused GPIOs handling
> >>>         drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
> >>>         drm/msm/dpu: rework vsync_source handling
> >>>         drm/msm/dsi: parse vsync source from device tree
> >>>         drm/msm/dpu: support setting the TE source
> >>>
> >>>    .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
> >>>    drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
> >>>    drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
> >>>    drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
> >>>    drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
> >>>    12 files changed, 106 insertions(+), 62 deletions(-)
> >>> ---
> >>> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> >>> change-id: 20240514-dpu-handle-te-signal-82663c0211bd
> >>>
> >>> Best regards,
> >
> >
> >



-- 
With best wishes
Dmitry

