Return-Path: <linux-arm-msm+bounces-42913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879129F8C4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D601693BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C16015853B;
	Fri, 20 Dec 2024 06:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5oFwPBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A019F40B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674434; cv=none; b=qjpLRYD3R3yZad8JGjsf/rvRsf6XvSqgC5mR6Qn4rz/zi36MELXaJbSsNaoOFKqikkWapXrhnOGI2BbIXdtYUedHgCSJpdzgSHVJizeW329QnrBtZFRuBSYr/FFjJm9D2XOGFx/u6FbCHegWIyz2jTgaMEf4//soMwrLv9RN3v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674434; c=relaxed/simple;
	bh=xLTdYIKYNY4VdvGFp8UWFG34/ADTdU3S7cf0JjO14/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWVLiFg8QtLlVjUzRqNkTSkTXe60I/bvi/C3gVRWJniNxSkI05rClDwfRVec2GE4DS9LcNy3odGRPJxf1ex06ZxE1XXnvLrCoh6gHmqbjnw7pNxA2dKvda4QZavSLWYnnQwS9TIS7C+TKGSVi+Qmtnw9YBSILzaB8dQqqxbDk3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5oFwPBw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1579164e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734674430; x=1735279230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
        b=L5oFwPBwqRcV/+19oaW1bP0TDluO5aNRDvul9jmQdVbxhJWU0FgLx/rEvDkWHnCHzZ
         RCRK897WwxUcOAtoVoSwTDJO5EsP849L2F4FktX4a9nDGZz6KeuKwXjqfvSzMuZlAu68
         wrxU3MghMBVP53Oe61QG0NcG6OKGLSFzaD1RVvdAUMs/BlHPvdiYr3q5Q4Ui28bcQHRv
         ZZGNtLeE8gdIGQix1iZsGZ4UzsT4U4vw5f95pk4l1YNejom/Hg4JwOxb+lqH2dnLj7Rg
         sWx3zI7T9UB8pV7R87+3dxR8Fh/0AsxaEu2UGKfErbPjyqqeqhcOF27cJyI7GOOPv/ER
         ZvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734674430; x=1735279230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
        b=A8exiUjUMZDvWRgcvEqtYOVU2+CIO5uRf0nb521hZ+abAAKnTQlHczrKgYxU1f2Stm
         CDa3hBphnjMUii5YTCYN1859L12N4GARIZjXrS8ThcSiOPk+16FnF/FhZo/zBk8hL7cs
         0Roh8s1Ghr12P5LmvkuVmcqg0+x0PgJ5PPXzCnFlhBdzhiRXQpJiT+oTI7LXv3ftwDKw
         Kiwl8ezC9B8hHdEr05AQ39YNSJsfhy32FudQVWcVMAftofmjyRM4HCrXlg6UX7aMYewD
         sT/TV/yfI/f7e/gB9Zr78yTNW4sBrFQ/Ko7Q2oPe8zyrHiikIowJKuPaEmB0Vq2Pektl
         ++WA==
X-Forwarded-Encrypted: i=1; AJvYcCXxQovkF5hJcJBca26+9DL925MHAl+dmf7w31/hozlnRpRpkXz20C4ON2jP0IKhAggc6m+mq1wi/fqbXvcj@vger.kernel.org
X-Gm-Message-State: AOJu0YwIChw8yAilEdhT3UFOYQXmux1c0dBTTjYvzNbJ+esBkBRclxgn
	jMat29WTkcCmi7NxayoXh/Ta3RquowTyRISTb5AEalCpa9YoBIq3+t7c7nzPC8E=
X-Gm-Gg: ASbGncvN7GKJeXccjFR6dts3+SCGwtl6UE2NuN1q7UkhTZDxPZ33TTUQZ2TNxTrqSvY
	u/x+6wnfQ1+jLMtlyf5J0moAwAHowBTQo05z05GlBTqdiQHVvQzsRgJSz2Znq7wtH5ijqSD7uAM
	NkXd2PIPdjEhcImqeLdcaDjlewLLD6KufElq2ssemPw9HjC0R34cqE7QlmG9iwZsM/uDidvejr2
	Mq+iQW1VtK+7Rwjyw/c1MO1spFTUsmI6hJpIYjpqrjYKygFQKsJhLM/7eUII3zwRB9Ob4iQn6pf
	H9bUSRSQ9j2eraL9/OMd1tgWWf4pMhIrQDMd
X-Google-Smtp-Source: AGHT+IFiEdq38m3N3tZdESWDddegsXGp5KSA4zDLDiDMTHVXrl2c04WWztsil1xL9Q1eYop5O6E+PA==
X-Received: by 2002:a05:6512:3405:b0:542:2a8b:d56f with SMTP id 2adb3069b0e04-5422a8bd614mr136330e87.4.1734674430475;
        Thu, 19 Dec 2024 22:00:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223835779sm379307e87.282.2024.12.19.22.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:00:29 -0800 (PST)
Date: Fri, 20 Dec 2024 08:00:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 24/25] drm/msm/dpu: Reorder encoder kickoff for CWB
Message-ID: <dszctcu5mm4hudc53gqpjklcugah5lisvvfkbmejeywgceqyl5@dqzopvt2lb7s>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:35PM -0800, Jessica Zhang wrote:
> Add a helper that will handle the correct order of the encoder kickoffs
> for concurrent writeback.
> 
> For concurrent writeback, the realtime encoder must always kickoff last
> as it will call the trigger flush and start.
> 
> This avoids the following scenario where the writeback encoder
> increments the pending kickoff count after the WB_DONE interrupt is
> fired:
> 
> If the realtime encoder is kicked off first, the encoder kickoff will
> flush/start the encoder and increment the pending kickoff count. The
> WB_DONE interrupt then fires (before the writeback encoder is kicked
> off). When the writeback encoder enters its kickoff, it will skip the
> flush/start (due to CWB being enabled) and hit a frame done timeout
> as the frame was kicked off (and the WB_DONE interrupt fired) without
> the pending kickoff count being incremented.
> 
> In addition, the writeback timer should only start after the realtime
> encoder is kicked off to ensure that we don't get timeouts when the
> system has a heavy load (ex. when debug logs are enabled)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 74 ++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

