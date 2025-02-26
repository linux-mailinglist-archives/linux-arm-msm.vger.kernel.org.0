Return-Path: <linux-arm-msm+bounces-49518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04823A460F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3B731897CE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A176A153BF0;
	Wed, 26 Feb 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO1HF207"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A012904;
	Wed, 26 Feb 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576730; cv=none; b=sK5ULQnYrEGNgruiHFMd91dxhQK+TAIh4DGBkidVzkVZY3XrNcc04187lYtRUywGpZDgwZ+Xg5AdBJLmuNPL5mRC31KXb0Fgjg+qtrgVYGiLOurjHHdkRCuY4K7supuTWbBNzDaCEpzp4BR3YWWrmQYiBCbPz+Oqs9JXL1QoXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576730; c=relaxed/simple;
	bh=87XnNLS5vX+w11/Z+SmXBj0sS8D51hZWXWwqpckuLdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brJJDylulLRyr8W7ao50trUIrKMv5UcYyV9FcWSCRMRt9l8OPRhZ5aqZ/AkMLQTeTOcH2eJMuOLHeKk5EfnQ5KHqOQN297zuSMk8vOOuB7Sgoz4GUxjDXTpN1/bCbcagQQe6hibJxneKwW4tm1Hllb0tnjG05WcS+IYNijcW674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO1HF207; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7452C4CED6;
	Wed, 26 Feb 2025 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740576729;
	bh=87XnNLS5vX+w11/Z+SmXBj0sS8D51hZWXWwqpckuLdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MO1HF207lu5OxxGlBGpLsRjkUTdAtTRgQFPFa0UKKxxPPonRiBCQcs18JJDVExy16
	 8szssYjWaU8BeY1FVI37zFA49AlLuOKH5Di74fPMeTipoT/LsCT5ziGvCa3o81uQ92
	 5VWuoE9Te4LYMbxo53+UC9dJx17YUlL9z02zpxkQIm0pWkiUwWswYYTk7tUlwF/2gb
	 oBILwYzQ0MAvrEiIIyUNLJArSnxdWDX+6m7tH7WSXADzaYhFkoxrMKMpRz5OG3dqdv
	 nORcz9g35yqluagNBkUK7KMK51uHeNzqY735133A3Je3TyTKCT7lZMEYQaF9ENuQKx
	 SdPUrkl2pTlag==
Date: Wed, 26 Feb 2025 07:32:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
	Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: Add
 missing eDP phy
Message-ID: <174057672730.1813399.10950790122107114702.robh@kernel.org>
References: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>


On Fri, 21 Feb 2025 16:13:11 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
> missing device node in the binding and extend example to silence
> dtbs_check warnings like:
> 
>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Fix reg size (address/size cells =1) in the example (Rob)
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


