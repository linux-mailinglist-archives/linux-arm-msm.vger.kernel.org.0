Return-Path: <linux-arm-msm+bounces-47336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C1A2E16A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 00:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4B63A53A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 23:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315AD2253A1;
	Sun,  9 Feb 2025 23:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbSNG8BC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE71E130F
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 23:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142831; cv=none; b=H0+9F9pH1tL/fqGQpkRwBC/5dqbRGHpYu8mJ1RyontlZ35NgBw5Zz2yEHNgG0agdFX0z8Emm9ktNgryVj4UdjXDLWsmBzMkc2UTiuxbmtnqb+0sb/RbaWF2Wof6ITHaDj9evNelgL53/Nn8bEUHIJ00pHFedybSxszgpVSOC8mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142831; c=relaxed/simple;
	bh=AI3CKIS5whLgIN6LJr7n1hpFAqsbhbjEggjy77O9BwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhDCGWcRJZaAkDnjVSuXWUnO58Cy0Tdc4iWVoQBhwncrtYEFPEq4D7usQ4df728Lr0poyqnLaLsgvkyzEVAbUof3UuY3F7CPP8n0/H7zUZCgXaenmSX3qCZFZgdQMbKIEd/AnC7yxDNZ2GPOcYabeXyGOmO0C8sUJsZvoSJmKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbSNG8BC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-545074b88aaso1011847e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739142827; x=1739747627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
        b=WbSNG8BCLz7gRZrXLk83qg4DSHTnx9913SmDZLrGxCfnlqAM1EWprQRpklAaohWEPs
         lhbwsISe5NSinZQ7U+C2qLX2X6xOowUEYiVEQ9yKQ5y1uAFPE1ZYEjmA4xkjSQHP27hU
         bxdZfzHN3RjfvBqx3qg2ph5uXK391DymtrXwhA0kmVucH5tEUSGXVAXlcKJz2FnsJ/it
         4MzVgY5IuZFxpbuertPjA3G6aCD0OufVUtyOn/eDk0b/Gh6nB7kDniOpdyh9SU5+QBxy
         22GyqiiLHiKMlsfTef3rAj3Q0kiB/rXBtegteyIyqsU0GCPnhTjjAyV1nwV+z17fS5nB
         subQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142827; x=1739747627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
        b=ZpCg6fqAzrVF1tIOfyMDba4ks7zkaz8KvT6J/fzs5Cr68x0GOKCOEq+591KbkliqjF
         0ZmvOoVjSogVW5bvZ2BWHzkWOun3gJABi3kYk2ExzDMUdDIDVC7Azoz6+s3AR6KsSPv3
         +OhiSaSd3vAxQeFLo7tVURnSQf/8JMQKv4WNm94dnnMe8O0WSBEhc6UgpbCuoGerdEua
         sF6ZnVo4VRZJTeeegJJaEqncRsQSZ/P3Tb5o5N6eWM9M+OuZqNEIXXvnXNZyr7yV9Mng
         Y83P9yhNfeWeHgzBE/I9ewiYyxnKQ8KdITdZ94tQpVPIVgk0twI5DNzQFv1aEA6Kskr+
         VjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlS+9s6U85EhL12O5nbEAwTI1ihYu153P6DbPBY0eVDzUOJ6GAe/ItZ/Aen08n5mfpo4Esx5a1+zUyjvpP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj537lhBJD0AExwx+wrGpoznmofhjSj7zuF0beaHM0pWP3d1yw
	ilLy5anpnWiMJ/m9B0rX2f4Dkjrn/4A7LxiQ+NT10E+FiB8tDUY8IZWzu4Q06bw=
X-Gm-Gg: ASbGncs2wXhlqDskw8AWqqClA63PZ2/MNWdBw9grUGT4qT+MoCdM9INxYHWQMu3Hk2A
	fP0AOVKJ/zn4bGcGHBNCPiP7d8R6kJvjBtPOvOlpdjqN2Dlm6W8wbWTEldk6KR3JUftWWi++Q0f
	hhsQdJsl+teuQS+rn13YJNMsK+7O4MMeZeGScS7bk/JwvA9GzxGMupy6+MemfOkrcMmoSvm5Bts
	rsZTsfduCYxxmLyjILqYd8CRdtGb8YyoawS/moybnnLG9691I0a3ynLnMl/9M+44vfvSSGA61wy
	wl6ilrnxqaGap1ElBtnKiND8MonEtV+P5mgvk1V7LZBSMM3DYCM64uTi3W+IFaDkvSC9HNo=
X-Google-Smtp-Source: AGHT+IG6pHxWcPGhnjwnxMZahzJXmycpngbz65UUqKb/X5omPdkl2r/lGWWjV9vy7q55qIJ9j0uJ6A==
X-Received: by 2002:ac2:5f66:0:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-5450b9ab564mr600700e87.52.1739142827370;
        Sun, 09 Feb 2025 15:13:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e3e4e72sm25386e87.199.2025.02.09.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:13:46 -0800 (PST)
Date: Mon, 10 Feb 2025 01:13:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1
 interface in DSC topology
Message-ID: <agibhaftgy26tvlxgvhqmiortwaycblsxs42bebj3n54trozj7@46bqaqlrfn6n>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>

On Sun, Feb 09, 2025 at 10:42:54PM +0100, Marijn Suijten wrote:
> When DSC is enabled the number of interfaces is forced to be 1, and
> documented that it is a "power-optimal" layout to use two DSC encoders
> together with two Layer Mixers.  However, the same layout (two DSC
> hard-slice encoders with two LMs) is also used when the display is
> fed with data over two instead of one interface (common on 4k@120Hz
> smartphone panels with Dual-DSI).  Solve this by simply removing the
> num_intf = 1 assignment as the count is already calculated by computing
> the number of physical encoders within the virtual encoder.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

