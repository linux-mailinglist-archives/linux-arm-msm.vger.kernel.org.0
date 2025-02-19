Return-Path: <linux-arm-msm+bounces-48581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3FCA3CD66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A4F67A8134
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCD125C712;
	Wed, 19 Feb 2025 23:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjXMjadB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04541D7E30;
	Wed, 19 Feb 2025 23:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007410; cv=none; b=AJdikGQWNpDAk+5EvZVo999bmbiCwpAziecIxFBJtVFp3v5oKMrK0cGJtWkSwLueoETi5CgZRRTHinjyoRuZDkGy9MRN/aN94TSJy1v9pEDDeaaZOR0td6O8APIJwCqh1km+gIoc9PSL2AbBNWYlJSscOhgQod2twbRWl7uH0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007410; c=relaxed/simple;
	bh=Cd2Np4M20fSpi/82K1zTOjFJqunVLAcIuWe2TC4Vl/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGIabQloPn4xil+mT2ZuEPGbK6Vko0+29EFbnA6ZiU2+vRAm2FGpnIujbJ8ZrK+ZHNDi/9CzHKSaD+tZL8VFaAp7EZLwuQqSJtAOuwErEh5/iPxOrOHyg5APUrBbZ6Uz3H3k6uA0pOPr3euyJpax1/GHWv/i3JRs+Zyoy6W/atI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjXMjadB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC8AC4CED1;
	Wed, 19 Feb 2025 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007410;
	bh=Cd2Np4M20fSpi/82K1zTOjFJqunVLAcIuWe2TC4Vl/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjXMjadBtm34ehttlKyk7q8n1voYSStfaXA/lyaiOKp7S9wO88FTOBcNgdKf/wLSV
	 kIr7RoTfBYAnMlo213m9LpXh0VWtIhNCVah4gyg7wVEgK+mkFYbjIIkh4J+Yi0+jRt
	 SrQE4IfUgDMOmqKeZabFFZMhnTjpJyqBpQRvCsOcqhuNACaHl2LybIQj46iVSucLUm
	 0rRDWnev62H3IMueTxLN0avHYcPddYa0B1dPeEDINxlL5oIAPzlCWNgTYWEizJiA+x
	 SJ9WIAx9OeDo2rT8LRZQ7v+GLdNMu+uihrZCQpt4l7zftA1Z59B87oByTaCrSseXOd
	 G2yjZ3cvhMi3w==
Date: Wed, 19 Feb 2025 17:23:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 06/16] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Message-ID: <174000740841.3166289.94560145914383982.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-6-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-6-d201dcdda6a4@linaro.org>


On Mon, 17 Feb 2025 17:41:27 +0100, Krzysztof Kozlowski wrote:
> Add DPU for Qualcomm SM8750 SoC which has several differences, new
> blocks and changes in registers, making it incompatible with SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


