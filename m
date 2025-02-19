Return-Path: <linux-arm-msm+bounces-48582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C92A3CD79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 648943ADB52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B219225E442;
	Wed, 19 Feb 2025 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcpBcpZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485C1D7E30;
	Wed, 19 Feb 2025 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007627; cv=none; b=dJ2QF+hmXGRsII+YROs80k++uRcNtMQ/0BIBy5mEDWfesJn0chyWxU0Gpt0Gf+JS2lH+sZESLxq3drCyGgFdxJTcbTfJ7MBB15vCyYrszs2dH33pyaXiR+Hn8vgm/lL18h80aX43UHq0Hy5qnk1jA4euHA2hgfpoQa5pbfoeuxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007627; c=relaxed/simple;
	bh=WX6lVmo/c25XHWA8ptWmTZ5D0wvhqhVJVdh7eGhlPHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+Q6gpcPM7FAneuh1IZ5a9KYMasIPpUqhgxsR5xHNubBT3srRTksdWdewx5QU3TvImi4NhII9/3ouAtiTpKHMz05M/3DBt5Vy8okNi7blwdsVh9+O9w0nRPZuPYoD/MpPmKRTxD6ME/PP6l9mDgDHfwW8FEnjxmBi0ybsaLBLyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcpBcpZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE72C4CED1;
	Wed, 19 Feb 2025 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007627;
	bh=WX6lVmo/c25XHWA8ptWmTZ5D0wvhqhVJVdh7eGhlPHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcpBcpZpcjx53AjXDByVc1qriePQTt9PzfDcUl6el/oToFwGynzQcj26tNfwh0jFu
	 jdDPRzx00n37KeNGxvhBjv00PW5UwN4cAkFpoMC6QMrTIhLArLkj5pfb33H389BN6S
	 WfCRzQcTcByYd5g2voFukcfKrEcPbtuNco9AQAs/uuN8G2K2Ab6ZD3FGYa8f7/IH1I
	 sWXgNGRRsKtutwIXQ4bKy2nnjGCvdHOeV27RIqbJjRlctjffOzOsFLhyNwITtTVvry
	 aX5+xO3L1IPFYn3uzP5qfPJDMVmvZ9gIA6AeDgkjEeAAaW/eWU4khjoAwP82e8IO+v
	 EbAqdSScg90Ag==
Date: Wed, 19 Feb 2025 17:27:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
Message-ID: <20250219232705.GA3166541-robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-7-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-7-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:28PM +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
> with two revisions up of the IP block comparing to SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 +++++++++++++++++++++
>  1 file changed, 460 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cfa21b0d081338f1b94779594798f86284ba0677
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> @@ -0,0 +1,460 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8750 Display MDSS
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8750-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm8750-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm8750-dp
> +          - const: qcom,sm8650-dp

Just use 'contains' here with the 8750 compatible. We'll check the order 
when the DP schema is applied.

Up to you what to do on the ones with a single compatible.

Rob

