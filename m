Return-Path: <linux-arm-msm+bounces-55370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903FA9AB4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90E7D7A7F67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75981F4E39;
	Thu, 24 Apr 2025 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmvryqqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511F221FBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492478; cv=none; b=BeY82fsmEmC2ntKC48XvbfneqkAlOzJfhIpS+zjztAap+f0jlfCw7x7CRcVWPCgDCIvrCNMH4YFN9agVnLmhjLMNdIau6q+hs4JbFHhgSoMZVbbs9NWhSWOgN+4IYmZLy18Q7IiZnU95v9eM+y+6cYyi9fx2YNXBl8WmqzJIUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492478; c=relaxed/simple;
	bh=LRMvNGED8g7QH78pxs4OzLmg43eZZ9iT6bQtOLqONp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecieMMuCsifNfxQ/Rxu1nxMCyydJ/QxcGQTexdgxq6vXjgAzicKFqHd6aW55MNXV4J9c0G0dcdRXsiInDufXHAY2DrHNOZjgQdkSEemTLFYGsvJthMe5owkIhr0pPbxR7wJnA2w9jMRyjzXnKvZJ0sEQ936b4Ksi3/IiddfeuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmvryqqV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549c70bf6caso114684e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745492474; x=1746097274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKAiZ5oUfGoNvPn02SKW2hKz0+x21UCr7tagt17mZ3E=;
        b=HmvryqqVVf3TYIVGVXKlQlmDc0v+lplFNO9sND0sEhlOCpZZeWPtJARdHHkDsKI6ns
         X/9mBE9CdRWK5j/QlddQXDRa76fnj0rbdVjznxolmVdV6gC0nrWauyJzVmqyEU5W+5AE
         1SNOSxKyZ783GshHzBWnbEeCdPlcBVbTPRO6chz3JOxiyhnGB9gOR2AnLnX6RFsl983Z
         dtLZG03k+LgId1WHEtx12CoZJPbQKOPRmBZYlwGg4Q3rh3HHx/SVIo+nsCvU57goOMFB
         1Knp15b/UVfq0hR37/q+pyR5meduAb+aMWyvpXCR47ocXssdfe/B90WyzD7zzIt6lL69
         DZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492474; x=1746097274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKAiZ5oUfGoNvPn02SKW2hKz0+x21UCr7tagt17mZ3E=;
        b=FbSpsI+GEhwcrDsZbjqGJHa1ukI3/Eird+BWJe1oNgku0FtxQxklnGC0/1vYV6zkms
         M9FYVcuZANW95iIdGd0HZE5hwHdIBHug0ZU7p27lPBTtIiYJM8H+8UJCNzhJPMXnrWKF
         S8g4w70xboSTuUKWHh5x48OdvzKG4FzkaJacbf3DXwPnHaRucJ41vheRh5Ty8Lz8jToU
         tLrzZ3XO6kC5ftz0wNhwaQCQuu1Q56kOBNDJ3/JNAidzMZfbjp4Y8ag2SN5rXsWwShGq
         NRAQ7cUmFP7XeIG2PRIwYCVRcEgWQq69gYZwMpTef33fin5gr4oh2+UBfidOSgkY8V8j
         AsLQ==
X-Gm-Message-State: AOJu0Yyzk1bLURfnH7+r9mSSWU0+oi877MUOnV0He4MiO4EOl0tnQkwn
	qwx5ZsorvOEuHQ0LzIJ9uK/WPNfPcvYw4/XhbWn1euMytz5g7HEQsFV9rfDZBz0=
X-Gm-Gg: ASbGncvBrmktuO5FauynQUyxzy35ubQdTh54uUy7gzLATmJsHHB7tC5NezkNJ6vxo3g
	zQpg2BeaBlxjp3/OK8AGVoMKvjJ6vTDiUIN3kzwJm/xPy31ERz9Fs7dCcTMeybxwdO1SvaVEFFl
	kpke4PL3i7z/R8cR5PLbcpG63OoERcHNCkz3vPgxsNOZaHx6B+cO5UsjCqXb+pa5YKNlP5VjOgo
	tbNeu7PCNRCcw2JpUWYV0vOTldQ4nyWtHl9A9Ay//+QpnTu2g1xldiXeraXIzm2QKBOnK5roEtq
	83Y3Cpk4rjinIbB+Yi3G3IzGjYaltgJV6czHSkzJTcxVLgCJGUPnxEmfYKCgPlM2ZTzExBvBuI2
	vUqK2IR9jrWc6Ii8P+qk=
X-Google-Smtp-Source: AGHT+IGgDVI0PyQ95vORTGKJqjnW2hj2x8uhHnF4g9z7xQDBS5ScvdRcsn0yFlNT9J59RjGOp2CMCg==
X-Received: by 2002:a05:6512:3f1a:b0:549:5769:6ae8 with SMTP id 2adb3069b0e04-54e7c413dfdmr276608e87.1.1745492474321;
        Thu, 24 Apr 2025 04:01:14 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb88d1sm198436e87.252.2025.04.24.04.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:01:13 -0700 (PDT)
Message-ID: <df0cffac-498c-45d3-a65c-013ed914d479@linaro.org>
Date: Thu, 24 Apr 2025 14:01:12 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 13:17, Bryan O'Donoghue wrote:
> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>> +  vdd-csiphy-0p8-supply:
>>>> Same comment as other series on the lists - this is wrong name. There
>>>> are no pins named like this and all existing bindings use different name.
>>>
>>> The existing bindings are unfortunately not granular enough.
>>>
>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>> How are the pins/supplies actually called?
>>
>> Best regards,
>> Krzysztof
> 
> I don't think strictly algning to pin-names is what we want.
> 
> Here are the input pins
> 
> VDD_A_CSI_0_1_1P2
> VDD_A_CSI_2_4_1P2
> VDD_A_CSI_0_1_0P9
> VDD_A_CSI_2_4_0P9
> 
> I think the right way to represent this
> 
> yaml:
> csiphy0-1p2-supply
> csiphy1-1p2-supply
> csiphy2-1p2-supply
> csiphy3-1p2-supply
> 
> dts:
> 
> vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
> vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;
> 
> etc
> 
> vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;
> 
> because that captures the fact we could have separate lines for each
> phy, names it generically and then leaves it up to the dts
> implementation to represent what actually happened on the PCB.
> 
> That would also work for qcm2290 and sm8650.
> 
> https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/
> 
> So for sm8650 instead of
> 
> +  vdda-csi01-0p9-supply:
> +
> +  vdda-csi24-0p9-supply:
> +
> +  vdda-csi35-0p9-supply:
> +
> +  vdda-csi01-1p2-supply:
> +
> +  vdda-csi24-1p2-supply:
> +
> +  vdda-csi35-1p2-supply:
> 
> you would have
> 
> +  vdda-csiphy0-0p9-supply:
> +
> +  vdda-csiphy1-0p9-supply:
> 
> +  vdda-csiphy0-1p2-supply:
> +
> +  vdda-csiphy1-1p2-supply:
>

This option will work for SM8650, if the list of the given 6 supplies,
where one supply property represens a pad to power up two CSIPHYs, is
extended to the list of 12 supplies, one for each individual CSIPHY.

Both options will be technically equivalent/correct, an alternative
one is just two times longer.

I would appreciate to get a maintainer's decision here.

--
Best wishes,
Vladimir

