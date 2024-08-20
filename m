Return-Path: <linux-arm-msm+bounces-29074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2906958208
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BC01F219AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9625918C33C;
	Tue, 20 Aug 2024 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCQdgS3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90718C004
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145819; cv=none; b=chB3c4CtduASJZ9+Zl2wIa3EfUdeaSjo4FTLE2s4PdmJbbcKGTs9vl4lahJq/oDecP0sVhtAENFp332WUCeYk3mw7Rf2UyBQnleSkVd/J2WOzd6oyL7pMxbjn5Az1aF9rhlEE3QiYj1GOcrooRzeP6/OJOnqO/UbBreMbJK59h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145819; c=relaxed/simple;
	bh=xDllrtn/qD4DkixdUPPvZUy37jpiMK+61GEL0PlGQfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ECHPWhUVHYVY+Sstj3737cEzetQ/gvSHx6xIIhYDSvqcJBWljgVZ31ZPy4NQUw5lvywjfSAl+gfAMyrLGCWi3c4ycEXk3Y9+SCBHRg02eATb0ZNrDrQmZ0bGiE35ZKOR2FZ4uPA55/yosxgi/dBomUpEZGQms8R7kLx/QOpZGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCQdgS3p; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53341decf9aso22918e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724145816; x=1724750616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdqVMnwAacQ74gXBl8dr3ho20uzyST6Z+0PRXKoicpg=;
        b=DCQdgS3pGgZ5KX8+z5lK3y0XHT31HpPfQO/fZ7xyJ5ZhVbh4vk4BFkp0smsyKzkHkX
         LHTBDth45E3jTFAfuk/ZPBXiXrIfRVSaKcQNBb/CdFvw8GIc1ymD6J8GWwjHqzhtMutb
         SS+LkQdtrXNBqOEmhCzTv/9FBMweJNxopUzfUiou7rljTfE4doDlfraVs2zwdguJBR7Q
         5fP1/cE9zru0KseDE8Y4gYvOJo8p3DgksI1swG3h+Xa2Lq28ahwbVTqMQE/7FYmchPgM
         GgH56WxFCt9oopq57/Y5ANDij0ZhvxU3OFuJrboil9qcXPlA4zdHsKcpKX+waQ/Xp2T8
         RXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724145816; x=1724750616;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdqVMnwAacQ74gXBl8dr3ho20uzyST6Z+0PRXKoicpg=;
        b=u4jQf6tc8YejYQpDvusIDRu+k+rp8VmXpFaakuqL4b3X2UdZj5Yd3QsWWp6CgsWdf8
         vRmhjw3dxgwk75nY34njnGwRlj4cChcjy+gblx8JjlST4d+/ITE3GdO6+bUhFLda/JJl
         t+pwJEAZMr/3teDUwlH6HrrAc5gcfKvoGP8F8ayPVRikkpBsh5iTrozEODTbn70LWcoh
         2csTintQBRR90SQ6kq2DP8CA/FQjyLThwMe424vq7iBZX/pHqlTenReJuyB8Pi8+tOlt
         hsOtDVCdrVT2woz5n7LUxardYJnrKalcnmAUP18l1sQDz40Boq0jdCWhW0X5lOv4XboH
         epWw==
X-Forwarded-Encrypted: i=1; AJvYcCUfHGJi+0/SPra2O2F8/HHWqc7zHdY4WbO8b8wsbkLN2Y3OaXS6FloM1OEtnhjLjvq4mm1CDi1KQRPz40wN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmvvril9LNPzkdV0s8yBokym/TXKaLLF6vmIL+0P2vd2+/82IN
	sZ+qgc51ZoZhqKs2FP4WNF1a4AwwJDp1kJcmApKcrkjEdz7U+yN+cURgUTJ4aec=
X-Google-Smtp-Source: AGHT+IGRNq4KbIGiGU/JcAnL4FPrWK4QB3N2L+snibGDdv62nJxWztlJa8W/bj8PHOkWKrn8AOaR6w==
X-Received: by 2002:a05:6512:1081:b0:530:e0fd:4a92 with SMTP id 2adb3069b0e04-5331c618ffemr5308462e87.0.1724145815612;
        Tue, 20 Aug 2024 02:23:35 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d424d6csm1709160e87.267.2024.08.20.02.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:23:35 -0700 (PDT)
Message-ID: <7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org>
Date: Tue, 20 Aug 2024 12:23:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm670: add camcc
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-11-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240819221051.31489-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 01:10, Richard Acayan wrote:
> The camera clock controller on SDM670 controls the clocks that drive the
> camera subsystem. The clocks are the same as on SDM845. Add the camera
> clock controller for SDM670.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 187c6698835d..ba93cef33dbb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";

Here it's wrong, and the compatible property value shall contain
"qcom,sdm670-camcc", probably it could contain both values though.

It may require to add a new compatible to dt documentation and,
if needed, to the corresponding clock driver.

> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,sdm670-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;

--
Best wishes,
Vladimir

