Return-Path: <linux-arm-msm+bounces-75884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96031BB690B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4635A4E46BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A8626E16F;
	Fri,  3 Oct 2025 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5MpwQ9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693926B2AD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759492430; cv=none; b=qaZsLVjE1IhTMX47Hb7R61a3PJYEvGWEmf1xU34pmKmyyuY/cvTkpYlY+2zwnDJfYFyROrrBGWN8I14AXmEBZjAdC8e64eCvYtcn2lfZHJ5R5N3lpYFR0Ve1Jf/AC5N9ahDFHB/dj+xQ9rnI8yMeBZogOwnN415kohxK9/hy6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759492430; c=relaxed/simple;
	bh=xxNiT++Ko9RTw9HOwLGTPFz5Lc+N7FUYBe8+a9G5faw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PP7iaY/XojAAdCJqstVc3dcFU74uQBgTPGjg4jcgj3YU+fBTkXxPZfdnnxNM0B2GjSlVWgcZUsL4Bq1cVinWhjiSwos1QELphbzhrRQ06xu099aEYpbQ9sguovEeJWo9slB0WZ9Gb8VZ8nslSjirT7nbeshpRjPE86fuRDDh5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5MpwQ9Y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso5973401a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759492427; x=1760097227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v348Sd1HyGnZQBz/neaZqbiR/lhhLUWkTvsJPcWV5Ok=;
        b=D5MpwQ9Yvwa0gPLhdrjtHBdug+tLd/dV37tlrTHl+hGtuDz2EflORc9mp1b5dGlILC
         uhf2f8ar3J8tLLD6T8GaqR1AyBDShoWlsIQPo8FcTeN8n7i2lTfM6EQ2sNFmbuvQIQT+
         KQkHG4oH071+/BakPXEaRB6GyehwBVGMu9Qp94sZlBV4zbqPrpn8v1DEJmbcxu1DqWrk
         sS+YiwWT2IEUfEE4D2LXosZxGiqRhM7zd0Xl/3vExzYfkj/ARb4pd7JLkphMBxFi2uAi
         5gj8hG1D/5t7zS8We8nIXnPNcC7SJRKultY1+olmWeSIZcCsA+16N5kqLehqxZ6macR7
         GO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759492427; x=1760097227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v348Sd1HyGnZQBz/neaZqbiR/lhhLUWkTvsJPcWV5Ok=;
        b=GPFIxQbHuLo3oIPgjHWdbI0q8l/phOJJHCcjaZ7GYj9ChBaD5C+3j9KquFwWMFPrjg
         3Qe0eF3HRSEl7MHWZpLnMLMTQJaLUxkG8ohMSpEBpM5kdx7BTrZH0AB9WH5TcF+SKVWG
         qTpf9C+i5yV8+RT4TWNbSoVatZbDLH2toUV+iMGTghhbQDutxqYqEu0iiYU6HUB05ZxS
         p7x/D2xFngv9/ydrkn83EGOePAlV8joCUtZMem5Pzr92eMm5h5upbWezOqRIVSp5a4D2
         unRnTt7CR/gZIh5xr5ESrZUYW4lEOiLi69zizLAxDMRLyLMRm33pdQnEuT4E+0w49e+p
         yAOQ==
X-Gm-Message-State: AOJu0Yydw24lDoGMn1oqamHfOaaT5dEKYEZEPDmzGv3oRHsaVGX8WGMs
	hlsuG3MNLBUt7LeyK3seiAJczG1tzDsGUr+2/TR4yVVjZXjzVJOUThZ66vJubHgJz0w=
X-Gm-Gg: ASbGnctU5LVWZPRx6x/PSVtXb61lPKUyX7ELxSr5IrwM5S3eHauNn9+k9uZMSxlgFVH
	+LaJvuoeXDhIEjuTbd4AEVjven1efmd/bt4753YOA7KsG5zWUCxS9d8MEoNX6ByUEM1OOgzsGQm
	OoHYlwTHCDseZ5pc7F+6nTPSupDmWgnmCuv5q0u6Kp6ZdMhBBS0cbsFoZfUYs2lNiormaivz1zs
	EhpBpLCGCrmP22tkYLICKu7yPAqo5m1wwPSbbp/2OuvVCoi1dkZiyJJOK/6UkvvtCWO8mluR4RJ
	wpP/b0O9cj1oi42PcS6ipAFVHqOf+s/rnPQhx+3H0F0UUWFMx7qkavQk21TGPIVIZDxy7nGBNyh
	C7zNPGkiXXzVp5IG1y7UnlINi6HJ4WalndkLhteegiisbBxoSeCJ90cxrtMSDOb5R2KJd
X-Google-Smtp-Source: AGHT+IHYR3iC2LH79LtowBLJrojMWjOE+pppainz+qSkeukLPpqSESK6b5VQ8mGniwQIYMRLlwAVvA==
X-Received: by 2002:a17:907:6eab:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b49c1971e56mr369945366b.9.1759492427304;
        Fri, 03 Oct 2025 04:53:47 -0700 (PDT)
Received: from [192.168.0.25] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7c47fsm430327666b.37.2025.10.03.04.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 04:53:46 -0700 (PDT)
Message-ID: <8e687353-f505-4122-bd46-57ba0d84dabf@linaro.org>
Date: Fri, 3 Oct 2025 14:53:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: firmware: qcom,scm: document SCM on
 Kaanapali SOC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
 <20250924-knp-soc-binding-v1-3-93a072e174f9@oss.qualcomm.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250924-knp-soc-binding-v1-3-93a072e174f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/25 02:31, Jingyi Wang wrote:
> Document scm compatible for the Qualcomm Kaanapali SoC. It is an interface
> to communicate to the secure firmware.

Same nitpicks on subject name and extra sentence

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index ef97faac7e47..340b754e6322 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -31,6 +31,7 @@ properties:
>            - qcom,scm-ipq806x
>            - qcom,scm-ipq8074
>            - qcom,scm-ipq9574
> +          - qcom,scm-kaanapali
>            - qcom,scm-mdm9607
>            - qcom,scm-milos
>            - qcom,scm-msm8226
> @@ -202,6 +203,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,scm-kaanapali
>                  - qcom,scm-milos
>                  - qcom,scm-sm8450
>                  - qcom,scm-sm8550
> 


