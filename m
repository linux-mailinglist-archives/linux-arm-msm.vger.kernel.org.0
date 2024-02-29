Return-Path: <linux-arm-msm+bounces-12998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887B86D138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 18:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB8C1F21F92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 17:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5443275800;
	Thu, 29 Feb 2024 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fUmIaXT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB89757FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709229319; cv=none; b=hJGk5S29lU+1v4X//jYmgE7KnJ37jEez+nlVLX+14lyflO4hT/zGIUnXh58IIbEuNEPTjOvDbLE3iFcndgPSRVaFI0k2rmCGkwtmdu/5n0O/JY75ZthS+2C3bI55IszDk6z9nev2C4isxBpAAPTOo7VH732J/yY42FvQ72k0wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709229319; c=relaxed/simple;
	bh=vKxNFS78uD0E5j38AWn+sBz9ITWXnKyhlNNJEbUO6ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XndqOkkInjC9o1rQZ5iGyb1O0KKqLdy+YsbO4NkFCWhrUnvjHSLFLREpJ4y5N8/yvQ9n3MtrVlDnItMMvjSZ9AfVWgrBaisQRtQEDc3P25TNmLtil0Rne9B5OHEphBtGoM0D9fERkkwssERps3NNEgYWxPocvLmIQ5r4BLGCB6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fUmIaXT3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so1880931a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709229315; x=1709834115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ep0WR+ChrFSVu6soC87wXbpyqa2oU4ugQ6MkkQ7GOxg=;
        b=fUmIaXT3LMTSnsZCt4ARxaZu2JOrR1qu/BJTPYzQFn1sTDfG+7085tdT/9H3mS8OEW
         1SOz2X2EMcHxH1vg1UZ/aOpPbQ5S+UtxiDgRNfN3VUpuFDTOwAPybjDEZn4WxFCa4xhc
         9Jvnp5dlZ3Bs5zxMYyDaD7+uFAMQT/yLbC+xqy6KI/hdiUUUGyvNQ+g6r5SCerqsfjt3
         PgpdiyqBrzKVoFSYRHP+GnNR3/Xv8QerMIXUuB6nDzU9S3FwWSZoTdfFSs0eO5Ofe/dv
         K1KZTOwP6lMMpCTPIv7F9mMei8oEe2p4MtrGF9D1wXNAqmn37yXuvp+0bDPtsPhpu+7e
         ZnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709229315; x=1709834115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep0WR+ChrFSVu6soC87wXbpyqa2oU4ugQ6MkkQ7GOxg=;
        b=f72T0CXSQGYYtwzViYJcwLDHMlzZZ5imAR7SoOb+/rwq9dvwNE5fEGbFvJ4GuZP+jS
         a9yFKx3fYcBY91apk4+DI5fmfnEO3mBMZKOzxeHXTYOR/bPBRz7sfi0n7XAI5C0y067F
         udiSQpFAWefSuU8/zfTjk1WiRO3mPKtEBIth2Z+BChCv7Mi8w6g7tHyVWC/nBh6ebXdT
         NVf3kCuxC9GfZpjmWplCMdax6XavHK8qimop2/BGK27l1QH9p4nd1C0NgblI2l8OJBzv
         FuG8ikTMOho1Qi7WSHZsRsqxgvPYT1fqWrIVFozPDLbqsyQtz1kmgaksCY1E7DYBGZnF
         /iwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX7u+xUR/jO2zex/A9mXD1fE7e/vbORFgRUlXww21Bda2tkILU/1tStfcqFrev/UWNjHVFZ3ShED/Ic3uHyV5zFYiJ/hLVMZOD/ADtUA==
X-Gm-Message-State: AOJu0YwNtaHF4bgKmfNE4DPuLkev4R4oTYvDHzNGwdzUrEj8H1nEkLdX
	ODA+R3qiNy2wfSHyMOfww+Tj2HHOG2iJ/N9Phga5kD81h/qj8UOkS2ILuem4URc=
X-Google-Smtp-Source: AGHT+IGlqcs8msF7hm2oFXU8BDHjZbeoUAnYAY8cpJdZL/vOWV9axBEkFbpSgw0FM/6B4GEhAE9n+g==
X-Received: by 2002:a50:8d86:0:b0:566:2e42:8c38 with SMTP id r6-20020a508d86000000b005662e428c38mr2080620edh.2.1709229315580;
        Thu, 29 Feb 2024 09:55:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id r15-20020a056402034f00b0056686744752sm809679edw.37.2024.02.29.09.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 09:55:14 -0800 (PST)
Message-ID: <926bde97-64ac-4cb4-8821-9dc828052e8d@linaro.org>
Date: Thu, 29 Feb 2024 18:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sc7280: Add DT nodes for the
 TBUs
Content-Language: en-US
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robdclark@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com,
 quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com,
 djakov@kernel.org
References: <20240226172218.69486-1-quic_c_gdjako@quicinc.com>
 <20240226172218.69486-8-quic_c_gdjako@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226172218.69486-8-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2024 18:22, Georgi Djakov wrote:
> Add the device-tree nodes for the TBUs (translation buffer units) that
> are present on the sc7280 platforms. The TBUs can be used debug the
> kernel and provide additional information when a context faults occur.
> 
> Describe the all registers, clocks, interconnects and power-domain
> resources that are needed for each of the TBUs.
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 89 ++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 83b5b76ba179..cc42560f63ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2905,6 +2905,18 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
>  
> +		gfx_0_tbu: tbu@3dd9000 {
> +			compatible = "qcom,qsmmuv500-tbu";
> +			reg = <0x0 0x3dd9000 0x0 0x1000>;
> +			qcom,stream-id-range = <&adreno_smmu 0x0 0x400>;

Where are the clocks/interconnects/power-domains? Your binding said it
is exactly (100%) the same as SDM845, so either binding is missing
compatibles or this is incomplete.

Best regards,
Krzysztof


