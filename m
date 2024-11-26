Return-Path: <linux-arm-msm+bounces-39202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAB9D97BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 13:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE9516245E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4C81D4613;
	Tue, 26 Nov 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMYVFlay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C41D4340
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732625766; cv=none; b=K+GOa+qlQ0a7gM9HGhm54xNzVq2knFzDe4xDTwiqRRz3fzug5gTTiPXO1j7aVTz+vE6uUnz+ZVQIwU+zqjEuhhEwHv+CL1BoV2YpSAd+TXcZfD48FafixWv1sFcACMFBycv8iUn3bl8yXBC97kbJUmEsGZ/UFLcBwuemK/n6gFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732625766; c=relaxed/simple;
	bh=bzBJ5ySU8iyC+cTGOrqLjv/wf4htjtDCeE2Z/8l0Yew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UymuH9dT32bRqtWKmLlJ83y30Nzpz7GskaghZW+5W5FgdrRbtCgyur836Apqbl0zRNIfRu2ZN/oFv4qaC8z4VIYAfmHE5yxYE32ENGXJlVnkNxV6jCuoRJy1oZB44erHJPJAMTAnYXMjNaaWn04xwmS/kuj5/J0GBCrhPt92fUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMYVFlay; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3ea53011deaso733021b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 04:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732625764; x=1733230564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dXE3QYJ5LikeczgQTvHoKWrWw3sPXnz+0dNSvQEom74=;
        b=PMYVFlayZbYKDjEyVTe5fZj74kzP54VAZ/lHXm4fqVF/LvelXMGdUopWDfJG+A7TIH
         Wdc+NeTyppMffNMciIJvha4WFY03DoVCPJo4ecBg3U/waVbaxQdlLkKDVdJ45I1CNkAw
         3M+qZ6RrcME5lTjpnYFihsS8u8nlECyxbuo1PdKc18EukNyl0B3WmAsxe3K3E9u3aRKF
         Dk/Ff/tifeLb+TWZfcioitKpzsH3KY+dm5iEjXoS78Mxki+GMLqooWzksW8yBWj0jSM5
         E7g41da/hePC55oE3iCmQSYduxKwgQXFbfcT6WyXfBaotmly2kf1xwUXJEM6XyllQDd1
         l5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732625764; x=1733230564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXE3QYJ5LikeczgQTvHoKWrWw3sPXnz+0dNSvQEom74=;
        b=S4W8/g0PtjCrvYHjdSLR/wmnLI0pyFYOVqUpnUepk9KIgwURrq+UWpesqpRUZAaJYE
         j48s3/ahuAGm5APyj129EovSOAQQkt0ZSsjLuwVxgqyAW8m+juF18QOZgSFG7+V8ufof
         uBGUCBCDQ/cHtpyXkY7q4hYcB61Hrn1mIU8I7Bk2q6iNM7XUb/ObpmFPIsKAUI8Y213E
         ChL0YfoRJwqXDb+Gkjb8c9cva3tOyDQTB49U9Ns+wwhh8YPtoVgRVWhEsmuOWPd5E2gf
         Udy0OYWbNkFeVsIHubTOYvVGRThYaJzSIg+yhA/YmMgWmeANW70wIk3K9rZGE9Z5S3O0
         iimA==
X-Forwarded-Encrypted: i=1; AJvYcCXthACN87Nov8Ksx2ecYAVwtWNSFzSewXe+++eYwEwsQaP/PPeJBcKgVkrPJJuu3KGICUuKqfTdr8zg9h1X@vger.kernel.org
X-Gm-Message-State: AOJu0YyebtH22PDSVDOGuKLGqKqEsENToeN2UdETop7M+2Ei7V44/OiK
	WK/xdnW5seH9o4bM71kCGf744JKEo43NgskHGkPRFZlhDGBwdAIjXOykQ+serg==
X-Gm-Gg: ASbGncsOOXak0Zg3DNvJxWn6XyOtue8bHNaQNLN/ML/tzN3rGRpxGAS9Uizu5L2vusE
	tOrb1wGPqYV5ONeqNfdP2N/RcdJ8B2evE6ZB+wuXHOw2TlnIjIRdpItH0XV/eYi8AS/T16yB/3N
	+K+TLwf0xERHOdAbsAv15r14mIsfgVrxqAgb4qcRldo+X90oxeXll6gr8O7mO/RNWGZD9T/nzyG
	F+GISXBe6OxzFQlDFWIE1ZEQUNBzoHfUuiYFNVeaGZK8hrYqNuGSnt/a/yG
X-Google-Smtp-Source: AGHT+IFNm2gT/rtGSM3QDKFPVSFCgKiQoR/R4Xr++om1Vj/nQzObB88rsH3X/oaoAwNa1JWVmpMuRw==
X-Received: by 2002:a05:6830:6403:b0:718:4073:62bf with SMTP id 46e09a7af769-71c04b7eecemr17953453a34.7.1732625764057;
        Tue, 26 Nov 2024 04:56:04 -0800 (PST)
Received: from thinkpad ([120.60.136.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3de284sm8598526a12.55.2024.11.26.04.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:56:03 -0800 (PST)
Date: Tue, 26 Nov 2024 18:25:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add 'global' interrupt to
 the PCIe RC nodes
Message-ID: <20241126125556.oncvvkyrwj5s7u65@thinkpad>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
 <20241126-topic-sm8x50-pcie-global-irq-v1-2-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-2-4049cfccd073@linaro.org>

On Tue, Nov 26, 2024 at 11:22:50AM +0100, Neil Armstrong wrote:
> Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
> to the host CPUs. This interrupt can be used by the device driver to
> identify events such as PCIe link specific events, safety events, etc...
> 
> Hence, add it to the PCIe RC node along with the existing MSI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..44613fbe0c7f352ea0499782ca825cbe2a257aab 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1734,7 +1734,8 @@ pcie0: pcie@1c00000 {
>  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "msi0",
>  					  "msi1",
>  					  "msi2",
> @@ -1742,7 +1743,8 @@ pcie0: pcie@1c00000 {
>  					  "msi4",
>  					  "msi5",
>  					  "msi6",
> -					  "msi7";
> +					  "msi7",
> +					  "global";
>  			#interrupt-cells = <1>;
>  			interrupt-map-mask = <0 0 0 0x7>;
>  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> @@ -1850,7 +1852,8 @@ pcie1: pcie@1c08000 {
>  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "msi0",
>  					  "msi1",
>  					  "msi2",
> @@ -1858,7 +1861,8 @@ pcie1: pcie@1c08000 {
>  					  "msi4",
>  					  "msi5",
>  					  "msi6",
> -					  "msi7";
> +					  "msi7",
> +					  "global";
>  			#interrupt-cells = <1>;
>  			interrupt-map-mask = <0 0 0 0x7>;
>  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

