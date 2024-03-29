Return-Path: <linux-arm-msm+bounces-15648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE3890FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 01:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE21D1F23398
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 00:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5203101C6;
	Fri, 29 Mar 2024 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3VHvE81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BEF9CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711673533; cv=none; b=tnEgVNVEiRdUOcNkPdmy9iF4ex///umI1QOEXWpbmsdde2D3ohhRyVdqtuXuxiYwciGWs61F3OCp0ycTa3ihcAf3kpfsw4lL73JrLVuixTHpRFMLZGeRvCYi/WpgO+TEeoQhT4Nt56vKbRNrNKpZ00wosmp2DdFy82IvJ8qWxQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711673533; c=relaxed/simple;
	bh=27aZ2S742GNSBlNOae1k6F/LljR7D6xbIdvdSXbZJ6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btY3OcECPL7xvsyH5PzUFUGmk8+Rg9HIuynRTyPWmhyYvp67qjxyv1jFHQe0bECHypck5RmLP10WYUqio4eT1oBZLPUw4aakHiv4VGiJtjlw/+w7XerLPmmE5oRw1kxMI80ZeSWCE7TSjWE3vZiD+XoTsBq+KY97z+zv0md9hm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3VHvE81; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4749eecff7so168092766b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711673530; x=1712278330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=odkXG5UmuQtNgheOiTVLTUF5waPTq7lcQlYOQN78IpQ=;
        b=g3VHvE81yaqWe3HRe91W5i42nR695SdZlH3mvpaD+QLDFxZ0OjrmaP96xcY6T4sq7X
         XslZxiq0Eb1LAxxd2JIJNp81DB32apRrLENIqOF+O7usGbIjMWSu4Q8zeSzsjFP5OymX
         FdLzw84OMZ9REAeqKgm6nckFjKHFC9N6kwIkQNbq/wIZoGYOyMSNLftwODbtZpbKaX+o
         /ubmy4UXQogkGCEfz+zSJbXMS5JnbBRzaAsgae+7mMGR+eDX7jbkb7usTevtJhmqfqaa
         p9Ocx60bnEyyN4CsG7Uq1JjXmdloWzLI+KSLBqiavFuky3aX9Og2zGo7rF0RbBFdqhcY
         6x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711673530; x=1712278330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odkXG5UmuQtNgheOiTVLTUF5waPTq7lcQlYOQN78IpQ=;
        b=Sf7EchRejhUFXveXqZDQl9UfnKDD8XXZD88YOu4Sm9od0iAbiH3QtCrS0XYh3v8PpT
         mTdCuLo0eDiaOyLgO6Gm6N6GJ4xe6soLOrhfRZ9UMe8Ofidev/bBuRy59EHwlhPJC5t2
         IlssQGx0AjU3i9RKYQkRj8E3aoBits8mfsT+SrKsg0XDd/xH334x0DG79zphe1sGhpyW
         vwqOtJrJC+V0d6tYIGAbnCeM036Sm71tcChLnWtoYKzvZrC+I48ZBbHWKnsstbqHBuow
         4m+yhoTmvaUCGIwa8FmK8PYKUg5vF3vw30E1I3md3JnL0i9BXYTsF8u56c6kGOjUhORq
         LDiA==
X-Gm-Message-State: AOJu0Yy+m7PdHbdrqqPfess7cIBQlDfWhpNfyLSzmj9NErWGl6pCpj3i
	11uQl1kDw/3ObFmj7lox6xepBYCG/Ye+nTbX2V35Pmx5A+1dNrccpQpKlqViPVQ=
X-Google-Smtp-Source: AGHT+IHnj4Nlv4eeyrNBkDOlQWG8EVF9Kh3wXl02RSVfH7VpLYdXSfgW7V5uo0kdCttb94qY/EI8EA==
X-Received: by 2002:a17:906:5653:b0:a4e:183d:8893 with SMTP id v19-20020a170906565300b00a4e183d8893mr475463ejr.60.1711673529980;
        Thu, 28 Mar 2024 17:52:09 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id ag12-20020a1709069a8c00b00a4e222225ebsm1270983ejc.15.2024.03.28.17.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 17:52:09 -0700 (PDT)
Message-ID: <1cdbd387-e937-4d5c-bedb-b4275fdf84cc@linaro.org>
Date: Fri, 29 Mar 2024 01:52:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] V2 arm64: dts: qcom: Add support for Samsung Galaxy Z
 Fold5
To: serdeliuk@yahoo.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240329-v2-dts-add-support-for-samsung-galaxy-zfold5-v1-0-9a91e635cacc@yahoo.com>
 <20240329-v2-dts-add-support-for-samsung-galaxy-zfold5-v1-1-9a91e635cacc@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240329-v2-dts-add-support-for-samsung-galaxy-zfold5-v1-1-9a91e635cacc@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 12:08 AM, Alexandru Marc Serdeliuc via B4 Relay wrote:
> From: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
> 
> Add support for Samsung Galaxy Z Fold5 (q5q) foldable phone
> 
> Currently working features:
> - Framebuffer
> - UFS
> - i2c
> - Buttons
> 
> Signed-off-by: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
> ---

Your commit title now includes "V2". Move it inside the square braces the
next time around, so it's like [PATCH v3 1/2]. With b4, this should be done
automagically, though..

[...]

> +/ {
> +	model = "Samsung Galaxy Z Fold5";
> +	compatible = "samsung,q5q", "qcom,sm8550";
> +	#address-cells = <0x02>;
> +	#size-cells = <0x02>;

These two can go

[...]

> +	reserved-memory {
> +		/*
> +		 * The bootloader will only keep display hardware enabled
> +		 * if this memory region is named exactly 'splash_region'
> +		 */

Ouch.

[...]

> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;

Any particular reason as to why?

[...]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8550/adsp.mbn",
> +			"qcom/sm8550/adsp_dtb.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8550/cdsp.mbn",
> +			"qcom/sm8550/cdsp_dtb.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/sm8550/modem.mbn",
> +			"qcom/sm8550/modem_dtb.mbn";
> +	status = "okay";

Unless you stole one from the factory, these firmwares will not
load on your phone..

> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32000>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <36 4>, <50 2>;

Would you have an idea what these GPIOs are used for?

Konrad

