Return-Path: <linux-arm-msm+bounces-49713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A846A4829E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC1C1884001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF6726A0C3;
	Thu, 27 Feb 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Odi5uaSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE92356AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668869; cv=none; b=uRIN9EWYPG8f0++afbNSB2nE8dugj0uZrwLhF4A3s0IRKO9yxpmzuzPQZ0IBtH9nfQA+QXnfDrXrHIw1/lO4EvXV2HX2cQ0nTrP8HWvpdc5NL8pls1o4jlN+TjkD8Ztm+sQv3c52KRCMI5KsyvZfvpr8nPlnrRpqHIy87hQ8byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668869; c=relaxed/simple;
	bh=2n5bNgf6szujo1VmFwYXqWseruaD6/HFShhaQ7E/r+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMdnuvB92oRU0TT+Fl3vHvnZkrH9Ju6E5QJEc+DfIbKZLxboLKcAgIuDNstFczd0JgmZVZBopokeyjeOLe617b79zPfj1WmOQf7QeuydDeIEZOZ/UrwMthb9nst08zblKRvcbP/mirBPbN4uZJn7FWK/U6hYQvbY3X0dl98SbNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Odi5uaSK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30b83290d39so8971741fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740668866; x=1741273666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PK0RBzU+X7MrHf7OnoKvPr4hQd6gs4EWXTwKEiRaqcY=;
        b=Odi5uaSK4Fs+GVFjFRQWF4EJYAdRIk+w170WKCBEGiqpT7HsP/5eVf6AdC8AfgwWM0
         4Se0sVAnmzeLWSoOQWjVH7AEmmaAWWxExsk7i64Bh+obwjJ0wpfk0ZIpzwSCiPqwZy8s
         y0EpVJNg1iXZuBsqpzp87vP7EQCU8msQLqw1S7gnGsiCJEoVSVQUdy40gPOCXPg35uuR
         8IAWSnxKNIs/jVefi7rbQydXDFH4XJvlWBcmdbJbRlqp//F0I/vy1o7zAS2+L9N8TU2e
         ccKDjnKDHGcnPztGbbuFJQc1O8p3y/7k4F7y1ls1oKeH1ujKVcwEh8DxLkj63uvd6pPS
         7FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668866; x=1741273666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK0RBzU+X7MrHf7OnoKvPr4hQd6gs4EWXTwKEiRaqcY=;
        b=IoZhO3qft7UmybXhOtwZNw+lB277b0Hwg/vfq6R3umSBZoqmaG0bn9khBqZsSipHLt
         fhEuuIwotNEMGhajw42hQRERb9CuKd7zkKH3yAx6s+jTgirametGmBg34Iih6AWKvG5o
         LVr9tb0jMDcDVj7eXMllZeqZcN6QVDcNJ1kZU2b6RGnkYQCtmicIe4LNu9FsyIt+wHXJ
         w+WIw7lKR2QTHTQpWCrIDvv4YdbVKz2Sj5I/sI9WRBAgcVNJ+WeYFi4t+ll3GPWB7a5e
         O/Qu8ic8AF0lE9sJYI/pP3nSiYgUe1PX5FdIM8RdLrwRQ5sbKS2yphNwC9xpg02qo2Va
         kY6A==
X-Forwarded-Encrypted: i=1; AJvYcCWDJHsp5jcue0EN2kSj8LsCsXtQ2RQ1z3jaoog+rWrRVGkzp2Y64PcChhZATUXR2SadWQIcQFFC1nMxOPcw@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTYZvTv2CHMp966rkelNUeLEWY1Frl/Smq98iEwsnqauKM5p2
	SMSi0xd7efwobQ1jaKza/cgNdxtWc1xTOpiN2uFbehwp7GMkKybcYr1mx8N1SuU=
X-Gm-Gg: ASbGncvrJbe4ykMvf5f7BCSarqFaa7IMg7TKLSP60qob1Sr3iUnkXWqGzm8t1w2BUg4
	ggMgSxzY/AvrxHSX/bUNojPd70BplmbVt71YeqoqXyADW6QFnhNIw5iVp4KI9bWlu/Hne/3yYiP
	82SB9XR5CtS39qATS/6YFk1VTWqwC29bcONyj4FhzoBvm7auCLAKFChl3TpqIvWNjONI8PfqxUi
	on+B3+xXXFy0nPDJibcdxZPhnmrE/kiztP/GGClBES8AcCFLi1byX1wxGgc60YhA7+8D9rMUBaR
	ju+n2MQxtXh7fZi6hVFGTRoangAWnola9HFbKlPJDG+NUY9ORf5f8pzZ9z35sVwkAYeQ3OenHfM
	tvgxN8w==
X-Google-Smtp-Source: AGHT+IGaQ//J8Vtjfl7pYmy+TQqYupxV6d/Q8c6JMZHrTt4arFwXtLg1U0DaRna2TQ4oULMoVcUSzQ==
X-Received: by 2002:a2e:7c0f:0:b0:308:f479:56b3 with SMTP id 38308e7fff4ca-30a598981c2mr93380391fa.9.1740668865510;
        Thu, 27 Feb 2025 07:07:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867c8f7dsm1855811fa.48.2025.02.27.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:07:44 -0800 (PST)
Date: Thu, 27 Feb 2025 17:07:42 +0200
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
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>

On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v6:
> - Drop duplicate cstate initialization code and unnecessary memset
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial application
> 
> Changes in v4 (due to rebase):
> - moved *_get_assigned_resources() changes for DSPP and LM from
>   encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>  5 files changed, 110 insertions(+), 126 deletions(-)

This commit breaks several tests in CI:
- sc7180-trogdor-kingoftown:
  - kms_cursor_crc@cursor-dpms
  - kms_pipe_crc_basic@disable-crc-after-crtc
- sc7180-trogdor-lazor-limozeen
  - kms_cursor_crc@cursor-dpms
  - kms_pipe_crc_basic@disable-crc-after-crtc

Corresponding pipeline is available at [1]

As I had to rebase your changes on top of msm-next, corresponding tree
is available at [2]. It might be possible that the regression is
introduced by my rebase.

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165

[2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb

-- 
With best wishes
Dmitry

