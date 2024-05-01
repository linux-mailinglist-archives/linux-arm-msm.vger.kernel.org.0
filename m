Return-Path: <linux-arm-msm+bounces-19048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A18B8872
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 12:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8264DB220D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 10:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C0321105;
	Wed,  1 May 2024 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n52ukbvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE851C4C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714558717; cv=none; b=dVyf07eB+SIKAVSXHcMp/m7AzdHXxHdCP9E53I9wHJ9RbMXqUazHUQfySnS+5RWwUnu1iXiudk7Lw117ki9iKLAyq10Nwbsw9EBR51nlT0RqUL//GUSZlb5wKmcLH7aIwcpyCoY4BnUAqb1lzrZAppT2ERtm6yix/TVwSeb15GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714558717; c=relaxed/simple;
	bh=4lJzcoO8EjRl0TMOLNbmozBAzanyiQnImFpdK38ND88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRKx7E7i949k9UyUquPcyyq7odktYzB2/AQesg+5hfcAl9WRITkjGAH98qJ72U2ttGFQoTgZb1tSY83t9Jb60Iii4NA+g1HP919FMkHG9wtwwePWuvp5VIdl9BIAUbDYSTRkyk1GR4s23oC+Awgo+3rCXUalNbjghOeEGkZfbtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n52ukbvm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34d7a32bdd3so1018424f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714558715; x=1715163515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UAwJNzVrnSjjfE0sZsPb7CPZEphhdjNs/Ysq9lTOCQ=;
        b=n52ukbvmr9CEUYIlg9SuRAbCIJH7M7nfMl1DOfV7qZXaSCcfpd2XT8UQoxXHV4E970
         Sv+7VVgS3hS9spOw9TEzEoqcY7DfL3uoWVJviY+31/Dv0a9GvDRwhiy4pie6TrNsJpaG
         kgif6GI1cdtjybHjd0iNWogkQyIhbdP1U6oRgqAmKjBhMvL8sgBCetNFt2RjIoLr/TPF
         xV7Rrc2Zyrut0CmpSVw6RM+nyZEBuVRMAoDoVlMZJtslTlAVgeKySwv+iiHCob2Umgyn
         NIs0pp6ZcDwcbE4qL7UlhJ+gCwpIpI6aj9Yyy+xMBDpadBnlvW88VtJqoG1+u6BIJP5I
         cPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714558715; x=1715163515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAwJNzVrnSjjfE0sZsPb7CPZEphhdjNs/Ysq9lTOCQ=;
        b=GnXncX2oWNiGhLW/5tMCI2H8+tJxJ1oXb9DzG+qMOYtaOk8XIncM1vStt3lGuSk1Ci
         p+a6J7yafc8XLLM8Jw9ngiAUtLTKzX5umf1t6DuDKR11fp+5Dg/pZyl75TdOjEESVDWd
         O7ooScxQZVWrPdkGowEr+0+cEpAGGwHQWNRu4I8mbWmg6PxRs70oPPIx0NuUcy+nW6P7
         H9WSPGgSObFK6Kop/QjO9hjcmy13XgGzcXPY4oc4shZpbLr3dyhj/8ct2ij9vUgKkYPd
         +QktewB7KrJConOAmRsU0gXDiyXsd8VUqZiZiIe+c63PmFloWMe+xtIbteY55wM7SK92
         AP3A==
X-Forwarded-Encrypted: i=1; AJvYcCUde4ee0kFa+wtFfdQJ9DyCoBfauJ+S8hGJmZKjQQpc8eBuiyEFofolR4JC+EuG7t5R/RjqIj25H42ptAohSIOTSxRDAkxyiirZ2JFyqw==
X-Gm-Message-State: AOJu0YyZePmrk9VYZvfycqvrgESri8gWcGJIZU3nF1AXV3MSdipdOwg6
	Xb6RZDD+XRiyPyW8968m1e+BGWZ7pd2g2y/FxcWFCf03oiUSjgpTAChrOljUfZQ=
X-Google-Smtp-Source: AGHT+IGkEfjOw4zsvZFKGIfMqVivukGP/zw6Bwcr200ZoiiGKP0Wr1BrZYwjJmUJLLzR/bj0IvkQzw==
X-Received: by 2002:adf:cc0c:0:b0:343:b942:32cb with SMTP id x12-20020adfcc0c000000b00343b94232cbmr1386122wrh.21.1714558714750;
        Wed, 01 May 2024 03:18:34 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b0034c9b7d406dsm10928375wrs.75.2024.05.01.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:18:34 -0700 (PDT)
Message-ID: <e9109e46-4e72-4b3b-a995-4b2af3c31e45@linaro.org>
Date: Wed, 1 May 2024 11:18:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/8] dt-bindings: clock: qcom: Fix SM8450 videocc
 incorrect header file name
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-2-quic_jkona@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430142757.16872-2-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:27, Jagadeesh Kona wrote:
> Fix incorrect header file name in SM8450 videocc bindings.
> 
> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index bad8f019a8d3..78a1bb5be878 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -13,7 +13,7 @@ description: |
>     Qualcomm video clock control module provides the clocks, resets and power
>     domains on SM8450.
>   
> -  See also:: include/dt-bindings/clock/qcom,videocc-sm8450.h
> +  See also:: include/dt-bindings/clock/qcom,sm8450-videocc.h

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


