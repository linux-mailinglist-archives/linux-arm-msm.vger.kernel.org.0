Return-Path: <linux-arm-msm+bounces-24339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDC918E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6218F289269
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 18:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F3019049B;
	Wed, 26 Jun 2024 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LO6etVeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB00190471
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425612; cv=none; b=ikmes7K8iDr+PHM0IvkG7AqUhiBxnv9Y63hxSbZKS2NNCTZs6uAoOYKuN5WwpR70AdncAj/oCzj3TxAziJ92kVVNX8i6D5bO141TW9CYqnNgxL327tmOkZE7j7BzFvkM+1Vonp4ZZdu2aGNBUZ4OQJFDOPcLis8uX91lmc9fDYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425612; c=relaxed/simple;
	bh=OmD93Q25ADpMFRu+xE36H+6K7ZcseHViUUMx1qwfFjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM6q438KTmxYUNwsn3n3HOJHSJc3rlt1PCOBVDTQD17ESAzZ9D0fp5QnuQROz83G0fUq8PsID7Kj9R52FiJmEp1Wi4xXa2aUHLggmOtGxjlf8kX12Uwph+OdgtACKeX5xzpOjM2AzE8kwOFBFyalq1Zxqak0cu/w/ByxbWNnbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LO6etVeU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so5218531e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719425607; x=1720030407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=98WqR+TIhgNWb50xP723naTMSf8HssIbDDAOYEhWpZA=;
        b=LO6etVeUT7kyZnKY5RwPsbRe4LIgl/Rg/F1tC2Yo7x+0oF7ZeFZXqHyeWqTB2JDCkk
         wvIK83QojDSOulwXbD2pSEKfIweIG/HruEeGD6fTjPnGKBms9hB1wRd4ts50Xf0Il5uU
         W6AOWwneCjLSwXklpeGMU+ROOkWzggEcV8Bz9ghbsLQxwqAJ47lqr17RRzzDG3FH4eV1
         6NdfgJtOSjF04cQzQGfceovRHPy3J5kg72Uoh05rtqoNoFgDJFxOQLxRZpuK56ezRbW5
         xpStS7seYecOnWAy50BrzYF2ldkngWqUoSIXeMl/hsHxzzg0m/6OMN8bVCMPzFso6u9f
         ipvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719425607; x=1720030407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98WqR+TIhgNWb50xP723naTMSf8HssIbDDAOYEhWpZA=;
        b=jnGJg2E5kgRCuzFLwcvwDjllOGnLeB1IOIJslMhEeVxOvvVlBwuZop8W3kV5uaAWMw
         oI330mqpZTs+eYNyo8PuP9hFPymtsV8wPrdfkXzY8ZFD6/TlVqTA/6ikNg/xkxj8LwzE
         7u68FiqAe5FnR5kw1iuO+dTd/nOkqTqWCqWM6w80aegtfQPIyvfpZXrHsdzHZgv0fHFG
         nuTXcICMTSQckyKFVi7fjvfO47Zqv2u/koRgYgylupQb+ikiiX4eGydkcUWXcy1DdaKl
         m2YqoFY1q4YwXfbzCB6wO4sNzsmuS5RRpgyB8OkL0v2kWMTnIT5k07x35dc4onGS6ab+
         PCVw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5xJyaiP3vCGJ3+s3CZjyxdr7gHF/ZBRTj6NChIF+bJmPYO0DyyPUGf8108/iKT8ZNO7n8ECNUwe6z/TkPBFT44qx0W05MBavfq9Qsg==
X-Gm-Message-State: AOJu0YwKyunyqqU2dN5MHn4Jm78wPf5mtftAb2j14j90zTYDma417TSn
	kBOJ0pazktOIQQ4o6tkutKKD34Ro9gosi4b3nkBYQP3UdNZnkqto2XO0MexiGhQ=
X-Google-Smtp-Source: AGHT+IHb4sBoQRn1fFcD1XojJf4lKn8EBbJIOhFkvUcsAWULMwiAUT7Lh4FrjhFG7Z2wX/StRwYc0Q==
X-Received: by 2002:a05:6512:3b91:b0:52d:141:153c with SMTP id 2adb3069b0e04-52d014118a1mr3551111e87.59.1719425606462;
        Wed, 26 Jun 2024 11:13:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b47b2sm1657580e87.50.2024.06.26.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 11:13:25 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:13:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	arnd@arndb.de, m.szyprowski@samsung.com, nfraprado@collabora.com, 
	u-kumar1@ti.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
Message-ID: <imkcmkqocsyrykaetnl4arxzn5q3x6zavs3ivyaf7mtdai2czz@yplf3jjjpex5>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-7-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626143302.810632-7-quic_devipriy@quicinc.com>

On Wed, Jun 26, 2024 at 08:03:01PM GMT, Devi Priya wrote:
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V5:
> 	- Dropped interconnects from nsscc node and added 
> 	  interconnect-cells to NSS clock provider so that it can be used
> 	  as icc provider.
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 41 +++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 48dfafea46a7..b6f8800bf63c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -11,6 +11,8 @@
>  #include <dt-bindings/interconnect/qcom,ipq9574.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
> +#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
> +#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -19,6 +21,24 @@ / {
>  	#size-cells = <2>;
>  
>  	clocks {
> +		bias_pll_cc_clk: bias-pll-cc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1200000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		bias_pll_nss_noc_clk: bias-pll-nss-noc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <461500000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <353000000>;
> +			#clock-cells = <0>;
> +		};

What is the source for these clocks? Is it really an on-board crystal?

> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
d

-- 
With best wishes
Dmitry

