Return-Path: <linux-arm-msm+bounces-29952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E59640C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78EAA1F26260
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D538A18DF90;
	Thu, 29 Aug 2024 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aaP2wj9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB718C93E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925522; cv=none; b=hkfb01LCoQqzvSMioXWvYfIHxHHvpgFIJPmBBVAmpwhT6Mk254YegH2cm6nZl50SFvF7XOnhh7bont8RD3U1zBQRx8qNSYE7W7oaAf7Jbl5viYcu4Zmd3AswjKZEBm5nIXFSFglg7wc5paTHcty+Vi8MhJ/Nnujg59MePkfHSZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925522; c=relaxed/simple;
	bh=OAo099RXJcbttM63ckMAjAENwVqbF71mee7qDlAjrQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaiM1m3DBsD8oR+H70eTQORPLMZ15SQU0fg0W9F+H0flN3oLYHquPQWZpdst9ZPBOl/FRle10mhF6G3qyn5DUsnqUQ9YTG6d5YTk+t9Myu6N81YlOSXO5SEDnw5g8dwpVzWJK3PS9OjUmekieEEDMMHilnujU/m7sKV4gpPuwRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aaP2wj9l; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa086b077so33213166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925519; x=1725530319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hB5SEnRl60z0NnuG/LobG+Z93CxcGtVR0FdulFJjCQw=;
        b=aaP2wj9lkg4xDmDFz8jolfArVo1iqXPo9o3bDaQPT4w6ek2c4N7jRkhN32JNchj+kD
         p/fObeyRtQlYBW7lxhGFOw/broBqq4HjzSSvW/edJHd4Nt0GpLelxw7ICqH/9ggx4ykP
         S6lnwFilQGllP/ETukNfng2JqEdzpctYyETlW6jgCJIykfxi+hFqAjpTA+Q9kh9BMi9R
         WmZEPbjbnu3WJVH4j6d9YP3382OPHM9iqT5Y0a5VxdsGg6+y7N5ATMcwTC+KR+AqBRDF
         u4ivj8/09BMe8MZLrVGsLBSYfixXRqVJ4MpnmmLddlGsMSIqjFz4zRy6wBh3g+m4Q9gI
         DPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925519; x=1725530319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hB5SEnRl60z0NnuG/LobG+Z93CxcGtVR0FdulFJjCQw=;
        b=aTF0RAR+S3aDBUMV73GKK3BjbCo/Pn6Juk9g6vypO0Go4XJW//syS/yYoi4pgPrfVs
         rrWMBfyE+lUsgnrIkTmwMPWm5Vbqn9oVJRQy8c9idK+Lgt7FqJco5hRF0YXQxi7h4RLx
         XfQv5n2mhEaSuL2m0D7xHLUBGP7W6Svhnhm1f6FhbWsHDYOfQ/GEY/JkYHmhucuuwkwy
         CTE9jsULEUM2e16WxWSXPBP3kZBFXJmdv6rmPqFndcHhnW7cDsXkRTc8WvBS3wDf0MdS
         s726dkZ2hc68+o8iwMI6+0pAWGHwihylim1issiuN9+9fx573XY7ITvD5GY6slF6oOah
         eJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHSuW+oabg6Qg+Wr72c6ilYD5hitra16JjcCbSVni0sK8Tg+yGQyo/vr04H5SD8O6Wom5Aff+Y36cdv5Ch@vger.kernel.org
X-Gm-Message-State: AOJu0YyBes14LXEYslPwc6AnwVfgohXC66a62S24Rgkq4V1QzHx5D5jo
	DOgSs3dhxd7Lr9ZWT/Z9fxH+pVZoqK7nVNLdtHBYx8Re83MgWk3z5YNMEfHRAig=
X-Google-Smtp-Source: AGHT+IF8NZNIsc9zduAvAlpgIqdyDtgyPeNBb1qX/zoQcMvklLE73xusgkCTnL7uJfNn/WMcnnvozQ==
X-Received: by 2002:a17:907:3daa:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a897f778b9amr189015766b.6.1724925518633;
        Thu, 29 Aug 2024 02:58:38 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feacd7sm57849466b.34.2024.08.29.02.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:58:38 -0700 (PDT)
Message-ID: <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Date: Thu, 29 Aug 2024 10:58:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> Adds qcom,shared-se flag usage. Use this when particular I2C serial
> controller needs to be shared between two subsystems.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..ae423127f736 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -60,6 +60,10 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> +  qcom,shared-se:
> +    description: True if I2C needs to be shared between two or more subsystems.
> +    type: boolean
> +
>     reg:
>       maxItems: 1
>   

SE = shared execution ?

---
bod

