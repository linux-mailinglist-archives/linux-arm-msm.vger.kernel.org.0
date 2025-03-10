Return-Path: <linux-arm-msm+bounces-50781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2395A58CD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2F8188D027
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672D21D7E3E;
	Mon, 10 Mar 2025 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMUUmsbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A51B423B;
	Mon, 10 Mar 2025 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591403; cv=none; b=Ek0tF4VUIyHacHsX43gjrYTBlH8tx3/+XLh1KTHajH0K28V5bN0DTSLfLE89/uQ6E51Vl6nh6ObZIaBzhUmZTw5qCDnIeoSfQjX2Y3rhMYhwE1tzvcpC6YUKgNNHb//pPe/laWjB/ndMZ8i+BGWehzMEKd1hwcl49ly+0IZ44MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591403; c=relaxed/simple;
	bh=4ETkd0jFHLyp3RPMBWiubYsNSXRDodyaLu0wHY0y2XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVAyUxFoOlzchsS8zSSrkXVRFGEqHxAEYslB9zpuSs2K3nhbpGXoI1e5HEa4a7VbOXU0W3UAUmbDW4x9Q/uP/dJVd1aaE0gDtMLlnkdGYHAse/ctnNwlxPcQ/dlaOeMKYwP/60jx2DX9sMtPbjj4lKfKK2yVnMStIxae6n9lrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMUUmsbK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59CBC4CEE5;
	Mon, 10 Mar 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591402;
	bh=4ETkd0jFHLyp3RPMBWiubYsNSXRDodyaLu0wHY0y2XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMUUmsbKMTpJIOzlDQphAuc2kpcQCU4fCSZ4fQtG+R+LQNt6YwQciN23OZgf0/itk
	 ZHbKHvjGM45dX2MbZ32QNS/PwrHxj753MYl4pfeJmj8IG+zd21QH8uk7puO/mVUPw/
	 d3vK3nq1DDBM6gRdMG2xVvD9ZnXQ2Hak9xP/rHOpyf7ZZPCVq7Hqw+ydmVGdjM56Ul
	 ikLzRYbPfFZ8Iz2AeAtACS929d5fWzFnJTVmj1FqpnQbLhuoJ2I17qUPM4tIiCuM2Q
	 ncunR/tRH4scVhXHG1p1hO46Jw3YcZptVCK5qVxeL7nteF7lj966YbXe+ntvpAneqj
	 UWIIfKEDhKqqw==
Date: Mon, 10 Mar 2025 08:23:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Message-ID: <20250310-eccentric-rare-rook-e4fb60@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>

On Sat, Mar 08, 2025 at 03:42:22AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe DPU controller present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


