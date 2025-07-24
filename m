Return-Path: <linux-arm-msm+bounces-66444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF06B10369
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9096AE18BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245FC274B5E;
	Thu, 24 Jul 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kee/8K20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B52274B38;
	Thu, 24 Jul 2025 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345265; cv=none; b=VkK5ZRX6Q7br2FYRH52p/JuGpIr5+s+P7/jpgcdgN3iBPDaquTS5POe8BWaiUn/JGsKC9xMW/ZNl1VU4DZTcPOG6RJdp2uj/yQYlj341ZoWkakUu+jgrYPFjasadf0jGbsE8cChZYps7HOti4OeDWU0+DVc/ca/RexGLvFZDlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345265; c=relaxed/simple;
	bh=U7RF3SdhySZA3ed/iA8u3Y4WkTs3IVBv6Wn0InNYTFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9XtrIKpPxRWWo2voetVaxq4oOhPi7pZNPQLAnGq24zVfhbXPMhVeTYjC7yfHkb94YV/y4N4yTk4L1iUKJpxlP9l08uexqzQvSrFK7yIUossiXqWRkgqCkQRsNE8L5bDXDDEvpJXkwMJ8+Hz4evqYHl9ZVvB9hbbybBcHTGwHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kee/8K20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2881FC4CEED;
	Thu, 24 Jul 2025 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753345264;
	bh=U7RF3SdhySZA3ed/iA8u3Y4WkTs3IVBv6Wn0InNYTFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kee/8K20y2oVRm2lwbOpjCrRGxzGrb8xrFnnXkk9DFRGt88+2RoBpwZeZmIxdW5Zm
	 MJBI7nb7Vex8GIe/ncNyLlmr3haY760YgKjXKjxlMj3KoZ2YRRxNCSIhtFBI5zxqP4
	 TV1AntMFyX+1UCuO55Vd5zNZDjqqO8T5h4eLBLuQFaOF+5TKWTcXWWNIl/lNle5BE8
	 R13lFMXoBjk71XLHA6+TdwMy5y5YS1F5oAK27voDqqTqAcqMGbPZiPwADaKlGHDV7N
	 ssv3e7oOtRzHg9QmcUy0o84g8j6Bn0Pr4vex75Z1Efq7HfHgOXaZYAupKPb0sGkgrT
	 +epB0gN90BDAw==
Date: Thu, 24 Jul 2025 10:21:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Message-ID: <20250724-serious-famous-python-e30a04@kuoka>
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-3-56c93b84c390@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723-topic-8750_gpucc-v2-3-56c93b84c390@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 10:38:50PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 63 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 4643705021c6ca095a16d8d7cc3adac920b21e82..ca0770a34bed64183185aedde04f1bb96eebfa91 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -3154,6 +3155,68 @@ tcsrcc: clock-controller@f204008 {
>  			#reset-cells = <1>;
>  		};
>  
> +		gxcc: clock-controller@3d64000 {

Not a clock controller based on properties below.

> +			compatible = "qcom,sm8750-gxcc";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +			#power-domain-cells = <1>;
> +		};

Best regards,
Krzysztof


