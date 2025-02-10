Return-Path: <linux-arm-msm+bounces-47432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F509A2F169
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6124E1671A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6675923C8A6;
	Mon, 10 Feb 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYWpdSzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB02343BD;
	Mon, 10 Feb 2025 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200976; cv=none; b=loPgl36epMZo0hWO8vJSspqePNk6lBml/+33UP2mwVBcI4fbJqNv7EYLwitcdtdKbQgZ4vpF2oubbOCjh1dGWMppE/NAh9xqjYtGsnvaBFke0G5SwKTubfoPtmK/DpsjW4n0AVLF+j4U16ydkAJMBJqcmXZehLKGawna8OO9QOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200976; c=relaxed/simple;
	bh=I0xID6K10lRi2mQi4bNLNlXp55T1ffWduyqLTDYv6Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQXaUHojNAQEJRMZvOIJ9Mpfat3NEGSCX3f/Sie53IZagqmnVtmKeW0Y+1hZscZo8XaDQNfDq/MRYCj3Z1zujVdQ0JhwhHZ+7gTcKMLRKLlkWlqNBS9ZmGmkYi5WPUyYUBv4o6G/OS6wrU0L3qi3wTmnx+CCPctwiwI3trWvwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYWpdSzL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE7DC4CEE5;
	Mon, 10 Feb 2025 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739200975;
	bh=I0xID6K10lRi2mQi4bNLNlXp55T1ffWduyqLTDYv6Qk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYWpdSzL1qH6ioZ5YAMrkCGoQqXCwp4XJ6Dq+xva3uZ1+aeKMYsdc7BnIA95TF1Ts
	 kt7x0LXeHYFiNhsfFS5YwLZdtNS+UuuQSXwbToRxv4JIqxwbHmGnoh0Oof77nkf6e5
	 91PKfdqC9Wqi4s2V1lMqDmg8xFGxXyv9+nJxMkDHiCiyfJLW8GfwUyiIHckZY1qeyl
	 0djybdXIjmUDu1BYSMi//5ybWMYxCtFbdWNh2VptIv9+FSnlEXNVY9r1JpMc/NIYbh
	 wqqF4hzWBrsuu0dmom6AtRuMHJUvaopjVYHXAAr8zyDwOGpa1xlOy+AgdNc/MNqkMV
	 GLwTEP4lL4/fA==
Message-ID: <1267c7ea-f06e-4165-8845-00685482a2bc@kernel.org>
Date: Mon, 10 Feb 2025 16:22:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] arm64: dts: qcom: qcs8300: Add QUPv3
 configuration
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250210084642.3819870-1-quic_vdadhani@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250210084642.3819870-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 09:46, Viken Dadhaniya wrote:
> Add DT support for QUPV3 Serial Engines.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> 
> v2 -> v3:
> 
> - Remove build dependencies list.
> - Rebase the patch.
> 
> v2 Link: https://lore.kernel.org/linux-kernel/20241112172337.3120801-1-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Correct gpi dma node name and compatible strings
> - Use QCOM_ICC_TAG_ALWAYS flag in interconnect property.
> - Update build dependency list.
> 
> v1 Link: https://lore.kernel.org/linux-devicetree/20241009091150.32354-1-quic_vdadhani@quicinc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 1916 ++++++++++++++++++++++++-
>  1 file changed, 1908 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9f..9239cd122c13 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-videocc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
> @@ -23,6 +24,39 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		i2c10 = &i2c10;
> +		i2c11 = &i2c11;
> +		i2c12 = &i2c12;
> +		i2c13 = &i2c13;
> +		i2c14 = &i2c14;
> +		i2c15 = &i2c15;
> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		spi3 = &spi3;
> +		spi4 = &spi4;
> +		spi5 = &spi5;
> +		spi6 = &spi6;
> +		spi8 = &spi8;
> +		spi9 = &spi9;
> +		spi10 = &spi10;
> +		spi12 = &spi12;
> +		spi13 = &spi13;
> +		spi14 = &spi14;
> +		spi15 = &spi15;
> +		serial0 = &uart7;

NAK, this does not belong to the SoC, but board.

> +	};
Best regards,
Krzysztof

