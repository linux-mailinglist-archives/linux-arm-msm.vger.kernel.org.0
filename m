Return-Path: <linux-arm-msm+bounces-45677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9100A17C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 756927A0431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD581F0E5C;
	Tue, 21 Jan 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM6RtouH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C41B4137
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737457259; cv=none; b=nHd1ffRb101saKnJfMeSchaGcRK2AQ0pgQwO/EBLJlXxLYa9JbwA00snMg3OJl0QpBESHucFdx3PS8mflpvBGGH9U7zY56KGDFw4GnZYxavNDa3ObhGuO8TnVkUnBUGcw0kY5gaSaApH9RuB8VUZAhd4vtNC+WPLBIpzgpnuCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737457259; c=relaxed/simple;
	bh=7t5zcBFeWpXAYM63z2r3g3/O5AF3W9a9XGM/zJFVLY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7BNmpqZBnf6wT/4in4zd84VkXT7jQpGvl1RvSJtn9OmEbo37FBW6Q/UMBEsFcWXOw4m92eju4JeNNGAtF4n+HsAzeJwIwQMYic05t+9rBdHEBWAuqOecWqLRD8gsq3pnQ0BJvYccK3/fUCQVooukF9h+Wq0tetSTZlRq5yHE90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM6RtouH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f22fd6832so5768099e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737457255; x=1738062055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUJ9VGxm2f2ND6SfmvCg1T6YHXm+1DnqS1Cjcy8gePw=;
        b=tM6RtouH5R3eLF18c9P8kQue/9IpxHeTuk2IjHpWPrbbb8Q1RKirN8A4BccvDZdfIr
         l6ZDj63SMbWHfUW8naV0dh9X4zTIoTZTVMXvB3BbB2UxbLXgOdhjTMDE9AsenTE9XKBF
         vAk8TnChbDJj+2V4c1qDKp2rdlCxrXGi8TromLibdddo/dpuXqRfHPUdUUDkKKg/gQ4L
         Vugke/n2Pq63yAz+5TgxOorJKgegYzu4TuV7AMUkphjMSR+QIcN5KX2V8JhqVKjIXRgM
         OaKx4vG5ZhF4KkXgMnQi56URMfs+Yq3qEkbBOdK2PHNvz6SDu+jfBfyY4U1bu70P01mc
         km7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737457255; x=1738062055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUJ9VGxm2f2ND6SfmvCg1T6YHXm+1DnqS1Cjcy8gePw=;
        b=e3RV32p4k4O4L3q9XKh7DRpeGKKXNeDYXyU3HwTjel6X7OZhYqky1O8Rr9vzsLOWVu
         7qseeQlui6jVJIQvcNMOO8o/2ZN+XRJvXZjyWQvZdhpC2+ARjNTe575cnWd9l7YwRnOr
         2KzSHF09QQOdP/EupoXV67lQ19kH8LKCJqiemVWNnnhLillfaS1lzoFpb30v3g1u9HnI
         oBSTohmnPLLEvx1J1xN29qjI73vMVq6s5kgfwjc38JWi18XEVliC1F7NxVfhA4cteeZp
         c0K2Th+foxzBKm0m5h2RXvoUL2bWvqyZJMoc4LSsMd+TTvh0QC6KZl+Xl9HN4wstKRRc
         AHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1WGgWzlR3qFOLvjyZjBc4d0Sjo0hnF65qILyCDemL4UowYv2L9ATAmnV0fSruQzG+yCRFBEwJYifjzez1@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVZyHGgeBe38kqlgZ+nsf425UhFhm0kI/+bInp0tWTVSOehE3
	0uNyRufmTklHIv+lQO6lpGZjz4zemts0se6XzQgAher8ip2E0AeGPUQuGJsSsUOXDyuV8SRXfhA
	Yu/4=
