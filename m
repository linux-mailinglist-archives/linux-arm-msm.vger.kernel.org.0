Return-Path: <linux-arm-msm+bounces-63553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B69AF7CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509331CA1467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8141228CA3;
	Thu,  3 Jul 2025 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQokQwHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7822236E3;
	Thu,  3 Jul 2025 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557407; cv=none; b=mzvMSBUtlBztmPyO39JZ7P1/K7qvcKc6BoummRV9ZZQyLd3W8jaAEtJf75MObRywUkuhpUcuyCVWEj33L+v2lkw7ME0+Ru+kawOqkc578WCUyEfjQ545QsC0Oij/AXUUDCqqJsy9U2ZgN0iwYs1LhtuU/GpNBS1ENnpeTXFERj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557407; c=relaxed/simple;
	bh=KPNx93oq+EW5S/Omi2rpiF4iPr+uVFbJwi4esUMXMw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTRAlLMZkYAGYaDkkJ/a4idgCX55TdhlOtzkzfXXHnD1/VZPEVzyEI1FVs1yc6+rYmI7cyRJ9BvZeRAfB2I1OkTbFm5NyEO0FOHaOzywbwkAwZryzKj5KMYIYqUMpE/r5lKFwVHVZ3ewiSqJUJgyEnAwE/bBaTe71Ua/HKfgMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQokQwHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBCFC4CEE3;
	Thu,  3 Jul 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557407;
	bh=KPNx93oq+EW5S/Omi2rpiF4iPr+uVFbJwi4esUMXMw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQokQwHYANLecf4Ib1umWY+AGlxYxq08A9BPwAQDmyMGnOEUzkN/i53aQU3zQ84xb
	 qv5GXEFWKjqnfFKbc6ztk2zDSqi7lZANLS7jPwGPQ7+rtWKbR+Wd0l1zm3y7khDZze
	 R8gzRR/l97lxaGYKzf0GhHjeMyMzPgtW82oHPFRgWfPXvInAjWbGjbDOmWRqQnH+aU
	 dJH/jQOUVXgvC//Ma3uGHV68ZQB3kcxLNUX5wvX8fP89FPqOWoZ/aLZcb1p3K5X8Nn
	 Bs/xJLWmppAhz5Q4n/RAWKVvjM8hA1JUVLpI3DgLY3eVW7qAU+kOUdwTZqWqfKbs7j
	 yl0xlGnRr51KA==
Date: Thu, 3 Jul 2025 10:43:26 -0500
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <20250703154326.GA1674898-robh@kernel.org>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130453.4265-2-quic_jinlmao@quicinc.com>

On Thu, Jul 03, 2025 at 09:04:52PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml   | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml          | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-replicator.yaml      | 6 ++++++
>  .../bindings/arm/arm,coresight-static-funnel.yaml           | 6 ++++++
>  .../bindings/arm/arm,coresight-static-replicator.yaml       | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpda.yaml        | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
>  10 files changed, 60 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..5ca6d3d313a3 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -98,6 +98,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string

label already has a type. Drop.

> +    description:
> +      Define the label which can describe what kind of HW or system the
> +      coresight device belongs to.

'compatible' tells us 'what kind of HW'.

> +
>    arm,cti-ctm-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:

