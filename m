Return-Path: <linux-arm-msm+bounces-49771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B233CA48D37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 01:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D2DA1890DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 00:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25149DDD3;
	Fri, 28 Feb 2025 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXKUfYbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974DA934;
	Fri, 28 Feb 2025 00:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702407; cv=none; b=gdosJcN6WTYgN4zFXiB3NuG8442p/mDC5xQCIOMAjEjunDfHgCy/hlSBK6nw/iWzeT636NsomEx0a38/6MC7C2MPGFPt1ETSvR04yroUSR1Gsc98vnOMXz+Q+Jq9CNOmLdyyzeM1p0w3IsGF7RtoU2v+xKGVxD3lDyIFrK7J4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702407; c=relaxed/simple;
	bh=b52fyAXulgYPgaXAdn+6P89qxSKuyBlkfSkjks/g4Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pufWZOVR0lf8yFWq3M1bJRJXNCmz4vizvqaMosruQm6oHwU9CNQKnRdaBC6Q2icAVnEx1VcPrczrLBOVkdKljpy3yje8qoiyBsoCd+3jF1EbkbKm46xnR7+eEKyuhxvCEW0ad3pwEBxx4yZe05smfhQC/arcmt7Qlhm/IVJU1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXKUfYbN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3451C4CEEF;
	Fri, 28 Feb 2025 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740702405;
	bh=b52fyAXulgYPgaXAdn+6P89qxSKuyBlkfSkjks/g4Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXKUfYbNAEqq/uFuilMHgi+D/nKC70+eFpKPV7Tn2Q3fCcMLm/BwkMV3kX/j6ZFr7
	 2VOyAetxygCZ56XEiOHOtbEQnIi9ThOSdLYjKHTOtO6x75QBDLy1cPs5AS5Usp+E7T
	 vTHO/efLyillS4TuEd85Zvhy/n9LWQJyRLSkz8W56sN/3hrSKrdZEukvDlSS7dt8Vz
	 QAsD8qMchnOsRFLETIqPF2Vihgho2up5pM/DdsvYn27LaBmFopG/lNZyCy3PILEwWa
	 oxQZPPQUNLnlM+KVSNY2KAHgPqIpA0Pz448mbrmdZD3BxQ8vQbzu4fFdQuW4F6bcXi
	 eegAVHYl56lVw==
Date: Thu, 27 Feb 2025 18:26:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Message-ID: <2mlmhzllhb5fhcbwtupy2nk74my5hruliayyr3kayrjvmtou25@em5encygrn2i>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227180817.3386795-1-quic_yrangana@quicinc.com>

On Thu, Feb 27, 2025 at 11:38:16PM +0530, Yuvaraj Ranganathan wrote:
> The initial QCE node change is reverted by the following patch 

s/is/was/

> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> because of the build warning,
> 
>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> Add the QCE node back that fix the warnings.
> 

Are you saying that adding this node back will fix the warning?

I'd expect that you would say something like "The changes to the
Devicetree binding has accepted, so add the node back".

Regards,
Bjorn

> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 23049cc58896..b0d77b109305 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
>  				 <&apps_smmu 0x481 0x00>;
>  		};
>  
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x480 0x00>,
> +				 <&apps_smmu 0x481 0x00>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
> +					 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "memory";
> +		};
> +
>  		stm: stm@4002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0x0 0x4002000 0x0 0x1000>,
> -- 
> 2.34.1
> 