X-Gm-Gg: ASbGncv87x1O9fOYjqkCNIMzP/lX5+cf9SHPZwiC+5ypOQwWpz4Sx5WnW8JOZdGtQVc
	TcVqVaDhxTaIR1JEk/niMRFWXit7mkzcwtXFFg2DQjG2FfQa0ii56NcDE2Biq3mkfWJCdvvJfVi
	aQ3NM3Tm3Y9mBNujxZcVqHK2FM6Wt+czbTquiGAcN4iOjbj3jAQUCI8gG0R7tx9ofkbgHhrg8uO
	VOQYLWE4cYewyTmguBwDpItXkME4jzQAI/ii4dqyI1n+S2Cs0+LM6ndoWrdSmdAUD7RDUjjBUOd
	4XUWFXztVk2bA/Z6ploD/HgbHdQl8VZDPmHr0K05BUNT050Ysw==
X-Google-Smtp-Source: AGHT+IF/4CV/h0ok4NQiia2tIo8sTH9wsJWy0DxL7KKHiRI7CPOolPiToKbAfH3+6UTqhbyBH0p6WQ==
X-Received: by 2002:a05:6512:3e03:b0:540:1f7d:8bc0 with SMTP id 2adb3069b0e04-5439c287470mr6386525e87.49.1737457255180;
        Tue, 21 Jan 2025 03:00:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78d62sm1765544e87.241.2025.01.21.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:00:53 -0800 (PST)
Date: Tue, 21 Jan 2025 13:00:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator
 out of soc dtsi
Message-ID: <z6vspyykbj7e55uequibwacdx7uuwubtuabnsxagcudmqrfwn3@4gfna5rqiimc>
References: <20250120140006.655463-1-amadeus@jmu.edu.cn>
 <20250120140006.655463-4-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120140006.655463-4-amadeus@jmu.edu.cn>

On Mon, Jan 20, 2025 at 10:00:04PM +0800, Chukun Pan wrote:
> Some IPQ60xx SoCs don't come with the mp5496 pmic chip. The mp5496
> pmic was never part of the IPQ60xx SoC, it's optional, so we moved
> it out of the soc dtsi.

Wouldn't it be better to move it to the board file without having
intermediate include files?

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  2 +-
>  arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 35 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 14 --------
>  3 files changed, 36 insertions(+), 15 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index f5f4827c0e17..9c69d3027b43 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -7,7 +7,7 @@
>  
>  /dts-v1/;
>  
> -#include "ipq6018.dtsi"
> +#include "ipq6018-mp5496.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
> new file mode 100644
> index 000000000000..fe2152df69f4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * ipq6018-mp5496.dtsi describes common properties (e.g. regulators) that
> + * apply to most devices that make use of the IPQ6018 SoC and MP5496 PMIC.
> + */
> +
> +#include "ipq6018.dtsi"
> +
> +&cpu0 {
> +	cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&ipq6018_s2>;
> +};
> +
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-mp5496-regulators";
> +
> +		ipq6018_s2: s2 {
> +			regulator-min-microvolt = <725000>;
> +			regulator-max-microvolt = <1062500>;
> +			regulator-always-on;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 7514919132b6..a02aa641cb90 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -43,7 +43,6 @@ cpu0: cpu@0 {
>  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&ipq6018_s2>;
>  			#cooling-cells = <2>;
>  		};
>  
> @@ -56,7 +55,6 @@ cpu1: cpu@1 {
>  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&ipq6018_s2>;
>  			#cooling-cells = <2>;
>  		};
>  
> @@ -69,7 +67,6 @@ cpu2: cpu@2 {
>  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&ipq6018_s2>;
>  			#cooling-cells = <2>;
>  		};
>  
> @@ -82,7 +79,6 @@ cpu3: cpu@3 {
>  			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-supply = <&ipq6018_s2>;
>  			#cooling-cells = <2>;
>  		};
>  
> @@ -184,16 +180,6 @@ glink-edge {
>  			rpm_requests: rpm-requests {
>  				compatible = "qcom,rpm-ipq6018", "qcom,glink-smd-rpm";
>  				qcom,glink-channels = "rpm_requests";
> -
> -				regulators {
> -					compatible = "qcom,rpm-mp5496-regulators";
> -
> -					ipq6018_s2: s2 {
> -						regulator-min-microvolt = <725000>;
> -						regulator-max-microvolt = <1062500>;
> -						regulator-always-on;
> -					};
> -				};
>  			};
>  		};
>  	};
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

