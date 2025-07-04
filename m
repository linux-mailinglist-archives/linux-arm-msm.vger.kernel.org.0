Return-Path: <linux-arm-msm+bounces-63722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40499AF96F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C155A2695
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2BB2D46A3;
	Fri,  4 Jul 2025 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2iLyecg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D36156677
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643461; cv=none; b=Z2irVNG08tyTY3E5x0utoQ47qiVU5RC/o02rVTy6x1j3IzzLLnUHvSeOZdcskiZb61OYIWJyx04iEL8SQrRe+bry8y0ohba9BYwSDuiFNrhnQpBHSyYTf+BXRBs6szxFhpNxkxlanzAJu1ujkLz0VxrAVU7go5U1874C07v1LCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643461; c=relaxed/simple;
	bh=nMUwUQvpw8YaloECKT7I6pAgLXmQeXqRvqFH/BN0VR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXbxARSTTLVPKWEknc8HhhBC84QmZHA0A83bJQwN/R0TUx2z2+jXr7tde1JrIehwP7gyYG5mV+G7BkgB0yo1E3VBMNm7x5MChDqvXrpbgs3x+4JyWJSKhPQBqxhPVyST15qsyAPeQ2tDtjec+E6wNCukcFPx9DuvNp1o0eDImp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2iLyecg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so465550f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643457; x=1752248257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4vHSbtWGZygYaRzsrpR/TDlNvjSrpMlfZbiVgpj+GA=;
        b=N2iLyecgzhJET466YfbKN+tbe28nj5TdEMz0iYFCAJYsrFUc+xw5lKK812NkcVMgEv
         ppAM0IaCrZ8XAkZgY2zpe36EdVzWQ4gKZvzhaI/J8JOZLMD21Dn7u9SqmtBKn7/vZYFd
         eymYDwwxbyFcNsmAYagnr2SoVAUT6cfc6ZNy/8P9pX1WrwSPrV2WF/Y9LTDJsD9lW4UC
         xxtcHuEPGqhKIRwknGMrFpTUdjYadUDhz6QZU1r6/5IshlsQRWr/DS0diK0SgL5JSN6Q
         vtwAob6M5RMrwjtZUrgcAzLoPKlX1kB8F/rO+iiSyBTZ7jL93cNgr1uHSrOl7jHAW5aj
         IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643457; x=1752248257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4vHSbtWGZygYaRzsrpR/TDlNvjSrpMlfZbiVgpj+GA=;
        b=j5NJIQacOToIoJhFvcA4kWXBhIRwV1ocgnPAi1wWqaiiPY3rgvvzknXCz2ee1ENpCL
         elPlV6Fi7L5Fx8FZaSetstocnxWEw0a8l54phkDKFuJ7NTSKY3sXRTk5cXZ2J5DMLZwR
         SyQQXDDj+G2l0GiJqB5JC7EmAa3Q3O7U0nfbq/EWp8NI6BkrxigXrpApFvZZDK2JDfDg
         8/i2qcc4drkOkLvi6o+9h38KgwlbK8jI6FOifEMRFGAFNxt/W2heucD6CAKyYpd3kKs8
         ex3kcLl2iI5hqyNlF3wkgdGufLZTM4GGZE6yN5TVmhoVBXlYsGDeaY2Z13tSfn5UMOfw
         RqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB2jtiEctnj3OKr9RAZt76AwTOSqaZzsW2NdK6jThl+s6RG10KEIIZ1eEqTQMajMPFZCyzWoF46Jno7tHP@vger.kernel.org
X-Gm-Message-State: AOJu0YxuoUBMWAAolJPeqKnGORMNi7y8HGaowUBzfm1Za48OARGSYHiP
	e2ILYfetdbPtipULvm8cbQSbX4OlJ6Lb1NliHKIn8VA905hce0hv7WINfRKqiAB6pE8=
X-Gm-Gg: ASbGncvcxhLcwFzc9HcE5rby3zQ8cCRRsOcj9mlvlkTRZ15iyzQeY7RhuFXrVydzXpA
	cu4PRHs2s0GKI8VpUTUl43y+gO1/tFKpnFybGEtAT1nJY7DUb82vulI2TDvHLFIDxzKOVLDwtOj
	G2uthVtJoKxp+6Q6o8XQ7Q0O+GnbXskpv4w4NhruWbjimDMJKKiwskDOtthIJxceRpejVS94/C9
	nwqxho0eWyDihGP2FF1FYP9lyKEr5o5z3Z0tFHuXp+zv/Fno4LKokNgMF0JLbSfZyngfE5x415s
	XgX6lscT6qWUQ81z+LbsLmXxnNjfJaROvAL3GlFE6EEnsSRj5va10MQLfdGmBdFGB25c1Xcc4/P
	ilTaz2f8sa2DiSwA+XjnmMll26bfH
X-Google-Smtp-Source: AGHT+IFhUkHnFrfbIeRzLcPeKFu2lnHSq4lMxRS57J9vUC96pAccxTa3B3IG8HOVaY9CGSpbxOA07w==
X-Received: by 2002:a05:6000:4387:b0:3a4:cfbf:51a0 with SMTP id ffacd0b85a97d-3b4964f1f76mr2566213f8f.21.1751643457080;
        Fri, 04 Jul 2025 08:37:37 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b1ecsm58921595e9.11.2025.07.04.08.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:37:36 -0700 (PDT)
Message-ID: <c0e03c16-ab33-442a-b73d-1b231b6d141b@linaro.org>
Date: Fri, 4 Jul 2025 16:37:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add videocc
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
> provides the needed clocks/power domains for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..890eaaa40184a18bff54f2d750968112a2546d19 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5171,6 +5172,20 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,x1e80100-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_QMIP_VIDEO_VCODEC_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

