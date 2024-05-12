Return-Path: <linux-arm-msm+bounces-19758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D11E18C3548
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5D6281B67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 07:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F04FBEA;
	Sun, 12 May 2024 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGNoYfnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875FCE556
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 May 2024 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715498307; cv=none; b=ndyQQ1wxfIJIi0LhVHUt/D0xRY0GCe8yFTrP2SIllARgkeSAwl0T2azeMgv/smAHlPbiaXh5KG/FpYpiyaMIKEBXPy1C5hcSEOGjQzbdRh7nDtVK+on5peU8a6QCFOOHEx4k67L8B0bYCsSk8SqQqyhU9gUw3tfsya40mNy8JyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715498307; c=relaxed/simple;
	bh=4tAha4vWh2sCmCdHIolv3tvIgyQgrDGI0NlsqXFoCHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzUEj4Jn64jOTNR50zl7TRAtoVuqZi6dGhpP3Zm7z4+DDxZjGDosE9lWoDA530KuIIkfz6xsRI+gig3B8uhBpoGUevH/hSxxCFIGzwj0+KnCfkfxYH4ZankhI51biEO3Azqj+H69mS0iAed+HVyuhuGO7nE6kwcqTL4HroWGYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGNoYfnY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e428242a38so49018201fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 May 2024 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715498304; x=1716103104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ho2M1HiQIdWbeZZb6QjJWcaSs+2rhcKJwgaqpenjTE=;
        b=cGNoYfnYAOgNC11tr/culpQTyU+ABZNgvCvxq4YGCsZIWjrOh5GYq12DPqLdRogVXb
         QdYgc4MG8A+wdjKs9KbRL14YVaHPVGobzWdPelTws1+xqah7sRZ/LZY56iFEZSROr457
         dfTXNAryxgeW+6zRy97xZcl32YWSLUHF4yQ6/y+EjKOE1XNYGIiqvngZr/l9puMkIuxN
         JUawD+0OLyTEsk0fA2u39VEKYUQNuBzZrhi1iYqvI5+XkNNdnhEBtOpACBOFLVePaTlV
         NTGvlRG4ZOQNfgqdMqVPbouiqcZs9NLZD8/z4+uzzWbVig8tRFp5EXw35CxFPa57GbPD
         5E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715498304; x=1716103104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ho2M1HiQIdWbeZZb6QjJWcaSs+2rhcKJwgaqpenjTE=;
        b=HF9tb6n8ImpcG2eoCX8MYU2HCm/ukV+TCJU/fyHxwp9JukwmVjoMgx/tCNQKK6dFE9
         wRB53r8PXZpFjwCk7/o7tcFTJCtAXVEm2k7I2oENRmNtYlJ1wRj0YZL2jl9kbMaTk10s
         iWKE94TsM/ZFNCGRiaBb0bI5hlK/zzPoq5fUpZ2IDZBWmXO81c3gNX3SXuA42oUQ51Wf
         9hr4SbbX9jhdQAoV1UK22PG/W+Q/yIeqtQ5nm9NMP/9oX+vAdqQLLrQrFRf+42+q1Jcy
         VcS9dFG6Eru9vzVw7bLnC5H0ikomtJaXeIVlifeadH54cktxfmmMakVvIBR3lDIR9k0N
         fomQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBjlVu7x24m8JvW5JD3TzQBs7P06R8AoMw6Za94yo3l2kuF7liXGqXYkKcR+mPeoW0gKYe1L3FMlEuQfvJ5vkX/qZ+J3l1/UyqA1BoUg==
X-Gm-Message-State: AOJu0YxdD5i6kV2xJd4JlP7OUAtnm75uk1kSlIwWHRAmpI9cC9njPSHL
	GJdX1EB5A4BhMmZhSRcEgeIlFbXTk7WD0AsgHqYlV/olOiFxybHA0E3rFrI6XU0=
X-Google-Smtp-Source: AGHT+IHFq0ufNNWxWGNJhbjtEqg492vkkSDjHXTgvyYhd5RDqv8PEWr4+4kRdkTRVvckVFOTc9ZeNg==
X-Received: by 2002:a2e:3c0c:0:b0:2dc:14d5:4621 with SMTP id 38308e7fff4ca-2e52028a8femr59741201fa.34.1715498303593;
        Sun, 12 May 2024 00:18:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d151569bsm10126371fa.87.2024.05.12.00.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 00:18:23 -0700 (PDT)
Date: Sun, 12 May 2024 10:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Message-ID: <vwxnwf6um4vmazqfomx46w5hc7swf4boiaaqtta3tmytwbbazo@g3ey2d4jxknm>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
 <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>

On Sun, May 12, 2024 at 01:49:39AM -0400, Kiarash Hajian wrote:
> The devm_iounmap function is being used unnecessarily,
> managed resource mechanisms (devres) are handling resource cleanup automatically
> 
> This commit removes the calls to devm_iounmap and relies on devres
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ------------------
>  1 file changed, 18 deletions(-)

In my opinion, this patch is better be squashed into the first patch.
Though I'd leave a final word here to Rob and Konrad.

BTW: for some reason your patches don't appear on freedreno's patchwork,
although they definitely hit the list and appear on lore.kernel.org.

-- 
With best wishes
Dmitry

