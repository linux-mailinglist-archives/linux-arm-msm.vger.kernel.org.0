Return-Path: <linux-arm-msm+bounces-33371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 071EF992D01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A402E1F230E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF811D2F7C;
	Mon,  7 Oct 2024 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGLPk81E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A41D1757
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307152; cv=none; b=Ljg/HezUlSLv3Sk2m5ga7mXsaBkRLnGX1ZcpG2dFYdinil4hPchy2nWHfplRsNzGqQSR67PCoofdrBRdz/LA78jYLVrRZ022nLchYpEONGbsJmJJhA3U31SqC0rsj74dkrLtmcqrO5XiHGnrD2os4fszfS+DIqXp3aFQjWgHiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307152; c=relaxed/simple;
	bh=zSSnmBKELsu8+TP1ru4kMnaPcFuUD2Iazj9ZA8DZBs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggjHFdBNAAPiYF0m4jIvu5uC+fH3rEL9Gk1me/3J1b7/3TC6EotqaauCjLzWQBmDpR2cW1BVFgYcYSsUOAex8AvBTtZaKncFl+mmqCdNBrXrhjcr1ChR+A0B7Zh8ny5yCYH/dGodNeFyRjEXmsES5gNUsHjaDvwTm49h78cLKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGLPk81E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53988c54ec8so4978953e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728307148; x=1728911948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xLf663k7Unb9yQSVk3+yd3X5tyISjr5HvAhl1UQ5jk=;
        b=bGLPk81E2Y0DhBdE/HvXdcfZd9jap3wHHpgLxMedujLiJEi/RtcZlDWs+uUj1l7sZ/
         GaGP1I5YbfBS+q2iuDajtmh2wNiwklWWfZSCK4X6hsKcegyjMPmjxoIpgphqWfbhp8uA
         47vpkU45CwrjNLkxgdmppvuqfXZEQu3VeWMGD8h3A2fA7ERM0PQeHiRxZDaiIjEKbZ7n
         segbu40iB9akFXca8y3CuuoQOHmOvi3tCeJdWY+XXineoqTT053fUNa4Yg8RWuPQsdzD
         rylLsejF0zg1Bk9i5FQ65Ez9xfczefT68T4v8ig7LMn41VfRyrsRWK4RVsbM6L9quk4I
         ZVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307148; x=1728911948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xLf663k7Unb9yQSVk3+yd3X5tyISjr5HvAhl1UQ5jk=;
        b=vsgl+dh7tY/08aN13cd0AyyflUWJ4s/B/ui60B9P4VsFOKW7cEXdYg8GZGbEt0Ny8E
         oqTQOe3yX5J9DD00HDXRlNLbKD2GoT2oNTUtGGkNBQGh/lR4VN2r9XZ1HYdqKSvht4go
         36ZFVCPm2NOBgpcBsNfwkeoLsE+dLvP1M4seHsSgC2yRl2QC+47kH3G1ViJ/VhSda0tZ
         NqfNpJ4ohNrF7bhapg0Mkz8BqpHWScsT4P8qayKSJXl/UQZAEmIegLpjXDQI20FdHNc9
         OdQw5HWlsRKwgdaU4H6J9mDrgrGzQsZJjxjbqkzmBC1iCb2WP8jNiAOdLA9riaPtKu1I
         CEkg==
X-Forwarded-Encrypted: i=1; AJvYcCUGkbkwyQGxg5QGsxbfZP9/tpOC+KPtPfP+q5sslvmEQSjzKu+bO0/zrCH5hFapOMYuOI0k5ZKeA2w5LuU/@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvlLtvGztr+jm2jzgk50OkSfidULAPXlHN9Y/JGLFpU/OBsZd
	A+Fil/FWVHk7fwPEWtio2BAtHWkg3rFOgwdK1aoxjxtn8ksVXfzcdJGGAKIjMss=
X-Google-Smtp-Source: AGHT+IGYvxRBROgH87NQ+TOEw0fRmb9P07SdQ3NJxECmesIK4Eck3W4jA2bZJ7wyTSLJn8CYPOwSVw==
X-Received: by 2002:a05:6512:220d:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-539ab9f1187mr5089552e87.58.1728307148223;
        Mon, 07 Oct 2024 06:19:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec847bsm840205e87.96.2024.10.07.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:19:07 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:19:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: fix 32-bit signed integer extension
 in pclk_rate calculation
Message-ID: <uuotcdtdnh7u6emjozmxicvdmaeztrdfa72bxl7w2elzanf3qc@2q4nip75flsx>
References: <20241007050157.26855-1-jonathan@marek.ca>
 <20241007050157.26855-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007050157.26855-2-jonathan@marek.ca>

On Mon, Oct 07, 2024 at 01:01:49AM GMT, Jonathan Marek wrote:
> When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
> conversion will sign extend the int to 64 bits and the pclk_rate value
> will be incorrect.
> 
> Fix this by making the result of the multiplication unsigned.
> 
> Note that above (1<<32) would still be broken and require more changes, but
> its unlikely anyone will need that anytime soon.
> 
> Fixes: c4d8cfe516dc ("drm/msm/dsi: add implementation for helper functions")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

