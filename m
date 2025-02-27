Return-Path: <linux-arm-msm+bounces-49716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF056A4834E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3064E7A7A21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A20926BDBB;
	Thu, 27 Feb 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bwRajS4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55E26BD92
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670844; cv=none; b=j10SG8brrUbTg12XCVyQO7PoAlxowbXzVA15i91lEh9aloBJzOpqlHpLu+4Z7yl05ZvRty3pVKrZfujOiH9P0Oc7zBr/yWLg9aRKhpjjiNYeE65gJ7svwZ+2/IfM6KhGZafHjHXvA9q+ksbeYNSeJoHgE0/FpbCSVRLaNrxB4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670844; c=relaxed/simple;
	bh=QHw7OAFUWU6niQBeT5cSwFgogQetkHz8qbH2HdnB67o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rcBsmG0nyMfanC7MbZcr16XqzwZ3qOcazOmEZqOOnqnP/U/FEfpEhMl8SdKgCUk3Io7DGAObOqdEgJBtunQ/bHkcCpomygQzWSybEEy2u0N+uxp/9deLMMeyt8gkK9XnpfaMsOiX69aSvvgWTMmWvRMvzlXD2AP0+Bq8rl9xY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bwRajS4l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439946a49e1so7774705e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740670840; x=1741275640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mICGVTvlu71CB2Y912+BgJeYTHn2DASMGPwLIjScMqY=;
        b=bwRajS4lZXwlm9NgrBjgFBlBod6RCSL+S44Ho98L5QD+UahuZ6mY5qjegGHtr3fF5y
         PEv8Krt4PjY42L4bWJghW9xi8WMJ+UMj8Rbjt5EzRFWGvlRa783TMapoJid6XQXHImJ5
         0uyQUynMrZ0CtmseXWqkjU4Mr6EKld26J0Ybezq3QZy6XSA4KPcQUhD/PuY9hnOZuhOv
         Xm3cnZkIhn7gmYDaF/zIZ35uz+HJRcppNO4ZrqEWtBGwyWuYiYgEyJgxCxKbpDuAfAa9
         7w8k6RqSVbX417lLHYOnWmmjsawfY7RArUMh6CL77dQNxFQWuczpcRjBqUpPP02kKUp2
         cVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670840; x=1741275640;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mICGVTvlu71CB2Y912+BgJeYTHn2DASMGPwLIjScMqY=;
        b=Op7DEuruDVnrmUB8iCpD2+tcTTRm4XFLffcheTytJB/8GKG3JLaduB+F8Ygdrsax3N
         MABYEYMQtKDyDmzoqDqxQFJNBHf7iywaepoda8dHETeqh6N3hfXuuGrlHssrzLG2WZE0
         u82IzXfYqdEr6PunX2TIyAhH4OoEEAkErm8ZoRSZCR1m3x8Gaj1fjBZZqcKndf/ZofzP
         oAFKoo1NykNXFYI/OFqdyRQLJ06sK4W/92FoOyijBBiqCCjrC4surLpCipJLTzBI3oWM
         AKOY1lwBOmn8MR6/NmAW9h8m2mYbYNpSO4vbTv00KTvu23sazMastzYN+GJmV+b0O8ex
         u4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUYRGARY3fFk7B62VH3Aiu0Rxyv17MQ0AVdJY1hmAEeSHViZ7yrQtEdBwHdwOiD0LCSg3C08rGrLs8ESUBM@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeD9VSlElR0Fz2pxqp8ACXfgYoptvk3+TCdY6xVEAKIuV92Xn
	AbStWJHkPSeElmMj/5L6MEqD3bN/s48PIYRk9UMT9gUIttRLnpTX6nNtoaamxUQ=
X-Gm-Gg: ASbGnctbRlbVTdg+TlYYKUZCwHNbjtdTiTwLFx+UT+Hw1lqDEKjVfnffmzMCZtRxLm1
	GY6fsYHE4rLMFSQcrmI/o0oXVAAWalMWzpxAczUF00MIQBqYb4FLK61ORsK0ISyEPPBM0X6hRbn
	MSYBCcsXpZrvhdB7nKUvfeGLp/x3qHwyg7Q7pFsELtd5r1HgoJejxne96PwwtPSh7J8sXHCflnX
	Nfwxs3EcUCcNimYfxwOfJkYXLR/mZN9cPBzOT9brdk6tsRcNVDYnsy54lBlzPKHj+eXHFJmbLJX
	MD4nRzvLHTcv+B82IWatwo15jNIhX/rG6MXxivi9kU996RT/Xt/suO1vgDZKKgZMaYjIFdbKR7L
	92A8=
X-Google-Smtp-Source: AGHT+IFCwirr0zSUWLtvCagWYh1fa3K+AfXuY+gLIHqR2YW+RV4zpszQEQ1q+3Ta9d7lcR+MDvPjJQ==
X-Received: by 2002:a05:600c:3b93:b0:439:7b5e:820a with SMTP id 5b1f17b1804b1-43ab8fdcac1mr75644555e9.11.1740670839850;
        Thu, 27 Feb 2025 07:40:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958? ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm27239005e9.33.2025.02.27.07.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 07:40:39 -0800 (PST)
Message-ID: <ab3f5ee6-eabf-491a-99ef-da1e74b29081@linaro.org>
Date: Thu, 27 Feb 2025 16:40:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8650: switch to
 interrupt-cells 4 to add PPI partitions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org>
 <20250227-topic-sm8650-pmu-ppi-partition-v2-1-b93006a65037@linaro.org>
 <fdlsw6mctzfutashmlve7eubgbx6nfzwsft2mnslmgsdrrwuve@pudlwja2y6g5>
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
In-Reply-To: <fdlsw6mctzfutashmlve7eubgbx6nfzwsft2mnslmgsdrrwuve@pudlwja2y6g5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2025 16:11, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 10:04:39AM +0100, Neil Armstrong wrote:
>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 542 +++++++++++++++++------------------
>>   1 file changed, 271 insertions(+), 271 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index de960bcaf3ccf6e2be47bf63a02effbfb75241bf..273170a2e9499b900b3348307f13c9bc1a9a7345 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -1417,17 +1417,17 @@ opp-3302400000 {
>>   
>>   	pmu-a520 {
>>   		compatible = "arm,cortex-a520-pmu";
>> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
> 
> Why are you changing the interrupt type? Should that be coming as a part
> of the next patch?

Damn, indeed, bad rebase.

Thanks,
Neil

> 
>>   	};
>>   
>>   	pmu-a720 {
>>   		compatible = "arm,cortex-a720-pmu";
>> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
>>   	};
>>   
>>   	pmu-x4 {
>>   		compatible = "arm,cortex-x4-pmu";
>> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
>>   	};
>>   
>>   	psci {
> 


