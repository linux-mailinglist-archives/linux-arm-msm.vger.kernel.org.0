Return-Path: <linux-arm-msm+bounces-86687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E52CDF818
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 784653002D74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 10:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2D2222AC;
	Sat, 27 Dec 2025 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTkHdSHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3662C9D;
	Sat, 27 Dec 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832328; cv=none; b=DezSljKasWuLwzhrYqtPU/zY4aVWy9lQwx5eGlzuN4/sh+lmB5cbLaFqGf0zqfRJT+LWTRzi8bc3QeGo7Umup7YGpU5QVLU9wEJ9EK5cvZZcOy4R7f1xokKTx+FKuYFNt6i0u9pGu3AcZPLRfKdCsdMrfhLg1nR/7k6Bqk37Zhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832328; c=relaxed/simple;
	bh=91/IDRS7+naE1B3qreo98hBY1XEXwd2plCFPqcbhK08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDviby4gjaU4048TKdL3mv/ePqhsPWpaDUcFirZwcYRafaXB7K4wWVy+8e0eljiSEU3TYah2z03rX6U25zp5xVyREHo7yyhRoYKwAnPrlDbc2wIaV8CZ7oWy2iCjYiu1oZiAWGv89R9bT0cu8clRStFkyZNxGJ0eDb288ENMmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTkHdSHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0884DC4CEF1;
	Sat, 27 Dec 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766832327;
	bh=91/IDRS7+naE1B3qreo98hBY1XEXwd2plCFPqcbhK08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTkHdSHemrEQstc/kDpzmFCcBQm4wvgVReNbFSw9cbLaGX++MeeZiKVyDpKeXfT7I
	 xCR/VjXnS7UfbiYXWIZcXC2uF8QUZsy2JAT3AEAA+kIaanYjtnT59XoldfOMjqHeQR
	 f2y4xFUbOfs2Ju6pyH70zILf2pDsbiy7o/1sy1U8XRQrkYuAmcX4idflIutDIgdk4q
	 M9tBl3wkXNZqlrpY3akAwZXTXOKpOPMUGMsG+4VfHhNks1FDMfsrvuvsV8CGXrHB9K
	 XBEbfpNz6H2y9FEjipr8nQVol7XypztOhhroJRjE6HJevt+9+qJG5/goYCDx0xMn/F
	 xDhXMUtfWHOkg==
Date: Sat, 27 Dec 2025 11:45:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <20251227-statuesque-rational-wolverine-7edacc@quoll>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>

On Fri, Dec 26, 2025 at 11:59:36PM +0530, Akhil P Oommen wrote:
> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
> which replaces GMU. But it doesn't do clock or voltage scaling. So we
> need the gpu core clock in the GPU node along with the power domain to
> do clock and voltage scaling from the kernel. Update the bindings to
> describe this GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


