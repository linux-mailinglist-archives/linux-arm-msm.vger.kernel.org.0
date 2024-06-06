Return-Path: <linux-arm-msm+bounces-21967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFCC8FF1DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C185B2A05D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3595197553;
	Thu,  6 Jun 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZLWFRMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA979197525
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689355; cv=none; b=C8r7fnRI82EkYPXHdNl/I046gZECYxZ1PsIBvm5GTzxY0S3VJSz4WAMPSyriHjEVfAWK9ZTZXzzQydNHDhRdM/GDx+7VWj4K0cg0XpyiOXOjVEVLXakDRMWVQwf+6MnRVd7PRaiTk7qNzFpQ7zCVxFQOuEL61LpFExpxNxkeQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689355; c=relaxed/simple;
	bh=gZABkgQCe9fU9Mw899tmLTE4UX7NncaFuL0OAh0yXRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYk8GjuWGRB5YY558hmYX+O7TRurvfhpHXYwrNDKu6IZhHEBOp8XOKmtv1hjJ5VwTThy9+dEDuTYAQUmyNq6T5gAPhMNP3kOZiOL772hXCoHh43sX7P66sv97R89m8TCkuHGD/LnVnBtTNMELKVEaUos6tzIYmh4PvznIKg7cWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZLWFRMz; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e72b8931caso11494191fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717689352; x=1718294152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1fwDi7m8Ls7tvW3PNXKUz3XR7Aa+gs5JKKnJgNGOmM=;
        b=oZLWFRMzSfrWOWRVoiPaBP3BIYrvUyh/oXNSn4HOXy3NRZ5B2rlZ/8vm8XInBR3AnK
         Gij5Pi31m8vLcXr9WNFRameRJkakOgl9N4zsVTUUw1pfyODYQp6TKH6GLfojPNQMUMyj
         VDua7x0IJzGYTu72Qo6H2o1xZOMT+GXEM7X8KMEnmQlg0Bk118hVPkNOVo/xRMLU1z2m
         r/dStroY+KVB9OvdRr8nX1p48iKWD7Hw8mRMFg+ruELuJ6A7iFg5znvoQ3abnjnG7X/g
         +V0o0JVRYg3KbU+9lM+5zUvIKoe9fdt4ClfYRYXz9aM1Z4p8mXQSXmkr1Ydf9aglVnjJ
         6LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689352; x=1718294152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1fwDi7m8Ls7tvW3PNXKUz3XR7Aa+gs5JKKnJgNGOmM=;
        b=f/TYF5vknREMj+WL4UhOH7FJ36ScubvuaHlNAB9Eikj20bOnoOIGnClagPE+7ga1Dd
         fDMAp8m9em4inKveU9n5o4gMJPM/oKW+IXj8tdnKYBB49fHMkgQ9Ca3t28JGaQwWP4zU
         ywBJBDJWm0LqWQBfbEzUaIYpQ6LjWfxrXbd5kBRMxl0hpBKuxStrngBFMAQkViBWu1Pg
         cpINjYtrr1cUBzciaDAi2/QzFbIThlsK9MWtk/gVV93c6fRMxS7wfEhjCoR0NH8hqWUW
         6n4AfVRlqyphhJfVe+vehDIeOzpFPtMFMpc7t7DSTj1z3kUqSI91mr2/22v3Cr0zyrwJ
         gvSA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ37JARMWSFHf5e3DIKwz/vLJy4eLgOms2rGmMspIdM03AsWSU5OVXUnhih10Jx1YJ3T9FmAqIEbj2UIU70EabpWamcxXOVJFMl/NJtQ==
X-Gm-Message-State: AOJu0YxF1a9jg3vQzCnfReCfnDriqfxJuQe3lD3NoNS7UANIcRistje9
	M5lytK2/Ma5LJl8c+hC0pb7hLuUshvan1niCEaLsV5yc4AoLG7mW6+xKRkTON9s=
X-Google-Smtp-Source: AGHT+IF4280Hgq0kqRgUvq0jhrs3am+fMEcFKbapIcsA4lrLBrVyPmTNuamu+kjd/+STHe9uv+uXYg==
X-Received: by 2002:a05:651c:a0d:b0:2ea:7e6c:42e8 with SMTP id 38308e7fff4ca-2eadce79aeemr851011fa.39.1717689352020;
        Thu, 06 Jun 2024 08:55:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41b05f1sm2390791fa.78.2024.06.06.08.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 08:55:51 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:55:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Connor Abbott <cwabbott0@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix A702 UBWC mode
Message-ID: <7mvu3xeosx45eorr277f47tb4ymujr7lu5m3vytfcphasxsxnw@qtia62v4bi5k>
References: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-a702_ubwcmode-v1-1-283fa9588af8@linaro.org>

On Thu, Jun 06, 2024 at 01:10:49PM +0200, Konrad Dybcio wrote:
> UBWC_MODE is a one-bit-wide field, so a value of 2 is obviously bogus.
> 
> Replace it with the correct value (0).
> 
> Fixes: 18397519cb62 ("drm/msm/adreno: Add A702 support")
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Closes: https://lore.kernel.org/linux-arm-msm/CACu1E7FTN=kwaDJMNiTmFspALzj2+Q-nvsN5ugi=vz4RdUGvGw@mail.gmail.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

