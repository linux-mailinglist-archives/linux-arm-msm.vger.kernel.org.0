Return-Path: <linux-arm-msm+bounces-20670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8D8D1121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F6BA282858
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 00:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED841C2E;
	Tue, 28 May 2024 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAgSxrya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F882D272
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716857311; cv=none; b=CY89uyCLGOrKieqKtpQVMVSGxRtEbCf11I4CJJucRCeapU/rq/fqgofWiMgZ8vBUQ3jdRJaVNy1m8TWkZbOhzpT3ueX8IA6q7yLboy6QUkG8lZ8U+sLn00UcixYSXW2Wdnzsl9ey/BZ7IVnaYk+RTUf9SutmWxiocP9hZa5pKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716857311; c=relaxed/simple;
	bh=e4u/acEE0ZMjC2PVgT7Neyq/Ki4uSj17Vukxh/E5AJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6Mhf1zC7vfXquzMFsGHsKO7wHI/UDdi/z/8a8lqg5c9B7ClXx4J2Yxpq+pIArRey81aRI9nou+khadsD5uj3nFWXNJfcbcokSEtCMx5ms4+70hGXcqjHzlCJ4rfwb082CHVGxOIOzYufCbsC9jsmhQhqHIQg/uxhy8Tux8O9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAgSxrya; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-529597d77b4so338094e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716857308; x=1717462108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
        b=dAgSxryaHECVTJp17ExHlurSE9fg0colMo0OKrLr/JqO7RgkHog5KrRAvt3LNpnfWQ
         Dm2+A6x9DJJrATgY4F2veex7a3gEQpGlHXhKiwT8h6HZWIyfYmbLld+p2EWgNimbzQFI
         jqaFT4OdQXmSi4XbUWegSgME8en9TDKOy0ihXV9PHd7QvhaemDgreHbF/+GKjfiyQJkI
         rGVyLoP5DFnUFWi9CzS4a48WWsApmae1G74JS7TywzySVAxZR0G+O515YG+L2sJM9Fzp
         6pV8LTd0Y//ZGytu72DHy9kmqfDr9XOxIeD/bViBOhvLpEUYph+QdpjYGFWPKMq0awr9
         cXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716857308; x=1717462108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
        b=p0j+1Gd2EsvMSRVBhrg9gGKvr8B4foIA5pSNkRpao+vLQQ8I6P2oQXtjN7K7wJhk21
         ZdQJ+mZNpjcvxM5B4LCIejC/ovdDLS7JMFNInYwCTwbFClbT+t/cldXfymJKCXrE1IK0
         qaQOmbWowGbGJFK4bvQBoJArF5L8xOwBanen6ovZJN51imn5y53oAr4mDhB21w4lhipm
         gIA7E03BipYSf8Mp+AqStwSVlAhlOp9EI9Yj8CVcJk8u6alpI8h2e9VbfXJ+ANNpEYEq
         mCtnYMZ9v3aHjAL0Wezh9qCd4vlXyy1nCemEyup1Y5Gu0rdRK38aFxvtwdN8KZQMgYPE
         v2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4dBfXeh3KFqbJrbjNJlB/UFcbSbMMcndakpwQfjbQyvVUNsAebIpJQcM27LHglfOshwTwVg73I7EbheeUkCyYQJv3a0wVk9cMMLuDIA==
X-Gm-Message-State: AOJu0YyY9Njts48GN3zlOYCPFajTue3i4QLcOkdo9Lm3kwwokj82BEPG
	Pf3qFj7mjyNJaX7YUYYSH4P9NoTQf2BTQbbf1yCHfyfGQ4Xv1I0aU3KBVtLc+UM=
X-Google-Smtp-Source: AGHT+IEkY3dLBPQpnDZeVlJ5g4IQ99DKVk9uniY+rjpvwvxmpQU+WYyWo8C0Uczxxy+AfmQzepE2XA==
X-Received: by 2002:a19:6912:0:b0:51d:998e:e0c1 with SMTP id 2adb3069b0e04-5296410ad52mr7332337e87.13.1716857308562;
        Mon, 27 May 2024 17:48:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a58fsm816295e87.67.2024.05.27.17.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 17:48:28 -0700 (PDT)
Date: Tue, 28 May 2024 03:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for
 DSC
Message-ID: <zdlreka3shviepb3p7cq4ulv7f6e2lz7b4af3pdqntnbqikmhq@uoiyu473v5e5>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>

On Mon, May 27, 2024 at 10:21:49PM +0800, Jun Nie wrote:
> Enable compression bit in cfg2 register for DSC in the DSI case
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

