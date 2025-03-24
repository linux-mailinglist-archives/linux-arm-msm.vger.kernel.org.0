Return-Path: <linux-arm-msm+bounces-52286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A6A6D593
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B8B188A80C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67FF25C703;
	Mon, 24 Mar 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItzZ73oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6C259C8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803112; cv=none; b=G9Q74sgp49seBBoYoVkf2lgRjN7m+vUcDZSy6U7cd5TZu1KHBvhR0LlepsCvebRjno3WvgRSJ0FsZZUkEEGOcUd92tNgmwqSqFtkm+s6fDQ5luPQnB3ggcISqIqQt6sTsm6NOYS3ZuY3QP30Mjtf55oKu8UsA1fK/EjWGjkuDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803112; c=relaxed/simple;
	bh=Hk67b2jK62ZrHw9NUvbj5w/WBx3baQ3ZYwl/y/2m83U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vA6jGVoO9Dl9US75I0U75ZR5lHWWP5SWMmqgVscg/UrO+xX4sH7Lh2G89AFVJGQs37Zgvzszv7StvfSXlLe0TkaKpW72BCoEu6g1ha03hQh0H2drSjJpToqXqEvat2QzFwy6GgkvgPavW55WTYklY9QX22ENRTUIpO8fHm1toa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItzZ73oc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so1719272a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742803110; x=1743407910; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp4ddfe4Vf8vx05tu7Jns3bwbMSMgp5+mmtijBmV9ns=;
        b=ItzZ73ocVt57h4fentpQz2W62Su7vsa1vcDxoC52emYjha9wyPfL/rBFnk/nvSUDQO
         TIMVVaK+tmK2MX3f38qiu/J9IqfV2cSEV32GA51PZpuSEmrdNyBOZxQ18fjBLL83VkHg
         cC5GgvoWmYVN4x/2VaVVjaC6kI0kY2ZSBFuLNFWC3Z6BgQwVGZGfyT6YrE+9h9RaGdFU
         EqTGGMKRoeVr1hLMCD5QilM5jPolm06UGSXYep4Y8noM8sNs0fsFdjm+D+SSG+ta19ih
         80+QQmPij00JAFuFVLcO2Pl/oGbXHtndTnatzq2kOhJ2zwPbhhFxbP29e6CTe9mzrKlQ
         I3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742803110; x=1743407910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bp4ddfe4Vf8vx05tu7Jns3bwbMSMgp5+mmtijBmV9ns=;
        b=uZKHICYMZQItFMYmc9eYzoBZiO5+fOj5FLPSenUZQ+hAewD3NjOVcKvVZi3ePmf2/l
         Nrv90iYysa8NexQlNF7ek/wVxHoP5XdtxOe68iq7V94owNd/BvXDJgjkH/trlm+I5SmZ
         z7LbDymn0g7mSQAbrVNBTnAgmAFYsRqjKGMp1TlvefpQbmwEtihPt3P6XaLNWAiAjHdF
         DOtpSZMoHfTfX+mxQwM+UMVDxPRrZbmgz//lqbrAp3U6KjYrOeDcrfjm7UPjv/sPzV9D
         9hlwFSAyBKVyQnfeBbNRRm2lyaFFDJkCE1+Yxp2o1pRp2swihjWwdFe3ENg9Kt0inLSt
         w8bg==
X-Forwarded-Encrypted: i=1; AJvYcCXtiSi+dLmlOne3RGSnGLb4ogTeao2XI0pEujLe4irCa8ytcHoDznmvElbSXiaLTIBX+6O8wFvpmXMUEZM+@vger.kernel.org
X-Gm-Message-State: AOJu0YxyqB/cOiqcgo8rDq5R0B47jjoPDV/vr0fLMxHc7q9wzQZ3WSjH
	Yg4qnVDnD6OEPbz9gb8fQb0PsjJAC/+cLDx/ARhIH+P6RfsFB0Ruoha3zva5QA==
X-Gm-Gg: ASbGncvg3Yy91sw/FQ7YJpgPfHEmflMFs6sW8CUHXNcimiYri3gtSnwJzlgWpW8P37g
	Md4d+ULahbCojAiP0lvfqIJlv+gHHwQP12mL1HNO1Kg70MM8Y/OKVJfxG1Vi+6wEA6jdz2ieOHt
	eq7WkbV0diNwpYwnB1Tm2bhTMHjqMZk3DGSz7u6cRg06Fr8epA8Sb17C7w250fTKaeOIyoOl4Q4
	Xg1ZzcDOiUZcMRVNXSap62+HjLn00O9x5BWXIS78XxcALg3Ag8Lb3r9uKxhZ3wNFK+fHa/+QfDP
	6QHC7qReHLWrXgKcAPL2q217G3XbrKH9Lg+P/mbpMI6WnYZjXF2g+nU3
X-Google-Smtp-Source: AGHT+IFaEEcjY/AaCnl8GGjUdE+Ran73MpkIfwVAljqCouhk2XWNRH1ssUSjHwSPezwzAjIBoXcYhw==
X-Received: by 2002:a17:90b:2647:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-3030fe95343mr23608416a91.12.1742803110159;
        Mon, 24 Mar 2025 00:58:30 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bf0sm11434777a91.7.2025.03.24.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:58:29 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:28:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	20250317100029.881286-2-quic_varada@quicinc.com, Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: ipq5018: Enable PCIe
Message-ID: <bn74cvfyprkwdw3moh3qqwxjnoa4nff7ycm63pqvoe7g5efplj@u7t3tmmbqapk>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>

On Fri, Mar 21, 2025 at 04:14:44PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 432-c2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 40 ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8460b538eb6a..43def95e9275 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -9,6 +9,8 @@
>  
>  #include "ipq5018.dtsi"
>  
> +#include <dt-bindings/gpio/gpio.h>
> +
>  / {
>  	model = "Qualcomm Technologies, Inc. IPQ5018/AP-RDP432.1-C2";
>  	compatible = "qcom,ipq5018-rdp432-c2", "qcom,ipq5018";
> @@ -28,6 +30,20 @@ &blsp1_uart1 {
>  	status = "okay";
>  };
>  
> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	pinctrl-0 = <&sdc_default_state>;
>  	pinctrl-names = "default";
> @@ -43,6 +59,30 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	pcie0_default: pcie0-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio14";
> +			function = "pcie0_clk";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio15";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio16";
> +			function = "pcie0_wake";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	sdc_default_state: sdc-default-state {
>  		clk-pins {
>  			pins = "gpio9";
> 
> -- 
> 2.48.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

