Return-Path: <linux-arm-msm+bounces-22954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611F90BF87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 01:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BBF32839FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701B519923B;
	Mon, 17 Jun 2024 23:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhZ7fiQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF737176AB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 23:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718665791; cv=none; b=n0RhJ2jqpI3SG/0YePgXw8KqzsIoJIDQXyrZ5YkJEWiOx4XphgKVnRi6ePPXCg/4z6fjpnmKwUhSIDqoltcFNhI59LynK6PDif/+PNxn9Ksru5JOvGzkDiuiS/kxpp8QGt9asBbRotygR35vK+owO9jtJXyjiwn5dnF/drjUguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718665791; c=relaxed/simple;
	bh=G6usFp7bKmfUImhheG1L/hun47i/F5MEZ+BqjuZY/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2X30C1snh8IpV6bPp4xBzrOodZ+9xnRAgq1d9r6t+LhmyIOgYGHb1hsYJOoA2YSGCReUpUzQ3swNKa5oPhwWpcNwzhamZqjDqiFq4OllgHioFDwILZtFhUOUBn/SBwnmA43BBUyvwEtYNGt3wEHynoZMlmqoUuU+7JAE18CExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhZ7fiQI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c85a7f834so6243516e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 16:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718665788; x=1719270588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTBpYs+rHA9ZGRXubRjFNJr2hj3dD85kNn0beF2XoaQ=;
        b=jhZ7fiQI+jP+pO86PxC8isd3v+iBLhimxojOUtL6SF3M2BnvSS07c83eAi+JbIgznI
         GCi8jJltUyi8Wq4/ovdFIreZXBvTiS8vGS5m96Z5vzeQuXjucUzFz+mQ1cRlQduAGUGv
         6phPpPpPOBxtgZCqGLcB3ApGLasYnN6j2fId3OTIyLKbaGxLIXlZc6x80GT3KD3TTwfC
         sJzRhPyFvV3iXX044fQLe9UCA1ahUV1UrA5EgPIWPtJzt/94miB/DP30Ukgr3adtMt7B
         YgqSEsJrJyu7b2CBC6ZWpRABjn6tu9wcdNBUzqNTD//2tzBpFcBJ3ZDXnCYmyiGNvZ91
         78ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718665788; x=1719270588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTBpYs+rHA9ZGRXubRjFNJr2hj3dD85kNn0beF2XoaQ=;
        b=CUG474IiTZmTMU0eoOz2WZMbreUHH98SSyT/dCqapfamVYLwo6gmwqpGmLdAN9EK3L
         RMVGkPMcHzTtmcvFQ+5Wsj+pIjWZX7TCCSyhiTTt++58y0gtZUMkXUQPN+UiJ/HsqrNq
         LGMRbqWjp4pcd11P+dXNzOOur3qxfmnniWSxxO6d1D4G1QiVwbUJ2qW40Vrqr5Gn8N9M
         0aoi9eBY6pP8SyPAS772IySY7cANHFlbHi1W24RaaBlWZBmCoHlcCb32iVMcggFz+5hC
         cnCOF7G9PFJGulUWe7f9BrVaqfvHtpXHn9Yod47JRu2tdQsFTEdNh3OmiYFzWgrztIk7
         Pmeg==
X-Forwarded-Encrypted: i=1; AJvYcCVGEOg1R47RbQjzmJ0ScnGq1wWvENVY6PyCFXbrUsnBv8xTX2dWUcapUKCzEWxb5CNzJL3JKTZQwpcexGNoEGVnzBoQ3VvFp6k/xszMEw==
X-Gm-Message-State: AOJu0YxWi0IIcrXMERO5ElT3DtvtFk5ZTEHd5YDoKZ8CxLMXfY3P1IDw
	ut3muFFjNypBPR26byniqZJ2XITT7EgCS95Sq4awZ6cB6ObxIeE3Uyn1nz7XOnU=
X-Google-Smtp-Source: AGHT+IHTs0fDZAR1ej9emSR23TPH1XNYZwIBJEMQjpG8ZC6EL1ncHYC1rF1ka09GwUmaY8K9cohTjQ==
X-Received: by 2002:a19:5e13:0:b0:52c:9d68:7443 with SMTP id 2adb3069b0e04-52ca6e56429mr5823534e87.1.1718665787866;
        Mon, 17 Jun 2024 16:09:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2887f0asm1397246e87.265.2024.06.17.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 16:09:47 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:09:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
Message-ID: <wylta64t7tje2ezvcc5joyayd5rdghyxzvjbukibqeujljcnvo@ivob3zlbw3we>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-2-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-2-robdclark@gmail.com>

On Mon, Jun 17, 2024 at 03:51:11PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
>  2 files changed, 63 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

