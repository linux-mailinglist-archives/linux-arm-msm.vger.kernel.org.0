Return-Path: <linux-arm-msm+bounces-14080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9787B818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 07:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5C41C22008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 06:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899345677;
	Thu, 14 Mar 2024 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBTJMn8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA15398
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710399367; cv=none; b=NmyXZ2pclkAZKBM2W5CwwPs1xmYsm7g8aljdKJ6Eo8gvvgqldR+3jCvX0IMKAlTUdV2RK6KAn2gcFq8GyvTEI0RrH4C8dtoNx4l+enqUzGXyGirf9MXftCriVOj+dY9SkQGHRVhv7PLJ7PggyBaXKhdZAqcnxhq1TCJxSpQ0fPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710399367; c=relaxed/simple;
	bh=ScvJR9e+IUmaIppQzVF9209j+jrkMtKvY9dGw05D6ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+4C2pzX/a4KDGPpWqXKfh+xahCBy8MHQg3lUfMR4TANqzZXCMT+0wMWJhDo6SV1aUCubQz5MVkijEW8pxC6jK4TtD8Tb5YoQ9sGZ0VWz4Jyf4/RLjLncF/VfBNA7jZcH/1WkpmJid7slDXFwBgTlvVHE+HW3/c+9yUuW2pRuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBTJMn8W; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-413eede49dbso3604745e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710399363; x=1711004163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ODMItIFfIliVR/2fgKV0McdXY87HA4sQWGAc6B5tQA=;
        b=qBTJMn8W1oAc7rGsOVgadBEi28uvoivVdGIjHH0RvVpnywEMUEzi7kHDWwmsYBIJqA
         W6uZ1RgGaChs7sGRDLXvWcIfpW8+7t/lMHCKgKE0egqMtTVinxMU7IVQqP/fVsacwrZd
         XMrSH8YuxCK/QsMmy4o3COKgwUb3OrG7oSNOvJk5spbi+1956//QyrdbP/VJJS+L/zIT
         44hCa6ARHSEbKCGmfz9Gp6ZkB+Lpwzjhfl2WlEVPMajwkXcsEdU8vFQA0DJ53CUXAs/T
         anKK5cWHY9Jb+sD5pK/OBldYpmz0BGbrq05eSVQflls5uacrDCBxVPkvbBQYu8ikHJm+
         Au5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399363; x=1711004163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ODMItIFfIliVR/2fgKV0McdXY87HA4sQWGAc6B5tQA=;
        b=dM3Etfr56Fix7yMe9WtG52bjtF0gdpTj5URKI8KJHn6hpFIcxu8kSEHAubNabGYmKm
         0A3335lH5H8JVH08HlwdaYE0cNkPObpDQQmjzp3cVz687Fzdz66GkSO9EVF4DYChUjWE
         R3ttEPE1WZUPN6hNkVLtLRUyhWi7noUSBSmkYNXElHoHDnIg3layLSKOJazNwSzQN5ER
         D3molyuoatnrPUhlp7BUwQa+2XXqe7ElmCcY3czOGRtl2aj8K8/gc3E3JE97OsqCMdh8
         F7O86d2y4S8/8iSiRXH6YUcgXrYTTpJcEomXAYyf5vjcasFBbdagjeBfKeIse3RhSIES
         lIYg==
X-Forwarded-Encrypted: i=1; AJvYcCW82icDDVUXG+74vBogOuQzZyMNWgP1dRYCqmWPTwLLahRm1X13k03zsDk9LYbp/RybmsBKm6JlQB02ST0Mlguf4OQPNfmL9OhM0urV3w==
X-Gm-Message-State: AOJu0Yw9t8kovhxsuosjre36lvlEaV6wKVGOn3rFOVJBjwc/FG09pHJK
	B7Nuh4Q9UGwkdlYD1yWK7fcAmxL+WarywyP+kAaz1qmxvx7HrBTUyzhIu0BXtXA=
X-Google-Smtp-Source: AGHT+IGQ3RD5Vlr1YHs+yA1FvdR1nvHGEm9pqQxSi1fqNhifG/CVxFFJ2koTGPduOX1IymgC7pL+CA==
X-Received: by 2002:a05:600c:1912:b0:413:e4cf:fdcc with SMTP id j18-20020a05600c191200b00413e4cffdccmr682519wmq.15.1710399362984;
        Wed, 13 Mar 2024 23:56:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id a8-20020a05600c348800b00413f52889desm328813wmq.3.2024.03.13.23.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 23:56:02 -0700 (PDT)
Message-ID: <c7ac2b10-eee3-4269-85e4-a68d24c2337a@linaro.org>
Date: Thu, 14 Mar 2024 07:55:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Add three missing
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: quic_ekangupt@quicinc.com, kernel@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240314063334.31942-1-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240314063334.31942-1-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 07:33, Ling Xu wrote:
> Add three missing cDSP fastrpc compute-cb nodes for the SM8650 SoC.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index ba72d8f38420..c238ad1be0d4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5084,6 +5084,35 @@
>  							 <&apps_smmu 0x19c8 0x0>;
>  						dma-coherent;
>  					};
> +
> +					/* note: secure cb9 in downstream */
> +
> +					compute-cb@10 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <12>;
> +						iommus = <&apps_smmu 0x196C 0x0000>,
> +							 <&apps_smmu 0x0C0C 0x0020>,
> +							 <&apps_smmu 0x19CC 0x0000>;

Lowercase hex. Please look at the code above, don't copy downstream
code. This applies to all your work: don't send us downstream code, but
clean it up from all of its problems.

Best regards,
Krzysztof


