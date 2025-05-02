Return-Path: <linux-arm-msm+bounces-56520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF13AA74BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF463AD3C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB69225417;
	Fri,  2 May 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6k+0ekJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A3F9E6;
	Fri,  2 May 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195453; cv=none; b=cavCfAJT0Zr3GmG+nJmGLsxW49dKmSA/O48/RxVLl0RwYhpFiYjyzTLP7+gudFhX435cY0Nv1rGhD/tfpPyjqSxWhgjpdP+C1ABK5u6rAgf7eHpaMNbhNaQY7xjWnDxZ5sbuprTXezqxKVUcjcMdG4KraYAXrnMJ6pK5Fcwu1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195453; c=relaxed/simple;
	bh=2N8TEGsiMLtjUetJc49vJ9WjD1CCLSGeFZZkcJ6kGII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8nA0oq4F4Ee269Wp9wlTKiP+SpiXxN3wp2X1mS57Ppfv0CFF04Ix4jqzoHqZo7ZUNhvb6bQd1p/e0ZixYgwrIv6WllHgQratAukTrxWbXjNZmiHdOeneEx5JG4BiHfqx5QHc7WSjhnD4cTFRVOav88Dwt/jnuLzMuK9hiVq7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6k+0ekJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F615C4CEE4;
	Fri,  2 May 2025 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746195452;
	bh=2N8TEGsiMLtjUetJc49vJ9WjD1CCLSGeFZZkcJ6kGII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6k+0ekJL9QRE4ELBOS5da/qeX6ubfL2owHdpi9KkWe5nAPf3l8ztARELEwyIG9+Z
	 uUypwPuSYv2sYRqdH7b/AWiAwI+L17wsCYCuv6IVsZCD8h4+4HtntekG2yuhVXwn6E
	 DP8/Dk4ko3neerJHTyWrHeMbV1SMirN2CEHPmUYpb4EVwAMsWlzPOPE2eSZRB+6tAR
	 kumPNt8fyFuuCPQUpf0bW/Ah0YzoKgSRwPp3KzwarBYvUdrmZ8TdR2mVasHUkLoH4s
	 RsBKIIxOV6nJUdfZf3KLKTPopo/Qa4rD+f3HDiUh6NWR0D2FmhtB9cq9PQ5yohxmTA
	 +tfnjOeaUZtvQ==
Date: Fri, 2 May 2025 09:17:30 -0500
From: Rob Herring <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
Message-ID: <20250502141730.GA1259057-robh@kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>

On Fri, May 02, 2025 at 02:15:43PM +0400, George Moussalem wrote:
> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
> ethernet (50Mhz) clocks.
> 
> Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
> first in IPQ5018. Hence, add optional phandle to TCSR register space
> and offset to do so.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
>  include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..25006d65d30e20ef8e1f43537bcf3dca65bae73d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -24,12 +24,10 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq5018-cmn-pll
>        - qcom,ipq5424-cmn-pll
>        - qcom,ipq9574-cmn-pll
>  
> -  reg:
> -    maxItems: 1
> -
>    clocks:
>      items:
>        - description: The reference clock. The supported clock rates include
> @@ -50,6 +48,13 @@ properties:
>    "#clock-cells":
>      const: 1
>  
> +  qcom,cmn-pll-eth-enable:
> +    description: Register in TCSR to enable CMN PLL to ethernet
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +        - description: phandle of TCSR syscon
> +        - description: offset of TCSR register to enable CMN PLL to ethernet

items:
  - items:
      - description: phandle of TCSR syscon
      - description: offset of TCSR register to enable CMN PLL to ethernet


