Return-Path: <linux-arm-msm+bounces-74000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA2B8274D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3BF2A3651
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 01:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D13183CC3;
	Thu, 18 Sep 2025 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTTVLt22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BC6F53E;
	Thu, 18 Sep 2025 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758157311; cv=none; b=YQbwz0/hj02wVyI3BM/ltmKMNmdTYluuoNCKezTSZois0SvpiH1A2x0Q5byd4i/hnw2zJ/lCwcGt+hsjy3zpsaTIlcgYbAzjW12oD0e6uCxz9rh4Kha4bX1JOjhEL4eolWSSqIXaRIhWld1+Z4vpV50mEoSQUwmryaEbMqOr9BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758157311; c=relaxed/simple;
	bh=JSIUrDUCEBotm/znuNOiQJb4uyQ+2I+hyAil8bK3s54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0dq76CdUSqC8DV7aQzY41bcjF0/Qe7XWfRW7BYyRTlHUH8EezqSF0gDJacaKm8zBSJAtyivEl6upCaK193gfMx/IkpecQ7kkWQzq6YujyQpA59beVb4jODac9uljL68xMFsHh4neXSe5ittKLpulgXx/nn0if9bZTYxQMOsWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTTVLt22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564ACC4CEE7;
	Thu, 18 Sep 2025 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758157310;
	bh=JSIUrDUCEBotm/znuNOiQJb4uyQ+2I+hyAil8bK3s54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTTVLt22doeEewvF32nXAVDo8PI/JOlnw8Gzj+WrKwqCTVkfXojtJFHHiHzhKrjS9
	 Bp3rlAmPob5hZr7ElxFoGqMJeNnDoevfCHtJEr/um/TpmPW4R6JdIq7zViT7rwpT2W
	 E46ZfuMfO8U4zn838DsUlVsUHHKkMMiSftBlcQfFFDCeFM50RnWLYPzQVxeYNJMmQH
	 xytaz2hH4gusc9NdpYPG+C6+SY2FzOEbtDJfxQ7Yi7xLXPkhue/jQRG0dz7NNMIbKi
	 jqov6aPEdPNauuMdOk5HjqXuLQiNG0TDJNAqrSQjjYalucjlfFV4UMxk7JF9lS45RB
	 FUTS5ZoBBFSAA==
Date: Thu, 18 Sep 2025 10:01:48 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on
 QCS8300
Message-ID: <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>

On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Patch v11 and still basic issues. I am very dissapointed.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


