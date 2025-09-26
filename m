Return-Path: <linux-arm-msm+bounces-75306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28EBA38DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F9016BE51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B25A2E0B47;
	Fri, 26 Sep 2025 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ha1U2bP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605E2765D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887779; cv=none; b=XhRaoxV6fhxYava5ui6MgJz4+Gad2ywhYJgoYAg33zFhe9QqqsZVY+N29HMK4rjE+vRwNj0dm6eKw+T8sSqWNeNrdX3EobZzA73loch1jhyfcLwaZLh1WwFehyi64jMXJ33hIhxWRIziw0YR0nJxDwWnrkW6k/ZxSFacU3MDyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887779; c=relaxed/simple;
	bh=Y5lO/lajfG3GUkVLo5ia+BO7S+9AfAuPZaobXibEtLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnbSuHFZJdPaykuztBsBYrL/HD5o1Y2NzqvXxwVqW6QM3/j8oy86DcrjXCDiKLElL+EaOc7hpxSy5w7MQeZ+cWvaTMrDL+lbUXLUHBOu7+jydhYcBzABn1FAp3HWExqeizFSHKyYmmmBKTBQCW7e+cITQ1tRkGZXHTuE/6Y2Xkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ha1U2bP8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so15132085e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758887776; x=1759492576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ut9PX3cAo1VE+qoXsWqw/nQBs5+sgJFMGOIiq69Ad8=;
        b=Ha1U2bP8vXIYtd+MiUjiRJAEA3nP8LmMKJUWB8TK/LxG6oiw4CGkW9ggmB8KmLvNMB
         nmm62GRs4jpGTKW7+QDbxnnJ1qRyJMOjeFhD3pW6k4V1dtmlO4fZABp77+ccqRK9Z31v
         MWVrtwNpLhxUvD750fSK3zZbbwTcszfqn04uDEeh09Giupkdu+xzTqBO7cudRkZUZbq6
         dO3pTrtWEqB6qKr/pNJ801BEjBnIW74Mjz/WAcfGw7aJImRAlO9VxyqU/8Y/kx/ySXPo
         wXYjekB0xNIFxeysXAomystm+FqSZ5X6ypafaj1Rze2Ah7wciwCDIU+r9f6LUl3a4iLM
         E/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887776; x=1759492576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ut9PX3cAo1VE+qoXsWqw/nQBs5+sgJFMGOIiq69Ad8=;
        b=B18WxUUYxlAGHt/K6R2EF+yUq+nhc12kR8OZlMMf7OcrMvKGfdXkbzyTpFnj/WTFVd
         OJbzB10DJEzqtSBA2l0Y7GxNFRtDsCn54qtcDjjJSzbo+d/4VEbhR1YcSzwTznaW8Q/T
         GNnDteJ3/IRz1jNrO8E6TZvzcWf7ao/BRL90f8RjUZAVYkK4LGQ8nehrwUZ9Oo8sfWku
         XFRMbkTnZXjhBJB+uiWfvHdSbXPk6zFRnkdJ+3rrq0KI7uSrVdJVnDX8sUrcDqPZzNAx
         DJhHO3kR99Pa45dIAZoGOc5LXRI8SEw9/NYU+jjWQ+QGAn7ORYAj6t3qrv2Zz635bWdk
         pr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx2txtkcjcce9VzbpFFQHPBuU8JnyZ3nK/tSoQg+I+7/657OGrAgYy2cmg6uF9WHUTaSX2dSvbn4/RbssO@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3kLJGh+EZQ76ELZZGDrr63RwGrYydsS1oTQptpAT3IktEaPO
	1pGlreVWeHB564aq1VEK4h4ZB3sy4VXwFMMdYsKPXuLJlKXZdD3CrV59Yk2b3UHrepNr2zgACNM
	Kb53I
X-Gm-Gg: ASbGncsZIU/PBp1A037xtkf/P7W7BdedYzIUA55Vha/iy3dmDw415DBWT9cRP2qfU/2
	NtGkkc5ekIzmGx8HUWd0MV72OsBekwqT/UoUYYqXql/LS8bBqsH/iH/uJifnAnaTdS/zGRonqk8
	einVdv822Dm8H7Mee3Wm6ivWG6tKAMpe/drsUOF37iMSflwGsEHgT//pkn/aT4Wq6Pd9el9ImHd
	amkwmiCNsxHf80FMveewY1vQBPs6/dovyOqMOagBx8HAdfvKswRrzQvGns9BAEXN0/IR7YlOP7d
	0Py/seYiJgDbHpO/E1iVc9SB75QJrhLfmziV8a4bbWmbGNODMLC5eXIMwm985KwwG6xVps4y6Gg
	TCQS2AxPhYtsKypeZNE4dnIgBUIxj76TU
X-Google-Smtp-Source: AGHT+IEhOtwCtT7hGmRGCgAuHa3ZlRs8uxFPuN5Php6GAeEsMeg5YY7gRCrXkIv2ffaFf67OznqytQ==
X-Received: by 2002:a05:600c:1f16:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-46e3292ea63mr65336745e9.0.1758887775546;
        Fri, 26 Sep 2025 04:56:15 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e3bdsm77800905e9.2.2025.09.26.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 04:56:14 -0700 (PDT)
Date: Fri, 26 Sep 2025 14:56:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d
 merge
Message-ID: <lteybuylw4ejxsnqbyv5cyrc45od4y5sccg4k4nfjkzbwc4how@xd323dg6agbd>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>

On 25-09-23 16:03:50, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Tested on Glymur CRD with yesterday's -next as base.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

Thanks,
Abel


