Return-Path: <linux-arm-msm+bounces-40401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4569E47EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A412165057
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2611F541C;
	Wed,  4 Dec 2024 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fB4WuRcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CE1F03DB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351781; cv=none; b=SjG9j+6QZHjx1F4dcTTO09AEaRqowxmsfe08YSvYp2kXJPKiReJuuSj4k1vEQmzgQa9joR0VUfD5BEUAy0FW0rphqQZ7hi9GzezoH2FcbAzBxfJDB7gLcDEyraOG2xVGRYPzpyCdV2radvkWS+SfEBP943xInMkq76Qu/zbTHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351781; c=relaxed/simple;
	bh=8nyNe6nBOf2Dk/jqULA7hpqv08Qyov1aCsfLJP+e0ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci7MZxzko3ZpGWZidKlAzc/DEXFZQdBs8zqY3J8NYNdFKb8Wx5NSfoM/lAFFqJ2IiAB3PWctKvFx0CtH0a3pvhsA3SXhhMRNso9xsj/fweoeLdGiJQ8KiPluGxHNfpksF+mFuWCbd6KmLjlbK8oBK3kJK+XaL9Q16+W+WEf6AxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fB4WuRcM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df1e063d8so467149e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733351778; x=1733956578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mmQIbMpMz7O0AOKTkxfl8dFrxJ33xOJobw0OfEwbNw=;
        b=fB4WuRcM3FIp3T0F7f5PzJzFKbU/bMYUYGPDay+g8J48QH0dCklAeeNTvHN3ZmW/Yd
         9C0xzANYRgGvyyjJxKgQzKq1mRnbNWxpkFdrKB/XVHomB0HhOZwlVfQnbgCrkgB3JFEJ
         JFgH0auMNwDgnydg/bUUCSk6vRZk07hwwJuYtnXfwkDqdQFMRB0O+5dfXToOQbH0DKxJ
         9qkDmYVDfxCj7Q0jrdONvImyT3Q6YJ/9Hi8R2DLDDWXhQBjbTkmZOz1S1/k7/gI7P7ek
         O7EkwK42zF/uvdRPRGogcgaflKYKCJ+qv1hj2asg5NwIITHtI2+Va7d6K/APbo0YKG6A
         cEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733351778; x=1733956578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mmQIbMpMz7O0AOKTkxfl8dFrxJ33xOJobw0OfEwbNw=;
        b=fhYdQNN8X4XEI7IR+f3mrhQDAepTZf0MRbWqbNcu2Y5Y0i2CYzu9emgNua4WWv/ZsY
         wQGQTo/ZSlFOHbLEjafTxeaB7/ddhmdneC7v68IIxG0l7M3A4Wh2YdOM+l79zU15kRb8
         IIZ2kR77VV2GGiKcUwNK1rKON8Hoa4dLb906+tdj40Ks8RR3qguK433jf7n5gqjrjBJO
         o/1MpOfOfKngzQnkjqCoyq3cmygePPyPq8FYRPOUtx4VjNM42foHG3zD9bQ0pw1UCZHG
         7vh8gRvOc1Jn3fuIgk9C6NLrVtUkFb61M32y3JU4tnOFvlusG6+JpTRdHpFqtnDp5Pcm
         aulw==
X-Forwarded-Encrypted: i=1; AJvYcCUKJ+LZ66S/995OD1hmVbvHhZ45JnX7BffpxdPSOpvSwrUSJ3xaaatTvyddKeyBTPpVo2K7dIPtEDfmv2q5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xaRtU1qPOJ5VMqzyCWwFhnJGchSPjDmxcdahbAz1FStyUg8O
	ssi4Iw7JCaVIN7dAWkLRuEtZLQaVykzv846f8miYXar6kHCoEjY6kgyzDgZS14M=
X-Gm-Gg: ASbGncuxgCTinWKLeDrLWH+qt/qZ8qF/2yxWMrN+WBYwgzXBokkhu1gLk3UqU3s7wB4
	yYBn8jji4L9QAo/6sraGc1ARyXatoe4v3IFveDmwiQS0oEZboogEF6r8bHy1YQ+varQ3Hy04IUC
	inc9kuFm7UKYL3W8pBINvkdrQMsEAOy8xig4pN4rjlX4O28vgabtRODGL0eLJXMn83TxOto7JvX
	UmvNht40vHTNt1T8N5bk6RlVYIxqzT3AoSADG3xVgO4JXCC/KBH3OGQ1RCyarDOYMTJ3P2lQ+Kk
	03xtFITeZ86uFgyH/Xhh0wk1hy3zrw==
X-Google-Smtp-Source: AGHT+IGuGoCD3puMElK86ZdB02YG7dUQkM6ohz8Me4tads6hOhrBog3l0JNlc1YxUZmWAvJj211T6g==
X-Received: by 2002:a05:6512:220d:b0:53d:d3c1:9fc4 with SMTP id 2adb3069b0e04-53e12a31944mr5017238e87.41.1733351778075;
        Wed, 04 Dec 2024 14:36:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca47esm21650e87.264.2024.12.04.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:36:16 -0800 (PST)
Date: Thu, 5 Dec 2024 00:36:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	=quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
Message-ID: <garuc5au5464xpmj3exlull4o2763xrkqubplde56xmyfhfhmn@cpd4bbt4dfyr>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>

On Wed, Dec 04, 2024 at 08:33:20PM +0530, Viken Dadhaniya wrote:
> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> support SE(Serial Engine) firmware loading from the protocol driver and to
> select the data transfer mode, either GPI DMA (Generic Packet Interface)
> or non-GPI mode (PIO/CPU DMA).
> 
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..a26f34fce1bb 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,15 @@ properties:
>    required-opps:
>      maxItems: 1
>  
> +  qcom,load-firmware:
> +    type: boolean
> +    description: Optional property to load SE (serial engine) Firmware from protocol driver.
> +
> +  qcom,xfer-mode:
> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mode respectively.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +
>  required:
>    - compatible
>    - interrupts
> @@ -142,5 +151,7 @@ examples:
>          interconnect-names = "qup-core", "qup-config", "qup-memory";
>          power-domains = <&rpmhpd SC7180_CX>;
>          required-opps = <&rpmhpd_opp_low_svs>;
> +        qcom,load-firmware;

please use instead:
firmware-name = "qcom/sc7180/qupv3.elf"

> +        qcom,xfer-mode = <1>;
>      };
>  ...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

