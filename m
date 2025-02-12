Return-Path: <linux-arm-msm+bounces-47740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CBA32419
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B813A6834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8741209F3C;
	Wed, 12 Feb 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQXah5wi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2D209F35
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357899; cv=none; b=MvIz2QW/tBQWLNpTudLDrrcraWoFGHAzPINh9lkfmNP0hpuskZg4NKwPKNlr6JLC+GLNk4wSKyY1iaTNNwioxf4effgf25OrjW/2pbs9pVB5MmfXOWoReieQ1uR3+wQ4QFZYYda657yEFpddShmvMERAH9JKR3uE7d7SdZ3DrjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357899; c=relaxed/simple;
	bh=6AQTxLpjLpfJiPBrHtlhZPTmpePFJrZOq4BwSa0DNQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy81dNWHen+wzo4LJQ96L6jM1ORmUPsj7WNMOS3Pyn/NJBYoUBWRj1b+aGstSyoQT7Ida7gpw3pZCOUbsTGGctP7ehg8A9bvF6sNrK3gRK1DFKyfAu/zg2kwRHuOObcRIv2N0BSK+5jU8SHGvRBRiRZQZiSjb4oX/wK83l1gmus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQXah5wi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450d56199cso794943e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739357896; x=1739962696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFCRTI+uxekbKaB7VjoVJZp4kloQ9ULA619mLaD9fcs=;
        b=JQXah5wisDpIwJNCFWQrFcTVbbyiT0pdrUkOXWeRcJiEAgc/jaVOm5rt1z1D0wuJe4
         Na5WRBIPEcFfkUduZMu5Z0ZWp3K8VNLxQh4i1z2NKPAPwF27UpzZxtqHZhTV/5d3qZmV
         YswJCoLt6EJGHk7h8y0eoRHJ0aa016IRQyJz2Z97TzYNQjMHx/WxxC7VQ95nAaZ3Wh7l
         1DKgzZy8Q8qchM3fJXJICst70A+aq/I2rarz7LSpkRiI4YVvhRZBlfcZejQjUeIyoZfI
         wuL8GxfEqv/VYVQd+SMbqiCr2PeIZOG+damJ7jwuN31eSZSfFCGE5Vg5dT95nFaXu3qU
         SWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739357896; x=1739962696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFCRTI+uxekbKaB7VjoVJZp4kloQ9ULA619mLaD9fcs=;
        b=AcAkgkiVmiFwh4fRgaQuIR1nI9X8SfP6w5Xe5CPCExLNV0Zi4kFf/Mj7PlNoXbDwSm
         ZNJ0ocJh+otZ1h9lEnEmhKd7zDZI+pHu4b2yCXzbbH1QQxy1G51eGHDa3Ee09sb/C/1z
         Gb2O/bkbGteLBYV/3rOV98kT4TK2rgitCaRMOStF5ydlmvzkmbvIiKbhKKyUUY5sNySL
         Aabh/1QJblp/i26TMPKRN3NU7m253v0k/ijQa+8RS2sJ97Flg0pesiprackhSfDIaFog
         omrj4H0QIokm6byx//hDZaGEM6+r2lbtn0ZAnDTi9+cIBKpMDGiaVcjXPXl80ChSo2ko
         D0aA==
X-Forwarded-Encrypted: i=1; AJvYcCX3WEalIZVcTUbaFAs+mhxeZa9gHB0y/J3SIugpW9EakZjPUyndpI/Sk1EZ3Ur5SuGcYBLvYASubeFM/ay/@vger.kernel.org
X-Gm-Message-State: AOJu0YwILjZHBxVQiGd2JxP/S2iR0GyAOhxR/1GFbe+celERd0tBm59p
	+MatufTkiRgRxXG8L4iLpoarcyzK8zOO4oW9CfxQB/XnbMqU0PofTsmUzDY9cpA=
X-Gm-Gg: ASbGnculO1vxIH1Dlvh75J4IW2m+IwRoYCeaMHMQL7NTjG3OjvQBw3pQU3gfTc8lwnt
	Ycycv7XAbQ2ToPowKnPpAnDq6XrJ95zyX3TTUX70qPbHYNh3+vX77e9N0OeCb0YhR+CykEp9siT
	VAH/2Z15JVLHxYvBXZsgnR2L2bkLUlMg1A2MgII5lA3QbLv/WJFlY2ZxdDz7Z4QfiPUsIo+qHNH
	D4J34OlrfQeqGhCYaM6EdeA2CRHF0Fl5st7yw9CEl0db3EBjvQzAw8TlluVkGNMgcaNAKiYSdm6
	oDZFN+n65cHs/LU52DztEzAj4ccorroiSzc6XZL/MLmJQc1yq2Zl5LNJ6VvrW1ieY1bHAco=
X-Google-Smtp-Source: AGHT+IGUpJ0IHuG1bctt41bVvHPQ/W3w8vStlenWEjKpIntH94rgVWmcXj9gpbKua89+PLGTI1w42A==
X-Received: by 2002:a05:6512:b08:b0:545:240:55ba with SMTP id 2adb3069b0e04-5451809a3bamr822239e87.26.1739357895751;
        Wed, 12 Feb 2025 02:58:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450cfff106sm894926e87.99.2025.02.12.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:58:15 -0800 (PST)
Date: Wed, 12 Feb 2025 12:58:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
Message-ID: <hb42tamaguzgoxbsqxqyvhwvsegcbqxwtcmdwlnrx4hqcityfj@dqa2seg5bt2a>
References: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>

On Tue, Feb 11, 2025 at 07:59:19PM -0800, Jessica Zhang wrote:
> Disable pingpong dither in dpu_encoder_helper_phys_cleanup().
> 
> This avoids the issue where an encoder unknowingly uses dither after
> reserving a pingpong block that was previously bound to an encoder that
> had enabled dither.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Closes: https://lore.kernel.org/all/jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q/
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> This was tested on SC7180 Trogdor by pulling in the concurrent writeback
> series [1] and running the IGT kms_writeback@writeback_check_output
> subtest.
> 
> [1] https://patchwork.freedesktop.org/series/144083/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

