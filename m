Return-Path: <linux-arm-msm+bounces-70286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA1B312AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 265EA1CE599F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FDB5680;
	Fri, 22 Aug 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGKqcEWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5EE393DEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854141; cv=none; b=AlIG87Eer2ZncRtNA1NlmuJwKaILA6SurLNo25LJYPw739yZNYxKNd0M7Mjvlr+QdnUMkQaox70Y+J9d11j18fX21/NbeXaAfr27Qozh+TMgOCsISVcLDlbPw541RrueFsR1BT1yOrdx22wfvOU+HdY3hnwkqeRZV28QhBD6bXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854141; c=relaxed/simple;
	bh=67quhyAVURtfXAvI5qZ+yhWFpelxcQR0uV33pnuuydM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oihsP3Yhck3zfigm+CHOms/o2O+7O4PnkZrK4ZtGSEugXooWplI1H/Qx1zDBzyUMtYtqNZ5Zc7Gg8PEp70+wjmRC8CsD9Nz87SD7m8i8cI6uawdVqyOhy303CnqfiS/gOLHicNnNKkxkrV75QW354ISYwtfYIZxx3/yLyYpEG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGKqcEWQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so14164025e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854138; x=1756458938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGpPFRfpj+k+209KhRHwNeakdQDjhN17yXLode2Nb/4=;
        b=QGKqcEWQ4Mp1oN56nFADnvX76jSjdFUPAw6g8QlF5tRe3kb2S8GXhoSTlCvAEljntN
         dju+EE03Q0xNTzF6JUBknc6yu2ydDceMDGwFtIdicjM6Ri+ShdFtQYDl22DAFc6bXO3H
         9VkzRPFBxrx79ULBwOVGqeWEjAYbeqja/CN9+hgkxZULfwnyuuvMtRBcSnivn1udm7gR
         Gl5ZWB0/ZeP3WWjNomDuofbSUDzZ8NumFvCCV81FbGhJH7jVoCqIWZmlrllS8jqHDbsb
         bZp+032aiy9bsh62+HYd3SmW9kBqusDcNz57pcylkempBWISi+EX7ecAhPmkjJg7j6jc
         twPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854138; x=1756458938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGpPFRfpj+k+209KhRHwNeakdQDjhN17yXLode2Nb/4=;
        b=i9oOPOW5FBYW92uVZqqAbFQ0svIxaI4tiEy/axIxl6J8zhcKaWznXm7Oco7Ba/Et16
         I4sNuYK71lTpNBkiYhbspGDW/eOsbmGPgdF6MqEeyFlzeyDsfZUN0fiOicDp1qdToagd
         rRny/3LNNakHY/Fyk9i4SHBQJ9lGmBViooJLWyht1G0Zs+I63a1pA7YqdciyvbtzqHQD
         1807DHoNeEk6T4YrUQ7FIEneEXANtxtukhkrJs/9zNVo+eB8r9QaM4t+lR2Wvo58UHvp
         OG3iBAyS/sqftX6lIWacKE6vWQL5cDVEWqrNbniRE/zpH1dAkbpn0OMjQKjhy5s0zfIM
         OdvA==
X-Forwarded-Encrypted: i=1; AJvYcCVzTPaVuN3n2wTF+yzjaf0T8Vb5dOLMxyFYUfQ1tNmYzqwRgM4Ir+PiAPnhfKaiAsUw1K3UNZjNLIOZnYzU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdkA9FNOZulA2sXv1P9FNpUiNxONWhSthUbkIA8qBuyv9ut2H
	ryvkWpjtcs753h5yF13f7n+UwjYDKwjxUMkLi14YGaNc9+Ns7zZyb6Z7NQGN6Xs66cw=
X-Gm-Gg: ASbGncu7fFn13nBhAGhx3xeqoBbjbtFsdlHOKv2Kzcqk94NjgfBACDBd7k9a/iWQQfX
	wyeDXdwRWRWJDoSA+mCGMgmDxZHi1IwKUrixSZRJw6Nq2plXz3Tu4kqw+faw74nEJXZChgKPEWs
	15W0JVZrAm/3bPT1IDXVzBrWYbMl8msEIhOevACn5MsWrNRIKdUtLHG/TgK8JbsIYHAN8XyiYMD
	NrnvI1iJb+iHFZ2O/WVSEMYUk4p/fQFGeiN0jvLtZOUvGYj/uqh7bGhU8oxA8PM2keeI3hcUQQU
	pAb7cAU2bnEkT6qJPjxxxr0DwI4olGM1XXZekmlQ5wWtXe872JGRkrWOML8LwnQhy69mmtf4bUb
	EtVsukZz3VTVYHFvmDPMEwlfL8gMynqucB3otyBnLy8bQi9zTr6HPw6cjNEH/HjVsHj/7UPYt3C
	M=
X-Google-Smtp-Source: AGHT+IF6MiE5xPg9MihtExsD8an9MDPxTItFLL+t2cF0hyrhB6S/GPbejDFdhHauuLqGnFd5oYU4WQ==
X-Received: by 2002:a05:6000:26c1:b0:3b8:f864:2fec with SMTP id ffacd0b85a97d-3c5dac1706emr1452253f8f.2.1755854138179;
        Fri, 22 Aug 2025 02:15:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c26fce3930sm12091681f8f.29.2025.08.22.02.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 02:15:37 -0700 (PDT)
Message-ID: <0f64e926-8b9e-45ee-b635-d6aeb9c75d9a@linaro.org>
Date: Fri, 22 Aug 2025 11:15:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
 <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-5-a510c72da096@linaro.org>
 <eaxppztxjggd7kdg3p5actz5rcsiy7czw7lnv5jrvnab26gxdj@pwmwlupaievv>
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
In-Reply-To: <eaxppztxjggd7kdg3p5actz5rcsiy7czw7lnv5jrvnab26gxdj@pwmwlupaievv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 12:19, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 09:16:38AM +0200, Neil Armstrong wrote:
>> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> Camcc requires both MMCX and MXC rails to be powered ON to configure
>> the camera PLLs on SM8550 platform. Hence add MXC power domain to
>> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
>> to align towards common macros.
> 
> The last phrase no longer applies.

Ack will fixup

> 
>>
>> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d4bffcc244c98e87464cb2a4075c21f3cd368482..54ea21e1778a7c104cdf6865f84a7f8b5a8691ca 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3625,8 +3625,10 @@ camcc: clock-controller@ade0000 {
>>   				 <&bi_tcxo_div2>,
>>   				 <&bi_tcxo_ao_div2>,
>>   				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> -			required-opps = <&rpmhpd_opp_low_svs>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>>   			#power-domain-cells = <1>;
>>
>> -- 
>> 2.34.1
>>
> 


