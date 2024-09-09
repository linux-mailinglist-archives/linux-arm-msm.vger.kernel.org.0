Return-Path: <linux-arm-msm+bounces-31274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794D9715E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AEC283A85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B171B530D;
	Mon,  9 Sep 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFS7h9fR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE81B250A;
	Mon,  9 Sep 2024 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879575; cv=none; b=Z4Q1Wt3WVDfVx7qtbO7LeneGRmOA2POGeS4M2xxs953bh0rmVPjuJAnQiLnxa/U8zHDzHIRx3qOMHFBDLzL4e1cGxcAUUwlIpxZi79bUL7CGiegS/ZV0I1H/0JpQTEqF8FWN/itzWn56DNp8nWWLesA17pbMN+xVrTHIQf/RvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879575; c=relaxed/simple;
	bh=8XQXWK0HfzqGtCmM0NNh3z8UfxNWWoHob7J/lVoRZCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJa9R8y3wfT3FQ1s3a0drqPMRAhRPRzHp4HgWBKfiEUEXwzZx2uWbzWYZJrfDsDqeQKALh3Z688VW/0Y0Ix+7ptT84orucDQwXs2XBfdsMzlTRUvdUmkK9dJRAsBoZJ8KxwYUQ2ghzaKZgAp4QaTiM4wUdbv4TINAsSMfHnQIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFS7h9fR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4A5C4CEC5;
	Mon,  9 Sep 2024 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879574;
	bh=8XQXWK0HfzqGtCmM0NNh3z8UfxNWWoHob7J/lVoRZCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFS7h9fRp8TOPR5GnYHWpbM8T5cjCRp6U68dZXHHeAteBgYHS2znuWFNIABgKnrw4
	 PXNPctq+8s7Uuyhm0dim1yciToykPpEV5RXae9fKfJM3/tLwEBBZZlc92LjIVr9HjY
	 /UNZHk8GYoM56pIdjQSoO6rluNSytwbfTQLemR4OtsN2sySWTey9CSJUJVHriTj8KN
	 toNn+Gbr7wwW9Jkr8WGrP2Kjo+VjUJDFnOzLCxpg9EbKrzeCatRLiWslM8Ks6ZPKit
	 TaRWPMM3l9iFsY2SM5/1O1qIPUC5Cr4+gY6/rPejNIi/WCudavZr6Hv6w9OlZEVc6i
	 RTwPpXGXPwGdA==
Message-ID: <486ec029-dc10-48bf-af8d-c0a8426d3247@kernel.org>
Date: Mon, 9 Sep 2024 12:59:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sm8650: extend the register
 range for UFS ICE
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Gaurav Kashyap <quic_gaurkash@quicinc.com>,
 Om Prakash Singh <quic_omprsing@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org>
 <20240906-wrapped-keys-dts-v6-1-3f0287cf167e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240906-wrapped-keys-dts-v6-1-3f0287cf167e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.09.2024 7:56 PM, Bartosz Golaszewski wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
> Manager (HWKM) to securely manage storage keys. Enable using this
> hardware on sm8650.
> 
> This requires us to increase the register range: HWKM is an additional
> piece of hardware sitting alongside ICE, and extends the old ICE's
> register space.
> 
> Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 01ac3769ffa6..54b119d6cf92 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2595,7 +2595,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sm8650-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x10000>;

I see mentions of this being a bit longer, any reasons not to stretch
it to full size?

Konrad

