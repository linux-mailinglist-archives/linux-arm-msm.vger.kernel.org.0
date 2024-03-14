Return-Path: <linux-arm-msm+bounces-14096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CA87B90F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 09:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56E51C20F37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B65D463;
	Thu, 14 Mar 2024 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WrCBGqrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED33209
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710403507; cv=none; b=T3IrStX6McLAnI60Sk9XWUGPQ9WaPOlF+pjM8BImJZ3VZFUHXsiSaJiyYSIA9KzYVn9iPVX+75EePOaKBEJ+vjv0Awd1IMynLgOUH3QrnD4vXET46d45s237vF6AzCwA5AmJG35jajK2e+fY/Cy176nps/WlLr23jvhObT3R00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710403507; c=relaxed/simple;
	bh=NzdeIaGHUsmz87VXTQWsyL/Vl5qykNdXArn9y2Pvsx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfyzX1da+7jDOJZ4Yzye2uSA77Z6dndG/tS1LwcTz0D5ASQBpito8QlYoVQ8qTESzBleMNoGlsc2ZpX688KV/cnMtXlc5fv7517Om/xHOAR5ANI39rhFq7NKue8I5psi8j8IsBYjUlFMuEViSZwl2EK9gRm/UbOe21rU1M/J+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WrCBGqrD; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <58cf7cb4-7d78-4d3d-9958-1c59b7f16379@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710403502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwOkeO0IePf2MkXjAfEBO6D0e7Im063f6cASBrBdNrQ=;
	b=WrCBGqrDp2ANKiyYR5AQSRarAuqSQVUzOzobJ1n7t2AW2HaJt5yHElD0HQyqsaiDGRuAfC
	GM9wNWBpX8zh8MFa9F0NdGObWkCFftnwoul76pj6skM0d680dUe/i87ho43RRpZfxyZIGD
	ifro2Fcb4W9clJAkPfFliRODGqUhClU=
Date: Thu, 14 Mar 2024 16:04:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v4,08/13] drm/msm/dpu: add support for virtual planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240314000216.392549-9-dmitry.baryshkov@linaro.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240314000216.392549-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/3/14 08:02, Dmitry Baryshkov wrote:


[...]


>   
> +/**
> + * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
> + * @rm: DPU Resource Manager handle
> + * @global_state: private global state
> + * @crtc: DRM CRTC handle
> + * @reqs: SSPP required features
> + */
> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> +					struct dpu_global_state *global_state,
> +					struct drm_crtc *crtc,
> +					struct dpu_rm_sspp_requirements *reqs);
> +
> +/**
> + * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
> + *	blocks previously reserved for that use case.
> + * @rm: DPU Resource Manager handle
> + * @crtc: DRM CRTC handle
> + * @Return: 0 on Success otherwise -ERROR
> + */

But this function do not return any value, right?


> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
> +			     struct drm_crtc *crtc);
> +
>   /**
>    * Get hw resources of the given type that are assigned to this encoder.
>    */

-- 
Best regards,
Sui


