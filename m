Return-Path: <linux-arm-msm+bounces-15575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2D890298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 16:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791CA1F25D48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091377EF1E;
	Thu, 28 Mar 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+eW7grx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E737E772
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638322; cv=none; b=qWWUfHQ6xjgcpy2YhdOh5Hy3gt+CcyTNYX0LtBRQG2DgY/OUnAPrZW9wKLhoBF9kt9n+8galF7A/BQH2glkt08LOEP0GJ7VfpdA+eG8cDwibpCZeXOeFFkXK5bPxsScvMGr5ZUorrOyuJhebx0eY4PZxbOD8ekT1ITRjQBDCv1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638322; c=relaxed/simple;
	bh=YrdTVxO2JSQOvQVRFdEvQ8UD5QBj/9QLsGzjgd3WYk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l87i4HOlNDSgM2LwjFgDyzdNWHR1q7fUHCWwYsept+Nm1WxZd38LlziDrg3hYvGfEGqebbB1EB6Tyq14FDKnQhL2rMtsf+Wb0yrIdEWH3/xZvVQaHEypbTriEMobTYY1F8uKppHZUe3hZHpg9ff6uSCZqP236t2E6IzEdXuDYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+eW7grx; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1038688276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638320; x=1712243120; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWfA5aPAvh98tytKTp4cttImQzYAy3tSsHDp9BTN8yI=;
        b=b+eW7grxdMQrnq5ySFLeOD8OWyadmcrawGqR8jAoedSsfhshN2owrIg06gV7DS7aHL
         6uyf+mUdhTB1Dh4MQ69oEFCDujs28POGwUe9+0P8T/oqDTrXatiYO0EFQgg38gLhqgHm
         krQ0tjWi15tk4HPS0HB3DjBqYaJuFTJsppG2FpGmQt8Igf+OZ74dkS8G7WXocEoj9YOv
         D5uqK6bxrnp//7ZSOHaSu0LBnMIt+NfP3u/y69W3U+Y9wfom50TTqojp/dDVTTfHp6q/
         bour49DhkvnyYjz9ENKW/ELZwEM+OtCzNqSWxlohWo+nThPJJGcn2wjR6Ce3UvHy7Tuv
         oKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638320; x=1712243120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWfA5aPAvh98tytKTp4cttImQzYAy3tSsHDp9BTN8yI=;
        b=XnP5h+saW2KbfyZgjt2M7CyjlMTh0Fe8JeS06Z7nZr6iCqfFIYeRZWbP4veN6PLT2u
         HUMFVONwmkR0oJV8X+V0nUzMACNUjuTztG457Qhyl8lGbRD8KPrvN18lNb5WGBAulh5T
         gbISVxqcgNrwWcnNcuY5U8/v5UIOMJdxsQ83KCYMZa5tg8XzJRnDG99cEpuR+F6Lh/qu
         3Ede/ttwEOwouKKIXIICFelcl7/4bYcOC8X4d4hrASg96i/UnAFx3CnPXPOdzwpiMwec
         05Sbyy0CY7ZKMWl1yfwKeILRfFKGLSgJto3XrO/KziW5GC3w5DwZ3bdg0F3KZ0KYA8Sl
         8gSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGPXbnoIurBxklT5beaLCZHpw9/AFubfPLkxHWHBWEKNHpkCI6D0zvb6D+wRYC9WnkLJTJuZuAi91AYRDwuoGDhidcxorMSiH9UrW9CQ==
X-Gm-Message-State: AOJu0YxMYHEi81/preDNL5Lm/dfmfDPjg53cU4spj7WAjauchuOcvxvX
	lkTrSOMgTFfl6oi7NsbJFjxZvaVOhM3YSFNvvPhaRXcLAfbe3Q0lKGGkzMDzOA8ps1JNcJuVRqb
	QPsKX6txFzAMclgd8cXX79Ickrf9eHSz6QGsw5Q==
X-Google-Smtp-Source: AGHT+IH5Xh+9FupHdZIT67h4lmZsG0DyoBdLyn4cmVbBccJpUVdzNv2lXzX29oOTWVqXhXAL3MPjvraXmi+NFx2bMAU=
X-Received: by 2002:a25:b843:0:b0:dc2:5553:ca12 with SMTP id
 b3-20020a25b843000000b00dc25553ca12mr2994878ybm.14.1711638320206; Thu, 28 Mar
 2024 08:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:05:09 +0200
Message-ID: <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
	daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Fix DSC timing and control configurations in DPU for DSI video mode.
> Only compression ratio 3:1 is handled and tested.
>
> This patch is modified from patchs of Jonathan Marek.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

This almost looks like a joke, except it isn't the 1st of April yet.
The patch lacks proper Author / Sign-off tags from Jonathan.
This is pretty close to copyright infringement. I'm sorry, but I'd
have to ask you to abstain from sending patches w/o prior internal
review.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++--------
>  include/drm/display/drm_dsc.h                 |  4 ++

Ok. The feedback for the original patchset [1]  was that it should be
split logically. Instead you pile everything together into a single
patch. This is a complete no-go.

Also, this patchset lacks changelog in comparison to the previous
patchseris. I don't think I'll continue the review of this patch.
Please rework it properly and add corresponding changelog.

[1] https://patchwork.freedesktop.org/patch/567518/?series=126430&rev=1

>  8 files changed, 56 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6a4b489d44e5..c1b9da06dde2 100644

-- 
With best wishes
Dmitry

