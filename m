Return-Path: <linux-arm-msm+bounces-33291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F5992171
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 480021C208E8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A373F18991C;
	Sun,  6 Oct 2024 20:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8gqvEtT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2454189B86
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247932; cv=none; b=gpzejr6F5SOKXee3g05BeSX9j8WQ9sXKqRAu+4qwbqZ0IdnH0il/Bj2YNKGzomF3NPnGBh2bBtkvl1grUvprPcux7E/2cvHqiJN4oUkhBvmwTi5ery/1gEfJDlnSWUSNH/A/Te5gUxg/BJSTJCEQmE8u4XCBc05hfLcqI69mt7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247932; c=relaxed/simple;
	bh=+5509jm8h0/5sBcaDeidd7i/+wankz7jps021gfu9Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9JASQYo+KVNzKUseihK00lJwHaWDOTJ/cMbmFOCRe1E/W5dxytwYEkV9+nK9VW+A51rBSrPhUT2k+WdtKWYzSwSlsyyrbsammT6Z5FGAVoZGNNXHoyL59h8JArvJRBuihdFo30jxOGwcvX+UIxVsSabTTiAqXfcI4Nab4mnsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8gqvEtT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so55491591fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247929; x=1728852729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OyMjhdbJ+/IeY2iyhb3CqRL8DD3x/amWZ1lVkIaJ5Y=;
        b=F8gqvEtTKCEmvdPYhoG7R83vKAZ8Cl3Xm0aq9/OnQK1/HpOP/rgg2mZZbWBzzf2WjF
         EDslB7hrnVyV6VtOHr6q1XmtTiCKDsdqyqrbA7tIDOAvBeqgepphSDqYlxkZuXFwwkFq
         nvRoFEygEHwn0MBx5TFfpJm/pUetlmFP5TxJM7IDb3qyVpGfwLm/EO9+MH1QEgcinBp4
         01KVOYBSIRe5wbXonvBLJB/Y+Gwyg0zR5Wv6x6DEpN87dsMiv/T96HR7ijft5L43y6vU
         /Ul5QOAnsLzU+9hRfbsc+hNdW7pvJypIaWeoA6dRi0zG/ZPmNWuVmh1dAqPNyjZE6Hf0
         Eyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247929; x=1728852729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OyMjhdbJ+/IeY2iyhb3CqRL8DD3x/amWZ1lVkIaJ5Y=;
        b=Fu3goeMl7fa+f9G6fNWlTDHEfSp55cF0FoOLH8QEIwqTm36vcbS6rjWjni0oDbDqZO
         j/nsd5XaAmH2rxhf8rrv8qulo6CQHtZtBab7vuLMp30yh7czwN+TEHO/v15v8kgTRFd0
         6H4iUCU1iPO4ad29SJhm71xAzbisAAU8703bRq5qVfgIAj8W2JUwDc49SNYRw2E8CL/1
         WR4N6hR7dxYtpGAOvkM9l2Gz2ih9ypH+5qj+HGapOpMIZxS9ogxdOqG+HbjHizLuEPxW
         m2HMgCaizHJ0H9kqq+VE36tBUbePzvUwba6wIcZEed+T8tcp2ii3XOZt3Kpdbcg778H6
         8cpw==
X-Forwarded-Encrypted: i=1; AJvYcCXexH0rTqwI7EOCaljgcoqgzkIr7zRBiUFhFtwOzgUYQVLZ6+Dy7cVf0OFPJcBXCWk/rRK28fYJ5T+gr6Yl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eAFmMrQdSIFGOg+cq0KVQFSkaJKbHFxYy2Dz5e3ALnbT0fWq
	Z0JujlfNdeEd6UmfmONcBMLoOnk0N8Zc94xtcYJSNw3G2JP8z69ARYr0Mfuzdlw=
X-Google-Smtp-Source: AGHT+IGRiIySlWrGOiv+6I3t6tczVBclAkcxaaYg68qustx800l6/g5ilrv8dcAOtRr4pKR5snZEBg==
X-Received: by 2002:a2e:bc1a:0:b0:2fa:c966:589f with SMTP id 38308e7fff4ca-2faf3c0c21dmr44365801fa.1.1728247929172;
        Sun, 06 Oct 2024 13:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac440asm6287441fa.46.2024.10.06.13.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:52:07 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Add support for MSM8917
Message-ID: <tv7eajb252ncdtb4vrd4o3yi3jbod6sgt3rerfaixr2kyddnfv@nrrihbhu5me6>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-4-594c3e3190b4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-4-594c3e3190b4@mainlining.org>

On Mon, Sep 30, 2024 at 08:35:59PM GMT, Barnabás Czémán wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for MSM8917, which has MDP5 v1.15. It looks like
> trimmed down version of MSM8937. Even fewer PP, LM and no DSI1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Remove intr_start from CTLs config, reword the commit]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 191 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

