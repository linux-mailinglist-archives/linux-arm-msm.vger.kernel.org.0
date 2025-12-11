Return-Path: <linux-arm-msm+bounces-85055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 443EDCB60B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D722301635C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7567F2DFA4A;
	Thu, 11 Dec 2025 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icLVHvhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471122068A;
	Thu, 11 Dec 2025 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460248; cv=none; b=jx9KJ2ehF1UAmpo7eR6Jlqd4vReFzFErq+c4qdmBF1WcLvQl2WkyRRSfIeVr5IDwLSyE4dBEu0SVVYdxCrKXZCxfhQoFygi4B+SSIvM8lTivGQ5IK0mpWlWE5w9EraeUHzgaNtt2zACiOlJkNQrHDkmHpjvAbchPFpSg4nXuIzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460248; c=relaxed/simple;
	bh=WicvLgJ3zuOHsq7pRChjkMd+4DZttyIDawUvyHdiB+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfuqkjbzVOZXg/BKlDuvTuegulUgzagGGfpxlQWF0m/bIgBYO9+cixtvSpxrp7idUv2wQ90nZky9HW4impMPdBQ06FGe3jsIywLa6I+p1YAz202hY3BvauvkmfwB5fvXFkkadm9eTH5o33Qt+qxfWw445X3Ix6xkWcZ75ZBBeyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icLVHvhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FABC4CEF7;
	Thu, 11 Dec 2025 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765460247;
	bh=WicvLgJ3zuOHsq7pRChjkMd+4DZttyIDawUvyHdiB+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icLVHvhveGjgL/AF+ZDXAvLRE8E0BweFDHOpx+aXZn3K27vq4fV+8tPoC8/YcEhyi
	 3XWVoVhdLFKmWJpdhTsOKi836DnzyPFTBINrt5ymDKRVNVwylFhnYHiY1b0jm2w7NE
	 etFJIoZSFKWhByJVWnj9c/4qrHjTm6K3t3caEeoKPtjMyhNZO9M81cB2Bw4BR0fnvj
	 FtfshZjXS23Kop5lZOBRKUcYMNu6B2NhWJC3YVijclZ3JvtXlx3OLk4enmSaxBJl3i
	 lKcsAPNK8M0ML8vdCI2KgITYKTUsLCCMBAHzfnP2j8zbkcE06yIaX+3AFXqvJM4ZyC
	 H8zZZZIkACCcw==
Date: Thu, 11 Dec 2025 07:37:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Message-ID: <20251211133723.GA859302-robh@kernel.org>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..90f88cc6cd3e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>      items:
>        - const: apb
>  
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for the first etr device
> +      - description: Byte cntr interrupt for the second etr device
> +
> +  interrupt-names:
> +    items:
> +      - const: etrirq0
> +      - const: etrirq1

Names are kind of pointless when it is just foo<index>.

> +
>    label:
>      description:
>        Description of a coresight device.
> @@ -60,6 +70,8 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      ctcu@1001000 {
>          compatible = "qcom,sa8775p-ctcu";
>          reg = <0x1001000 0x1000>;
> @@ -67,6 +79,11 @@ examples:
>          clocks = <&aoss_qmp>;
>          clock-names = "apb";
>  
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etrirq0",
> +                          "etrirq1;
> +
>          in-ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> 
> -- 
> 2.34.1
> 

