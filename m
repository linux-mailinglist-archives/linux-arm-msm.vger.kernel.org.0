Return-Path: <linux-arm-msm+bounces-75377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA05BA5DFC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 12:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34F992A704E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 10:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAAE2DAFC3;
	Sat, 27 Sep 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJtfeXqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32015B971;
	Sat, 27 Sep 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970373; cv=none; b=bHLq6X5l2q1MwXuwQblqIc3WXJ8PA8kSglGuJ7QbCBHuS5rZniPUNKRIirPwWaHUh9yPnSI2adcvy49d+JZOSs9mL+c9X1xaI3IaA4qrKWx+Mt+Zrh7IUetvQ+IGCH7M9uV23RYy+4VxMib34TRpPnqdygohAu22hQqvhcrv8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970373; c=relaxed/simple;
	bh=5vJ79PqLSk1W3ySPx3aEhtMSl07Usjxr4YYanamg+qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JapdIcYjDdcHdkQ7mevauGmmpRltEeXg+ChufqX8xli7poJcoYiLzZcD2BfjG9BtjsjciMuA/9/z6M4qXZnG5r90xkViifvj9wwVh3bJBOwbu3MP6IEtInNhgXqsEHd1dupzYuKmsKI1cFPqFIrrdvqdD31tMmh9WqD5aZxB8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJtfeXqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB713C4CEE7;
	Sat, 27 Sep 2025 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758970373;
	bh=5vJ79PqLSk1W3ySPx3aEhtMSl07Usjxr4YYanamg+qI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KJtfeXqfLaEcUKsaryDmNzD7+ylJeOzAp9i7oCbXn83M1o2ir4TqQmmmGZSeXRync
	 edNho+p6GK7QNWXEDkkWn0ElVK+6FUMGhlBK8XQfUq2ol13Cx3NhlNNnyMKKVa3BrR
	 9PwF7JmU9QFUbdWA06l2bhe79mipvlFUiXYvk4KzRtgVrq1ncQgIF2A5eRZH2m4eUm
	 0UgM47PYtfwqHEryiyxkSa1DYMIBozCfM8P5Vmfk2liWHUar4Hn41APmgDTniVOsY1
	 PPm13BZVMjOdt1z/UwAMsFzyQ0cdqvg82Z8nxx6hQ2wrZa9YYKvFPfl5V/WI3oEpJF
	 uwI+BA6yJsH5w==
Message-ID: <0f1b82e2-208d-44d1-8e3a-08b2821a297d@kernel.org>
Date: Sat, 27 Sep 2025 11:52:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
 <20250926-topic-hamoa_gcc_usb4-v1-3-25cad1700829@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-3-25cad1700829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 13:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With the recent dt-bindings update, the missing USB4 clocks have been
> added.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.

Small nit, "expected number" would be better.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 51576d9c935decbc61a8e4200de83e739f7da814..cc76b9933a9bbff396ec4739f4a1dd3d2cc81f0f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -807,7 +807,34 @@ gcc: clock-controller@100000 {
>   				 <0>,
>   				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>   				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> -				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> +				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
>   
>   			power-domains = <&rpmhpd RPMHPD_CX>;
>   			#clock-cells = <1>;
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

