Return-Path: <linux-arm-msm+bounces-38445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289EA9D3894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BB47B26945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A9319E802;
	Wed, 20 Nov 2024 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuDE3e9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E419DF4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732099417; cv=none; b=maxsOB7B6MqYinL1yZcq0X6JpA220CMvoy3VjCe09Nh7rA06R1FL2rMTXCb6XxlD0uicG3YpdKt0XWUQ+tYV1a7UMR92hAjri1ofRWYyCcPTsPaOlj3Mo1ZbWE6H0rgyAqUs47akqXI7wkHYHZi9CIWTqMoRYJbrvXLuMu7BpZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732099417; c=relaxed/simple;
	bh=V+/MEtn3nVo+kVuLjA7VUTnQYml1jSRYhfqMcSBxIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0T553tL2PyPwYHFsh/+TVUWswvbYWbonxYscd/Sc5PlzbAX1h45oJ20tUMuYtlDfun3iv+cAibjmhOFmkGxa3ciwq7G4PmBXPT5V+3BlrPfpotR3uN6v2NPEIe2Oz1aypiWLONaBXtY70kyB3Ft9GmT2TAfJ59MbVl08wIjoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuDE3e9Y; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53da3b911b9so6160701e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 02:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732099414; x=1732704214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=56B0s+ajZzOmTEonufappGobLQWqg2YeuA0usKhiLy0=;
        b=CuDE3e9YmDLFvB4b78HezQWYQgjoIEJUDiOI1eFpq0Of5RRzfuHMmqy3/gmMBOvObB
         phpGUN4uacvXFAzahZ15G5pplfB8U7mx/hUaYWK5qMSeAZjs7MROkea+ZvKGRqb2+P4Q
         boD1G96ooU8+pOACU5TSjgANjDbFSNwD+Yi1zxeGGeloocY7g/461XYB+S2Q4i9lEP+C
         pbXI2rTD6VdaKwOerlXndK6dfUilLd9eeKTj14M3Tszt8Xf+BNDA0jw4Ipawvyta8L1o
         47xuYv/7RxL79aI1Bw2/w2PhfDgNPrFnaJNJgQjtSjMKJbBxpRXDNXe/nRLrcNoBq8Ym
         a5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099414; x=1732704214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56B0s+ajZzOmTEonufappGobLQWqg2YeuA0usKhiLy0=;
        b=P++pokom4Rw+33HdkrR0JceM0XPNDRLsefM27L6ysBZ90Kg3WcZpgc9srqmIcj7Exs
         MH1l3L/Cyeypz1JZhZFZBQy2fYWYwNaEpFWTqKfZqK8P68vufGugVpfgsZeUOrnJkEpa
         8WbTZ8NpB69bL+qjcXKd6xML/bacxSo2JuPaEVjks2qGCwQ3rfhz41I/wNuEL006DmQ4
         n4Dw6XVatkTyrKH7qNIxUMFWTdluteyWnhSQBMVQjnH7EUCu2mxu6Hd2hpfbTBW4AeNU
         3LDeFNmbtRVMtMrjJltk4bsasD7YZMx6MNlvFcDzgPZ0wNuZCFfFNyyOIOtZCLv7MUK+
         0VCA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xOBbGAWUOlLfk4GbC+g7Qk0mQzKdVdS6ZcOVxjRU3jmoX1TLSuw++plISiCRmqyfazMw5xkHqqxaglmD@vger.kernel.org
X-Gm-Message-State: AOJu0YxxYoIe2gQgHgDko/4z4uWN++FJXNGA5e98Tc+N/UHo8qb2XT8u
	jUXAypoSs7FvdKXnMXFprDTALPY/MSo738IfmgOFTDl/J43tAA+rhZgPgiRQgHw=
X-Google-Smtp-Source: AGHT+IFtz95KHAingBu4+6JxpvwiZFXOgLDbTsR4XQYWIXQ/wmYoEfAj4pt85XX8+TRQgbgS5MkOKA==
X-Received: by 2002:a19:8c02:0:b0:533:4689:973c with SMTP id 2adb3069b0e04-53dc13343ddmr608112e87.23.1732099414065;
        Wed, 20 Nov 2024 02:43:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3edca6sm591093e87.27.2024.11.20.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:43:33 -0800 (PST)
Date: Wed, 20 Nov 2024 12:43:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
Message-ID: <454tdpuglu23nmxfqqesv42h5rk3vqiji7spo3naf2djqwojqt@6x3ram3lnlkq>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120095428.1122935-2-quic_chejiang@quicinc.com>

On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
> Several Qualcomm projects will use the same Bluetooth chip, each
> focusing on different features. For instance, consumer projects
> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
> SINK feature, which may have more optimizations for coexistence when
> acting as a SINK. Due to the patch size, it is not feasible to include
> all features in a single firmware.
> 
> Therefore, the 'product-variant' devicetree property is used to provide
> product information for the Bluetooth driver to load the appropriate
> firmware.
> 
> If this property is not defined, the default firmware will be loaded,
> ensuring there are no backward compatibility issues with older
> devicetrees.
> 
> The product-variant defines like this:
>   0 - 15 (16 bits) are product line specific definitions
>   16 - 23 (8 bits) are for the product line.
>   24 - 31 (8 bits) are reserved for future use, 0 currently

Please use text strings instead of encoding this information into random
integers and then using just 3 bits out of 32.

> 
> |---------------------------------------------------------------------|
> |                       32 Bits                                       |
> |---------------------------------------------------------------------|
> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
> |---------------------------------------------------------------------|
> |   Reserved        |    0: default       | 0: default                |
> |                   |    1: CE            |                           |
> |                   |    2: IoT           |                           |
> |                   |    3: Auto          |                           |
> |                   |    4: Reserved      |                           |
> |---------------------------------------------------------------------|
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 7bb68311c609..9019fe7bcdc6 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -110,6 +110,12 @@ properties:
>      description:
>        boot firmware is incorrectly passing the address in big-endian order
>  
> +  qcom,product-variant:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      specify the product information for driver to load the appropriate firmware

DT describes hardware. Is this a hardware property?

> +
> +
>  required:
>    - compatible
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

