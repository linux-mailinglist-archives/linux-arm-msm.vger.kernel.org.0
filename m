Return-Path: <linux-arm-msm+bounces-28225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006F94CC78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA062838F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1148118F2E8;
	Fri,  9 Aug 2024 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+VuTe2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA018DF93
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192910; cv=none; b=rJIbjcAJBGX2mxoFx6ADYwdAtA4BmHMYXplD+hBO1tSG8sej2IPl65t6w8Z+NBLWN7btV/eSJ2Tc8M6LrdbDVGMVf+c05mWd94XhQMjrWlWAVbgTiW+0PXOcL6YIP5jNUNn0bjDrqegANnu/KLZlFva7hW//h8L7nymBjtdQd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192910; c=relaxed/simple;
	bh=j/S13d0Z0pYbxJ1hefT/rX+m7h2ctUfYuOzuzKDKYlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih4S1BEhRdpLn7izgPQ4wUfRQlGnnwbWH2QKgWqlcs/9X1PhZ8H9EiCwwDfbK5bdqEox8vapkcdMmZ5kL9IbHlORSFoCz+LuaIalMuw//dqvUo4Ldj2AkIH7Uj+9r+iJ+BEU74cYuJSeLoJRUkAmv0qO+G5iRbq6w+1+ohkvagw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+VuTe2X; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso162793766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723192905; x=1723797705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igOkBgZd7zG3j/GyqH3kh4WPbZ555PZKYMSCL8FnoCE=;
        b=p+VuTe2XeawnOmXqFJhNS+Cb3wj91ONg75BZdUPV1jqvfLSiKUI3qUWRfnVyfcLYBx
         VC69nTojmVmy5QLp5n+y9mTMjSNmzshP2tahhIulLitTLGe4JqyTy0n64JZA8eEvlgvR
         PIlv715Ec/NyNCsBToeCpmzbdJI3rRrrXM1m0zuJbgEBC4kpwkcvsEZQg6WUUgtQh8Ca
         q7d7p7QkULU9W61hBj5IkpuYsgNPB3dVE9qn8S2EpFUTQtZpClCAoP+lXd9Es66euCxp
         xo74GnoJBLMWCIUmxMggLXFNAlpnAV3As/2wDEL8LmBP9ij9ggisiwNeFwNPuBhTYxoH
         2UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192905; x=1723797705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igOkBgZd7zG3j/GyqH3kh4WPbZ555PZKYMSCL8FnoCE=;
        b=tjRuqGgv+OBY+83C9mgD95jVPQO65OQvOhU93xlw2jI6ywn5IOZAfcDmyYsyf4FLtW
         us3PpPr1FkZCJGzbBzUv0MwMHS0NEuwLPLInIgGqbQr+hAukAyikV9CuqujjXjJgpZMP
         yZ9hlrUwJtcXenha64EwSe5MVgq2sndPs2CUe9Oyd/3g+5iwHB/NcNpXHoIaRC3RDQ+0
         egVpDh7eHyFCqAS9zMSdU+oHiBkQQfPf4ZyXD1kVvFA+4X6fZnoaqZvVzeqv6NXskReW
         tSbTK1ZtOVSZosHKWKaPkb110aMxmFN2xNyRDg41/xPfFYmxFKCHmY/fNgkrALYiEpl0
         4DBw==
X-Forwarded-Encrypted: i=1; AJvYcCVusTw//za68ZklgY3qwQgyu7YRMyLtg9v2KJwD41LYYsXTYm6u99RKhrvsIhTt39w7TngSlKKYYGOkWsidzpu8C7xoPfwlPhS0n1f93w==
X-Gm-Message-State: AOJu0YwDqvHuk0/Y2Qo2cbuXCzbeu/3eiLWpa2oYPckczkpV4A+Ed6TK
	7Ld7WIok7gqVyQ31zO3QtGO5U3mzmqXPSF9wbT0WqEX3OulIWW1XT68PNyc6Fh8=
X-Google-Smtp-Source: AGHT+IHDTfZHQA6DtLuqsLz9Hf4m6jUvCYCNbaS4ALlr+hOs22VeUrtBxQRoVGIhejmLy79jxfiviA==
X-Received: by 2002:a17:907:97c3:b0:a7a:abd8:77a5 with SMTP id a640c23a62f3a-a80aa654862mr66716566b.43.1723192905091;
        Fri, 09 Aug 2024 01:41:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:8395:bc08:2fce:1f21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8067efcf0fsm335600666b.145.2024.08.09.01.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:41:44 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:41:39 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add UART2
Message-ID: <ZrXWPQVXfdL-QLnt@linaro.org>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
 <20240809-topic-sl7-v1-3-2090433d8dfc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-topic-sl7-v1-3-2090433d8dfc@quicinc.com>

On Fri, Aug 09, 2024 at 03:43:22AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> GENI SE2 within QUP0 is used as UART on some devices, describe it.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 52 ++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 326283822aee..a2a011702752 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2142,6 +2142,28 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  				status = "disabled";
>  			};
>  
> +			uart2: serial@b88000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x00b88000 0 0x4000>;
> +
> +				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				clock-names = "se";
> +
> +				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
> +						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "qup-core",
> +						     "qup-config";
> +
> +				pinctrl-0 = <&qup_uart2_default>;
> +				pinctrl-names = "default";
> +
> +				status = "disabled";
> +			};
> +
>  			spi2: spi@b88000 {
>  				compatible = "qcom,geni-spi";
>  				reg = <0 0x00b88000 0 0x4000>;
> @@ -5365,6 +5387,36 @@ qup_spi23_data_clk: qup-spi23-data-clk-state {
>  				bias-disable;
>  			};
>  
> +			qup_uart2_default: qup-uart2-default-state {
> +				cts-pins {
> +					pins = "gpio8";
> +					function = "qup0_se2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rts-pins {
> +					pins = "gpio9";
> +					function = "qup0_se2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				tx-pins {
> +					pins = "gpio10";
> +					function = "qup0_se2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rx-pins {
> +					pins = "gpio11";
> +					function = "qup0_se2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};

Can you combine these into a single entry, i.e.

				pins = "gpio8", "gpio9", "gpio10", "gpio11";

if they are all the same?

Thanks,
Stephan

