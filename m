Return-Path: <linux-arm-msm+bounces-24716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACCB91CCD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 14:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDE67B21366
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 12:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2374754278;
	Sat, 29 Jun 2024 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glxRhO+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D629429
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719665807; cv=none; b=M39VRME6P4IkO23vVKCQkpsHOZ6+/3j9IpdFKCmgK20XvNT9MTU1T3sqzRflCU7OOBcbGDGw45fkzpnmE3/k8M5z0SQ2Cvml2dCc2dKpCUbwZEODB+/HoI9SFZgZtq67Z9FPr0gYdh5RXT0uNRIyLlFTiqpE/WRJoqAU8bDB37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719665807; c=relaxed/simple;
	bh=aoX0AYKkE/8EHAJYrYxVzfMl8NYAv9cp+xERbNhnvDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bpfj2J4TOctK6hrizfC1RtaUwoL8RdNWczUeHiF8gnHouK2Lox0HLSD0GnOgEW2VTmalsmtZkA0Sx5ZXy5kCOKnoRLI8FsknsrDmqRMaZLk+tiNvJDjEbzLDXLegSWD4wgGZw7GXtH5lxwc3F99jN6aRP5AaiUGNIXhhJA6dEo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glxRhO+R; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a729d9d7086so444928966b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719665804; x=1720270604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VLCFevl+bnXSYKqYiNMt3y9w/Slf85G42xq1zxOL/VE=;
        b=glxRhO+R6AL5j1h8kks/6nJumjoVu9jcssqSPMtn/SmHPldhmpQB7DIMGWLqkdiBJt
         V1zzbNfoRVFTiOrq96gdEqyD9Tgzdu331O3my1Z8Iu5lHTpGh2Dc82G/xMJ4sq29hqua
         BmwzQ4dVJJ5YlySIf0ugaFVFW8CJPiYGZhYa8YhEsAFX6VE4lShlMLP63R1wA2ep8nWC
         tpUVSPQLZILU8/GPIakGvTw4cAfv4dsrY8owwJDUmeGcQEAh7gfCAunMrgg53IHKj2KE
         0zydoMgg9fYmxYtDT2rp2wEqR4Xrj96Sp757ibGafKh2AugrNYyAHKZYF2jzStQExU3Y
         wZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719665804; x=1720270604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLCFevl+bnXSYKqYiNMt3y9w/Slf85G42xq1zxOL/VE=;
        b=P7VBNr28Htg2wFqYd/JLJhr3yx6bAXHTDi3aFGYOhBwX7FFVoFMM7nNAkAQddRNHQH
         ROzlbB7i7ZiV6LOztSU5ra728hm+ex3pwEOuiOPUgYtpDs3/UjbzZ/TV4FpfQrGErbZk
         A/m7W+uvU8w5vQmLqu60mzjos2EwPZB6VXCvtn6WxVHsYjwG0sthueEWu5dM157V5S7H
         7OR+jINBCXzJTf0DYI3pIzoEKmh9GHqjcgoDZZlQKEza28Ybf1OG6eK5jV/Lqs/h40jB
         z0QhGkxeoyVx+wxYlna6uW8XkQ3/toIzDazJ783BMBMFq5D9kikFfBNi4LMhX5D3JABD
         EpOw==
X-Gm-Message-State: AOJu0YycJT5jIf/00t4zsGOZcjWIloBxm9ww4iWDBFWF7mY67hfSKLyy
	BcHPxw43oq7ENzBiE6WS8YCuz1o4nG5F9Npm0YzckekjeYLBpNM9uKDSglA2iyE=
X-Google-Smtp-Source: AGHT+IEFToXVictsFhLt27KEbw2INbGmxJOI/RnHLwEHzpz95mIpAqGiJvm+Lavqpk16FUMfxkb7Jg==
X-Received: by 2002:a17:906:2709:b0:a6f:e699:a9f8 with SMTP id a640c23a62f3a-a72aeeb255fmr258839866b.18.1719665803243;
        Sat, 29 Jun 2024 05:56:43 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab06521esm161574466b.110.2024.06.29.05.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 05:56:42 -0700 (PDT)
Message-ID: <0c47c5fa-5fe2-4675-8eb9-9707f044ce90@linaro.org>
Date: Sat, 29 Jun 2024 14:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add device tree for ASUS Vivobook S
 15
To: wuxilin123@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com>
 <20240628-asus-vivobook-s15-v1-2-2a1e4571b8ab@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240628-asus-vivobook-s15-v1-2-2a1e4571b8ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 1:30 PM, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
> SoC (X1E78100).
> 
> Add the device tree for the laptop with support for the following features:
> 
> - CPU frequency scaling up to 3.4GHz
> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
> - Keyboard and touchpad
> - WCN7850 Wi-Fi
> - Two Type-C ports on the left side (USB3 only in one orientation)
> - internal eDP display
> - ADSP and CDSP remoteprocs
> 
> Further details could be found in the cover letter.
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>;

#address-/size-cells usually go at the end

> +
> +		connector@0 {

Could you add a comment detailing which port is which (like in x1e80100-crd.dts)?

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&nvme_reg_en>;

property-n
property-names

[...]

> +
> +	ports {
> +		port@1 {
> +			reg = <1>;

Please separate properties with subnodes with a newline

[...]

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie6a_default>;

property-n
property-names

Looks good otherwise!

Konrad

