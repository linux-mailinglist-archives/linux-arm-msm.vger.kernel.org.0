Return-Path: <linux-arm-msm+bounces-33370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894C992CF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC5B1F2315D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F881D415D;
	Mon,  7 Oct 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sk6qloce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813601D3648
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307024; cv=none; b=IJHDou1MAYC1hb6mcDGVUd1RiXyLVhCtDVELRVuljLMAA1ldyZ7zZMf8dZ2QrzQK3H8s1hzvC3+ohIip8UucVmyy9sWW2EefiWDbrd/fytTOK/IKkH31BYQiLZ0y0JpUrVPblnGCXvhSse7lUyB4fL78d2kmAEOiW0PFmY4nJsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307024; c=relaxed/simple;
	bh=bQCnwp48K9oO6qUwa6rSERrhuCN6Vwe1If08ID2b/wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMbq/WqIc1aLOyqAQl5g0LsRdv/rWMiOglyfC+vzrtiH9/u8uJJwpmMxKuid4L3UI3KvmAYEc9uqcsjvsLQBkgj40AaWcDU6DFdgSa13V6nRa56ojOcct6sM3U7SNF/jSd0IljYqq0TQD4envJnTcgwz1fVwma5sTfKCzEDuaJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sk6qloce; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2facf40737eso47393381fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728307020; x=1728911820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
        b=sk6qloceFWkCteMsVeEDuoPTACHBrBaEt4sN7+QZNYE7hkyCqxouX7ADgJBRad+0q/
         NCDP/9HT5x7mr+ZWPYfQzuvVDim6uWcIpUIjH4zH1u7boSMSVrE/oBiX187cKy/mrmki
         IFXsemM1zAUz8o6iIEM6wSy7X9TJ/Iwe1rErZktv8AE/7Pmm4aLRiA2EZEXz9fAgH//H
         GqfOvIE1ny5YhfZFKZFZKkPhB1z9LeOAaNA+nOzjlpDUznDNEJmDqMLxzzT9dBUcVqjD
         7QzXtyrM0Jx+POjGuPrQxWJUMQrpEmyuLvljAMSjX8uLKRgJT6ANqGDuax4b1a2ka9EO
         xIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307020; x=1728911820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
        b=B4A6Ory5RK8ZLEIX/LH+jad6pUqpyBB5my1uvOwMZcmh7tlLyMDNGKWFLJLt+LeqmI
         tUgFSw03GAu1LkrsX9nX+8t+QUiaTEXeZYyZ1oCRywbOsia6/KjOKpNN5sAoZN4AyNb7
         GiTx48qifxHBXNYgE0fRYUSDPECFSdfQ4RanL0VFWvPBUCz4yORFI/097zLmH80Dh3D4
         YN08SU9mENbaguUG2GKtZwQ9lqqLdDl1Kjp2GTgpXh4Js5K9uBw10krVvBqCAX6mmeyx
         W6utyv+NM/HeMAnqr93xzEsdmcFmoKxzy3xRg/SIKB9h3wi7VW1f8gH4lWESCXD8lVxm
         GCIA==
X-Forwarded-Encrypted: i=1; AJvYcCVc4L/0AZin0BeZ1idGkJX3IHIPrUgXL+fh9KuL986WkyRMQCCPOk9u71xQjQ/24CensQW203zpPU8d2b3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7aQQXXzfwIG5w7NNeMjYTxs4xJP0iD/+SAyCEH0R1G/5+ghq9
	P94TkKgH+0dOTZdw295rG01G8WSurumiteFLICCiwEw4Xs4/kumqRgX/TXEIGpQ=
X-Google-Smtp-Source: AGHT+IF5Z5M06yNJGCi1ez/Gx/T8VjldzZqMCqhBqFS3zMMX19PR8zfmRYYeTqG1usnU6bJUYarfKQ==
X-Received: by 2002:a05:6512:3c9b:b0:539:9155:e8d4 with SMTP id 2adb3069b0e04-539ab862530mr4922913e87.8.1728307019585;
        Mon, 07 Oct 2024 06:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec157asm851578e87.58.2024.10.07.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:16:58 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Message-ID: <gd3bevkbevqqn54xq54dfc5imq3koc7ggudkila7jxgaxcluvz@5mkw2ra6pgoh>
References: <20241007050157.26855-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>

On Mon, Oct 07, 2024 at 01:01:48AM GMT, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

