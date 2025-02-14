Return-Path: <linux-arm-msm+bounces-48056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C042DA36263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DD93B1436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ABC267383;
	Fri, 14 Feb 2025 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgw+OeXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB954266F03
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548440; cv=none; b=CCHJrfE4AxYvPbSs+53vhmx4VO3BUlqzp4B+B0cI4GmjYExU0wyhikLzMwTZBHKu0EmtsPEMLmcqSO+QV9Cepd+KsMJrxrToigc8S9i8/sSLUxgnAnixSBlYWiniHhmjtn6bApnSv7Aq1Rq5lqGcm6izBYYpZcbEf7mtyle/fkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548440; c=relaxed/simple;
	bh=zg9ob+Rge09Gs5vUf0FzgVmgKbYNJdwP9pJiZCyaWZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MigvcZDpaxOFSe7w9Pe4iJ/G4SGVxHCUvCcY59JGlbiOmVd7tHAY/vFq6LM65QDgkfIduL+IYQU1uobLuJVh2kDmQ3OXGUfd9KcrX7HOi8o6SEV7nsmUKM51M1dSGeVvREVmoMvFutXIJX0shNJi87mGNuVrhdqS/3H6RRItils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgw+OeXv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450475df18so2364069e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739548437; x=1740153237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HS3uecu9TMJRaOEOUKVJiydyZFBfgEQCXWB2WvE0/0A=;
        b=pgw+OeXvlAC4MPGbS4byXG2QMCf2kZfU/Sts1/UIeUeXLnZS0d0yscQHPSv5J95U/w
         1X8fr+0N1C+2BopTDFE3XDDDVNhRz1CR8QnYe4MYldliLjuvPrG+PjoNQP54Xr9emXvq
         C5X2lGhift2ZPLO774MkFdUIoV+qeulqsjlBkxBBWdZbBYpzpqQ969ag2nQ5fimmNz/u
         JBmdW8EPYeS5eSuuvR98NRXtb+1qhfgNpPNoLTf3fvkO0fGXeWGq7I++Re7EOwzhatnN
         3MoktWgVEzXcij7DN/Vx6FIQWYrP7xpt01rJYXbE8sqBdXUfsGuECwRUl1qJk0LGPlKE
         yKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739548437; x=1740153237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS3uecu9TMJRaOEOUKVJiydyZFBfgEQCXWB2WvE0/0A=;
        b=azZo6W5I2d60/EHdfOfBIzspCIXmhsV2mXtIp7jIle4S5oKZax816GofccvhIoudhA
         PKqnv0z0cRk6mxdT6/CHjdpPiqN/T/Z/8l6e9/PUz7VORcMBna0BdtFo1g0K6c6Gxiwy
         vDt3+yXaXnBImWejMqxBVUKPwe2rCCSWfzUO5JVakSQvFegW6blBfIsi57ySj9T6rvfi
         moK3SLjBWcfE5/WxATB2E8AagWFWjU/Rd/IaLiS7azgmylTiuIF2RcqJWu27ezuVyBZD
         9JHBaqhnIHpaS/KMYFHkSyYaLh9RJbtniOs2dHntzxDczmWX6bnjfVhliUecAG/0vOJW
         KE3g==
X-Forwarded-Encrypted: i=1; AJvYcCUPvsNg0ANfygUDr/PPv5dWuZy+kF8vjBQbmUnU2HpcyImV1objf7cZJAndLYK72ASdZ1ysXZUHHjjsyS01@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnZ2sCrMfY6x3u1eGaCGYO4ytgBVC0niNhBo4RGESiJf67lgj
	0BSZmc7LZrFQXIouAIGgswZ3fhLaExlcBzlOkomzm9dUsySv10HQ0IFwRU2XWV4=
X-Gm-Gg: ASbGnctYXCQ8+OImXH9PlKh519cmxfRvauiAsb+hgHUr+l3otLeX24i0zKNoeRVgsG8
	4BtFao1R/wpk6S1ZXL2wVuhpx9GWCuaU4Rrt1sE2x5f/E0aKcZyQvbvGJIcBse5xxGrE16pTdjA
	DBkYplYacy0iMtMensLdMWAU7h1TWCrlstLIzzj9kGTowu5fi7xi5WkRjiNECHWJ6vTEFmRUqdb
	kwQjNWlgG7oVOncH6tWlD7X+EBDleh1kYj2wC8nKi2nEoEQp4K72VSa4q5yel3yu5NOjCz/B6re
	lg5BYUtKmpN22QlKLAbHLg1PLiPA5mFbJXAAe0UG6J7WCk8jVWSupnh/XWWZfJ2u2d4T0vw=
X-Google-Smtp-Source: AGHT+IFktQPbauJ0wmVAOA4Ond5xWCTpVxR1gtGYr0ljgsIR7j0dZM8PNLyip+zKlVCTBnd9Mquj6w==
X-Received: by 2002:a05:6512:230d:b0:543:e406:6363 with SMTP id 2adb3069b0e04-545180e5dd9mr4710520e87.3.1739548436771;
        Fri, 14 Feb 2025 07:53:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f0834desm566000e87.37.2025.02.14.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:53:55 -0800 (PST)
Date: Fri, 14 Feb 2025 17:53:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Message-ID: <e4u52y7mvalcqncjwpwavmw3xevp7pgdshp75rjmk7sddmhg4z@5m2fmm4qzuaz>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
 <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
 <a0391156-8d37-4595-a490-2b828170ab65@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0391156-8d37-4595-a490-2b828170ab65@linaro.org>

On Fri, Feb 14, 2025 at 04:28:45PM +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 16:22, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
> >> dsi_clk_init(), which gets the clocks, is called only through platform
> >> driver probe and its failure is a failure of the probe.  Therefore
> >> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> >> value stored there won't be used/dereferenced afterwards.  What's more,
> >> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> >> doing this cleanup.  Dropping redundant code allows later to make this a
> >> bit simpler.
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> 
> 
> Thanks for reviews. Both you and Abhinav reviewed, so I assume this will
> be applied by Rob?

I will pick it up once Abhinav posts msm-fixes

-- 
With best wishes
Dmitry

