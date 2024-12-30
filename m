Return-Path: <linux-arm-msm+bounces-43682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436C9FEA6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 20:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A8D1883A62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 19:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87484186E54;
	Mon, 30 Dec 2024 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RU4e0fIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9213C82E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735587964; cv=none; b=HxD0TnX4BawRzrHwZXmlIjPkXuNricoYbL8wNyDr3TI00XXsa8hUOTQOM4ylyC7bYt21W8ozdQtdIfSsrXrf6eWag4J6hwnYuy2E3V/SRFB5ilW80OqBTtlc5PmVgwIDxwmWyt0eUEskCxm4bj7RRcc/zKdXCkYTXNf05g639qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735587964; c=relaxed/simple;
	bh=KkfCIBKnF5fwnqaFO3EGMdwpJzBICxdQnkM1Cym2WvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN1C4QxiGZZy9lDGCYHZLMeSzKOP8LTH8H3GnZZblV+CYehHAHiML4ygOHw0YzyTVIKUCbjDzKhAR58e4d7fuLfTddZDRMdSRgw+10iZeqZ2bC671aiBtwf3yFT7i4KVzT0I8spdg+Ig1iPIVgFTJLbUX852BbFl5t0VuADYLHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RU4e0fIr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43658c452f5so13901245e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735587960; x=1736192760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8Naa43QCGHNyg2KPWS+kj2ly/b/cOPWw7DpI0jEnNk=;
        b=RU4e0fIrBLSF8zGQX/5nQiuC6WO2YPDE6PRLI0iVB/yZkmNjuN1W5sX0TuhPwpFy4w
         OwaJZmUIcZlhXgQOEMYBGQElcTlmTNfkM3vzW1u9UO6IZmJAPvvEtmJ55M76fcQpaJGt
         AqJMMb5N7CZ7RUZ/dMtIcmzMzt1Oh7a3vYrLKS1K0B+OzBsjQKK9yfAZ8xJEIVOIulwp
         MacvD4MSJnoL09/GcLDGR6ssydgLw3ko7m2ZTSgCxFT6WPLALM6Qwt0nmN2s6To8OJx7
         pQ7v3JFirs9SNDWGxzwuKvfMMCA8m/7FeZJuqzrPSj4IaPNL6yabTOm3LFXFcuhBIpRd
         4oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735587960; x=1736192760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8Naa43QCGHNyg2KPWS+kj2ly/b/cOPWw7DpI0jEnNk=;
        b=pGA1M0mly1sILQC7q1he5DaBGbV6ds6/Um1vElwakVdxJPhMs1IGhLXFkQAgYtMS3M
         FZSsAmN0rO/MaRGwtHPIAi4vzAhILB2SoYMrd4o87cMWV9P0hDD1R11dTXHj0xPBSCMf
         1jWUxTmqq6PEkoBp2kADjrp9tlS4XXMSfxZigiGLlkkoeCeZgJUgs/nas1dhhkydunDo
         PMEtEXf7u0VvKnFWhE03z1OCvBZOB0JaBjoLZKPveog/eTdXN37S0mJkpeYEzlntM+Ep
         1MIcY3JlhHAKuiHJIAIhdspwZNahrmAApk5QXkJCZov9IfO5SO/jiZ93ACQ7G/5wtzqL
         7bFw==
X-Forwarded-Encrypted: i=1; AJvYcCWzENyoy+8WAollpw9ZothCtvgWSvMFMdqJQTSQwKAihICSsdxqePHlOhWDxKXZR9CSktWvXCdVAUGvoQlb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+kKOmYkTiuHdYkSGeDO86pfwdyxI+IDM+2ILusIUMLzEmh7U
	CQonJu6ziWPqk/atfeomQi2O1jE/41TIXVOsa9Y/yNtJle2g0v2RZn7+mBIdI14=
X-Gm-Gg: ASbGnctuZGuehIU+zrRRs4AQj9b1Hd94glCkk2U+KRT1b2CHeEISPpUIsonFhLFhBco
	khrAkVEWmwLIbpWf1Iut32C870WCPxAcVQIGR8TbQpXsqBIYtYXUVXYxxs01PDiIcngBcBUnUCB
	wWqe+7Dhd6H9ctRWfEJTr9p3U8SFX0CR0KMIBSBuKHRa8rqoD0ViyxjFEFXNsTyxR/QwWVhGJDN
	bI4ZFQeQSYpaKNJ3zLTBhnxFCE9tGTkJhnmFBA1dRYOJpPYyfKTu3om8R0Vli5FKAp3lgh0yBq2
	h3ypPYeoU3qkXPidebJ6
X-Google-Smtp-Source: AGHT+IExhNxxISBwK7nKa79+DMGbXNAgnjT4OVTT/gPZUUpxNcDfWbpouGKFxa5X8xAu0n1XSLt/WA==
X-Received: by 2002:a05:6000:1b88:b0:38a:5557:7677 with SMTP id ffacd0b85a97d-38a55577945mr1461371f8f.5.1735587959917;
        Mon, 30 Dec 2024 11:45:59 -0800 (PST)
Received: from [192.168.178.85] (i5E866BC1.versanet.de. [94.134.107.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm361945625e9.28.2024.12.30.11.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 11:45:59 -0800 (PST)
Message-ID: <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
Date: Mon, 30 Dec 2024 21:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 12/27/24 15:11, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>

It would be preferred to sort the list of includes in alphabetical order.

> @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			status = "disabled";

Please do not disable the clock controller, it was discussed in the past, that
all clock controllers should be enabled by default.

> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

--
Best wishes,
Vladimir

