Return-Path: <linux-arm-msm+bounces-79132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65DC13B70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6245334A589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35492D879F;
	Tue, 28 Oct 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MS8HsA3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF823507B;
	Tue, 28 Oct 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642579; cv=none; b=oU/nqIfX/FeWW3u+vGgIMyzrqdG4HOM7Yjrsagcyp+uLdNnICF3U75TDJY8zOQkvw6ztkHCIwf6VsMhtozOgDegr7Wbe+K2ax/StHmPb51WNiFjOrC+GKDN8Ovxk1DPpovMyx4A19wy3+6cElRSUuFZJvBhfPOhv35asOWE6Dic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642579; c=relaxed/simple;
	bh=ZeszJ3G5pFbOJEm0PLsqfPwRQuGZps8vSqiFmYtwyKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAIrBmo2N/rtSB6YqHBWUsfyr/JsvFXBVE7MQsIEC4TYmvGY/qIx4DEk2yGb53ZnVaJuu5JVpb8w38q482fJ0REqJ997VG7CpYF+C0IkNrZvQSU9hlTMivI1KrflIHk/+zUTCbnMJWvv7ubi5bOlaR2HjiqkCh1bgimHGGEJBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MS8HsA3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74176C4CEE7;
	Tue, 28 Oct 2025 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642579;
	bh=ZeszJ3G5pFbOJEm0PLsqfPwRQuGZps8vSqiFmYtwyKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MS8HsA3gHTzSFAkqVuH2/l8x1ouMjR1uDE4ZkKX7gH9k7EojJyCK4fKjjovw27RTp
	 A1c4+6iqPHZjJW0zXOtiHS0TV+vlW37gAldPWA/ImTJljpZHvNLVI4Jpgs667xo6lH
	 s6PVRRtHGv1l2bngpH5Qr3X8nQbgInqUMxD3jS+U9DMtXvfp9N5u06k0wpc4ZwpDqE
	 BLC9iKNMcNuKGU5nfR/s2rAprUa7Wn4sKzQykkWjXuZcUwNPiZ4XW3I3VHby96bEtl
	 whB5SVnoVtD8+xHnOA63yI7RY2LpBw23xPm2x+Ixy/LtxcDvzhi8dEG4SBVU7s7JcT
	 EmlAuKIT3Mi6A==
Date: Tue, 28 Oct 2025 10:09:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
Message-ID: <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>

On Mon, Oct 27, 2025 at 11:28:03PM -0700, Yuanfang Zhang wrote:
> Add the following compatible strings to the bindings:
> - arm,coresight-cpu-funnel
> - arm,coresight-cpu-replicator
> - arm,coresight-cpu-tmc

We see that from the diff. Explain here the hardware instead.

> 
> Each requires 'power-domains' when used.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
>  .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
>  3 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> @@ -28,19 +28,32 @@ select:
>    properties:
>      compatible:
>        contains:
> -        const: arm,coresight-dynamic-funnel
> +        enum:
> +          - arm,coresight-dynamic-funnel
> +          - arm,coresight-cpu-funnel

Keep alphabetical sorting. We asked this multiple times already.

>    required:
>      - compatible
>  
>  allOf:
>    - $ref: /schemas/arm/primecell.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: arm,coresight-cpu-funnel
> +    then:
> +      required:
> +        - power-domains

Just move the allOf to the bottom like in example-schema.

> +
>  properties:
>    compatible:
> -    items:
> -      - const: arm,coresight-dynamic-funnel
> -      - const: arm,primecell
> -

Why do you remove this?

> +    oneOf:
> +      - items:
> +          - const: arm,coresight-dynamic-funnel
> +          - const: arm,primecell
> +      - items:
> +          - const: arm,coresight-cpu-funnel

Hm? Why do you need custom select if this is not primecell? And nothing
in commit msg explains why this is not primecell anymore.

You have entire commit msg to say something useful, WHY you are doing
this, WHY you are doing it DIFFERENTLY. Don't say what you did - that's
obvious, we are capable of reading diffs.

Best regards,
Krzysztof


