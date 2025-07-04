Return-Path: <linux-arm-msm+bounces-63721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EAAF96F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77E247B0A4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B3A2D46A7;
	Fri,  4 Jul 2025 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hK2ZiIY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5D1E9B21
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643421; cv=none; b=ZM17UC7dXrwkUMwrHMF5EUEva+LeAwDGRbvGrJws1ZesJF1Q2x/vZ9dr5eiw73X4BdmxoBu4GTP3aZeY/Bobi+KRgY53GHl+XsKQ/OseahpZ40QfNzsE3EFedB5QcxXHWQkjk1OfrauQGbtEdVXbP9/LvByx27tFwL/xLzHPV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643421; c=relaxed/simple;
	bh=Nd2ieUJ4/LjUfPGJsbtgPp6Vi4m3tStbkjvl5grTX08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtLqh2m4tlBB0OIUxHbWSGxobNGELHOcabb2LJsSH4EEvNPw9fvwIdzR6LRjkj3p4yPaKzw9VVrn+pJcLNJoE+jVGbxdm5/Sag0H0LGEIzYiuzlgNmMg7B8OP0eRM9KhaCKuezJqOvofQXAvOxNTW0ExwH3wsDPDFkP6YyiLIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hK2ZiIY6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso825199f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643417; x=1752248217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=hK2ZiIY6Knsx9D8619FL2SHIy5Pf2DFkFggtLGWAtW6VJTwIAIyV8BtEsVuz3dDPUw
         +0DlCNkFgLi4cASKFkabVl0UULEKwFNAdA3mVge39BOee73aQw3PIHORFZx1mtN27FEW
         BJRBQ01bIIt34fYN5zvRxAFGnPaJRXpeRHviBgO+ofQsO2Y4o7iL9BsROWHsydmmVGi1
         ugXDqIamghDA5vbkDlyt++C5l+n+djR9lDZFs5DzsNXr1TYBD4w+ghXuaMnKHugHmENA
         QYqHxsiNcQWmXBOsl1lQm6Oof+WOdDQyIQG5u/gbE5w07yT9sPIFteOkOOf16RJzEvA7
         5seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643417; x=1752248217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLiZwgpkLMualPzt87ntArI8waunCrBqnuH0mN0dSPE=;
        b=IO4Q18wLRii1ajNA3Yb8F86pxYkejTwx2fjwyxL2lWALvzJte4dwNFd7Wh+8bzVdf5
         qyVRBYkSNAb+7VUlSKwMooQjI/jrDDq+I34S9Yj704SjTe6UeuHzZCU+F2O+AmeIsNR6
         A0BNuBoH7RCse1AB+TixVy5gWwGrLul9VXkw9EFQWfvD5961GO1EnBt/zYSexMCp3756
         7L2t5sdSKcUX6xoQ+mV5Qjy5PqjtLt06NZhrqphNT63dxeVgvV5quLdoNL93eCY0nNUS
         8AUNJhx21UuaU9Igt7KBxuouuR5GDmKOgRVhlEgOC4764eFE/f6rRFf91IyskoqU93Mm
         5DuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl5pODlcRKTZDxPVuABCU6R/KoihCGXYFJz1iPdrLVKJRkoQIQdMdpJl5fkfkvFFd7kZJGork0glxZfvE6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5Q2Y5MAF3B3nW3XUfKsulg4ff1Sz9UNVQ0K5eJJzrWVcdjLK
	e6BOzlMdGKpVgoESU9HmEfKOj+TLZEJ6rTGbMwRUvVcADlK5uQIkj+e6xmQVK7AXCB/ieAg4wjZ
	0UeJSSdk=
X-Gm-Gg: ASbGncsLYKISxNk0qTu5g36Dx4EbrYuDVc/R+JONvh9UH7GOgo0fSBICQLDLSOcgToW
	1z4TgswDsyPW5RzVTFVE44fgDh69RKmUbBSCSm8dwZxp3HhDevktHluEbBLgcql6UEbr7wVJvPn
	Pnn7kpaSKRhwwqamIHYjaASkZZ6FrH11uG2nu+CUlQubDEc2HqQisfwNgUTOae65uMPot8Ryg/R
	uZgY9ktz8mZlPrx4jyx4j8osoOH/FYaM0rJYVmb3CJJswnmaIwOYnR5FRUZU5QX3fCtRz7vETL4
	JhgBj55lTXka17Y8uinCDTCj9bHLixkzJDcUpW7+vYRDBLz+H22kpKwrbTEvvGTOFEuQWaBYTO4
	I9DbVOxnvs0z+lxxlR5o8WYPtRyna
X-Google-Smtp-Source: AGHT+IHqM7Iy80KErSccPJqKfwLxmIXwKCu2g56lGYo/d8Opt8xmrzRkqZI8qhJs2jylA3Gj/Xk/CQ==
X-Received: by 2002:a05:6000:2512:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3b4970195e6mr2519830f8f.21.1751643417073;
        Fri, 04 Jul 2025 08:36:57 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b501sm2788217f8f.14.2025.07.04.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:56 -0700 (PDT)
Message-ID: <ad0d5ff2-f112-471e-89aa-65cd229c52ff@linaro.org>
Date: Fri, 4 Jul 2025 16:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
> --- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> +++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> @@ -482,4 +482,6 @@
>   #define GCC_USB_1_PHY_BCR					85
>   #define GCC_USB_2_PHY_BCR					86
>   #define GCC_VIDEO_BCR						87
> +#define GCC_VIDEO_AXI0_CLK_ARES					88
> +#define GCC_VIDEO_AXI1_CLK_ARES					89
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

