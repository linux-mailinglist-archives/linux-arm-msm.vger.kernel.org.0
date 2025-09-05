Return-Path: <linux-arm-msm+bounces-72223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40482B4513B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052A258323B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB392FA0F5;
	Fri,  5 Sep 2025 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdc9x6qR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBB1E7C03;
	Fri,  5 Sep 2025 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060579; cv=none; b=YXpzwgvjeqcK7HK+rYKwuiidMBf5tEHgYt1Afa2BM7EdqvgxbYv5tajIXYce0OEJXwWSMQ2FjKI2ymj4EOxGq4DVpGBKnURC4jQxprt4ukNALdOwd1OXV+agtxT5IFPyl0w9viCJtVCs1xu6DB4EeIfpXZfPpTv2XYiEG4ovazI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060579; c=relaxed/simple;
	bh=ey/kShOzSS9LzBy1SpXYUKciwMlZQTcbrdVlmd2wvSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLRl1YJhTb0xGJoU9goGJ+ECkmWQ/gKMpr8jIixeFMj0fyO7wHCXbcdZZ47vNOnOiFnQFX5p0F7Vrcv2fhMO1MtIie8OOqBYlfmrt6GyiLuGfg9zGsoOuUFusMfjRHukBqV6PvI8T5ZXO43/vkuLV7wUN7ayl3BHN/ilGhzYLlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdc9x6qR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED6BC4CEF1;
	Fri,  5 Sep 2025 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060578;
	bh=ey/kShOzSS9LzBy1SpXYUKciwMlZQTcbrdVlmd2wvSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdc9x6qRbgLD9mazhdyUs0XSsipHnza/HDk+e4+gfJ8l9fuJ3IrqGn3G4Jknqxnjp
	 3/9SF5mYZsqHWzI79YA+W73qmJoq3ARERv4W+dGDDpOKeru+IsgM85LCq3c3JiAd/k
	 njZXAR8Z4oTBvHZRrPDhEv+pu1z8K5xRmGTu/UiAlmo63O49nO4B25meUnWobCmHoS
	 a2zIVZWcNG9D7xCgE5JfFt0cIJbxlUzIWsk76lT1wRAY/C01hbxUDdqQUd/7wX4iUU
	 g6eWobUD57QzAwK+809jNntxFvFQbn82CO5O7VWXCUf1r22O5vY6cF72Sn7ixEYrhF
	 g129HfS+cZfPw==
Date: Fri, 5 Sep 2025 10:22:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: Add DP PHY compatible for Glymur
Message-ID: <20250905-clay-falcon-of-anger-de5b5a@kuoka>
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
 <20250904-phy-qcom-edp-add-glymur-support-v1-1-e83c6b9a145b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-phy-qcom-edp-add-glymur-support-v1-1-e83c6b9a145b@linaro.org>

On Thu, Sep 04, 2025 at 09:55:51AM +0300, Abel Vesa wrote:
> Document the compatible for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index a8ba0aa9ff9d83f317bd897a7d564f7e13f6a1e2..e572f6ea3523a483f701aedab383a63af7abe0e5 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -24,6 +24,7 @@ properties:
>            - qcom,sc8280xp-dp-phy
>            - qcom,sc8280xp-edp-phy
>            - qcom,x1e80100-dp-phy
> +          - qcom,glymur-dp-phy

Please keep alphabetical order. We never add things to the end of lists.

Best regards,
Krzysztof


