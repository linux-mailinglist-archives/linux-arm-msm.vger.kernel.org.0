Return-Path: <linux-arm-msm+bounces-9752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD22848FA6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 18:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F93D1C21074
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 17:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC50F23749;
	Sun,  4 Feb 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FfYqXvSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F1249E4
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Feb 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707067453; cv=none; b=M/WkyIiHAxkeI+5mWQVfzVfP1GA4PeNoJPQ2IAAcz+l/hIL5Io5AUWzwqJ447E7hAe/lAhD1z8Bs1nCXKKar9HV2YdAKXkE80wmYzpYqaCqvzQokbHax8awoXxwCrkrw63ewfIkW3X0xUwsAZI0RyQPAEXlBy4n+IT6kB7PpZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707067453; c=relaxed/simple;
	bh=ge61ygw4PmZXaFKzfXuyvYCrts6fN3YIespn9P5gMzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFnShC5uXRwHAqGyARO7a+ybwzJpG2DwhDdZVLzZey93iEChmIQSI2JPpIwcl4rC1W9Tks+X/6UMG/LDp6JwqXDKTTrmiSY2bdi8O4OI5EbpKCnKFdoQWwHRwz/E+HpkEtQhMee/reReMf876uFOppDH5pRiZERi3i0Vla6EK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FfYqXvSw; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d8f19ab3so3587537276.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 09:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707067450; x=1707672250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T1P19T303L/B43bwnD9+Y7IOxEcnJdUhgKJO0qIHJpc=;
        b=FfYqXvSw/1arNlPxIyfFAnejcpwmBuL3gLjQXL9d/eDpzXdnDQbEKNW2U4DjAMUEvF
         OcGYEHzkaiiMWF23P6kmtyLZvwYXprq9JqCjO6cYeyUerQ/dUG5APQV5cJ9Kk6kKbulA
         vWBLUNEzvXRpx6BFkw1cL51o3nBLF0iS81uyWeD5yhzD3qBjfOeYi28IPL84dt73RvYD
         nvI9ZdDvJR43dXoCKSrt0B1T1D8sYAk5npVl5OL4FP7SJbK5kq6FSgmO9FO7juyUsXVk
         1XDWG4X4TdkfOlKIthGKP7CdimfyIk/j59bs1vQwG7MJL174Afr8SQX12pQDUBuyajcy
         3fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707067450; x=1707672250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1P19T303L/B43bwnD9+Y7IOxEcnJdUhgKJO0qIHJpc=;
        b=mOqQZTsqz9QLMwkpUm36dY52AxzbHPrPCUh9iQKsQ73lqOcGQxOIz+Gok47EIn3VLe
         haQ5AWYzysFFK5RPQ8CLCBVAQcXg0/5AiGnaB1Sq5dDVF8V35yFcZWClTQStAptr3r8K
         PQ9A13v+BqXa/14possN7Lp3MVNTMM0euZXw8N6beDHU+bmB94OwBKNWFFWB2zU7V66/
         juJ2Mg5Cf3oct/x5aYAD/UVJNDX+d4H3HZXBZQCDefDCkj4tLO+hm1vk5c3uk7Po9H/l
         QatsFrSVHaK5k0VBkrh6myd+f8NNLReLtend+XT+nhY5neiZGCcSQtWOs+V4168vcACf
         0JhQ==
X-Gm-Message-State: AOJu0YwZ2VktucXpPWSu/YthCH6lUscGzg7ksglnVRUfqAk6/IaYLOmU
	HJTXM5rFyQX6pHs5FUoFVm6tsUMenAQUubFXcjzZeYOp0opXO80RGPcXbxThNxcgNWjliJCPs8X
	Gan93bD/7kAqEOFe1gTBQqXh+rozsIxx5jKMUBA==
X-Google-Smtp-Source: AGHT+IHZYVkC99LHGk0ItLne/MvFpBr+BVnK1MV9EqBBA9F3ArKp+lRF7UX8mtilpk16mlV1PhE7o33VzQh5K0Ob39s=
X-Received: by 2002:a25:ac5e:0:b0:dc6:4b37:e95 with SMTP id
 r30-20020a25ac5e000000b00dc64b370e95mr7149348ybd.26.1707067450280; Sun, 04
 Feb 2024 09:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
In-Reply-To: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 18:23:59 +0100
Message-ID: <CAA8EJprcdzEzYKzscyB0J5VrWfF77xJs1SZaoCpP-GQZ2AFmpw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Feb 2024 at 18:04, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
> to bpp, named mipi_dsi_pixel_format_to_bpp().
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

