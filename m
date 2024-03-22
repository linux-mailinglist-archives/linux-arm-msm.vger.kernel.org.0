Return-Path: <linux-arm-msm+bounces-14807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FB886A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7FBDB25874
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CB0374CF;
	Fri, 22 Mar 2024 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg/BHtze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285F35894
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103075; cv=none; b=KL8IQe9uId2Uw6fXKtcdEVzDGKmDAT46+Y4aevRPDXN1ys+W2xosJoZVujGtg6hYaWXrDaNRgjRh/llU++MRn1VNS7bhJJNU2grfgTIcMhsJwn834g1cThQUVYZzqdI8AgZu4PThUDljLybnbVPpBZ+4koNpxtV2UYwVS5YP7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103075; c=relaxed/simple;
	bh=LdraHFKkYxsoFAQsnK5xaReIIh1bnT+H6G/1KbOLhyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhJ3+4oZUq3YJD0iTuf895fpDqEDNFLsE3Cdu1SV75FwfBjq8hBtAXTkZH5E1t5OLEKUjvFYkPStqyR2AE2TMdPGsJH434FfeFCZBKmZjT98YyIHD++efKEfYwvC+i8VfhDD5kNPrYxaljDo8RdZXBky71mmUuJJ7AC9SKGq320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg/BHtze; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d46c2e8dd7so24152601fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103071; x=1711707871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=lg/BHtzeA/KHPPcljScts4CsixnZl76gpq9JZj5ZkU7bzJMm48s/26GhY+Pvxjsv9P
         1tnYDHbd61gxMDnNQI6t32TRhzk8CquEZLI2gN1UKMAfqISTcVavL/8Xx7ro88AuXa5e
         TmlThLO2fHWouenruEgoqBR1DIAAYlFwpM55wIWw8DD7YI2xXD1E0Uy9dSslNU82WeFR
         yjEU00t7wecaQ0057KzvvJcawdRbHH6oDtADJxnhBoNrGk6ib7jwuaoZPExJF3+Z+Un8
         DfvESBDX6UjwDtK/0wnb5SNjFl91CyxxH4WxcYBhhaP3d90hSYHsSPTLqVVMfv1KCxtk
         j8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103071; x=1711707871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=qLZFBTFjXD5uxxoOc0s4IwBEGpwyFKOlF7MZZwq+bG+d491yGFnkRf1uW5I2rUHdAN
         1CquuM/RP4hVA5UmK5YRbS0eklFIAMP1N0zqvGEseds3axXYNweOrXRB4NOtUl3tAUOA
         nG3xD4O7uFeTfTa9LHShwwObqNNKmt3cGJeXHEuqFtHXfcDzM+f7BbI1Kc6QBLHaUbRJ
         NLN68kGTf7RpyWfjgOBRMgD1xhqnN/rCI38RRzEZZ3oNAr7uAObzww8TsJw8cls/+Ws9
         sYD66sPyFitev4GlfDVaV1g4rAPD8AXw3SV3Z9Cvi2QHU+HoNGepJCl1HBQZyJEzm+2C
         TyRA==
X-Forwarded-Encrypted: i=1; AJvYcCX1kdcR8l1Lyv/RU4eDH6g27irfAhfedS685dzbPVBvP9DocUIJ1vYTMa5f8pPGDdC+uqhKt+GmzpkO19xHPV8RpjG6i/7I/3TZ/UXyNA==
X-Gm-Message-State: AOJu0Yzdz1rsJKwYEI33BNJEVMvb+dvxICn5Uon3xazEV1TAjwdngmwK
	2fn+no9x3Sx+8YY2TquC9fMWRi/m/GSv8Vov2JAMghz6ADmirVM+WU8HqjqGBvs=
X-Google-Smtp-Source: AGHT+IEIVG8bh+X4Ju2UJR3vnr0XfmzR3ZjVuy71x8WHH0+8JMVoyLDvz2/SChZ+zaLCYvb5BdxISA==
X-Received: by 2002:ac2:44cf:0:b0:513:eba9:46c8 with SMTP id d15-20020ac244cf000000b00513eba946c8mr1213314lfm.35.1711103071691;
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0041468961233sm8440421wmq.35.2024.03.22.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Message-ID: <f5dafde0-03d6-4693-b263-adf19984fa64@linaro.org>
Date: Fri, 22 Mar 2024 10:24:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: regulator: qcom,usb-vbus-regulator: Add
 PM7250B compatible
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
 <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> The VBUS register block on the PM6150 PMIC shares the design with the
> PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index 33ae1f786802..fcefc722ee2a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - qcom,pm4125-vbus-reg
>                 - qcom,pm6150-vbus-reg
> +              - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

