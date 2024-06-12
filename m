Return-Path: <linux-arm-msm+bounces-22523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BF905D96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 23:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669A41F22641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 21:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EC085923;
	Wed, 12 Jun 2024 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACnKSU4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE1175A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718227393; cv=none; b=f1G4fUzmXBR31R4f7MvL5v7YGiql1xU3GhJG1JOntx4HBgNdC0wxbq632jCsXAjPafbJl8ihSlZAJhOq+eGQ4MPfJrZ3aVv43o/biVN8QXHZlWAVx/RAsoFj/li+ItdjC2fixDa7AXQ66Cc/uVkWFUuDZhCfdvNu+zlrJ3/4S0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718227393; c=relaxed/simple;
	bh=2T6gZ7EEse7y1Sv1WZ9KMDR0fG0OjHjw17gxaTFfib0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2V9w/fs6pmw51NKy4HjZQnheEdj89NayMuqoD0duQ7Vy+f4dzld+0ykzeZxI88GVOixEVjlaV4kldHessITaLk3koUrEXn3g5PmMHe/vpvgW/izf4gTqfjVBCnWpszGdSryj9oConbZX3ntFBA1gNSDvzy7v3jYVhMpf9M1y/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACnKSU4q; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-52c8432e241so52924e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718227389; x=1718832189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jowrInf5O80KtTvVyPQmOW7J8r+ZDPgzfIXrxnvdHXo=;
        b=ACnKSU4q0Bk1sEugeLy4W8opJ/VxcqkOXnoCLdF8Yi3lKfLUhv/gxp+Ilvx6yBegsd
         1Ek2fOcqB0B0Nd+aQi1Tm/mhQTCO0HEtjjaHo+BmRFRj7xJmfjyj8VbvjQ6TC9FvPUl9
         wcpzxkMqzxEGKQkR267YK6SJ0eyBJbsVVmfq4GK7cBICMKxuGrkk4lFHfPC39t4TLAaM
         otjV8PUQHLpB1+BIMTOY7coszja6qiJY72zr23uE2yeyKrRPe9HvOqMie3+l8EG8P4KP
         BIYlUx8ci1T2blQNc58PervEBlXrj2fg3t2RUQvqRy/wrFaP2Tkf9edkGLU9lq8sEh+Y
         wKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718227389; x=1718832189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jowrInf5O80KtTvVyPQmOW7J8r+ZDPgzfIXrxnvdHXo=;
        b=QXa/YaVm20XKZAx/Vbnr+I73WrOpBF01gztUp/gr+ZxwAGPPdFkcPTobXBV/cL93mg
         Dt20Qd+M4wde0qaOKDBMZ4UbIKHO5r2KWvgbqAhR9r/4iY+tvoogmeIYCH5ohlopwUV6
         uF3Ip4X6beV8lDHWoJ1MTdDE0CNDeP5SNi/A14Wc8VOBcBf1Us+U9Z0lQvybWdG822ly
         zogvRPkXtBWqeg8aJj5/MGDzo6TaWqTtbYLghon5C5Sl8Vv3315shn5VD7x2drfEwsid
         Bz9zF67NpS2aem1EAbQCkbFrO62XAqHapDqvEZNzsyShuOQbMwEN+VUM5F8xtgVmnnpS
         w91A==
X-Gm-Message-State: AOJu0YxxwXD71r7zvYP+/knUXb+N686+rLcv7Zr7OijZUdGDkYmIUbTd
	kQDVtBmoYuLGVsTkTJJOAFlXRdpRCpVxWmur2xH6B2elP0fvKN2Iwb80juSGfxY=
X-Google-Smtp-Source: AGHT+IHkk2lAXNm9+BSIbdQPTDnRwExlmJx8FGNX6T88IDk+5uIBJ09Vd4kpOGd505sPIGXbtc1bfA==
X-Received: by 2002:a05:6512:3288:b0:52b:bde6:2dba with SMTP id 2adb3069b0e04-52c9a42b427mr1788782e87.6.1718227389131;
        Wed, 12 Jun 2024 14:23:09 -0700 (PDT)
Received: from [192.168.1.3] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c9daaf31fsm349089e87.104.2024.06.12.14.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 14:23:08 -0700 (PDT)
Message-ID: <0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org>
Date: Thu, 13 Jun 2024 00:22:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240602114439.1611-9-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagadeesh.

On 6/2/24 14:44, Jagadeesh Kona wrote:
> Add device nodes for video and camera clock controllers on Qualcomm
> SM8650 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 336c54242778..d964762b0532 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4,10 +4,12 @@
>    */
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8650-camcc.h>
>   #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
>   #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>   #include <dt-bindings/clock/qcom,sm8650-gpucc.h>
>   #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
> +#include <dt-bindings/clock/qcom,sm8650-videocc.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/firmware/qcom,scm.h>
>   #include <dt-bindings/gpio/gpio.h>
> @@ -3315,6 +3317,30 @@ opp-202000000 {
>   			};
>   		};
>   
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm8650-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8650-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>;

When you test the change on a particular board, do you get here any build
time warning messages like this one?

   clock-controller@ade0000: 'required-opps' is a required property
	  from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#

I believe it's a valid warning, which has to be fixes, and as it says it
corresponds to the required property exactly.

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,sm8650-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;

--
Best wishes,
Vladimir

