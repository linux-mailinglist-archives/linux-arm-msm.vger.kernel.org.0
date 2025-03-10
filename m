Return-Path: <linux-arm-msm+bounces-50778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF7A58CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92980188ECB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 07:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A001D5CC1;
	Mon, 10 Mar 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGWqhLCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD31D5AAD;
	Mon, 10 Mar 2025 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591338; cv=none; b=mWjQvF7mT4W8gYNnef4/ApE3+os1oC9ZjKZ1/1ZQFFoRJlf/1/N7fL2Fi8xU6TKgwokd+SinGYKpCgK9q1tSdOU3PTSP7bYqVrcql8VxAP2ry5k/LlO2PIQRpKrH55XoGDJTjiMV/3IkjEtovTHa+VqKv46xduZ3DVRzWQ4XfyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591338; c=relaxed/simple;
	bh=n5EJYANlraVMEy+z1CBmSc7C+ttH7vkN8CorsyFAuIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddlX0zCr2G4Zqt+JADexcaS86zuVVMA28okB/+eE1AXeCHL/biMbrroQW6HaSSzHGpXrXmKFxKC5ednCk+AX5TnyWRzeY8yzUAG/UhhCcRGOi4BjLsEHbG7bW4a4La4ay0ImkEbq1xDC414sywTB3xRPS2sZqNkmzr75/u7MHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGWqhLCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739DEC4CEE5;
	Mon, 10 Mar 2025 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591337;
	bh=n5EJYANlraVMEy+z1CBmSc7C+ttH7vkN8CorsyFAuIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGWqhLCyHfViKVUDQ0jzJVcUDm1jsoJM5JnDqfJcZojKRbq7vNU+vCgInlkqWwyIO
	 gRoT7KuGYicBeb9fB7YOiZcrL1ksNwYXxjq4mVly2MhjuFkQYHamsY6eZ1/Tsw+RGI
	 tz28itcBfaVrsBedxosouyOT5zCcHb1Dsx6hh1Eoprrbz9HknvikhcQo0EKq9lx6dz
	 HSM969yK4eZT4TZG8Can+YSyIijegAX++6/y+hFi1G/2xY+Yh25LLE4G7bW7b2ajyE
	 aD9WlibTu1ig4095nGNzz7t2iZB1KU+2FCMlqC8dWOXlY7BX+r9bG/jNJuDDRRzMrT
	 +4iLxrs2cfxeg==
Date: Mon, 10 Mar 2025 08:22:13 +0100
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
Subject: Re: [PATCH 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
Message-ID: <20250310-adamant-wildcat-of-order-8efdda@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>

On Sat, Mar 08, 2025 at 03:42:19AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


