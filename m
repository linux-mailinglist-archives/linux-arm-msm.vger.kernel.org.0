Return-Path: <linux-arm-msm+bounces-11140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AB855C6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A4A4B2CDF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC84514286;
	Thu, 15 Feb 2024 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUUQ3jf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753414013
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985217; cv=none; b=aqRGwxJjOIQ5gqZHcTkF0N8mtziTENPqNrn2iWxa8Jf7qY+Xy9h3KeK/lzd4D4Sxu8hBprVWYpKxhzrdnAgTrb8n8PAIzoYOnOw//JxMcYptUjWtEAWSAOFtrX0GYgLYxs6aFY+fWbrwoeGa8AWU1F7oVseUOf8c/pE34OF3Wp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985217; c=relaxed/simple;
	bh=zaHAvH2jKFAr4zBmjLOfjuivmIOAvMHZWjSICERGKFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZk4lSA4ZEcdcB7iN+8JouPn5aGy5iolCdSdGKOlKvPgD2BEkMUBrsrifiN+2KwHm/LNeCvVpDrTAhWOHMd6ynTO+Y2kHcNxK+KWBeqYqXkdQGtRRC3ZczqUDEsYohBcOjpg5zg4Mvv5XU0KuL8m/gCGD7KIgsR1TESUXDmbAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUUQ3jf8; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso513742276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707985215; x=1708590015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Do6lkICkviYxGolQ4jKofjndpLLNdGDEYdxEGQGE5Qw=;
        b=JUUQ3jf8HbEIHg98bGM92I5hVP+jHpSH/zKoy1ggwRT6nqEc29AJdZrzwJxZPV08Oa
         7jE5sbRfQbq7vls60xpLaKnP+D8gs1F7M6yBiHqcLQ8fzpVWWI3lyOpgw9xgtcP0gY3G
         JrWUOK9+qmGqB1HOYpQIz4YCPEdbo4mfK/77Wyob/1VJc8A6cwGBaS5iG2laYZ0U6nC9
         mdN0KBsB0OMOBVf68dF753lWwYzJFJNUmuguNGVx876z4l4CNTuS6GlaMdlDxGBjzaKB
         0m51ADk2nwi2ojXbHAiT702vGq9Td2ecAIIMOSkvafYf0cxK1VNCqtc512h15yEOA3tG
         /C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707985215; x=1708590015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Do6lkICkviYxGolQ4jKofjndpLLNdGDEYdxEGQGE5Qw=;
        b=samyG/WO1JOgVXu9fKPvS1PThYIYWiAuxxChyd7GjLHxGgiW/gThTgaan4UsH3F6DU
         ULHLuxMjKQrdq25nsrC/9Vz025GqLW12QtUpJES/6ekPtfeuUXbDqLzWHHoH7G8TbRjU
         6obDKh/hE0doUcE/28ILyJ9Dp8nU3plrnwEO4wftYOC2r4UeVAHo/DsTRhXJVlDdxFKg
         pzZReRbK4x9z6tRJqWLPIlo/SmrYUxlEx9lxkY1T76vHFuXru3r+3owANKODtPRPkzfz
         21GLKh5R2Z4pWYasfVqb9c1ffDeam104bnIbhkaaQebnO8eqybU/sX7pnjjcB0bRS5YN
         C0pw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Bi5oDCSjl5XXqhih88tDfWU7K/nWs2uiMcSN9fsEt5ZGSUgdd04ZOYB6VAus6ebM1LcTiXLFiUfUIwPCBPeroPFlOUdDz8e090KcdA==
X-Gm-Message-State: AOJu0YwampnqIZh+o1fr5DnRq8oQwmjsSk+/pUXUMTLHJXe/qA/vi7hD
	ZKbfLsnRvSaaEPbqcfbK72UiXGxtH3qQQmiY0ovcM+jKQZsIIKYEwyd3O9sBAn4qaRkCBBfybuf
	CnL5H9zyogmSsQgFLZeR2ixpdytpwPXi+YyYYfA==
X-Google-Smtp-Source: AGHT+IFR0BaawAwJFtSrOqTIsOaDiPK3hJcwFuKA/JF3s/kl+o1cA1+0zvrdu4dUcz7SxN9wKGH+LLMJUUmzevFC5+c=
X-Received: by 2002:a25:848d:0:b0:dc6:be64:cfd1 with SMTP id
 v13-20020a25848d000000b00dc6be64cfd1mr899082ybk.36.1707985215265; Thu, 15 Feb
 2024 00:20:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org> <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-3-cf05ba887453@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:20:05 +0200
Message-ID: <CAA8EJpobjxa4-Yu_mZxUPiFEcmA0OyxtM4umR1OvBg_WB4pj5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm: mdss: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 23:24, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add support for MDSS on X1E80100.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

