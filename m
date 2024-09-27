Return-Path: <linux-arm-msm+bounces-32697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189D988C9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 00:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 984FA1C20F7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 22:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DFC1B6521;
	Fri, 27 Sep 2024 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmRdPUHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024E1B5ED4;
	Fri, 27 Sep 2024 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477315; cv=none; b=nFN6edJVdypldvmlgxRDDBgOFMGSxzyA8sfHsLs7ZvL1qLSQyndFLHhSz8BKST/L9ngHCwc4NjlpYnY/IyL6GD79yEfz3n9V7FVran0fzbvmLaBTOGkiLASQKAsl7NgAE2HAw0Q+qDKIqFjd1KiUMPWmCfrubd0PrWQh5kVDYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477315; c=relaxed/simple;
	bh=1T2DBWFpUEl4LR7s6nY1OCs1JvrlTPH3zAkcEcXGX+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLc4csRy/CBxUjjQeQyLK1SAi/lZkC9D467C0HD6QndvMQZuZqdj2p/rDsLXR0wkRYR2M8NBevWuLpQTLwad0bzGs4VBWl3XaRVGuob/9lq3Dy+DxAQ1ED9+NK4+aOLCMHOxwnllsxhsdZc0eO/yb74ZR6FiT/5jgBFjdkas2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmRdPUHc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8295AC4CEC4;
	Fri, 27 Sep 2024 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727477314;
	bh=1T2DBWFpUEl4LR7s6nY1OCs1JvrlTPH3zAkcEcXGX+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmRdPUHcf5NPTzP4nMqsCwbKXvX7ow0VM2zp1bNvu/pK4DYfOeTZ/9gcbx2+jrZZ2
	 +Avl6b6K3H2OvT9PuH9HfKgNqsqUV+ERppGFbVhdhyY3j8ez/E/uB3/E+JUPmyWvhO
	 uZ5QCSbfB2zCXohYoqnX4/yi5aU65icxGGsx4vX5nfcShXSmWzEBy+qu7kngTDBrhe
	 fcuWEUqKFqQVfjVRIHCYWjok07TbVUH8mbJG7dGvb5SWBoJGMdRRS14QF/JmtqdglS
	 vDCslZC6UuHIsw8t0QOL8cjtMU/v1F8Nz8SrIyyDaWNFghjkoyvGRipXBg1JAJ4LKu
	 /froGnHygnYEg==
Date: Fri, 27 Sep 2024 17:48:33 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: do not
 restrict power domain to MMCX
Message-ID: <20240927224833.GA159707-robh@kernel.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
 <20240927103212.4154273-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927103212.4154273-3-vladimir.zapolskiy@linaro.org>

On Fri, Sep 27, 2024 at 01:32:11PM +0300, Vladimir Zapolskiy wrote:
> It was unveiled that Qualcomm SM8550 Camera clock controller is attached
> to MXC power domain, therefore it has to be reflected and generalized in
> the device tree bindings description.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 26afbbe65511..9ef967523987 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -40,12 +40,12 @@ properties:
>    power-domains:
>      maxItems: 1
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      A phandle and PM domain specifier for the supplying power domain.

Just drop as it just describes every 'power-domains' property.

>  
>    required-opps:
>      maxItems: 1
>      description:
> -      A phandle to an OPP node describing required MMCX performance point.
> +      A phandle to an OPP node describing the power domain's performance point.

Same

