Return-Path: <linux-arm-msm+bounces-81709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4512EC59F15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFFBD3B4379
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCD22ED17C;
	Thu, 13 Nov 2025 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGQzjKPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3245218AD4;
	Thu, 13 Nov 2025 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065087; cv=none; b=RguMDd9P4A/lyFIgC3BPa/9Y33bIhNLvznIOZZUx6FRNeo+bJJ408untfteYepGaG7F9v46NJ+ziEJRrpTRS8MPMY6/LnYytNUO+0I+3ECgfzXIsqW7E7fzwPO1OhHFwI+CgiEBrqjoAQKRSkaorC4x8jOzkzt6i5tAK6bWNOug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065087; c=relaxed/simple;
	bh=l5FwEgXEUvdi3iQPENPfoWiUGpA14APd6EDnauSzk1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPMdt5TT5peqtKyPHNuhGyOIcrLRDZVTonTrUDNSYXEF7O0Ne+7kxykMc2U1SwF59d+jDLF8LvAIrbI8ebSK2FnqkQ0VkcBX1fer4scacQPy3eY5veOXkkSZGpaza0Wpp6ECr/QF75IEFlvQH6HiBtrgqOdfSg+nIgmNBEJd2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGQzjKPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2046C4CEFB;
	Thu, 13 Nov 2025 20:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763065086;
	bh=l5FwEgXEUvdi3iQPENPfoWiUGpA14APd6EDnauSzk1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGQzjKPIt7+u9UuodvWzl/Ma5W19SdIk80i7H6KFciTbfCpMEIlu+IqBOOyMqKFJg
	 7VOdwtUshqHbkX0zHD2I5dPbPFg7y1t7JYtqG6D+KArqJ7z2BqKfGeJ2XSyWcGH/9m
	 I2XIBYjHqBePIoauDX6CYW+S2tqGRts6A7rokryJprIrFJQRh3f4R3nJNxZ3kJo9uW
	 NSy/2sff7UgXHrlxJ4BuVI7NlszKoyTuqnH44k6xU06h/jI4jSiIgwZu2e/A9Lqnok
	 c3ambqgYuOyEFnl+q3wH1IAzIiQ5X9KSfvzcfAxyTSJByTwdvodJE2lcvvASrx7cjd
	 u3KJhxpOajb1Q==
Date: Thu, 13 Nov 2025 14:22:28 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
	yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v7 1/4] dt-bindings: display: msm: sm6150-mdss: Add
 DisplayPort controller
Message-ID: <rftd4uhi4co7rburzrj4fjflrrk2p5fnxfzcaxnshhfi4er6c5@bgzhj3ixbyuq>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
 <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 09:33:23AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> SM6150 uses the same DisplayPort controller as SM8150, which is compatible
> with SM8350. Add SM6150-specific compatible string for the DisplayPort
> controller.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..98949deed9ae0a23148c5bc9877e6b7250a2f64a 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -51,6 +51,14 @@ patternProperties:
>        compatible:
>          const: qcom,sm6150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        contains:
> +          const: qcom,sm6150-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> 
> -- 
> 2.34.1
> 
> 

