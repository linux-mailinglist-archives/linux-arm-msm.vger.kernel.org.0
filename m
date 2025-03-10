Return-Path: <linux-arm-msm+bounces-50782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198FA58D15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBB83AB176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 07:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B169E221DB3;
	Mon, 10 Mar 2025 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLLZEVEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0FF1D432D;
	Mon, 10 Mar 2025 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741592428; cv=none; b=cJFRuQVZgN96jNlv70Joa1n9T3KnCkzUvzH54PtN9PVI41nvqpbOscMdkCj6SGi5YSBQ3cTDDKK1sSpvFavI2EdffXmhCb5v1i16Rr47CNp05bXbspad2x9qnzHGMpPsTrgltodF3DZW63BjDwgyn+lyXfd5WyFKOJOzmrnGOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741592428; c=relaxed/simple;
	bh=A1+vd1+iI7U2juLRNkQfIRGQ+caFncDP5Th5PCoA3dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY1AOarcQL0VF8FjbQmVN/hcalQe5UYitnaTJveNIMStbKGJtTecWPkVy1AYn9I2wNkiS5nSwTBuyPLFiF/nR/jEUaPr7vT3ovU15ZiPW8f9eRDJ0bycxoe+uNgQ27VmTcQe6jCsruH/FO02eASlb4pkQ/NIWzHJxmTVezaFYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLLZEVEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23303C4CEE5;
	Mon, 10 Mar 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741592428;
	bh=A1+vd1+iI7U2juLRNkQfIRGQ+caFncDP5Th5PCoA3dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLLZEVEGzufs0VlS6qieY+pMhoUDMxcouSNcWPOVrGjQx1+BmVdccK1B31g4zgat+
	 S9t+CMks5K+WhoLTpoMllIS9jxMDecewNqkeTry3J7MakMz75SFX8FcMghXi9kWwe2
	 zasatPj38fuVJw5Y0DyKT93QDXjrJAsokH92ZYbWZKtJDWadI05auP+gsW0ntdETMp
	 tUbEVpawx/nm2mYD23HNeUigHTu5sAsLfltu4Z5t2rYDgYfXK/RNWoDfOPB/E8pCx7
	 lqUncZbsrTer3uvAWWEbtP0sXsfjpqQJ/RIejBYs++63rs2P/+NPR6I/rg9lTWSI8Y
	 QJC0gyvxVCyHQ==
Date: Mon, 10 Mar 2025 08:40:24 +0100
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
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Message-ID: <20250310-impressive-cherry-bullfrog-cbd8fd@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>

On Sat, Mar 08, 2025 at 03:42:23AM +0200, Dmitry Baryshkov wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dp
> +          - const: qcom,sm8350-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Drop last compatible here and use contains (see v3 of my sm8750)

> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dsi-phy-5nm
> +
> +required:
> +  - compatible

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


