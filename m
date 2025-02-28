Return-Path: <linux-arm-msm+bounces-49772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD73A48D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 01:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5AE03B7E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 00:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347EBDF42;
	Fri, 28 Feb 2025 00:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njLsup4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06036C2FD;
	Fri, 28 Feb 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702504; cv=none; b=mqXMjQECVim7G9q48gLjipmt8pfi2V/AiDJ5HSE5PrXmCHj1pA069ba8N0kdUxszyGQ9onkB+es5N8+TOIndyLEQrXDgCTrh5nEnLKyO4AeZxl4K0AjeIgeBgqFvodQmd03H6IBwIETPwPenZdnIPk8eswcvyUXIsHENqu5QQ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702504; c=relaxed/simple;
	bh=QdF1eUZ/9ENA3nm/mjiegy9H6xUu5+JWgG8YghGjdKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcmepFeg9QenkoAYBfgNdrjvL7f4pZ+eUGucy1JiGNXQfahznMCjUE6rB/qYur0rKaim6FHtuvpHBR1WvCIVASjga2PGownW5rhctoqkQHVs4wYtyQi6onXVpmzGXqPD5xO0vhOOBrCoEE0jLQ0ZCsFKRYSeB3G5M/qA4kDcPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njLsup4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DECC4CEE4;
	Fri, 28 Feb 2025 00:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740702503;
	bh=QdF1eUZ/9ENA3nm/mjiegy9H6xUu5+JWgG8YghGjdKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njLsup4r8Og9WGL08fP+iF0+4Q8txF42dYcDP5gaGMrLVwa+IhtGScKjc0WrqgtaF
	 1ZbKVSpsVrMaXqD6vpAODkfeRpZCkG7AQkcnbkRwwVNSGTJ5XVWp2/Wm5kygbn+anq
	 mmIcspH2CA3+BkQphIJL3nVN+m53J+1EheaKYsSKZbl0UIHwzY9iPXHgorWjAy5lNB
	 CWBmkDCAa9f3L7MenOY8VRUTp6jwgdqyybZMn3RcaCxswZWsmB8//kQoWez+2adzCN
	 OZ1tzTr8gtq9hV7EPkM83Gns8fpwtnyyWp+50DYVXtEIahKHEsnSl6Z9f+mAjDXZKq
	 xKks5FsiT1GdA==
Date: Thu, 27 Feb 2025 18:28:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: add QCrypto node
Message-ID: <vm3bmy7m3ouajawi4dhfi7ifbqio2j4xh74opc5zdcwxe4l77i@42bagwbh3b4m>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <20250227180817.3386795-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227180817.3386795-2-quic_yrangana@quicinc.com>

On Thu, Feb 27, 2025 at 11:38:17PM +0530, Yuvaraj Ranganathan wrote:
> The initial QCE node change is reverted by the following patch
> https://lore.kernel.org/all/20250128115333.95021-2-krzysztof.kozlowski@linaro.org/
> because of the build warning,
> 
>   qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> 1. ICE crypto node is not sorted and fix to sort it.
> 2. Add the QCE node back that fix the above warning.
> 

Please put that in two patches. Please also adjust the language as
requested in patch 1.

Thanks,
Bjorn

> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 13b1121cdf17..0ee0539a22e8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -785,6 +785,13 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,qcs8300-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>  			reg = <0x0 0x01dc4000 0x0 0x28000>;
> @@ -798,11 +805,16 @@ cryptobam: dma-controller@1dc4000 {
>  				 <&apps_smmu 0x481 0x00>;
>  		};
>  
> -		ice: crypto@1d88000 {
> -			compatible = "qcom,qcs8300-inline-crypto-engine",
> -				     "qcom,inline-crypto-engine";
> -			reg = <0x0 0x01d88000 0x0 0x18000>;
> -			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x480 0x00>,
> +				 <&apps_smmu 0x481 0x00>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
> -- 
> 2.34.1
> 

