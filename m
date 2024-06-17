Return-Path: <linux-arm-msm+bounces-22956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409690BF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 01:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F226CB20A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E13199386;
	Mon, 17 Jun 2024 23:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbhiOl6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD31991BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718665828; cv=none; b=Ccy0M9TxGybluVOOsJvHTECk+drwj5TK3lBSwvwAvRAOVmEPEFeBoQR7DGJ9Gm2yCBw28XvA2BFlzIU1EUpIDpC3tljIseGX2KgBuYC51y31nmWBM97dT/uAC1MaLMrAyl5PzxWY3ESwcJgSjRU5GrGKCLxE4CPsARfDj5DWW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718665828; c=relaxed/simple;
	bh=JUQxuvj9BML1Hkx6TtF7g5KKvm9pIFZvW9FQlreKw5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5b3zX1Krvl+bhiNeSflL9z0K9ewTu4T8BVyG044SjDnpZAEeiyATsHsRIMAi1c1+U8GOlWO8D5PTFi5ih25i07u1FDWIFdzbW2bN3nipkqGKqVPSXw4QtNkGuW1hqfdGEtxFL6p0ZmJP1iVwOq3uHiGDARE2f7PH8soOVjEHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbhiOl6R; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cc148159dso776800e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718665825; x=1719270625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=We+cMzzEfPyNJs4E8h7UGUZk04qxzQ0Y4iOOEjzjP+g=;
        b=cbhiOl6RTaXFF9ZLvZ+WqsZSrMzNwQB/nFGtPJJ0Imyk8T/rDa0TAR7vijiUHwZj/i
         cbkl/2CmSsSY+iQmTZqpDov3AIgSgT8Hi2mejiiUC/ZjeBPnLHnC8Z9pSTQZSaQLDUCr
         TDwfuHMUY0QAQRFePRzg0ZoKr2Iq26wh/s7rOR9Qvh4peEw9YStqGG+vcoNbgXmbXPcJ
         Wq8fxbYYByshTqSOsmJl8c4YnrgqXB0mVW4oPzNhn1gojSZ3bftHbnj+lx1I54kMsyB0
         xyR5oBuJIlV3EHFvG5EMS92dRtaQTvGeq1+X0mCnqRcPiEIO8ERDUqUGIpI2piVJzSGw
         a/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718665825; x=1719270625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We+cMzzEfPyNJs4E8h7UGUZk04qxzQ0Y4iOOEjzjP+g=;
        b=Z0LRl9m/3zYbDNZqPMEPW+azbyfCaqKAUJhXKDz4GBebtt24cqgMMjrX6tw4UFOxNA
         2onnCeC54Byl4F8/xgDmfiK19WlDGO3HuigBf5XSvLXobPaH18hZ3/72/472N/gWGj/P
         ZpDU1Sk/0q0PTToc25l/Ur9NY6JAJHTS7fRBppUHjSsmrd8bzuVhWBb+3udCfL7nwDl8
         KEI2zt2MIXBYghMPLnhsnAk2net3HshgbQbqQRgN2TxZgqjV7Dq/d/lW4qhCbVBhLB6a
         WgKGWujE8otB4dyirZr69+wbMC9ndjKdP57KUCS2/FBdBBLmqRIEH5QU4a5NEvkzx7ZA
         wtTg==
X-Forwarded-Encrypted: i=1; AJvYcCV+D7pmSOacnNsb3IptaYcVfjv9yqGkJ/nrOXHfXJymSuyrkcA1vfc9QLp76ChlTfUsLhgutJG/Xvdc3lcq94o+t/AJg8lvBOHkb1pV3w==
X-Gm-Message-State: AOJu0Yy+EqA6ggshOosrpvM0NaINY4ocpHV04RPd6zmZDe0REXo3qs7o
	gTdTS6KHVevs3CMRb0Zv1PSVYdl76lpSa8DO8qLWo0LiXrsqiv8VQt97WamVflo=
X-Google-Smtp-Source: AGHT+IE6WSPz5JkX+9XH3yVWV8ckTdvQ10ELe26IE1/Ux/k9Utl8IdxCmMwFdOH8UA/7aA0NlFVE8g==
X-Received: by 2002:a05:6512:1083:b0:52c:8405:4869 with SMTP id 2adb3069b0e04-52cbd4eacbdmr2770357e87.66.1718665825451;
        Mon, 17 Jun 2024 16:10:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2ed0ac7sm1345613e87.125.2024.06.17.16.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 16:10:25 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
Message-ID: <ysodcykcvjbv3wx2s4gdjnz66sn4cwbf5dyswncxgmnz3be4vk@fr62mulvuj4c>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-4-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-4-robdclark@gmail.com>

On Mon, Jun 17, 2024 at 03:51:13PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the hwcg tables into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 619 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 617 ---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   3 -
>  3 files changed, 619 insertions(+), 620 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

