Return-Path: <linux-arm-msm+bounces-48277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8FA38C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDBD07A3253
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFCE235BFF;
	Mon, 17 Feb 2025 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDOYIYOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69C170814
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819926; cv=none; b=IvcqFeafKWag7s0fYCRm0oLY1uMS2ZMDOxCSlHWXjPubFoBertVk08lU24CAVcMFRFB2nkDJiQyx8FWQuXr8ynvPMLADMvQVYRUGfqmTgIoJVxn1GUjQqGk39fXrL8wPtDAeUxqoIgDqZkubE8YeU/Nj4FVSWIXZLdgvYep0fCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819926; c=relaxed/simple;
	bh=mhMQAL+ZuCppMLZz3hGC1V1w1m+yQ2xV52Svf7YNBBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0/IBu1kBXz4j87EtVSZXymr221Nr00BwNbU9ApuF0DTCJjSgXaz9fnsWuAFpkI2tHhHVUjal+rAx9NjeMh9q47oQbI8bzvijqSgtSkUWyFnz/hF4OFQ8E4m+n4JwCLIpUlCUyIm7x9l4fvWYT0kRZ/4h3vg899WuCf5uyYh0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDOYIYOB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-546210287c1so1401431e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739819923; x=1740424723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
        b=BDOYIYOBgxrYEXkVTg9BNQkdzk2Hk/0TDeHpNhz8Rr0L2ZSG9mRKe/f1U2e3isBkKE
         PHdjNJZ3n4CT1WlAAfTEChtcsFEYTxpA6YS1K4nmGkDq8btB6S1CQ3lMndViSv3eZz7T
         qWoqQ50kqY7wdbOCEc2UN4bhuNT9wiCMy6Kb2I9UePtYAcacHyOrqAQ35w61DOA0Sqwo
         HoDxN3QjiaX02qY5qi62tCUKwKjLbuJ/uzdolThFyQcrgg4cBjxaFADyNA3gEydedpv1
         Z9hduDbGsBk0+5vsNuRWySc+f4BfP5ZAuaqf7U6bgNf7LcH7VynAMsvv1ZZgwgAF60zO
         3CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819923; x=1740424723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
        b=taTvykUZQDcc/zbPVkuGayGmoOdIEqBQgPYVa/XFJbIqFrwjhO59A3/dUbsO5MXGKA
         M3s8ipo9Pu1AKf3XE9Zk7BWUf2PDE8/XtfBoQGuUy6yJqlgsAZfMUuygOBKHbfoUfA0l
         qCjCSlN9PtDh+/El9k971a1uJrvjziQ8weQ1z6RhB5rgXLhdor1BlkF00rE1g28DjIbU
         ckxC7P2fHfpoirGzOU2vjWbMj1y9gZnHGNNzgtiIrTgtjxX/20e6SxA+9dunuacmxfsk
         C8nJUztaWydtTuUxsW1O7hiJbWiBBLmdKv5IDnpWf/fHMkobmoBuz3PdRtubMghjTrzy
         +4tw==
X-Forwarded-Encrypted: i=1; AJvYcCXUkdVUlIWW2+oq+eP09OmyIhTyzauwAlN5qPmn+PjslZwc4QqUZI08nMdKVngaeHoJdgSh//LImAEIcHFF@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6hFQyl/ULblwNAfF0+LotfCNGSzfmlOHSi00txNprlOlKcgx
	VLJBxs57TtDzESKCUEwHep+AAYLIMqp/LDUpfqNhncVvXbLTEXW3Ad1QXl5ubd8=
X-Gm-Gg: ASbGncukDdTjpDrMCsIzJO3yoQmzCawyFjXG7Dlz97TwfOn9CrM57GoZXzXsCTvy/sf
	qthzF6/7+bvhC9asBeil09CkLu3GReEqXEg0hQ0XcikAjDrjk50/xPqG1RKXvyiYhgejINJ7R4P
	pLAE0Yj6wP0Xf6IdSq7YhklZbgkrBISWcMNjs/BpoMFQYVhr9OlTYHn8G5LLjIP4qpNEG2jqCjE
	VdhQdq6xKlu1DvugusybPSHUk9TKk+SiuEb13FvvI+Nfug2nbqQAYW1IhsTtbo+P5/RRgaQ3NMx
	POJi3L/YRdQ1DZTgtKPHKB5831SaOm/mfzOjqejnxUrIHwO05hKiLRhSD8qMY5mzRn6Q/L0=
X-Google-Smtp-Source: AGHT+IH7pPe9WdA9acnmeu4tM6FBkJrCmOJkB/cGc23MUQGTJZAedW80zQq+KjfFc7YHQvnbMFONmg==
X-Received: by 2002:a19:2d11:0:b0:546:27f0:21a7 with SMTP id 2adb3069b0e04-54627f02773mr695030e87.49.1739819922816;
        Mon, 17 Feb 2025 11:18:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461d4f2aa5sm694294e87.0.2025.02.17.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:18:41 -0800 (PST)
Date: Mon, 17 Feb 2025 21:18:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
Message-ID: <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> Implement new features and differences coming in v12.0 of DPU present on
> Qualcomm SM8750 SoC:
> 1. 10-bit color alpha.
> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
>    layer mixers.
> 2. Several differences in LM registers (also changed offsets) for LM
>    crossbar hardware changes.

I'd really prefer for this patch to be split into a logical chunks
rather than "everything for 12.x"

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  49 +++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  12 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  59 +++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  17 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 210 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 +++
>  6 files changed, 350 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

