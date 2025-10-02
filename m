Return-Path: <linux-arm-msm+bounces-75744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99EBB22C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25DB19C4CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E88EEDE;
	Thu,  2 Oct 2025 00:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2ifJumk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6134BA41;
	Thu,  2 Oct 2025 00:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366476; cv=none; b=aOVvwgTKoSXG8LsW13We5akoHaLhGjEeogMb7yEGCQodbm5BUxBsJtFReS3CsA3oUE8BdEju3KPDnRovFW2tl070aOvSHn9KmYPeTHbxPMJRWymUlFDryXzIJuIbnAt8HpVKC5FFMNLSqmOdyY/zQY5IwO51qgj0Q+mjCK+UiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366476; c=relaxed/simple;
	bh=h/ZqzLMTizO1E2ngkdLjkGoZgkExE0YuTrWMWtHQDIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF4kloU/0TpzJV4EGYeKKvJrU3z3xJ6/WHcZ5OpiYeHq4AOUgla+ULE+/n/+sjymh3IaduWmc1ES1TNev0w+PHxzVSaqxYv6JT4f97KynOKpe79ifXZ4ccTY+ejsy/coiZWK3Net20bwlDltn5gtxNwMUib8A6pyNYs1TSEdsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2ifJumk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC5DC4CEF1;
	Thu,  2 Oct 2025 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759366476;
	bh=h/ZqzLMTizO1E2ngkdLjkGoZgkExE0YuTrWMWtHQDIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2ifJumkqnaOdRaclDkH1zQhW7rBXT93GtRMH5zSHf79RmctW6RefVkBvP4eiqdWX
	 HQOMidm5FNwb5oyLjqV67FIms2MMYebhD0xodxz6l+psevnfHAbalylGfPyF0OS6Q4
	 Ec05eIpqUn8qJNKXwd/uyFkO6LWQSP5lcNbQpJK4beoFaY55xSbg9OuQF2TZSL8Nk/
	 lDBbcTuDX1T6ncbTg/UpDY4dfHIA8LlZpTcAYC0b7VPizW5N9V79LTdM9GZL8CxGgX
	 SFCSvKio3TNi8LdQu+Uy5jxtMrbEOV+MxvxVau70ypGKrE8JH8++X9bzqptQw2Yv/r
	 67N9qJ0zws3sA==
Date: Wed, 1 Oct 2025 19:54:34 -0500
From: Rob Herring <robh@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
	konradybcio@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
Message-ID: <20251002005434.GA2796203-robh@kernel.org>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 12:07:25AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
> with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
> need to be hypervisor independent, the iommu property is mandatory to
> ensure proper functionality.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
> 
> Dependencies:
> Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
> This patch has a dependency on the iommu binding added in ^^ series.
> 
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml     | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2dd479cf4821..cba45ce2865e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -28,7 +28,9 @@ properties:
>            - qcom,x1e80100-adsp-pas
>            - qcom,x1e80100-cdsp-pas
>        - items:
> -          - const: qcom,sm8750-adsp-pas
> +          - enum:
> +              - qcom,glymur-adsp-pas
> +              - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
>        - items:
>            - const: qcom,sm8750-cdsp-pas
> @@ -95,6 +97,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,sm8750-adsp-pas
>      then:
>        properties:
> @@ -185,6 +188,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,sm8750-adsp-pas
> @@ -238,6 +242,16 @@ allOf:
>              - const: cx
>              - const: mxc
>              - const: nsp
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-adsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          minItems: 1

The min can never be 0, so it is already 1. Drop.

> +          maxItems: 1
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.34.1
> 

