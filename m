Return-Path: <linux-arm-msm+bounces-58895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F04ABF584
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246AD1BC20BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9866F267B84;
	Wed, 21 May 2025 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8uP9/0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2626AABD
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832847; cv=none; b=gf7ZGZztCGlYIUm6N4NmC8nwNmIOwO8nBAy3RlbH1HY8sDgR7XAcX27CTMqFP4cwKMmGheZClgoJ6CfRB6AtmAzFHNvbt0xBpxtVAGcqArV+7vcm7UMWAZkgtZ8GLexhG3uXzsC2XHw7NMhB7vCayJahNvFD09OoXPMe/YOEvBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832847; c=relaxed/simple;
	bh=/p8hi4Fb9JbhcU9eXGccjakCQbbweGLDyTOE826eGz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRR2Z7OcqnrjPuZLU01IjA+JBuoap8PnLfZDeMVKrk5DtyRH48HHuhoRYlOtCMn0mwmqW6bxGqQhESsq1WtMYnWVtjNtBbU/LuIH7BSBAPorZO/Wa+ppWEvgtucCM18GBRcFIY5gCG7Hwmhn57VEHNWQSq1SI+Bd35/RL2ylvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8uP9/0P; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a363ccac20so4273246f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832843; x=1748437643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=n8uP9/0PXmH07oBxwjujbqu3lrb93tHq14FgXaRA5qH7C+Lm2XflNrUkq+MLLm2Mbi
         PrxJUPc7zbxgA89n8m6XgjDl+eXiHojeItuP9tcZGu3YhKT+wncTtOuXt0VkRRMIHfM7
         NHsYLbGhblbwZNicF5hLTcD6JAMlyncCpQ+u+GUd2VfYlaXvvBTp0yVZibkfHFFc1Xy4
         fKOvGLkrBydex7LbvAiJBe2f8gQzq9dOF/kTWjYCATzcLASHaDulxhDcLG1mLDehZoM7
         iyPuP3qwP/KNQvmg3GGHAn12If5lDYweZGvkkLAtyaWO1iBTWT2VO+kOcFBGxy4hwsLJ
         wQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832843; x=1748437643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=F4gQDlowIAia7PlviiCvdfHchC3J8kbHb07KzHdx9NDBiRGt0Qyp0lbg7ZjeUScknH
         XIJNKyY4zDwsloYM95+gJjjHjmDP/OilatD7zsL31Ghqbwc9RSrsHvox9l8e12ZXXN1p
         XI8uVYNX5SqOIgRH5R0+2cKkhIUhTzF9Apx/zqhGqAr9qAsaovjAyDyMSIcrH7y9mcv5
         NXWc9OvRVRm5lutZvt0bkrR4o9iF+E30lcPMZLDnd08EMG+1/1sgVbFmqP3Qz/VNHoUK
         /gU6GY8LXpaE7deFtLOZxD48Rm2On2owuOkfYfpT3RFf3XEyHZv1L2i1zjFcOCkXb8mN
         5nBw==
X-Gm-Message-State: AOJu0YzBZ/nMmU10xlqxyBr6W1n5C/yNk7eentOj896pQHIN1yPS26an
	ZhJQgxV5EGaRILhKm/oNdI3sM6lajv62g1MM56HC3MQHXRsDt3qVz8LKIF4rT3pQ5PI=
X-Gm-Gg: ASbGncueC/KdwIsUIyPE3jJAXQjyg6Pp04TKe6X03DI3baSVj9mmJlTfmM9GG71lwAe
	NexMoNrdsQwKedlL46KNS+kRBhcyvAZSO/YKy4GfdeaRZFK3J401JfYAVr0psfU2RKrTBXrMEwV
	PpjwkqWVAQb/lv5SHtNhCzr0izU/Qb8lJ1JRscpBMfWf/FN65OHM4M+JTiP3ptor/AZEk0ecrdX
	Cc2k6ddaHspnkU+z0Lq6ZmUcb4RkMc7Wd7p38V6EK7djIt29cOhOTFDkF7qug21QEZmwWE25wRf
	HZJsdzebkkRS7Mb3O2g+p2nG1ClmB1n89jK4U5epD18xtDnt4CUaNvibiuKKiN23xYRtyI1K0fC
	E6vss1nqmYxvgrtN+
X-Google-Smtp-Source: AGHT+IE+t/PYCXMw3FrDdML6YsWV5MqKEMrz7cLzul08Pv1j9GQdjSaGfDFVw2hwDw8YQywVgAFYbw==
X-Received: by 2002:a5d:5f56:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a365959288mr13967995f8f.36.1747832843294;
        Wed, 21 May 2025 06:07:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1basm20036403f8f.15.2025.05.21.06.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:07:22 -0700 (PDT)
Message-ID: <b2cf41af-756d-4e78-8df0-0350198d357d@linaro.org>
Date: Wed, 21 May 2025 14:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, todor.too@gmail.com, rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +
>   &gcc {
>   	clocks = <&rpmhcc RPMH_CXO_CLK>,
>   		 <&rpmhcc RPMH_CXO_CLK_A>,
> 

I think there's some confusion.

I'm willing to accept CSID and VFE changes with the minimum proof of TPG 
driving it.

But - CSIPHY in CAMSS which is only proven by TPG is obviously not a 
proof and again I agree with the consensus here - there's little value 
to an end-user in just having the TPG for a camera.

No sensor:
CAMSS::CSID
CAMSS::VFE

Just about acceptable

No sensor:
CAMSS::CSIPHY
DTS::CAMSS enable

Is too much of an ask.

Just publish your sensor code ! We need more sensor enablement upstream 
anyway.

---
bod

