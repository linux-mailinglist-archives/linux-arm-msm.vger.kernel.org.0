Return-Path: <linux-arm-msm+bounces-46213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54ADA1D357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8AA3A249F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 09:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07881FDA6B;
	Mon, 27 Jan 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4NVy8Xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA421FC7CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970115; cv=none; b=PiOMrSJMCo6kynxoZnbFSanNaYrWza3UAFrqyC9ZrkIthVAJp54wUziaoE6C1dnNLWCP0kZHseg+Ytrp4E9uDSW1laMOxy80yV7UWlu71sgogsnJKDFaQY6xArlmidbyDQruG3K2R5WYXczQLxM/YnxoB8zcyXAewnweqo+8M4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970115; c=relaxed/simple;
	bh=jG6C1oQBMCq9LAc/Rvpv8xIkgJhrX5pH93bT32/ipBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ2TdvT7HNLfewIV6LV+Ttm4UZ9LF47TdzTqWY5UYn+I3ctUMEolVgvOZP7wzkrK8lbCm5T42vT1Sxrvd6aQqAULobBJ27WdAqfTp46zR0LFig2BDXkUBYoLbmxtVg5YFFpg2PyxClcBFkNu5+MYHFz7ic5+dwcFYJ8eenDT4ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4NVy8Xk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso6269053a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737970111; x=1738574911; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dijvCU0SPZdtVsHE2T2w5uYrQzB+N6hQhFYPYAMrz9o=;
        b=r4NVy8Xk3Pa7Z0NHyi/B17zUAaG3GKol7Hg3cJP3bPDYO2a3G17GojahIe/oXNWoTQ
         XbvJYN+VKlCLUaj4dI88iGL91QqTJFLALscNUVy+vubfGpVK+bsvmeCz/q78m0Z7sisn
         SGHdM218geVKvvYXHGOK3NhPjPCkyxsr9pblbQzq6ELzqAfMXGNUO6JxR1lAbnoV8Lql
         o3NVYKaDLoozB+9DZD+LsNa8skKHgFCW71GQC/S7nC2JfvKOAoJ541CAGUZ4ULitygyX
         jowTkMNymJC/EP8x4AKBJ3L2zwFBRMEklQnwnsISyZ3z1BlOBUsNYR+5nQOIMkZRLL8Q
         ZAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970111; x=1738574911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dijvCU0SPZdtVsHE2T2w5uYrQzB+N6hQhFYPYAMrz9o=;
        b=IhsOamGy0Iep3Xp97EBiPVY1mQrBGuaTFnEtBYfmTuhb4q9mgSZh9ly7glL50ZNADb
         NwzRu/uebu+VjTko9HFy9Ix9tcmJVkkY9ErGum6bNInlkHMTUcx7wY+/YaBHMk1LlP4X
         zUdVEFdabgClP1ZCzXDW4RG/bqL5tzk45K+aA0iDRo1hUz7kx2GDKmuvS3O/5E8jg9G7
         Y3Z/1oCdYm+KhLwlRU7X5RtnYgfSIzp5ibZfuGbABzUC/8cVh0kUSIRjIrfyVOiTk6bO
         bUEiLdB3caSoqZNmeCHJAWJl8JB0ya43t4fpi4+FOH42XRPyyeFeepGtgJ/hrQ746O5i
         5EWw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIAG9RmNWUsmsxTY9ES9peymzU0vHAB5k3FidQKh/Y4GlGCqjtRkYtZbhwPIzfQB2ChjZWlxgSW/Lj8LO@vger.kernel.org
X-Gm-Message-State: AOJu0YytHVTm6UKaDiT0qIJ4CwBTuI1GTIja23Ro07V1fZ9hzqmYww81
	aTmbwphUy2JwuD3Geq6oOChKM8IKDX/E+jjKYFU5DZLnUfL6jzYRY53Au40EPfU=
X-Gm-Gg: ASbGncsrEVvCmsaUCGIELxX4ik+w1y9Rjnl/B+8wuR3SbbOhJFgdylV5L0uFVpSYroy
	KwhoBY69ldv+qaoG52dgmOnGDhEx1QYqCpHnzJwll+H1Mj6D3y8r0YMjGv/EDJgUFmnZemWcORY
	qXnrM2usuLepn7KKuAk7qhE2mKkiPIO1Lzwud5KFfmJLeihAvCe9GVKkaRsyqt/jbXLs9qahNki
	M3CNA+ewHbPq68YeOg4JmYaYj+nM8YFMIQhbBvcOudKnUGJqU32p3csRa9w2YelrBvNSi6Ey/qW
	/18KKTM/1BVLGeFP
X-Google-Smtp-Source: AGHT+IG/PK0i4cjJBXR80fck8NTF0pr77nNVOKwW0u+ZnYmXiYMPZNiHwSdPWJd7JmifLLUGyuml+A==
X-Received: by 2002:a50:9357:0:b0:5db:e91a:6baf with SMTP id 4fb4d7f45d1cf-5dbe91a6ce3mr42059947a12.14.1737970111005;
        Mon, 27 Jan 2025 01:28:31 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d8b37sm5108857a12.72.2025.01.27.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:28:30 -0800 (PST)
Date: Mon, 27 Jan 2025 10:28:28 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] ARM: dts: qcom: msm8226: Add smsm node
Message-ID: <Z5dRvI9psN4hBqah@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-6-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-6-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:25PM +0100, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Add smsm node for remoteproc cores.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 34 ++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index caaeeadf289f78d29403312738bbb714eaad74d2..7e0838af6c2d0dc26e0082471b70578bc627491d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -253,6 +253,40 @@ adsp_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> +	smsm {
> +		compatible = "qcom,smsm";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smsm: modem@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		adsp_smsm: adsp@2 {
> +			reg = <2>;
> +			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		wcnss_smsm: wcnss@7 {
> +			reg = <7>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> 
> -- 
> 2.48.1
> 

