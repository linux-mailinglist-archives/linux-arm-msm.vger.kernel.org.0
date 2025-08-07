Return-Path: <linux-arm-msm+bounces-68025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFDB1D9CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20F703AB58C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FA22B2DA;
	Thu,  7 Aug 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3JgVtHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219C450FE
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754576239; cv=none; b=I1HufkPUw5Ik6K1S2Hv3wgW3qM6tIFtBL94oXDc3foi7Ueu0WUWBR/1mDiK3/CKe2YB7w0WRs+UCDgw6BLXdjjyFcNAqlxJ1XN13B+XrvLLUVoRFXul4exNN3bC+oPp339cC3OXCbleKANEE6KcJGmY7qI0r6WWoeQPSymLZfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754576239; c=relaxed/simple;
	bh=J8ImUBo6k11PmLTRi9ueapBPrpFIObd3Z5925Bgdke4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uCnRso3IO7qZGT8wzZGs2B1fPZsrzFYhfrL+wXsRKjaOg9kgwM5ssXZc2Fn76bgyDQHL+0EjMJiRBlgEjTY5OH7mFrP4qKPL8JyCFR4DTh2jAVLBlDwHvJ92RCGnHCwpekIB+/x4mfeR5JTKIqAa8Wd9TBV1f8+3M06PP5KMa3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3JgVtHg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso7455525e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754576234; x=1755181034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DMkxCmKEcDzAQwWDeiQkackfhplB7h7dFl1ES31WYs=;
        b=a3JgVtHgE05Y2/8YHSse7V//BxupdCTBLBfdsfzeI1lkH5JZUfqonEW0R4JsXf/2pv
         vH4bLPWFzjLESKdX1V27RQQ4MTku9zSymn8vEkjDL3TlQNajfDtuOVapYjscWTduJcpU
         twCjDK1GGCp3eRjHJIseylLAJdhYmS800vise2j6mi84pxJBCHNVToRnilqc8ZxsXssX
         JHfyJSArrbciZ715J4vA9po8XG39h4XB0YYvo6ouqo7kB2nALeCFQJj5pAl9wgJhgwz0
         wLMoU3WjS1XrNsLQNMp/rbMqDa0gIyscU/ch8IbjJCIz+4y2G6DuFAJg/tSmyJDZR0LH
         oY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754576234; x=1755181034;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5DMkxCmKEcDzAQwWDeiQkackfhplB7h7dFl1ES31WYs=;
        b=wA1GRVcJQkhlz1Bajdao3aeEJdCPfVYXFnLjMGBfQo1ZxnmcCeMUSNLde7t2RuY1sO
         1dQhGpL1G2y0F2bGLI5wNQop2pdGZgcQOZlaNKEijH94/vFad+EW4Pj8gY0qSyAqKa/N
         aos18nlFsLbusfYslbEPJL1/UH7ncW88VxQjrCI03g07fLAE86mY/qmcNh2UM+hidvQd
         Vh6/rFh2+j0zZLP0czWh/b8MXP0MqRTH5ad4Xp4lknvvOGAtQBXZ+k1cDqpgME6kMa2P
         879FPujYKzLCkAXyNMqERMryspSaf2tzv259b+ANM0Wh1NEK1dUQbJrqsji9VoftX6kD
         +dBg==
X-Forwarded-Encrypted: i=1; AJvYcCWEj0pYxF3hHTjADSNQCFLLto6YNzgkqdEYoA+PbcuHYhgFUlNiSriTYlL8yVcYADbZIGURd3pWseEnJOkp@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnjpK5a3GhCf1MgrVmmQHalVArXN4E7Rdi78f9nmxhRU4cgJN
	Uzr/8Wp4b3tH2RgSyAI/tIm3Bc49gVp/enKl9Q7jQdFnb65qfyvt1WTIPdmqVfeJulE=
X-Gm-Gg: ASbGncse1Wcw9wwagotHVyF+q2DTQDgDXXF+yU6irLclTmuIFit9uda/nqbfHz65iGR
	/u0CCFTEkR15ASlzIilhNTxxCa8eUqyWEcCbJu9GnhqZ065EJ/+U+6KCpIBVu+UY5Tn+46tbxhq
	ewYhlqw6QB6y7jYLaZ+bKkVJzWGNYhfIbOltZlFF+J1vNDmCTDhE07gzZ+aIUuC5NBk8eGaANNC
	8x0L6t00pAqiFFb4JZ8ovJNNs9zReBZrH8xX6bCAhI2/mlRVZSPRDWtuwBbP5+fFaYjeZxqGDW8
	lpyYh3eZsHG9F3Nyiriwu7EPlNhjXDNRirQVFuX+zgkEmDwAoYk+pZQsZefaLciWbHntaSz9703
	+akLyBaMrqvwDDHPTkIcDdnRpnzbb4pWH8XHkhSnjxcHZhDDgRL3p/rSTYMw3W0oskn7Bx84PBj
	o=
X-Google-Smtp-Source: AGHT+IFz6uCC0YYRe9nWXy3/iGewWRQEgH33Nf36nFwo6jhM8HFNPyL4Wp6EentkfsIY4v5Ki9fvjg==
X-Received: by 2002:a05:6000:2c01:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b8f97f50c7mr3782203f8f.26.1754576234128;
        Thu, 07 Aug 2025 07:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5bf9:b40c:d741:ea95? ([2a01:e0a:3d9:2080:5bf9:b40c:d741:ea95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm27292199f8f.42.2025.08.07.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 07:17:13 -0700 (PDT)
Message-ID: <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
Date: Thu, 7 Aug 2025 16:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2025 14:37, Bryan O'Donoghue wrote:
> On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.
>>
>> Note that the optional 'phys' property is deliberately not added.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> For testing only, do not merge.
>>
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..401a32679580 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>>                            "cam_sf_0_mnoc",
>>                            "cam_sf_icp_mnoc";
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
>> +
>>               ports {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>> @@ -4641,6 +4645,16 @@ port@5 {
>>                       reg = <5>;
>>                   };
>>               };
>> +
>> +            csiphy2: phy@ac6e000 {
>> +                compatible = "qcom,csiphy";
>> +                reg = <0 0x0ac6e000 0 0x1000>;
>> +                clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +                clock-names = "csiphy", "csiphy_timer";
>> +                interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +                #phy-cells = <0>;
>> +            };
>>           };
> I don't think we should make this change, for CAMSS in general and specifically for sm8250.
> 
> Instead I think we should go this way:
> 
> https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/
> 
> With separate standalone nodes, and reuse of the upstream PHY API.
> 
> I believe you have a series for the 8650, please rebase on
> 
> https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/
> 
> and
> 
> https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
> 
> V2 of the CSIPHY above will incorporate feedback from Neil and yourself on adding endpoint@ to the PHY however I think we need to have a conversation about standards compliance at attaching two sensors to one CSIPHY without VCs or TDM.

The PHY is able to setup 2 lanes as clock and connect 2 sensors over the 5 lanes available, like for example:
- lane0: cam0 data0
- lane1: cam0 data1
- lane2: cam1 data0
- lane3: cam1 clk
- lane4: cam0 clk

Any lane mapping is compliant. There some Meta slides about that at:
https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran-Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13

Neil

> 
> ---
> bod


