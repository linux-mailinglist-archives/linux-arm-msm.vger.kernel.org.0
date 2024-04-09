Return-Path: <linux-arm-msm+bounces-16980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01E89E42B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 22:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 990E1B218A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAF71581F1;
	Tue,  9 Apr 2024 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YVLxO2VT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F7156F2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712693373; cv=none; b=fePOUKdRrMStzuGBuZ38Wlq8p7jJ6MKpMO5UqAeFoF6/6wu6M6pewSUvoxQqN2owR1Mv23PnxsLxZKDgUrIEh8qOX4E76v5dkVlYhk3t93W6YqG0tjLBPslmKVTMux1a1zRelNrndka87AIIEet5n+jwmdDXLUmc/J+pM5pemQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712693373; c=relaxed/simple;
	bh=8VFIYG/HL7BvpwoWBv8E/3mquKkvmJpt4VpuN45Ttvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFBM+P8wiBisvNKIsAYA5tO3T+1HHZCH/W76jOE/gYh0n/OLywXJ4GGEyc5vuAlzsN9VyCjodkOWuj8Oo/MjgVHxmSf4z9+9CEYvTdSm0d4lMC/8GJAmrjMX4At/1SJmoUd8ZaWbdrVehwRHKufFhI64z82KKV3fTlo/74fLgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YVLxO2VT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343b92e54f5so4503028f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712693370; x=1713298170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=anbYT1hNakZn+AZw9h2Dqb7sHuoewOVNw6ZzwzUNulM=;
        b=YVLxO2VTJQDWV/xc2ShRduzJBkyYDiNHk+XKwcZ2b9gbjMRaBcC0K00stYr/mZTXS/
         N1LEvtj+yLssyE7irdFxBXMiYtU2Gyk4L9aXymFuDSNZDIFjTDKBFBYe3mAhq2mTe5S6
         XFpZnQmjSAalxuZplbr7RmGQrGw2KJCeZvOlwMhcNyHtr6GmwdtOuebeadKMP/PNaWAY
         SElCdBA/FrNut2QHMAhJ8uUDgAevSP4d25XRUhjVcb3ATbgfqFFTQhJWyQ8pwQiVK48h
         8hoXzGuxUxOWuAaxJfvfQmhWCu7vPuyPl66DJXkeo6oP3YQFb1IanxkipTq4MeutZJrR
         WQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712693370; x=1713298170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anbYT1hNakZn+AZw9h2Dqb7sHuoewOVNw6ZzwzUNulM=;
        b=BacrqDWyhOliKIpaOkRJ7c6TKtaV3aayFX6m906xUxw0vOCF6R7wQE/nn5LGynl1W2
         6T7U/ABsmA8joAFfI7uTnaOkIaGgG4C44aLeNsxTnvDGthKaVp+qd1og5Dcr+7I010vW
         7IzfGF+VLx97YRO9hM/BeUApjjdLRtsMB224XxKIw7KIVebs+G2GBVPue8M5xk1zsb0o
         XbrrVMYf0h2YBxka8rNpuw09GFtF8fqRqW0g5eb+f7bOnDj/RBUsRPcdidtYn2Gu3k92
         UPkhodjz82gV+jCbK5DqNMPsf5AUUitsBf2+WNqKUJ7G0IkMAyNA8O/5hzSjq03jrF2o
         EoTA==
X-Gm-Message-State: AOJu0YyaMJxK7Rp5iUHg+b4QbvHasawrHwWt87N15KHPuNqaXIujw8V5
	cnY5G2PL5+QtT0c4qRiBzzVasLg0G9ku8JLpX1Cdu5ZBJjpDNLZYfoXTUYWU4qJpSbt5HAryyTl
	H
X-Google-Smtp-Source: AGHT+IFlo0fOsHtnodAKo5MMyTpY5Z158Y8mZha1e+JPajG+OUyyd70YVlpTpO942fBt4Vzy7pMQUA==
X-Received: by 2002:adf:ed8d:0:b0:343:85f5:63f1 with SMTP id c13-20020adfed8d000000b0034385f563f1mr458169wro.40.1712693370334;
        Tue, 09 Apr 2024 13:09:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4c91000000b00343cc702c56sm12220479wrs.47.2024.04.09.13.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:09:29 -0700 (PDT)
Message-ID: <019180df-67b9-438b-a10d-f92fd4ddec03@linaro.org>
Date: Tue, 9 Apr 2024 22:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dt-bindings: phy: qcom,ipq8074-qmp-pcie: add
 ipq9574 gen3x2 PHY
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240409190833.3485824-1-mr.nuke.me@gmail.com>
 <20240409190833.3485824-6-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409190833.3485824-6-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 21:08, Alexandru Gagniuc wrote:
> The IPQ9574 gen3x2 PHY is very similar to IPQ6018. It requires two
> extra clocks named "anoc" and "snoc". Document this, and add a
> new compatible string for this PHY.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 31 ++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> index 634cec5d57ea..017ad65a9a3c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> @@ -19,19 +19,22 @@ properties:
>        - qcom,ipq6018-qmp-pcie-phy
>        - qcom,ipq8074-qmp-gen3-pcie-phy
>        - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,ipq9574-qmp-gen3x2-pcie-phy
>  
>    reg:
>      items:
>        - description: serdes
>  
>    clocks:
> -    maxItems: 3
> +    minItems: 3

Which binding inspired you to such change? No, you need maxItems. See
your previous patches here how it is done.


>  
>    clock-names:
>      items:
>        - const: aux
>        - const: cfg_ahb
>        - const: pipe
> +      - const: anoc
> +      - const: snoc

OK, you did not test it. Neither this, nor DTS. I stop review, please
test first.

Best regards,
Krzysztof


