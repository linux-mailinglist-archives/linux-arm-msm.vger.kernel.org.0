Return-Path: <linux-arm-msm+bounces-31275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7639715E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3C11C2286C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4B41B532F;
	Mon,  9 Sep 2024 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh/N/dL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176721B5304;
	Mon,  9 Sep 2024 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879601; cv=none; b=pRRC1tTEYHyF+KPFNObb1XlRj5+YEWuQhnEk65u9eBmDewCGY55EC0sVQqiOBidKk95CRdGrshkVWBG5P1pICtvXuthnyxvxNVRJ2tAuPgMeo7TQ61hZ4xhZLBUAPF8afCZXZySmVZc/dPKLMFS7GCiXgyihTLJSE45Ec38hBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879601; c=relaxed/simple;
	bh=EWYINoyvOmZV3vngLWCjzx70+tJ31VBKws1/aUb5gBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XI/bP32xQKHSUTryTHrg3wiGzA1ysz2tXM2tuGddUn2xmWArrtsGSU3OijDEuFk5yNIDHPf/nr51mUEgOTBH1VRiZby6Jv8kJk1+BgTyIESD0KXSxsjk4YahrDi1KVHwRr96y6tvbFsQsZquCW0xc8WusmzT1udRbTsQGBEeU6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh/N/dL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325ABC4CEC5;
	Mon,  9 Sep 2024 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879600;
	bh=EWYINoyvOmZV3vngLWCjzx70+tJ31VBKws1/aUb5gBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kh/N/dL/7Zx1GLljn4PvEDcam1FHKyCdU7VVKqAjt1vW61i5kRZvqQsKvhLNET50T
	 WzsXkaSOpKVHvrZa5HlVkPM/R89CXTXmCA0FhgMyJaiDtGzjWMcpccaQW6AQdIVr6y
	 eEcZOcUszAuS8zNOKb5g7NY5ppNwXP3iUnDcKy5z2eVqpyynQQgX6lzvyPAUAXTmbL
	 oKw1T3Dj6JHfhkIbjCjSuSbYpyJ/XiBOAXW4W6ivh/qDn7UYdy9MQpYxEGNFTsMQnw
	 Q1xJfGCE6Gsko2qLAKkCS//00fEClQRXoTzO3V9wHln2JbnXOfG476IL4IEDqDEBHS
	 oaaSHS3GybXvA==
Message-ID: <d98996d1-5c9e-4fff-994e-c09adee4b639@kernel.org>
Date: Mon, 9 Sep 2024 12:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sm8550: extend the register
 range for UFS ICE
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Gaurav Kashyap <quic_gaurkash@quicinc.com>
References: <20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org>
 <20240906-wrapped-keys-dts-v6-2-3f0287cf167e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240906-wrapped-keys-dts-v6-2-3f0287cf167e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.09.2024 7:56 PM, Bartosz Golaszewski wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
> Manager (HWKM) to securely manage storage keys. Enable using this
> hardware on sm8550.
> 
> This requires us to increase the register range: HWKM is an additional
> piece of hardware sitting alongside ICE, and extends the old ICE's
> register space.
> 
> NOTE: Although wrapped keys cannot be independently generated and
> tested on this platform using generate, prepare and import key calls,
> there are non-kernel paths to create wrapped keys, and still use the
> kernel to program them into ICE. Hence, enabling wrapped key support
> on sm8550 too.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 9dc0ee3eb98f..a000785f3915 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2076,7 +2076,8 @@ opp-300000000 {
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sm8550-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x10000>;

Same as p1

Konrad

