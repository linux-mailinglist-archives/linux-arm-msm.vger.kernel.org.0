Return-Path: <linux-arm-msm+bounces-49714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3EA4828F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA473A3276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3087725EF95;
	Thu, 27 Feb 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUFP87Dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8422356D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669100; cv=none; b=Ef4q30gReEl7RDcMZy23+Vu1N6gAzjfFTvMqGIz+bLJNfziusf1qnF7sAZbGTkOfvJjFTRsMhLXjGVzpuw6d363DU6f49wQ/ib5Rm3Ib90X7OpZi/ll6j4ttvOvuP++R7ixruhOiszwwXqledmGkb9YIGNxD+ZDep/iz+50kh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669100; c=relaxed/simple;
	bh=44BNYiLW2yCxONzcBxyBR7IADrkxuDTkruh9GOEQ0ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTgTvGX+v7tut3eWuLMLkvZEHBHmfXdVe82rYJNcV1GxjXpr6MMcBur8znxeN6+f8EYunoWVYjqdwO0NZD1qrhy//Fsz5EuXxrpJHqRgIIf1NKk/r5rz92bUwD6qddNig6p4T5/ruKNsX0hjvK0znlQuB6XVng0xHBCuJdJ1Bz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUFP87Dt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-547bcef2f96so1085284e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740669096; x=1741273896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+t6Tt0jg0KxPZB1LakHJIKAhXRLp/GXu0dW03Mj8Cwo=;
        b=HUFP87DtG5S7EZtQzX8Cjegv3hPOwOBNRbcQQTozETOtBvwfTBbp1o5uOjlJhrxoip
         +jY9VjlDCXKeEGWRl71rQW8OsmpyEpQ/hBA7JefYCsXQiGXyb9RvfOBcEBTxWj6AExKD
         MOCl17/0YxbPFVxlfPWIDHL+DReP0U3wYrGspRDzel5DBLuKowBxx7xwE1gQEUVXrtyl
         /7ikhJC4gOpvE6Ieg12l+nd6f8xHHyRyVoWoJK9u2iCAT0+L8vNL6OeSiDzFkj2ngkEI
         8HZuFxwWx9P/ewIdlGhABDABc9RXnVcemAtNep2aNuX+5YO+HgzS5cUI18iKMWW3lZWn
         CzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740669096; x=1741273896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t6Tt0jg0KxPZB1LakHJIKAhXRLp/GXu0dW03Mj8Cwo=;
        b=PHCIIpOJanrZcSKG7jRBhM6eniPJLG3xAEArkXP8ZcjFu2cqK4cqkMPgjCmdCqnu2l
         45RCFGAl2UiH8icWZ7UPOBQrpWaGaz2rbA/DHLRGyYhEWZkKA3jPPQQgeq1b1N3Qx39v
         vQSSOSWxc09IjqygAU90zJZfKLCX2WFYFXBg/OPH3Qat3oMQnTSiH1aq/QyE22q5fjp8
         58s/pIcTr1Ns7iLS7SwvzeSY1nToR8qb7vMVO5zGD3RZRO9Np7T+tGSyksc+dDRM7cAU
         I8on/7C0xilCb65oRqrWfu+klfkldWFxRImKCubwHEH/W4xrYDQbhNqw9PosVQVAYQXZ
         am0A==
X-Forwarded-Encrypted: i=1; AJvYcCULfAPhvcuYp2qWS1GmkLdO9t24vhg3SzQFXywZR0CsLmWFbvkxGuzP94IFgdQG6MlcexQWX2Hbwmqe/wcB@vger.kernel.org
X-Gm-Message-State: AOJu0YyqBN0Ykh5Gd26tdj6eSI4Tj/xkO2R8O7c8LkuLB3ddLFBX9rz+
	0ws3ShCJw6tB/INnAceIlHovVV4UwRO2FipLHBeSp+BQbBtLbgNG/VpYYEhpIus=
X-Gm-Gg: ASbGncueap07SV6RVZXpM8mbcIVaaLuOUQscPcok1xwJWRbyssRU4I8D4w/kNywiciN
	0bSif24FYuoy4irNZ/n6/q9VB0a+RyHTX44ApDnhJPylUDttq/OFljNYSHb96LuiqTjCHV3rcJa
	h5kj7e7oQdjoqR0Tq/aUisF9QQw3ED8FEzr4RFMspFtG/YVQKSP3MffLfJ0eBgqtVYY0NZHNsyt
	Bi9Eq6K11vVlApQX19qZUW8nO7Y3bUf9aKULiEv7/2jC2zvHfNNn+iMa8tPYms6z3YtOojt0WSA
	hsp4Xbt9fJ8/W+F2D7dW3veGmdP5xJkG4MSb4AVoOdU019uWW5s5pwNt6gtcwzsqfdCUfFE9f+s
	moo6HNA==
X-Google-Smtp-Source: AGHT+IGgnwEjREgD/grYv1CY7G2mqND2p+JVQ6PM1HUjMevqU6xFcdofK3dLNsfRSqBL6gSR90jkvw==
X-Received: by 2002:a05:6512:6ce:b0:545:441:52d2 with SMTP id 2adb3069b0e04-54838ef4c73mr13673229e87.23.1740669096378;
        Thu, 27 Feb 2025 07:11:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417a491sm182907e87.78.2025.02.27.07.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:11:35 -0800 (PST)
Date: Thu, 27 Feb 2025 17:11:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8650: switch to
 interrupt-cells 4 to add PPI partitions
Message-ID: <fdlsw6mctzfutashmlve7eubgbx6nfzwsft2mnslmgsdrrwuve@pudlwja2y6g5>
References: <20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org>
 <20250227-topic-sm8650-pmu-ppi-partition-v2-1-b93006a65037@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-topic-sm8650-pmu-ppi-partition-v2-1-b93006a65037@linaro.org>

On Thu, Feb 27, 2025 at 10:04:39AM +0100, Neil Armstrong wrote:
> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
> partition map phandle as the 4th cell value for GIC_PPI interrupts.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 542 +++++++++++++++++------------------
>  1 file changed, 271 insertions(+), 271 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index de960bcaf3ccf6e2be47bf63a02effbfb75241bf..273170a2e9499b900b3348307f13c9bc1a9a7345 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -1417,17 +1417,17 @@ opp-3302400000 {
>  
>  	pmu-a520 {
>  		compatible = "arm,cortex-a520-pmu";
> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;

Why are you changing the interrupt type? Should that be coming as a part
of the next patch?

>  	};
>  
>  	pmu-a720 {
>  		compatible = "arm,cortex-a720-pmu";
> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
>  	};
>  
>  	pmu-x4 {
>  		compatible = "arm,cortex-x4-pmu";
> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
>  	};
>  
>  	psci {

-- 
With best wishes
Dmitry

