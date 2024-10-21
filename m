Return-Path: <linux-arm-msm+bounces-35163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B09A5C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6BD1F22927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FDF1D130D;
	Mon, 21 Oct 2024 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY5t/FED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E571D0F7E;
	Mon, 21 Oct 2024 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494997; cv=none; b=Kipv9AQ87ybu4pisSzo289Q4v9hjOkiJZZjGrd9acrn/uE5D31JgJ7LxpCR1AAcTd2eNGj98UGQL25PukacIYkdvGqCYX0YAGo2WlG0olYxge8jdOvgLfK14u9hkfwAzqs4Viij8G1J5aoJbM1fcp+T+kS/WNT5x7au9EF4Xgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494997; c=relaxed/simple;
	bh=wQ1YsES1KsH6eJcjGe71asXjZGM4hRj8D/5aV4t80Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvgiWlLdq/MliHFiRiYGokesXCXwgn2YFo0ZBNyX+wVZVKx7aLp/V5DDVK3ylycYYe+TpeEkL45DM1V9JEmFAKmZKIsFXuUJixmf4k7lrRCYQ/IOvrQxE4hTfnjU8s+kG6T2J+7PMqTjSZMXDNzQDst0O3x7egjh5NM608i2M98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY5t/FED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E387C4CEC3;
	Mon, 21 Oct 2024 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729494997;
	bh=wQ1YsES1KsH6eJcjGe71asXjZGM4hRj8D/5aV4t80Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QY5t/FEDLe5fDtOyT3IcJBxS4EYmCXHMfGbD2E/lryj8DxZGosVIFOZmFo7J7r8A0
	 y2vP9ghHM4f6km0PU5stGbfB1x8kjprEIVgdtPMtJhBW0VplBwj9EnkLnwC1NzicfJ
	 Jc9Zr+8MNkFruqv1MobQTvLsUYSMKQlql8EiHbtAvYQWpk5OUyzlLtWB5kyn7wm47K
	 DfV4KBd8abs8nWeC2qGRIl0QgrzQr5mklvDeCAJOivRUzFVPsj6AbIUA9BpUSeLz7f
	 LKioEK5KVTE8GdGk5UpD7QbzV5ldkjUYB4Cexowp9Fzh8K8iO/2vG3GqM4gbnoGXoG
	 bkkdY5Uw64qyg==
Date: Mon, 21 Oct 2024 09:16:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Message-ID: <rskz2jgw44fxkv4vuflro4zkdoinitdpjbc7fm7ql2xvkwhzm7@n5ggqubf3grx>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
 <20241019-patchv3_1-v5-2-d2fb72c9a845@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019-patchv3_1-v5-2-d2fb72c9a845@quicinc.com>

On Sat, Oct 19, 2024 at 09:14:54PM +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


